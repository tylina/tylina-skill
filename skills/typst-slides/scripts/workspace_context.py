#!/usr/bin/env python3
"""Resolve an existing SeaSlides workspace without creating another project."""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path


SUPPORT_DIRECTORIES = ("assets", "output", "sources")


@dataclass(frozen=True)
class WorkspaceContext:
    """Canonical paths for one existing Typst workspace and its active entry."""

    root: Path
    entry_path: Path
    entry: str
    assets_dir: Path
    output_dir: Path
    sources_dir: Path


def resolve_workspace_context(
    workspace_path: str | Path,
    *,
    entry: str = "main.typ",
    prepare: bool = False,
) -> WorkspaceContext:
    """Resolve and optionally prepare an existing workspace.

    The entry must remain workspace-relative after symlink resolution. Preparing
    a workspace creates only SeaSlides support directories in the given root.
    """
    root = Path(workspace_path).expanduser().resolve()
    if not root.is_dir():
        raise FileNotFoundError(f"Workspace directory not found: {root}")

    relative_entry = Path(entry)
    if relative_entry.is_absolute():
        raise ValueError("Entry must be a workspace-relative .typ path")
    if relative_entry.suffix.lower() != ".typ":
        raise ValueError("Entry must be a workspace-relative .typ path")

    entry_path = (root / relative_entry).resolve()
    try:
        normalized_entry = entry_path.relative_to(root)
    except ValueError as exc:
        raise ValueError("Entry must stay inside the workspace") from exc
    if not entry_path.is_file():
        raise FileNotFoundError(f"Workspace entry not found: {entry_path}")

    directories = {name: root / name for name in SUPPORT_DIRECTORIES}
    if prepare:
        for directory in directories.values():
            directory.mkdir(parents=True, exist_ok=True)

    return WorkspaceContext(
        root=root,
        entry_path=entry_path,
        entry=normalized_entry.as_posix(),
        assets_dir=directories["assets"],
        output_dir=directories["output"],
        sources_dir=directories["sources"],
    )
