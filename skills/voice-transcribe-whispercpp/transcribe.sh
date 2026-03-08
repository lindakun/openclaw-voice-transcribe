#!/usr/bin/env bash
set -euo pipefail

IN="${1:-}"
if [[ -z "$IN" ]]; then
  echo "Usage: $0 /path/to/input.ogg|wav|mp3" >&2
  exit 2
fi
if [[ ! -f "$IN" ]]; then
  echo "File not found: $IN" >&2
  exit 2
fi

WHISPER_CLI="/home/ubuntu/.openclaw/workspace/whisper.cpp/build/bin/whisper-cli"
MODEL="/home/ubuntu/.openclaw/workspace/whisper.cpp/models/ggml-small.bin"

if [[ ! -x "$WHISPER_CLI" ]]; then
  echo "whisper-cli not executable: $WHISPER_CLI" >&2
  exit 2
fi
if [[ ! -f "$MODEL" ]]; then
  echo "model not found: $MODEL" >&2
  exit 2
fi

BASENAME="${IN%.*}"
WAV="${BASENAME}.16k.wav"
OUT_PREFIX="${BASENAME}.transcript"
OUT_TXT="${OUT_PREFIX}.txt"

# Convert to 16k mono wav
ffmpeg -y -hide_banner -loglevel error -i "$IN" -ar 16000 -ac 1 "$WAV"

# Transcribe Chinese
"$WHISPER_CLI" -m "$MODEL" -f "$WAV" -l zh -otxt -of "$OUT_PREFIX" >/dev/null

echo "$OUT_TXT"
