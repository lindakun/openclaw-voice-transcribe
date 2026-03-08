# voice-transcribe-whispercpp

用 **whisper.cpp** 在本机（OpenClaw 服务器）把 Discord 语音（常见为 `.ogg/opus`）快速转写为中文文本，方便后续让助理继续处理任务。

## 默认行为（达叔偏好）
- 当收到 Discord 语音附件，且用户没有同时提供文字内容时：
  1) 先转写
  2) 再基于转写内容继续回答/执行
- 说明转写结果，供用户确认

## 依赖
- `ffmpeg`
- whisper.cpp 可执行文件：`/home/ubuntu/.openclaw/workspace/whisper.cpp/build/bin/whisper-cli`
- 模型文件：`/home/ubuntu/.openclaw/workspace/whisper.cpp/models/ggml-small.bin`

## 用法

### 命令行
```bash
./transcribe.sh /path/to/input.ogg
# 输出：同目录下生成 .wav（临时）与 .txt（转写结果）
```

### 输出格式建议（给用户）
- 转写：<文本>
- 我理解你要做的是：<一句话结论/意图>

## 注意
- 不要让用户发送密码；2FA/验证码仍需用户本人处理。
- 语音很短/背景噪音大时，转写可能不准，需要用户确认。
