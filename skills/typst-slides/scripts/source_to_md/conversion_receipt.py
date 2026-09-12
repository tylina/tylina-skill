#!/usr/bin/env python3
"""Shared success receipts for source-to-Markdown converters."""

from __future__ import annotations

import hashlib
import json
import os
import re
import shutil
import tempfile
from datetime import datetime, timezone
from pathlib import Path
from typing import Iterable
from uuid import uuid4


SCHEMA = "seaslides-source-conversion/v1"


class ConversionReceiptError(RuntimeError):
    """Raised when a conversion cannot be certified as successful."""


class SourceSnapshot:
    """Immutable local-source fingerprint captured before conversion starts."""

    def __init__(self, path: str | Path, sha256: str, size_bytes: int) -> None:
        self.path = Path(path)
        self.sha256 = sha256
        self.size_bytes = size_bytes


def _fingerprint_file(path: Path) -> tuple[str, int]:
    """Hash a file without retaining a potentially large source in memory."""
    digest = hashlib.sha256()
    size_bytes = 0
    try:
        with path.open("rb") as handle:
            for chunk in iter(lambda: handle.read(1024 * 1024), b""):
                digest.update(chunk)
                size_bytes += len(chunk)
    except OSError as exc:
        raise ConversionReceiptError(f"could not read source file: {path} ({exc})") from exc
    return digest.hexdigest(), size_bytes


def snapshot_source(path: str | Path) -> SourceSnapshot:
    source = Path(path)
    if not source.is_file():
        raise ConversionReceiptError(f"file does not exist: {source}")
    fingerprint, size_bytes = _fingerprint_file(source)
    return SourceSnapshot(source, fingerprint, size_bytes)


def verify_source_snapshot(snapshot: SourceSnapshot) -> None:
    current_hash, current_size = _fingerprint_file(snapshot.path)
    if current_hash != snapshot.sha256 or current_size != snapshot.size_bytes:
        raise ConversionReceiptError(f"source changed during conversion: {snapshot.path}")


def receipt_path_for(output_path: str | Path) -> Path:
    """Return the default receipt path beside an output Markdown file."""
    output = Path(output_path)
    return output.with_name(f"{output.name}.receipt.json")


def clear_receipt(
    output_path: str | Path,
    receipt_path: str | Path | None = None,
    *,
    protected_paths: Iterable[str | Path] = (),
) -> None:
    """Remove a stale success receipt before starting a new conversion."""
    output = Path(output_path)
    path = Path(receipt_path) if receipt_path else receipt_path_for(output_path)
    source_paths = [Path(item) for item in protected_paths]
    if any(output.resolve() == item.resolve() for item in source_paths):
        raise ConversionReceiptError(
            f"output path must not overwrite a source file: {output}"
        )
    protected = [output, *source_paths]
    if any(path.resolve() == item.resolve() for item in protected):
        raise ConversionReceiptError(
            f"receipt path must not overwrite a source or output file: {path}"
        )
    try:
        path.unlink()
    except FileNotFoundError:
        pass
    except OSError as exc:
        raise ConversionReceiptError(
            f"could not clear stale receipt {path}: {exc}"
        ) from exc


def clear_receipts(
    output_path: str | Path, receipt_path: str | Path | None = None, *,
    protected_paths: Iterable[str | Path] = (),
) -> None:
    """Clear both canonical and requested receipts; never hide a cleanup failure."""
    paths = [receipt_path_for(output_path)]
    if receipt_path is not None:
        paths.append(Path(receipt_path))
    seen: set[Path] = set()
    for path in paths:
        resolved = path.resolve()
        if resolved not in seen:
            seen.add(resolved)
            clear_receipt(output_path, path, protected_paths=protected_paths)


class OutputTransaction:
    """Stage Markdown/assets and publish them only with a valid success receipt."""
    def __init__(self, output_path: str | Path, *, source_snapshot: SourceSnapshot | None = None):
        self.output = Path(output_path)
        self.source_snapshot = source_snapshot
        self.output.parent.mkdir(parents=True, exist_ok=True)
        self.directory = Path(tempfile.mkdtemp(prefix=f".{self.output.name}.", dir=self.output.parent))
        self.staged_output = self.directory / self.output.name
        self.staged_assets = self.directory / f"{self.output.stem}_files"
        self.assets = self.output.parent / f"{self.output.stem}_files"

    def __enter__(self) -> "OutputTransaction":
        return self

    def __exit__(self, *_args) -> None:
        shutil.rmtree(self.directory, ignore_errors=True)

    def publish(self, expected_output: str | bytes, receipt_writer=None) -> None:
        validate_markdown_output(self.staged_output, expected_output)
        if self.source_snapshot is not None:
            verify_source_snapshot(self.source_snapshot)
        if self.staged_assets.exists() and not self.staged_assets.is_dir():
            raise ConversionReceiptError(
                f"staged asset path is not a directory: {self.staged_assets}"
            )
        backup = self.directory / "backup"
        backup.mkdir()
        old_output, old_assets = backup / self.output.name, backup / self.assets.name
        moved_old_output = False
        moved_old_assets = False
        installed_output = False
        installed_assets = False
        try:
            if self.output.exists() or self.output.is_symlink():
                os.replace(self.output, old_output)
                moved_old_output = True
            if self.assets.exists() or self.assets.is_symlink():
                os.replace(self.assets, old_assets)
                moved_old_assets = True
            os.replace(self.staged_output, self.output)
            installed_output = True
            if self.staged_assets.exists():
                os.replace(self.staged_assets, self.assets)
                installed_assets = True
            if receipt_writer is not None:
                receipt_writer()
        except Exception as publish_exc:
            rollback_errors: list[str] = []
            try:
                if installed_assets and (self.assets.exists() or self.assets.is_symlink()):
                    if self.assets.is_dir() and not self.assets.is_symlink():
                        shutil.rmtree(self.assets)
                    else:
                        self.assets.unlink()
            except OSError as exc:
                rollback_errors.append(f"remove new assets: {exc}")
            try:
                if installed_output and (self.output.exists() or self.output.is_symlink()):
                    if self.output.is_dir() and not self.output.is_symlink():
                        shutil.rmtree(self.output)
                    else:
                        self.output.unlink()
            except OSError as exc:
                rollback_errors.append(f"remove new output: {exc}")
            try:
                if moved_old_output and old_output.exists():
                    os.replace(old_output, self.output)
            except OSError as exc:
                rollback_errors.append(f"restore old output: {exc}")
            try:
                if moved_old_assets and old_assets.exists():
                    os.replace(old_assets, self.assets)
            except OSError as exc:
                rollback_errors.append(f"restore old assets: {exc}")
            if rollback_errors:
                details = "; ".join(rollback_errors)
                raise ConversionReceiptError(
                    f"publish failed ({publish_exc}) and rollback was incomplete: {details}"
                ) from publish_exc
            raise


def _sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _portable_path(path: Path, receipt_dir: Path) -> str:
    """Prefer a path relative to the receipt directory for portability."""
    try:
        return Path(os.path.relpath(path.resolve(), receipt_dir.resolve())).as_posix()
    except (OSError, ValueError):
        return str(path.resolve())


def _file_fingerprint(path: Path, receipt_dir: Path) -> dict[str, object]:
    if not path.is_file():
        raise ConversionReceiptError(f"file does not exist: {path}")
    sha256, size_bytes = _fingerprint_file(path)
    return {
        "kind": "file",
        "path": _portable_path(path, receipt_dir),
        "sha256": sha256,
        "size_bytes": size_bytes,
    }


def _is_table_separator(line: str) -> bool:
    if "|" not in line:
        return False
    cells = line.strip().strip("|").split("|")
    return bool(cells) and all(
        re.fullmatch(r"\s*:?-{3,}:?\s*", cell) is not None for cell in cells
    )


def _fenced_code_block_count(lines: list[str]) -> int:
    opening: tuple[str, int] | None = None
    count = 0
    for line in lines:
        match = re.match(r"^ {0,3}(`{3,}|~{3,})(.*)$", line)
        if match is None:
            continue
        fence = match.group(1)
        if opening is None:
            opening = (fence[0], len(fence))
            continue
        if (
            fence[0] == opening[0]
            and len(fence) >= opening[1]
            and not match.group(2).strip()
        ):
            count += 1
            opening = None
    return count


def markdown_content_profile(data: bytes) -> dict[str, int]:
    """Return conservative, factual Markdown structure counts."""
    text = data.decode("utf-8", errors="replace")
    lines = text.splitlines()
    return {
        "line_count": len(lines),
        "heading_count": sum(
            re.match(r"^ {0,3}#{1,6}(?:\s+|$)", line) is not None
            for line in lines
        ),
        "table_separator_count": sum(_is_table_separator(line) for line in lines),
        "image_reference_count": len(
            re.findall(r"!\[[^\]\n]*\]\([^\)\n]+\)", text)
        ),
        "fenced_code_block_count": _fenced_code_block_count(lines),
        "non_whitespace_chars": sum(not char.isspace() for char in text),
    }


def validate_markdown_output(
    output_path: str | Path,
    expected_content: str | bytes | None = None,
) -> bytes:
    """Return output bytes only when a non-empty Markdown artifact exists."""
    output = Path(output_path)
    if not output.is_file():
        raise ConversionReceiptError(f"output was not created: {output}")
    data = output.read_bytes()
    if not data.strip():
        raise ConversionReceiptError(f"output is empty: {output}")
    if expected_content is not None:
        expected = (
            expected_content.encode("utf-8")
            if isinstance(expected_content, str)
            else expected_content
        )
        if data != expected:
            raise ConversionReceiptError(
                f"output does not match the converter result: {output}"
            )
    return data


def write_success_receipt(
    *,
    output_path: str | Path,
    converter: str,
    version: str,
    warnings: Iterable[str] = (),
    source_path: str | Path | None = None,
    source_snapshot: SourceSnapshot | None = None,
    source_bytes: bytes | None = None,
    source_uri: str | None = None,
    requested_uri: str | None = None,
    receipt_path: str | Path | None = None,
    expected_output: str | bytes | None = None,
) -> Path:
    """Validate one conversion and atomically write its success receipt.

    Local conversions pass ``source_path``. Web conversions pass both
    ``source_bytes`` (the fetched response body) and ``source_uri``.
    """
    if source_snapshot is not None:
        if source_path is not None or source_bytes is not None:
            raise ConversionReceiptError("source_snapshot cannot be combined with another source")
        source_path = source_snapshot.path
    if bool(source_path is not None) == bool(source_bytes is not None):
        raise ConversionReceiptError(
            "provide exactly one of source_path or source_bytes"
        )

    output = Path(output_path)
    destination = Path(receipt_path) if receipt_path else receipt_path_for(output)
    output_data = validate_markdown_output(output, expected_output)

    if source_path is not None:
        if source_snapshot is not None:
            verify_source_snapshot(source_snapshot)
            source = {
                "kind": "file",
                "path": _portable_path(source_snapshot.path, destination.parent),
                "sha256": source_snapshot.sha256,
                "size_bytes": source_snapshot.size_bytes,
            }
        else:
            source = _file_fingerprint(Path(source_path), destination.parent)
    else:
        assert source_bytes is not None
        source = {
            "kind": "url",
            "uri": source_uri or "",
            "sha256": _sha256_bytes(source_bytes),
            "size_bytes": len(source_bytes),
        }
        if requested_uri and requested_uri != source["uri"]:
            source["requested_uri"] = requested_uri

    warning_list = list(dict.fromkeys(str(item) for item in warnings if str(item)))
    payload = {
        "schema": SCHEMA,
        "status": "pass_with_warnings" if warning_list else "pass",
        "created_at": datetime.now(timezone.utc).isoformat(),
        "source": source,
        "output": {
            "kind": "file",
            "path": _portable_path(output, destination.parent),
            "sha256": _sha256_bytes(output_data),
            "size_bytes": len(output_data),
        },
        "converter": {
            "name": converter,
            "version": version,
        },
        "warnings": warning_list,
        "content_profile": markdown_content_profile(output_data),
    }

    protected = [output]
    if source_path is not None:
        protected.append(Path(source_path))
    if any(destination.resolve() == item.resolve() for item in protected):
        raise ConversionReceiptError(
            f"receipt path must not overwrite a source or output file: {destination}"
        )
    destination.parent.mkdir(parents=True, exist_ok=True)
    temporary = destination.with_name(f".{destination.name}.{uuid4().hex}.tmp")
    try:
        temporary.write_text(
            json.dumps(payload, ensure_ascii=False, indent=2) + "\n",
            encoding="utf-8",
        )
        os.replace(temporary, destination)
    finally:
        try:
            temporary.unlink()
        except FileNotFoundError:
            pass
    return destination
