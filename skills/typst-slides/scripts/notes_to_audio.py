#!/usr/bin/env python3
"""Generate per-slide narration audio from Touying speaker notes.

Extracts speaker notes from Typst source files and generates audio using
multiple TTS backends. `edge-tts` is the default zero-config backend.

Usage:
    python3 notes_to_audio.py <project_path> --voice zh-CN-XiaoxiaoNeural
    python3 notes_to_audio.py <project_path> --provider elevenlabs --voice-id <voice_id>
    python3 notes_to_audio.py <project_path> --provider minimax --voice-id <voice_id>
    python3 notes_to_audio.py <project_path> --provider qwen --voice-id <voice>
    python3 notes_to_audio.py <project_path> --provider cosyvoice --voice-id <voice>
    python3 notes_to_audio.py --list-common-voices
    python3 notes_to_audio.py --list-voices --locale zh-CN

Dependencies:
    python3 -m pip install edge-tts
    ELEVENLABS_API_KEY=<key> for --provider elevenlabs
    MINIMAX_API_KEY=<key> for --provider minimax
    QWEN_API_KEY or DASHSCOPE_API_KEY=<key> for --provider qwen
    COSYVOICE_API_KEY or DASHSCOPE_API_KEY=<key> for --provider cosyvoice
"""

from __future__ import annotations

import argparse
import asyncio
import os
import re
import sys
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))

from config import load_prefixed_env_file
from tts_backends import (
    backend_cosyvoice,
    backend_edge,
    backend_elevenlabs,
    backend_minimax,
    backend_qwen,
)


@dataclass(frozen=True)
class AudioBackend:
    provider: str
    extension: str
    api_key: str = ""
    voice_id: str = ""


def _load_tts_env_file() -> None:
    """Load TTS-related keys from the first .env file, without overriding shell env."""
    load_prefixed_env_file((
        "ELEVENLABS_",
        "MINIMAX_",
        "QWEN_",
        "DASHSCOPE_",
        "COSYVOICE_",
    ))


# ─────────────────────────────────────────────────────────────
# Speaker note extraction from Typst source
# ─────────────────────────────────────────────────────────────

def _extract_speaker_notes(typst_source: str) -> list[str]:
    """Extract all #speaker-note[...] blocks from Typst source, in order.

    Returns one string per speaker-note occurrence (one per slide).
    Handles nested brackets correctly.
    """
    notes: list[str] = []
    pattern = re.compile(r'#speaker-note\s*\[')

    pos = 0
    while pos < len(typst_source):
        match = pattern.search(typst_source, pos)
        if not match:
            break

        # Find the matching closing bracket
        bracket_start = match.end() - 1  # position of the opening [
        depth = 0
        i = bracket_start
        while i < len(typst_source):
            if typst_source[i] == '[':
                depth += 1
            elif typst_source[i] == ']':
                depth -= 1
                if depth == 0:
                    break
            i += 1

        if depth == 0:
            content = typst_source[bracket_start + 1:i]
            notes.append(content.strip())
            pos = i + 1
        else:
            # Unmatched bracket — skip this occurrence
            pos = match.end()

    return notes


def _extract_notes_from_project(project_path: Path) -> list[tuple[str, str]]:
    """Extract speaker notes from main.typ, returning (slide_id, text) pairs.

    Also checks for a notes/ directory with pre-extracted per-slide .md files
    (for compatibility with manual note workflows).
    """
    # Strategy 1: Check for notes/ directory with per-slide markdown files
    notes_dir = project_path / "notes"
    if notes_dir.is_dir():
        note_files = sorted(
            p for p in notes_dir.glob("*.md")
            if p.name != "total.md"
        )
        if note_files:
            results = []
            for note_path in note_files:
                text = spoken_text(note_path.read_text(encoding="utf-8"))
                if text:
                    results.append((note_path.stem, text))
            return results

    # Strategy 2: Extract from main.typ #speaker-note[] directives
    main_typ = project_path / "main.typ"
    if not main_typ.exists():
        return []

    source = main_typ.read_text(encoding="utf-8")
    raw_notes = _extract_speaker_notes(source)

    results = []
    for idx, note in enumerate(raw_notes, start=1):
        text = spoken_text(note)
        if text:
            slide_id = f"slide_{idx:02d}"
            results.append((slide_id, text))

    return results


def spoken_text(markdown: str) -> str:
    """Return narration text from notes, stripping Markdown headings and Typst markup."""
    lines: list[str] = []
    for raw in markdown.splitlines():
        # Skip Markdown headings
        if raw.lstrip().startswith("#"):
            continue
        # Skip Typst comments
        if raw.lstrip().startswith("//"):
            continue
        line = raw.rstrip()
        if not line.strip():
            if lines and lines[-1] != "":
                lines.append("")
            continue
        lines.append(line)
    return "\n".join(lines).strip()


def main() -> int:
    _load_tts_env_file()

    parser = argparse.ArgumentParser(
        description="Generate per-slide narration audio from Touying speaker notes",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("project_path", type=Path, nargs="?")
    parser.add_argument("-o", "--output", type=Path, default=None)
    parser.add_argument(
        "--provider",
        choices=["edge", "elevenlabs", "minimax", "qwen", "cosyvoice"],
        default="edge",
        help="audio generation backend (default: edge)",
    )
    parser.add_argument(
        "--voice",
        default=None,
        help="edge-tts voice ShortName",
    )
    parser.add_argument(
        "--voice-id",
        default=None,
        help="provider voice ID/name",
    )
    parser.add_argument(
        "--rate",
        default="+0%",
        help='edge-tts speaking rate, e.g. "+0%%", "-10%%", "+15%%" (default: +0%%). Ignored by cloud providers.',
    )
    parser.add_argument(
        "--elevenlabs-api-key-env",
        default="ELEVENLABS_API_KEY",
        help="environment variable containing the ElevenLabs API key",
    )
    parser.add_argument("--elevenlabs-model", default="eleven_multilingual_v2")
    parser.add_argument("--elevenlabs-output-format", default="mp3_44100_128")
    parser.add_argument("--elevenlabs-stability", type=float, default=None)
    parser.add_argument("--elevenlabs-similarity-boost", type=float, default=None)
    parser.add_argument("--elevenlabs-style", type=float, default=None)
    parser.add_argument("--elevenlabs-speaker-boost", action=argparse.BooleanOptionalAction, default=None)
    parser.add_argument("--minimax-api-key-env", default="MINIMAX_API_KEY")
    parser.add_argument("--minimax-model", default="speech-2.8-hd")
    parser.add_argument("--minimax-base-url", default=None)
    parser.add_argument("--minimax-output-format", default="mp3", choices=["mp3", "wav"])
    parser.add_argument("--minimax-sample-rate", type=int, default=32000)
    parser.add_argument("--minimax-bitrate", type=int, default=128000)
    parser.add_argument("--minimax-channel", type=int, default=1)
    parser.add_argument("--minimax-speed", type=float, default=1.0)
    parser.add_argument("--minimax-volume", type=float, default=1.0)
    parser.add_argument("--minimax-pitch", type=int, default=0)
    parser.add_argument("--minimax-language-boost", default="auto")
    parser.add_argument("--qwen-api-key-env", default=None)
    parser.add_argument("--qwen-model", default="qwen3-tts-flash")
    parser.add_argument("--qwen-base-url", default=None)
    parser.add_argument("--qwen-language-type", default="Chinese")
    parser.add_argument("--qwen-instructions", default=None)
    parser.add_argument("--qwen-optimize-instructions", action=argparse.BooleanOptionalAction, default=None)
    parser.add_argument("--cosyvoice-api-key-env", default="COSYVOICE_API_KEY")
    parser.add_argument("--cosyvoice-model", default="cosyvoice-v3-flash")
    parser.add_argument("--cosyvoice-base-url", default=None)
    parser.add_argument("--cosyvoice-output-format", default="mp3", choices=["mp3", "wav"])
    parser.add_argument("--cosyvoice-sample-rate", type=int, default=24000)
    parser.add_argument("--cosyvoice-volume", type=int, default=None)
    parser.add_argument("--cosyvoice-rate", type=float, default=None)
    parser.add_argument("--cosyvoice-pitch", type=float, default=None)
    parser.add_argument("--cosyvoice-instruction", default=None)
    parser.add_argument("--cosyvoice-language-hint", default=None)
    parser.add_argument("--list-common-voices", action="store_true", help="print a curated voice list and exit")
    parser.add_argument("--list-voices", action="store_true", help="query provider voices and exit")
    parser.add_argument("--locale", default=None, help='filter --list-voices by locale, e.g. "zh-CN"')
    args = parser.parse_args()

    if args.list_common_voices:
        backend_edge.print_common_voices()
        return 0

    if args.list_voices:
        try:
            if args.provider == "elevenlabs":
                backend_elevenlabs.print_voices(
                    backend_elevenlabs.read_elevenlabs_api_key(args.elevenlabs_api_key_env)
                )
            elif args.provider == "minimax":
                backend_minimax.print_voices()
            elif args.provider == "qwen":
                backend_qwen.print_voices()
            elif args.provider == "cosyvoice":
                backend_cosyvoice.print_voices()
            else:
                asyncio.run(backend_edge.print_voices(args.locale))
        except Exception as exc:
            print(f"error: {exc}", file=sys.stderr)
            return 1
        return 0

    if args.project_path is None:
        parser.error("project_path is required unless --list-voices or --list-common-voices is used")

    voice_id = args.voice_id or args.voice

    if args.provider == "edge" and not args.voice:
        parser.error(
            "--voice is required for --provider edge. Run --list-voices --locale <locale> to discover voices "
            "(e.g. --locale zh-CN), or --list-common-voices for recommendations."
        )
        raise AssertionError("unreachable")

    if args.provider != "edge" and not voice_id:
        parser.error(f"--voice-id is required for --provider {args.provider}")
        raise AssertionError("unreachable")

    if args.provider == "elevenlabs":
        if not voice_id:
            parser.error("--voice-id is required for --provider elevenlabs")
            raise AssertionError("unreachable")
        try:
            api_key = backend_elevenlabs.read_elevenlabs_api_key(args.elevenlabs_api_key_env)
            extension = backend_elevenlabs.output_extension(args.elevenlabs_output_format)
        except Exception as exc:
            print(f"error: {exc}", file=sys.stderr)
            return 1
        backend = AudioBackend(provider=args.provider, extension=extension, api_key=api_key, voice_id=voice_id)
    elif args.provider == "minimax":
        try:
            api_key = backend_minimax.read_minimax_api_key(args.minimax_api_key_env)
            extension = backend_minimax.output_extension(args.minimax_output_format)
        except Exception as exc:
            print(f"error: {exc}", file=sys.stderr)
            return 1
        backend = AudioBackend(provider=args.provider, extension=extension, api_key=api_key, voice_id=voice_id)
    elif args.provider == "qwen":
        try:
            api_key = backend_qwen.read_qwen_api_key(args.qwen_api_key_env)
        except Exception as exc:
            print(f"error: {exc}", file=sys.stderr)
            return 1
        backend = AudioBackend(
            provider=args.provider,
            extension=backend_qwen.output_extension(),
            api_key=api_key,
            voice_id=voice_id,
        )
    elif args.provider == "cosyvoice":
        try:
            api_key = backend_cosyvoice.read_cosyvoice_api_key(args.cosyvoice_api_key_env)
            extension = backend_cosyvoice.output_extension(args.cosyvoice_output_format)
        except Exception as exc:
            print(f"error: {exc}", file=sys.stderr)
            return 1
        backend = AudioBackend(provider=args.provider, extension=extension, api_key=api_key, voice_id=voice_id)
    else:
        backend = AudioBackend(provider=args.provider, extension=backend_edge.edge_output_extension(), voice_id=args.voice)

    project = args.project_path
    output_dir = args.output or (project / "audio")
    output_dir.mkdir(parents=True, exist_ok=True)

    # Extract notes from the project
    note_entries = _extract_notes_from_project(project)
    if not note_entries:
        print(f"error: no speaker notes found in {project}", file=sys.stderr)
        print("  Ensure main.typ contains #speaker-note[...] blocks, or create a notes/ directory.", file=sys.stderr)
        return 2

    generated = 0
    for slide_id, text in note_entries:
        output_path = output_dir / f"{slide_id}{backend.extension}"
        try:
            if backend.provider == "elevenlabs":
                backend_elevenlabs.generate(
                    text,
                    output_path,
                    api_key=backend.api_key,
                    voice_id=backend.voice_id,
                    model=args.elevenlabs_model,
                    output_format=args.elevenlabs_output_format,
                    stability=args.elevenlabs_stability,
                    similarity_boost=args.elevenlabs_similarity_boost,
                    style=args.elevenlabs_style,
                    speaker_boost=args.elevenlabs_speaker_boost,
                )
            elif backend.provider == "minimax":
                backend_minimax.generate(
                    text,
                    output_path,
                    api_key=backend.api_key,
                    voice_id=backend.voice_id,
                    model=args.minimax_model,
                    audio_format=args.minimax_output_format,
                    sample_rate=args.minimax_sample_rate,
                    bitrate=args.minimax_bitrate,
                    channel=args.minimax_channel,
                    speed=args.minimax_speed,
                    volume=args.minimax_volume,
                    pitch=args.minimax_pitch,
                    language_boost=args.minimax_language_boost,
                    base_url=args.minimax_base_url,
                )
            elif backend.provider == "qwen":
                backend_qwen.generate(
                    text,
                    output_path,
                    api_key=backend.api_key,
                    voice_id=backend.voice_id,
                    model=args.qwen_model,
                    language_type=args.qwen_language_type,
                    instructions=args.qwen_instructions,
                    optimize_instructions=args.qwen_optimize_instructions,
                    base_url=args.qwen_base_url,
                )
            elif backend.provider == "cosyvoice":
                backend_cosyvoice.generate(
                    text,
                    output_path,
                    api_key=backend.api_key,
                    voice_id=backend.voice_id,
                    model=args.cosyvoice_model,
                    audio_format=args.cosyvoice_output_format,
                    sample_rate=args.cosyvoice_sample_rate,
                    volume=args.cosyvoice_volume,
                    rate=args.cosyvoice_rate,
                    pitch=args.cosyvoice_pitch,
                    instruction=args.cosyvoice_instruction,
                    language_hint=args.cosyvoice_language_hint,
                    base_url=args.cosyvoice_base_url,
                )
            else:
                asyncio.run(backend_edge.generate(text, output_path, voice=args.voice, rate=args.rate))
        except Exception as exc:
            print(f"error: failed to generate {output_path}: {exc}", file=sys.stderr)
            return 1
        generated += 1
        print(f"[OK] {output_path}")

    print(f"[Done] Generated {generated}/{len(note_entries)} audio file(s): {output_dir}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
