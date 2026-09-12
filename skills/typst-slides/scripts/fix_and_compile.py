#!/usr/bin/env python3
"""
Fix inline #mitex → #mi and inline --- → -- in a project, then recompile.

Usage:
    python3 fix_and_compile.py <project_path>
    python3 fix_and_compile.py <project_path> --fix-only   # skip compilation
    python3 fix_and_compile.py <project_path> --compile-only  # skip fix
"""

import argparse
import re
import sys
from pathlib import Path


SCRIPTS_DIR = Path(__file__).resolve().parent


# ─────────────────────────────────────────────
# Fix 1: inline #mitex → #mi
# ─────────────────────────────────────────────

def fix_inline_mitex(content: str) -> tuple[str, int]:
    """
    Replace #mitex(...) with #mi(...) when it appears inline (not alone on its line).
    Block-level usage (line starts with optional whitespace + #mitex) is kept.
    Returns (new_content, replacement_count).
    """
    lines = content.split("\n")
    new_lines = []
    total = 0
    in_code_block = False

    for line in lines:
        # Track raw/code blocks (``` fenced)
        stripped = line.strip()
        if stripped.startswith("```"):
            in_code_block = not in_code_block

        if in_code_block or stripped.startswith("//"):
            new_lines.append(line)
            continue

        # Block-level: line is ONLY whitespace + #mitex( → keep as-is
        if re.match(r"^\s*#mitex\(", line):
            new_lines.append(line)
            continue

        # Inline: #mitex( appears after non-whitespace content → replace
        if "#mitex(" in line:
            new_line = line.replace("#mitex(", "#mi(")
            total += new_line.count("#mi(") - line.count("#mi(") + line.count("#mitex(")
            # simpler: count replacements
            count = line.count("#mitex(")
            new_line = line.replace("#mitex(", "#mi(")
            total += count
            new_lines.append(new_line)
        else:
            new_lines.append(line)

    return "\n".join(new_lines), total


# ─────────────────────────────────────────────
# Fix 2: inline --- → --
# ─────────────────────────────────────────────

# Patterns that are EXEMPT from replacement:
#   - Line-leading ---  (like --- Author attribution)
#   - Inside markdown table separators  |---|
#   - Inside code blocks

def fix_inline_emdash(content: str) -> tuple[str, int]:
    """
    Replace ' --- ' with ' -- ' when it appears inline (not line-leading).
    Exempt: table separators (|---|), code blocks, comment lines, #text()[--- ...] attribution.
    Returns (new_content, replacement_count).
    """
    lines = content.split("\n")
    new_lines = []
    total = 0
    in_code_block = False

    for line in lines:
        stripped = line.strip()
        if stripped.startswith("```"):
            in_code_block = not in_code_block

        if in_code_block or stripped.startswith("//"):
            new_lines.append(line)
            continue

        # Skip lines that are markdown table separators
        if re.match(r"^\s*\|[-|:\s]+\|\s*$", line):
            new_lines.append(line)
            continue

        # Skip line-leading --- (attribution / hr)
        if re.match(r"^\s*---", line):
            new_lines.append(line)
            continue

        # Skip #text(...)[--- ...] attribution pattern
        if re.search(r'\)\)\[---\s', line):
            new_lines.append(line)
            continue

        if " --- " in line:
            count = line.count(" --- ")
            line = line.replace(" --- ", " -- ")
            total += count

        new_lines.append(line)

    return "\n".join(new_lines), total


# ─────────────────────────────────────────────
# Main
# ─────────────────────────────────────────────

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("project_path")
    parser.add_argument("--fix-only", action="store_true")
    parser.add_argument("--compile-only", action="store_true")
    args = parser.parse_args()

    project_path = Path(args.project_path).expanduser().resolve()
    main_typ = project_path / "main.typ"
    if not main_typ.exists():
        print(f"ERROR: {main_typ} not found")
        sys.exit(1)

    # ── Fix phase ──
    if not args.compile_only:
        content = main_typ.read_text(encoding="utf-8")

        new_content, mitex_count = fix_inline_mitex(content)
        new_content, dash_count = fix_inline_emdash(new_content)

        if mitex_count or dash_count:
            main_typ.write_text(new_content, encoding="utf-8")
            print(f"[fix] {project_path.name}: #mitex→#mi ×{mitex_count}, ---→-- ×{dash_count}")
        else:
            print(f"[fix] {project_path.name}: nothing to fix")

    # ── Compile phase ──
    if not args.fix_only:
        import subprocess
        compiler = SCRIPTS_DIR / "typst_compiler.py"

        # Step 1: compile PDF + PNG + overview
        print(f"[compile] {project_path.name}: PDF + PNG + overview …")
        r = subprocess.run(
            [sys.executable, str(compiler), str(project_path), "--all"],
            capture_output=True, text=True
        )
        if r.returncode != 0:
            print(f"[ERROR] compile --all failed:\n{r.stdout}\n{r.stderr}")
            sys.exit(1)
        print(r.stdout.strip())

        # Step 2: export PPTX
        print(f"[compile] {project_path.name}: PPTX …")
        r2 = subprocess.run(
            [sys.executable, str(compiler), str(project_path), "--format", "pptx", "--force"],
            capture_output=True, text=True
        )
        if r2.returncode != 0:
            print(f"[ERROR] compile pptx failed:\n{r2.stdout}\n{r2.stderr}")
            sys.exit(1)
        print(r2.stdout.strip())

        print(f"[done] {project_path.name} ✓")


if __name__ == "__main__":
    main()
