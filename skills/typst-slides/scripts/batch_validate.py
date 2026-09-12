#!/usr/bin/env python3
"""
SeaSlides Typst Slides - Batch Validation Tool

Scans a directory for Typst/Touying projects, validates their structure,
attempts compilation, and generates a summary report.

Usage:
    python3 batch_validate.py --dir ../examples
    python3 batch_validate.py --dir ./projects --verbose
    python3 batch_validate.py --dir ./projects
"""

import argparse
import subprocess
import sys
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from project_utils import (
    find_all_projects,
    get_project_info,
    validate_project_structure,
    format_file_size,
    get_project_stats,
)
from validate_project import validate_project as validate_delivery_project


COMPILER_SCRIPT = Path(__file__).with_name("typst_compiler.py")


def result_gate_passed(result: Dict) -> bool:
    """Return whether a batch row passes every automatic default gate."""
    return bool(
        result['structure_valid']
        and (result['compile_success'] or not result['compile_requested'])
        and result['semantic_valid'] is not False
        and result['quality_failed'] is not True
    )


def run_quality_audit(project_dir: Path) -> Dict:
    """Load and run the quality checker only when compilation was requested."""
    from typst_quality_checker import audit_project

    return audit_project(str(project_dir), fail_on="blocker")


class BatchValidator:
    """Batch validator for Typst/Touying projects."""

    def __init__(self, root_dir: str, verbose: bool = False, do_compile: bool = True,
                 export_path: Optional[str] = None) -> None:
        self.root_dir = Path(root_dir)
        self.verbose = verbose
        self.do_compile = do_compile
        self.export_path = Path(export_path) if export_path else None
        self.results: List[Dict] = []

    def scan_projects(self) -> List[Path]:
        """Scan for Typst projects under root_dir."""
        return find_all_projects(str(self.root_dir))

    def compile_project(self, project_dir: Path) -> Tuple[bool, str]:
        """Compile canonical delivery artifacts through the public compiler."""
        main_typ = project_dir / "main.typ"
        if not main_typ.exists():
            return False, "main.typ not found"

        try:
            result = subprocess.run(
                [sys.executable, str(COMPILER_SCRIPT), str(project_dir), "--all"],
                capture_output=True,
                text=True,
                timeout=300,
            )
            if result.returncode == 0:
                return True, "Compilation successful"
            error_snippet = result.stderr.strip()[:200] if result.stderr else "Unknown error"
            return False, f"Compilation failed: {error_snippet}"
        except FileNotFoundError:
            return False, "Python interpreter or compiler script not found"
        except subprocess.TimeoutExpired:
            return False, "Compilation timeout (>300s)"
        except Exception as exc:
            return False, f"Error: {exc}"

    def validate_single(self, project_dir: Path) -> Dict:
        """Validate a single project and return result dict."""
        info = get_project_info(str(project_dir))
        is_valid, errors, warnings = validate_project_structure(str(project_dir))

        compile_success = False
        compile_message = ""
        semantic_valid: Optional[bool] = None
        semantic_errors: List[str] = []
        semantic_warnings: List[str] = []
        quality_status: Optional[str] = None
        quality_failed: Optional[bool] = None
        quality_code_counts: Dict[str, int] = {}
        quality_severity_counts: Dict[str, int] = {}
        quality_message = ""

        if self.do_compile and is_valid:
            compile_success, compile_message = self.compile_project(project_dir)
            if compile_success:
                try:
                    semantic_valid, semantic_result = validate_delivery_project(str(project_dir))
                    semantic_errors = semantic_result.get('errors', [])
                    semantic_warnings = semantic_result.get('warnings', [])
                except Exception as exc:
                    semantic_valid = False
                    semantic_errors = [f"Delivery validation failed unexpectedly: {exc}"]
                try:
                    quality_result = run_quality_audit(project_dir)
                    quality_status = quality_result['status']
                    quality_failed = quality_result['quality_gate']['failed']
                    quality_code_counts = quality_result['code_counts']
                    quality_severity_counts = quality_result['severity_counts']
                except Exception as exc:
                    quality_status = "incomplete"
                    quality_failed = True
                    quality_code_counts = {"QUALITY_AUDIT_EXCEPTION": 1}
                    quality_severity_counts = {
                        "blocker": 1,
                        "review": 0,
                        "advisory": 0,
                    }
                    quality_message = f"Quality audit failed unexpectedly: {exc}"
        elif not is_valid:
            compile_message = "Skipped (structure invalid)"
        else:
            compile_message = "Skipped (--no-compile)"

        stats = get_project_stats(str(project_dir))

        return {
            'name': project_dir.name,
            'path': str(project_dir),
            'format': info.get('format_name', 'Unknown'),
            'typ_count': info.get('typ_count', 0),
            'has_spec': info.get('has_spec', False),
            'has_readme': info.get('has_readme', False),
            'structure_valid': is_valid,
            'structure_errors': errors,
            'structure_warnings': warnings,
            'compile_success': compile_success,
            'compile_message': compile_message,
            'compile_requested': self.do_compile,
            'semantic_valid': semantic_valid,
            'semantic_errors': semantic_errors,
            'semantic_warnings': semantic_warnings,
            'quality_status': quality_status,
            'quality_failed': quality_failed,
            'quality_code_counts': quality_code_counts,
            'quality_severity_counts': quality_severity_counts,
            'quality_message': quality_message,
            'total_size': stats.get('total_size', 0),
        }

    def run(self) -> List[Dict]:
        """Run batch validation on all discovered projects."""
        projects = self.scan_projects()

        if not projects:
            print("No Typst projects found")
            return []

        print(f"Scanning: {self.root_dir}")
        print(f"Found {len(projects)} project(s)\n")

        for project_dir in projects:
            if self.verbose:
                print(f"Validating: {project_dir.name} ...")

            result = self.validate_single(project_dir)
            self.results.append(result)

            if self.verbose:
                self._print_verbose_result(result)

        return self.results

    def _print_verbose_result(self, result: Dict) -> None:
        """Print detailed result for a single project."""
        print(f"  Format: {result['format']}")
        print(f"  Structure: {'✓ Valid' if result['structure_valid'] else '✗ Invalid'}")

        for error in result['structure_errors']:
            print(f"    [ERROR] {error}")
        for warning in result['structure_warnings']:
            print(f"    [WARN]  {warning}")

        if self.do_compile:
            print(f"  Compilation: {'✓ Success' if result['compile_success'] else '✗ Failed'}")
            if not result['compile_success'] and result['compile_message']:
                print(f"    {result['compile_message']}")
        else:
            print("  Compilation: N/A (--no-compile)")
        if result['semantic_valid'] is not None:
            print(f"  Delivery validation: {'✓ Valid' if result['semantic_valid'] else '✗ Invalid'}")
            for error in result['semantic_errors']:
                print(f"    [ERROR] {error}")
            for warning in result['semantic_warnings']:
                print(f"    [WARN]  {warning}")
        if result['quality_status'] is not None:
            quality_icon = '✗' if result['quality_failed'] else '✓'
            print(f"  Quality gate: {quality_icon} {result['quality_status'].upper()}")
            if result['quality_code_counts']:
                codes = ', '.join(
                    f"{code}={count}"
                    for code, count in sorted(result['quality_code_counts'].items())
                )
                print(f"    {codes}")
            if result['quality_message']:
                print(f"    {result['quality_message']}")
        print()

    def print_summary(self) -> None:
        """Print summary table of all results."""
        if not self.results:
            return

        col_name = 35
        col_fmt = 12
        col_struct = 10
        col_comp = 12
        col_status = 8
        total_width = col_name + col_fmt + col_struct + col_comp + col_status + 20

        print("\n" + "=" * total_width)
        print(f"{'Project':<{col_name}} {'Format':<{col_fmt}} {'Structure':<{col_struct}} "
              f"{'Compile':<{col_comp}} {'Status':<{col_status}} Notes")
        print("=" * total_width)

        pass_count = 0
        warn_count = 0
        fail_count = 0
        skipped_count = 0
        missing_spec = 0
        missing_readme = 0

        for result in self.results:
            struct_ok = result['structure_valid']
            comp_ok = result['compile_success']
            compile_requested = result['compile_requested']
            semantic_ok = result['semantic_valid'] is not False
            quality_ok = result['quality_failed'] is not True
            has_warnings = bool(
                result['structure_warnings']
                or result['semantic_warnings']
                or result['quality_status'] in {'review', 'advisory'}
            )

            if struct_ok and not compile_requested:
                status = "◌ N/A"
                skipped_count += 1
            elif struct_ok and comp_ok and semantic_ok and quality_ok and not has_warnings:
                status = "✓ PASS"
                pass_count += 1
            elif struct_ok and comp_ok and semantic_ok and quality_ok:
                status = "⚠ WARN"
                warn_count += 1
            else:
                status = "✗ FAIL"
                fail_count += 1

            if not result['has_spec']:
                missing_spec += 1
            if not result['has_readme']:
                missing_readme += 1

            notes_parts = []
            if result['structure_errors']:
                notes_parts.append(f"{len(result['structure_errors'])} err")
            if result['structure_warnings']:
                notes_parts.append(f"{len(result['structure_warnings'])} warn")
            if result['semantic_errors']:
                notes_parts.append(f"{len(result['semantic_errors'])} validation err")
            if result['semantic_warnings']:
                notes_parts.append(f"{len(result['semantic_warnings'])} validation warn")
            if result['quality_failed']:
                notes_parts.append("quality gate failed")
            elif result['quality_status'] in {'review', 'advisory'}:
                notes_parts.append(f"quality {result['quality_status']}")
            if not compile_requested:
                notes_parts.append("compile/quality N/A")
            if not comp_ok and result['compile_message'] and "Skipped" not in result['compile_message']:
                notes_parts.append("compile err")

            notes_str = ", ".join(notes_parts) if notes_parts else ""

            name_display = result['name'][:col_name - 2]
            fmt_display = result['format'][:col_fmt - 2]

            struct_icon = "✓" if struct_ok else "✗"
            comp_icon = "✓" if comp_ok else (
                "N/A" if not compile_requested else
                ("—" if "Skipped" in result['compile_message'] else "✗")
            )

            print(f"{name_display:<{col_name}} {fmt_display:<{col_fmt}} "
                  f"{struct_icon:<{col_struct}} {comp_icon:<{col_comp}} "
                  f"{status:<{col_status}} {notes_str}")

        print("=" * total_width)
        total = len(self.results)
        print(f"\nSummary: {total} project(s) — "
              f"{pass_count} passed, {warn_count} warnings, {fail_count} failed, "
              f"{skipped_count} not fully validated")

        if missing_spec:
            print(f"  Missing content_design_spec.md: {missing_spec}")
        if missing_readme:
            print(f"  Missing README.md: {missing_readme}")

        total_size = sum(r.get('total_size', 0) for r in self.results)
        if total_size:
            print(f"  Total size: {format_file_size(total_size)}")

        # Fix suggestions
        if fail_count > 0 or warn_count > 0:
            print("\nFix suggestions:")
            if missing_spec:
                print("  - Add content_design_spec.md to projects missing design specifications")
            if missing_readme:
                print("  - Add README.md to projects for documentation")
            if any(not r['compile_success'] and 'compile err' in str(r.get('compile_message', ''))
                   for r in self.results):
                print("  - Run 'python3 typst_compiler.py <project> --all' for full diagnostics")
            if any(r['structure_errors'] for r in self.results):
                print("  - Run 'python3 validate_project.py <project_path>' for detailed diagnostics")
            if any(r['quality_failed'] for r in self.results):
                print("  - Run 'python3 typst_quality_checker.py <project_path>' for the blocker receipt")
            print("  - See examples/ directory for reference project structure")

        print()

    def export_report(self) -> None:
        """Export validation results to a text file."""
        if not self.export_path or not self.results:
            return

        lines = []
        lines.append(f"SeaSlides Typst Slides - Batch Validation Report")
        lines.append(f"Root: {self.root_dir}")
        lines.append(f"Projects: {len(self.results)}")
        lines.append("=" * 70)

        for result in self.results:
            lines.append(f"\nProject: {result['name']}")
            lines.append(f"  Path: {result['path']}")
            lines.append(f"  Format: {result['format']}")
            lines.append(f"  Structure: {'Valid' if result['structure_valid'] else 'Invalid'}")
            if result['structure_errors']:
                for err in result['structure_errors']:
                    lines.append(f"    [ERROR] {err}")
            if result['structure_warnings']:
                for warn in result['structure_warnings']:
                    lines.append(f"    [WARN] {warn}")
            lines.append(f"  Compile: {result['compile_message']}")
            if result['semantic_valid'] is not None:
                lines.append(f"  Delivery validation: {'Valid' if result['semantic_valid'] else 'Invalid'}")
                for err in result['semantic_errors']:
                    lines.append(f"    [ERROR] {err}")
                for warn in result['semantic_warnings']:
                    lines.append(f"    [WARN] {warn}")
            if result['quality_status'] is not None:
                lines.append(f"  Quality gate: {result['quality_status']}")
                if result['quality_code_counts']:
                    lines.append(f"    Codes: {result['quality_code_counts']}")
                if result['quality_message']:
                    lines.append(f"    {result['quality_message']}")

        lines.append("\n" + "=" * 70)
        pass_count = sum(
            1 for r in self.results
            if r['compile_requested'] and result_gate_passed(r)
        )
        skipped_count = sum(
            1 for r in self.results
            if not r['compile_requested'] and r['structure_valid']
        )
        fail_count = sum(
            1 for r in self.results
            if not result_gate_passed(r)
        )
        lines.append(
            f"Summary: {pass_count} passed, {fail_count} failed, "
            f"{skipped_count} not fully validated"
        )

        self.export_path.write_text("\n".join(lines) + "\n", encoding="utf-8")
        print(f"Report exported to: {self.export_path}")


def main() -> None:
    """Run the CLI entry point."""
    parser = argparse.ArgumentParser(
        description="SeaSlides Typst Slides - Batch Validate Typst Projects",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    %(prog)s --dir ../examples
    %(prog)s --dir ./projects --verbose
    %(prog)s --dir ./projects --no-compile
        """,
    )

    parser.add_argument("--dir", type=str, default=".",
                        help="Root directory containing Typst projects (default: .)")
    parser.add_argument("--verbose", "-v", action="store_true",
                        help="Show detailed validation messages")
    parser.add_argument("--no-compile", action="store_true",
                        help=(
                            "Run structure-only checks; compilation, delivery validation, "
                            "and quality audit are reported N/A"
                        ))
    parser.add_argument("--export", type=str, default=None,
                        help="Export report to a text file")

    args = parser.parse_args()

    root_dir = Path(args.dir)
    if not root_dir.exists():
        print(f"Error: Directory '{args.dir}' does not exist", file=sys.stderr)
        sys.exit(1)

    validator = BatchValidator(
        root_dir=str(root_dir),
        verbose=args.verbose,
        do_compile=not args.no_compile,
        export_path=args.export,
    )

    results = validator.run()
    validator.print_summary()
    validator.export_report()

    if not results:
        sys.exit(0)

    all_valid = all(result_gate_passed(result) for result in results)
    sys.exit(0 if all_valid else 1)


if __name__ == "__main__":
    main()
