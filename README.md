# MTerm

Native macOS terminal emulator built with Swift and SwiftUI, inspired by [terax-ai](https://github.com/crynta/terax-ai).

## Features (planned)

- Multi-tab terminal with SwiftTerm (VT100/xterm emulation)
- Split panes (horizontal and vertical)
- Local AI agent via MLX Swift for command suggestions and explanations
- Custom themes and terminal color schemes
- Session persistence

## Architecture

- **UI**: SwiftUI with `NSViewRepresentable` for SwiftTerm embedding
- **Terminal backend**: SwiftTerm (VT100/xterm emulation + PTY via forkpty)
- **AI**: MLX Swift for on-device local inference
- **State**: ObservableObject for tabs, settings, themes

## Status

Early development. Not yet functional.

## Requirements

- macOS 14.0+
- Xcode 16+
- Apple Silicon (for MLX Swift AI features)

## Build

```bash
open Package.swift
```

Or build via command line:

```bash
swift build -c release
```
