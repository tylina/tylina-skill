#!/usr/bin/env python3
"""Detect unsafe ``cols(lazy-layout: true)`` calls in Typst source.

``lazy-layout: true`` is only safe when every column contains exactly one
top-level content unit. A column like ``[#card-a() #v(1em) #card-b()]`` or
``{ card-a(); v(1em); card-b() }`` can push later content off-screen because
theme cards commonly contain ``lazy-v(1fr)`` internally.

This parser is intentionally narrow: it only matches the ``cols`` function and
does not treat the ``#`` prefix as meaningful. The column body delimiter
controls parsing mode: ``[...]`` is markup mode; ``{...}`` and positional
expression arguments are script mode.
"""

from __future__ import annotations

import re
from dataclasses import dataclass
from pathlib import Path


OPEN_TO_CLOSE = {"(": ")", "[": "]", "{": "}"}
CLOSE_TO_OPEN = {value: key for key, value in OPEN_TO_CLOSE.items()}


@dataclass(frozen=True)
class ArgItem:
    raw_start: int
    raw_end: int
    content_start: int
    content_end: int
    prev_comma: int | None
    next_comma: int | None


@dataclass(frozen=True)
class ContentItem:
    kind: str
    index: int
    content_start: int
    content_end: int


@dataclass(frozen=True)
class LazyColsCall:
    call_start: int
    call_end: int
    contents: tuple[ContentItem, ...]


@dataclass(frozen=True)
class UnsafeLazyLayoutFinding:
    file: Path
    line: int
    column: int
    block_kind: str
    block_index: int
    reason: str
    snippet: str
    # ``blocker`` means the source definitely has more than one direct output
    # in a lazy column.  ``review`` means the lightweight parser cannot prove
    # the required direct component is stretchable (or cannot expand it).
    severity: str = "blocker"


def is_ident_start(char: str) -> bool:
    return char.isalpha() or char == "_"


def is_ident_char(char: str) -> bool:
    return bool(char) and (char.isalnum() or char in "_-")


def skip_string(text: str, index: int) -> int:
    index += 1
    while index < len(text):
        if text[index] == "\\":
            index += 2
            continue
        if text[index] == '"':
            return index + 1
        index += 1
    return index


def looks_like_script_string(text: str, index: int) -> bool:
    """Avoid treating a quotation mark in markup as a Typst string.

    This is deliberately a small lexical heuristic.  In particular ``[\"``
    is ordinary quoted markup in a number of themes, not a string literal.
    Treating it as one can hide every later ``cols`` call until the next quote.
    """
    previous = index - 1
    while previous >= 0 and text[previous].isspace():
        previous -= 1
    return previous >= 0 and text[previous] in "(:,="


def skip_raw(text: str, index: int) -> int:
    tick_count = 0
    while index + tick_count < len(text) and text[index + tick_count] == "`":
        tick_count += 1
    marker = "`" * tick_count
    end = text.find(marker, index + tick_count)
    return len(text) if end == -1 else end + tick_count


def skip_comment(text: str, index: int) -> int:
    if text.startswith("//", index):
        end = text.find("\n", index + 2)
        return len(text) if end == -1 else end
    if text.startswith("/*", index):
        end = text.find("*/", index + 2)
        return len(text) if end == -1 else end + 2
    return index


def skip_trivia(text: str, index: int, limit: int | None = None) -> int:
    end = len(text) if limit is None else limit
    while index < end:
        if text[index].isspace() or text[index] in ";,":
            index += 1
            continue
        if text.startswith("//", index) or text.startswith("/*", index):
            next_index = skip_comment(text, index)
            if next_index == index:
                break
            index = min(next_index, end)
            continue
        break
    return index


def trim_span(text: str, start: int, end: int) -> tuple[int, int]:
    start = skip_trivia(text, start, end)
    while end > start and text[end - 1].isspace():
        end -= 1
    return start, end


def find_matching(text: str, open_pos: int) -> int | None:
    opener = text[open_pos]
    closer = OPEN_TO_CLOSE.get(opener)
    if closer is None:
        return None

    stack = [opener]
    index = open_pos + 1
    while index < len(text):
        char = text[index]
        if char == '"':
            index = skip_string(text, index)
            continue
        if char == "`":
            index = skip_raw(text, index)
            continue
        if text.startswith("//", index) or text.startswith("/*", index):
            index = skip_comment(text, index)
            continue
        if char in OPEN_TO_CLOSE:
            stack.append(char)
            index += 1
            continue
        if char in CLOSE_TO_OPEN:
            if not stack or stack[-1] != CLOSE_TO_OPEN[char]:
                return None
            stack.pop()
            if not stack:
                return index
            index += 1
            continue
        index += 1
    return None


def parse_identifier(text: str, index: int, limit: int) -> int | None:
    if index >= limit or not is_ident_start(text[index]):
        return None
    index += 1
    while index < limit and is_ident_char(text[index]):
        index += 1
    return index


def parse_top_level_items(text: str, start: int, end: int) -> list[ArgItem]:
    items: list[ArgItem] = []
    item_start = start
    prev_comma: int | None = None
    depth: list[str] = []
    index = start

    while index < end:
        char = text[index]
        if char == '"':
            index = skip_string(text, index)
            continue
        if char == "`":
            index = skip_raw(text, index)
            continue
        if text.startswith("//", index) or text.startswith("/*", index):
            index = skip_comment(text, index)
            continue
        if char in OPEN_TO_CLOSE:
            depth.append(char)
            index += 1
            continue
        if char in CLOSE_TO_OPEN and depth and depth[-1] == CLOSE_TO_OPEN[char]:
            depth.pop()
            index += 1
            continue
        if char == "," and not depth:
            content_start, content_end = trim_span(text, item_start, index)
            if content_start < content_end:
                items.append(
                    ArgItem(
                        raw_start=item_start,
                        raw_end=index,
                        content_start=content_start,
                        content_end=content_end,
                        prev_comma=prev_comma,
                        next_comma=index,
                    )
                )
            prev_comma = index
            item_start = index + 1
        index += 1

    content_start, content_end = trim_span(text, item_start, end)
    if content_start < content_end:
        items.append(
            ArgItem(
                raw_start=item_start,
                raw_end=end,
                content_start=content_start,
                content_end=content_end,
                prev_comma=prev_comma,
                next_comma=None,
            )
        )
    return items


def clean_comments(text: str) -> str:
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)
    text = re.sub(r"//.*", "", text)
    return text


def is_named_arg(text: str, item: ArgItem) -> bool:
    cleaned = clean_comments(text[item.content_start:item.content_end]).strip()
    return bool(re.match(r"^[A-Za-z_][\w-]*\s*:", cleaned))


def is_lazy_true_arg(text: str, item: ArgItem) -> bool:
    cleaned = clean_comments(text[item.content_start:item.content_end]).strip()
    return bool(re.match(r"^lazy-layout\s*:\s*true\s*$", cleaned))


def parse_content_arg(text: str, item: ArgItem, index: int) -> ContentItem:
    start, end = item.content_start, item.content_end
    if start < end and text[start] in "[{":
        close_pos = find_matching(text, start)
        if close_pos == end - 1:
            return ContentItem(
                kind=text[start],
                index=index,
                content_start=start + 1,
                content_end=end - 1,
            )
    return ContentItem(kind="arg", index=index, content_start=start, content_end=end)


def parse_chained_content_blocks(text: str, index: int, content_index: int) -> tuple[list[ContentItem], int]:
    contents: list[ContentItem] = []
    while True:
        index = skip_trivia(text, index)
        if index >= len(text) or text[index] not in "[{":
            return contents, index
        close_pos = find_matching(text, index)
        if close_pos is None:
            return contents, index
        contents.append(
            ContentItem(
                kind=text[index],
                index=content_index,
                content_start=index + 1,
                content_end=close_pos,
            )
        )
        content_index += 1
        index = close_pos + 1


def parse_expression_unit_end(text: str, index: int, limit: int) -> int | None:
    if index >= limit:
        return None
    char = text[index]
    if char == '"':
        return min(skip_string(text, index), limit)
    if char == "`":
        return min(skip_raw(text, index), limit)
    if char in OPEN_TO_CLOSE:
        close_pos = find_matching(text, index)
        if close_pos is None or close_pos >= limit:
            return None
        return close_pos + 1

    ident_start = index + 1 if char == "#" else index
    ident_end = parse_identifier(text, ident_start, limit)
    if ident_end is not None:
        index = ident_end
        while True:
            index = skip_trivia(text, index, limit)
            if index < limit and text[index] == ".":
                next_ident = parse_identifier(text, index + 1, limit)
                if next_ident is None:
                    return None
                index = next_ident
                continue
            break

        while True:
            index = skip_trivia(text, index, limit)
            if index >= limit or text[index] not in OPEN_TO_CLOSE:
                break
            close_pos = find_matching(text, index)
            if close_pos is None or close_pos >= limit:
                return None
            index = close_pos + 1
        return index

    index += 1
    while index < limit:
        if text[index].isspace() or text[index] in ";,":
            break
        if text[index] in OPEN_TO_CLOSE or text[index] in CLOSE_TO_OPEN:
            break
        if text.startswith("//", index) or text.startswith("/*", index):
            break
        index += 1
    return index


def parse_markup_text_unit_end(text: str, index: int, limit: int) -> int:
    while index < limit:
        if text[index] == "\\":
            index += 2
            continue
        if text[index] == "#" and parse_identifier(text, index + 1, limit) is not None:
            break
        if text[index] in "[{(":
            break
        index += 1
    return index


def compact_snippet(text: str, start: int, end: int, limit: int = 140) -> str:
    snippet = " ".join(text[start:end].strip().split())
    if len(snippet) > limit:
        return snippet[: limit - 3] + "..."
    return snippet


def count_top_level_units(text: str, start: int, end: int, mode: str) -> tuple[int, list[str]]:
    units: list[str] = []
    index = skip_trivia(text, start, end)

    while index < end:
        unit_start = index
        unit_end: int | None

        if mode == "markup" and not (
            text[index] == "#" and parse_identifier(text, index + 1, end) is not None
        ):
            if text[index] in OPEN_TO_CLOSE:
                close_pos = find_matching(text, index)
                unit_end = None if close_pos is None or close_pos >= end else close_pos + 1
            else:
                unit_end = parse_markup_text_unit_end(text, index, end)
                if unit_end == index:
                    unit_end = index + 1
        else:
            unit_end = parse_expression_unit_end(text, index, end)

        if unit_end is None or unit_end <= index:
            unit_end = index + 1

        snippet = compact_snippet(text, unit_start, unit_end, limit=60)
        if snippet:
            units.append(snippet)
        index = skip_trivia(text, unit_end, end)

    return len(units), units


_NON_COMPONENT_WRAPPERS = {
    "align",
    "block",
    "box",
    "circle",
    "cols",
    "figure",
    "grid",
    "image",
    "line",
    "path",
    "place",
    "polygon",
    "rect",
    "stack",
    "table",
    "text",
}


def _single_unit_review_reason(
    text: str, content: ContentItem, start: int, end: int
) -> str | None:
    """Return a review reason for a sole unit that is visibly not a component.

    A source-only parser cannot prove that an arbitrary custom function is
    stretchable or that its definition retains a terminal ``lazy-v(1fr)``.
    Emitting a warning for every custom component produced thousands of
    non-actionable findings, so custom calls are left for the documented
    component-definition review.  This helper only reports high-signal cases:
    plain markup, control flow, dynamic spreads, and generic layout wrappers
    that hide the direct component relationship.
    """
    source = text[start:end].strip()
    if re.match(r"(?:#)?(?:if|for)\b", source):
        return "cannot statically verify control-flow column content"

    if content.kind == "[":
        call = re.match(r"#([A-Za-z_][\w-]*)", source)
        if call is None:
            return "sole column unit is markup, not a direct component call"
    else:
        call = re.match(r"#?([A-Za-z_][\w-]*)", source)
        if call is None:
            return "cannot statically verify the sole column expression"

    if call.group(1) in _NON_COMPONENT_WRAPPERS:
        return (
            "sole column unit is generic %s wrapper; expose one direct "
            "stretchable component instead" % call.group(1)
        )
    return None


def validate_column_content(text: str, content: ContentItem) -> tuple[bool, str]:
    start, end = trim_span(text, content.content_start, content.content_end)
    if start >= end:
        return False, "empty column content"

    if text.startswith("..", start):
        return False, "cannot statically verify dynamically spread column content"

    mode = "markup" if content.kind == "[" else "script"
    count, units = count_top_level_units(text, start, end, mode)
    if count == 1:
        review_reason = _single_unit_review_reason(text, content, start, end)
        if review_reason is not None:
            return False, review_reason
        # This is only a structural pass: the caller must still verify the
        # custom component's stretchability and terminal lazy-v contract.
        return True, "one direct custom component candidate"
    if count == 0:
        return False, "empty column content"
    return False, f"{count} top-level content units ({' | '.join(units[:4])})"


def finding_severity(text: str, content: ContentItem, reason: str) -> str:
    """Classify definite multi-output violations separately from uncertainty."""
    if reason.startswith("empty column"):
        return "blocker"
    if reason.startswith("cannot statically") or reason.startswith("sole column"):
        return "review"
    start, _ = trim_span(text, content.content_start, content.content_end)
    # ``if``/``for`` output depends on runtime control flow; our unit splitter
    # is not an AST and must not turn that uncertainty into a false blocker.
    if re.match(r"(?:#)?(?:if|for)\b", text[start:]):
        return "review"
    return "blocker"


def parse_lazy_cols_call(text: str, call_start: int, name_start: int, name_end: int) -> LazyColsCall | None:
    index = skip_trivia(text, name_end)
    if index >= len(text) or text[index] != "(":
        return None

    close_paren = find_matching(text, index)
    if close_paren is None:
        return None

    args = parse_top_level_items(text, index + 1, close_paren)
    if not any(is_lazy_true_arg(text, item) for item in args):
        return None

    contents: list[ContentItem] = []
    content_index = 1
    for item in args:
        if is_lazy_true_arg(text, item) or is_named_arg(text, item):
            continue
        contents.append(parse_content_arg(text, item, content_index))
        content_index += 1

    chained, call_end = parse_chained_content_blocks(text, close_paren + 1, content_index)
    contents.extend(chained)

    return LazyColsCall(
        call_start=call_start,
        call_end=call_end,
        contents=tuple(contents),
    )


def iter_lazy_cols_calls(text: str) -> list[LazyColsCall]:
    calls: list[LazyColsCall] = []
    index = 0
    while index < len(text):
        char = text[index]
        if char == '"' and looks_like_script_string(text, index):
            index = skip_string(text, index)
            continue
        if char == "`":
            index = skip_raw(text, index)
            continue
        if text.startswith("//", index) or text.startswith("/*", index):
            index = skip_comment(text, index)
            continue

        call_start = index
        name_start = index + 1 if char == "#" else index
        name_end = parse_identifier(text, name_start, len(text))
        if name_end is None:
            index += 1
            continue

        name = text[name_start:name_end]
        before = text[call_start - 1] if call_start > 0 else ""
        after = text[name_end] if name_end < len(text) else ""
        if (
            name == "cols"
            and not is_ident_char(before)
            and before != "."
            and before != "#"
            and not is_ident_char(after)
        ):
            lazy_call = parse_lazy_cols_call(text, call_start, name_start, name_end)
            if lazy_call is not None:
                calls.append(lazy_call)
                # Do not jump to call_end: nested cols calls are independently
                # subject to the contract and must be visited as well.
                index += 1
                continue
        index += 1
    return calls


def line_column(text: str, offset: int) -> tuple[int, int]:
    line = text.count("\n", 0, offset) + 1
    last_newline = text.rfind("\n", 0, offset)
    column = offset + 1 if last_newline == -1 else offset - last_newline
    return line, column


def find_unsafe_lazy_layout_cols(text: str, file_path: Path) -> list[UnsafeLazyLayoutFinding]:
    findings: list[UnsafeLazyLayoutFinding] = []

    for call in iter_lazy_cols_calls(text):
        if not call.contents:
            line, column = line_column(text, call.call_start)
            findings.append(
                UnsafeLazyLayoutFinding(
                    file=file_path,
                    line=line,
                    column=column,
                    block_kind="none",
                    block_index=0,
                    reason="lazy-layout cols call has no column content",
                    snippet=compact_snippet(text, call.call_start, call.call_end),
                    severity="blocker",
                )
            )
            continue

        for content in call.contents:
            ok, reason = validate_column_content(text, content)
            if ok:
                continue
            line, column = line_column(text, content.content_start)
            findings.append(
                UnsafeLazyLayoutFinding(
                    file=file_path,
                    line=line,
                    column=column,
                    block_kind=content.kind,
                    block_index=content.index,
                    reason=reason,
                    snippet=compact_snippet(text, content.content_start, content.content_end),
                    severity=finding_severity(text, content, reason),
                )
            )

    return findings


def find_unsafe_lazy_layout_cols_in_file(path: Path) -> list[UnsafeLazyLayoutFinding]:
    return find_unsafe_lazy_layout_cols(path.read_text(encoding="utf-8"), path)
