#!/usr/bin/env python3
"""Stable diagnostic taxonomy for SeaSlides Typst quality checks.

The Typst compiler exposes warnings as objects, but their display strings are
not a quality policy. This module normalizes those warnings into stable codes,
severities, and ownership hints so callers can distinguish automatic blockers
from signals that require visual review.
"""

from dataclasses import asdict, dataclass, replace
import re
from typing import Any, Dict, Iterable, List, Optional


SEVERITY_ORDER = {
    "advisory": 0,
    "review": 1,
    "blocker": 2,
}


WARNING_RULES = (
    (
        "CONTENT_OVERFLOW",
        "blocker",
        re.compile(
            r"content (?:did not|does not) fit|content overflow|"
            r"detecting slide content overflow",
            re.IGNORECASE,
        ),
    ),
    (
        "LAYOUT_NONCONVERGENCE",
        "blocker",
        re.compile(
            r"layout (?:did not|does not) converge|layout non.?convergence|"
            r"document did not converge|page(?:\s+number)?\s*(?:[:#]\s*)?\d+\s+"
            r"did not stabiliz(?:e|ed|ing)",
            re.IGNORECASE,
        ),
    ),
    (
        "IMAGE_DECODER_FAILURE",
        "blocker",
        re.compile(
            r"(?:could not|failed to) load (?:an? )?image decoder(?: plugin)?",
            re.IGNORECASE,
        ),
    ),
    (
        "MISSING_RESOURCE",
        "blocker",
        re.compile(
            r"(?:file|resource|image) (?:is )?not found|"
            r"missing (?:file|resource|image)|"
            r"(?:could not|failed to) load (?:an? )?(?:image|resource)\b",
            re.IGNORECASE,
        ),
    ),
    (
        "EMPTY_SLIDE",
        "advisory",
        re.compile(
            r"empty slide|slide content is empty|detecting slide content is empty",
            re.IGNORECASE,
        ),
    ),
    (
        "FONT_FALLBACK",
        "review",
        re.compile(
            r"unknown font family|font family .* not found|fallback font|"
            r"font .* does not contain|failed to load font|could not find font",
            re.IGNORECASE,
        ),
    ),
    (
        "RAW_TEXT_FUTURE_SYNTAX",
        "advisory",
        re.compile(
            r"no whitespace before raw text|deprecated.*raw|future.*syntax",
            re.IGNORECASE,
        ),
    ),
)


_CONTROL_CHARS = re.compile(r"[\x00-\x08\x0b\x0c\x0e-\x1f\x7f]")
_LOCATION_END = re.compile(r"\.typ:\d+:\d+")


@dataclass(frozen=True)
class Diagnostic:
    """A normalized quality diagnostic."""

    code: str
    severity: str
    message: str
    source: str = "compiler"
    owner: str = "project"
    location: Optional[str] = None
    page: Optional[int] = None
    slide: Optional[int] = None
    detail: Optional[str] = None
    occurrences: int = 1

    def to_dict(self) -> Dict[str, Any]:
        """Return a JSON-safe dictionary without null-valued optional fields."""
        return {key: value for key, value in asdict(self).items() if value is not None}


def normalize_warning_message(value: Any) -> str:
    """Normalize compiler warning text for reports and rule matching.

    Touying's ``uniwarn`` package currently emits some warnings through a fake
    font-family diagnostic containing backspace control characters. When the
    real ``[touying]`` message is present, keep that message and discard the
    transport prefix.
    """
    text = str(value or "").replace("\b", "")
    text = _CONTROL_CHARS.sub("", text)
    marker = text.lower().find("[touying]")
    if marker >= 0:
        text = text[marker:]
    return " ".join(text.split())


def _warning_text(warning: Any) -> Dict[str, str]:
    message = getattr(warning, "message", None)
    if message is None:
        message = str(warning)
    detail = getattr(warning, "diagnostic", None)
    if detail is None:
        detail = str(warning)
    return {
        "message": normalize_warning_message(message),
        "detail": str(detail),
    }


def _extract_location(detail: str) -> Optional[str]:
    for raw_line in detail.splitlines():
        match = _LOCATION_END.search(raw_line)
        if not match:
            continue

        # Typst's source trace prefixes locations with box-drawing glyphs. Do
        # not split on whitespace: both POSIX and Windows project paths may
        # legitimately contain spaces.
        candidate = raw_line[: match.end()]
        candidate = re.sub(r"^[\s\u2500-\u257f]+", "", candidate)
        candidate = re.sub(r"^(?:--?>|at)\s+", "", candidate, flags=re.IGNORECASE)

        preview = candidate.find("@preview/")
        if preview >= 0:
            return candidate[preview:]

        drive = re.search(r"[A-Za-z]:[\\/]", candidate)
        if drive:
            return candidate[drive.start() :]

        absolute = candidate.find("/")
        if absolute >= 0:
            return candidate[absolute:]

        # Relative locations normally occupy the whole trace line. If a
        # warning sentence also happens to contain ``.typ:line:column``, keep
        # the old conservative no-whitespace fallback instead of reporting the
        # prose as a path.
        if not re.match(r"^(?:warning|error|help|hint|note)\s*:", candidate, re.I):
            return candidate
        fallback = re.search(r"([^\s:]+\.typ:\d+:\d+)$", candidate)
        if fallback:
            return fallback.group(1)
    return None


def _extract_number(pattern: str, text: str) -> Optional[int]:
    match = re.search(pattern, text, re.IGNORECASE)
    if not match:
        return None
    try:
        return int(match.group(1))
    except (TypeError, ValueError):
        return None


def _classify_code(text: str) -> Dict[str, str]:
    for code, severity, pattern in WARNING_RULES:
        if pattern.search(text):
            return {"code": code, "severity": severity}
    return {"code": "OTHER_WARNING", "severity": "review"}


def classify_warning(warning: Any) -> Diagnostic:
    """Convert a Typst warning object or string into a stable diagnostic."""
    warning_text = _warning_text(warning)
    combined = "%s\n%s" % (warning_text["message"], warning_text["detail"])
    classification = _classify_code(combined)
    code = classification["code"]

    # Overflow/empty warnings describe this document even when the transport
    # originates in @preview/uniwarn. Other @preview diagnostics are owned by
    # the external package until a local override is proven possible.
    external_source = (
        "@preview/" in warning_text["detail"]
        or "/typst/packages/" in warning_text["detail"].replace("\\", "/")
    )
    if code in {"CONTENT_OVERFLOW", "LAYOUT_NONCONVERGENCE", "EMPTY_SLIDE"}:
        owner = "project-render"
    elif external_source:
        owner = "external-package"
    else:
        owner = "project"

    return Diagnostic(
        code=code,
        severity=classification["severity"],
        message=warning_text["message"],
        owner=owner,
        location=_extract_location(warning_text["detail"]),
        page=_extract_number(
            r"\b(?:on\s+)?page(?:\s+number)?\s*(?:[:#]\s*)?(\d+)", combined
        ),
        slide=_extract_number(r"\bslide\s*(?:[:#]\s*)?(\d+)", combined),
        detail=warning_text["detail"],
    )


def make_diagnostic(
    code: str,
    severity: str,
    message: str,
    source: str = "quality-checker",
    owner: str = "project",
    location: Optional[str] = None,
    detail: Optional[str] = None,
) -> Diagnostic:
    """Create a non-compiler diagnostic with validation."""
    if severity not in SEVERITY_ORDER:
        raise ValueError("Unknown diagnostic severity: %s" % severity)
    return Diagnostic(
        code=code,
        severity=severity,
        message=normalize_warning_message(message),
        source=source,
        owner=owner,
        location=location,
        detail=detail,
    )


def severity_counts(diagnostics: Iterable[Diagnostic]) -> Dict[str, int]:
    counts = {"blocker": 0, "review": 0, "advisory": 0}
    for diagnostic in diagnostics:
        counts[diagnostic.severity] += 1
    return counts


def code_counts(diagnostics: Iterable[Diagnostic]) -> Dict[str, int]:
    counts: Dict[str, int] = {}
    for diagnostic in diagnostics:
        counts[diagnostic.code] = counts.get(diagnostic.code, 0) + 1
    return dict(sorted(counts.items()))


def diagnostic_key(diagnostic: Diagnostic) -> tuple:
    """Return the stable identity of a compiler or checker diagnostic.

    ``detail`` is deliberately omitted: compiler transports frequently add
    unstable trace/context text to an otherwise identical warning.  Consumers
    that need every raw occurrence should retain the original list as evidence.
    """
    # Font lookup warnings repeat the same family at every package call site.
    # One family-level finding with an occurrence count is more actionable than
    # dozens of identical location-level rows. Other diagnostics retain their
    # location because the affected page/source position is part of the fix.
    location = None if diagnostic.code == "FONT_FALLBACK" else diagnostic.location
    return (
        diagnostic.code,
        diagnostic.severity,
        diagnostic.message,
        diagnostic.source,
        diagnostic.owner,
        location,
        diagnostic.page,
        diagnostic.slide,
    )


def deduplicate_diagnostics(diagnostics: Iterable[Diagnostic]) -> List[Diagnostic]:
    """Coalesce equivalent diagnostics and retain their total occurrence count.

    The first diagnostic preserves the representative raw ``detail``.  This is
    intentionally opt-in so existing callers retain their current receipt
    shape/count semantics until they explicitly adopt deduplication.
    """
    unique: Dict[tuple, Diagnostic] = {}
    for diagnostic in diagnostics:
        key = diagnostic_key(diagnostic)
        previous = unique.get(key)
        if previous is None:
            unique[key] = diagnostic
        else:
            unique[key] = replace(
                previous, occurrences=previous.occurrences + diagnostic.occurrences
            )
    return list(unique.values())


def gate_failed(diagnostics: Iterable[Diagnostic], fail_on: str) -> bool:
    """Return whether diagnostics meet or exceed a configured gate severity."""
    if fail_on == "none":
        return False
    if fail_on not in SEVERITY_ORDER:
        raise ValueError("Unknown fail-on severity: %s" % fail_on)
    threshold = SEVERITY_ORDER[fail_on]
    return any(SEVERITY_ORDER[item.severity] >= threshold for item in diagnostics)


def sort_diagnostics(diagnostics: Iterable[Diagnostic]) -> List[Diagnostic]:
    """Sort highest severity first, then by stable code/page/message."""
    return sorted(
        diagnostics,
        key=lambda item: (
            -SEVERITY_ORDER[item.severity],
            item.code,
            item.page if item.page is not None else 10**9,
            item.message,
        ),
    )
