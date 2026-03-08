# openclaw-voice-transcribe

OpenClaw 技能：使用本机 `whisper.cpp` 将 Discord 语音（如 `.ogg`）转写为中文文本，便于后续处理。

## 内容

- `skills/voice-transcribe-whispercpp/`：技能本体
  - `SKILL.md`：技能说明
  - `transcribe.sh`：转写脚本

## 依赖（示例）

- `ffmpeg`
- `whisper.cpp`（含 `whisper-cli`）
- 中文模型（示例：`ggml-small.bin`）

> 具体路径与安装方式以 `skills/voice-transcribe-whispercpp/SKILL.md` 为准。
