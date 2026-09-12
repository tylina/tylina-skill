# Generate Audio Narration

> Standalone workflow for generating per-slide narration audio from speaker notes. Run only when the user explicitly requests audio/narration generation.

## Prerequisites

- Slides compiled successfully (`output/slides.pdf` exists)
- Speaker notes present in `main.typ` via `#speaker-note[...]` blocks

## Workflow

### 1. Check Available Backends

```bash
python3 ${SKILL_DIR}/scripts/notes_to_audio.py --list-common-voices
```

### 2. Select Backend & Voice

| Provider | API Key Env Var | Default Voice | Notes |
|----------|----------------|---------------|-------|
| edge-tts | (none needed) | `zh-CN-XiaoxiaoNeural` | Free, zero-config, good quality |
| ElevenLabs | `ELEVENLABS_API_KEY` | `eleven_multilingual_v2` | Premium voice quality |
| MiniMax | `MINIMAX_API_KEY` | `speech-2.8-hd` | Chinese-optimized |
| Qwen | `QWEN_API_KEY` / `DASHSCOPE_API_KEY` | `qwen3-tts-flash` | Alibaba Cloud |
| CosyVoice | `COSYVOICE_API_KEY` / `DASHSCOPE_API_KEY` | `cosyvoice-v3-flash` | Alibaba Cloud |

Recommend a backend + voice based on the deck's language and user preferences. Default to `edge-tts` (free, no setup).

### 3. Generate Audio

```bash
# edge-tts (default — free, no API key)
python3 ${SKILL_DIR}/scripts/notes_to_audio.py <project_path> --voice zh-CN-XiaoxiaoNeural

# Cloud providers (require API key in .env)
python3 ${SKILL_DIR}/scripts/notes_to_audio.py <project_path> --provider elevenlabs --voice-id <id>
python3 ${SKILL_DIR}/scripts/notes_to_audio.py <project_path> --provider minimax --voice-id <id>
python3 ${SKILL_DIR}/scripts/notes_to_audio.py <project_path> --provider qwen --voice-id <voice>
python3 ${SKILL_DIR}/scripts/notes_to_audio.py <project_path> --provider cosyvoice --voice-id <voice>
```

### 4. Output

Audio files are written to `<project_path>/audio/slide_01.mp3`, `slide_02.mp3`, etc.

## Notes

- Do NOT call `notes_to_audio.py` directly without first checking available voices
- For full CLI reference: `python3 ${SKILL_DIR}/scripts/notes_to_audio.py --help`
