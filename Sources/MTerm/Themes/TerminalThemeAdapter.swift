import AppKit
import SwiftTerm

struct TerminalThemeAdapter {
    static func apply(_ theme: ThemeDefinition, to terminal: TerminalView) {
        let ansiiColors: [SwiftTerm.Color] = [
            hexColor(theme.black), hexColor(theme.red), hexColor(theme.green), hexColor(theme.yellow),
            hexColor(theme.blue), hexColor(theme.magenta), hexColor(theme.cyan), hexColor(theme.white),
            hexColor(theme.brightBlack), hexColor(theme.brightRed), hexColor(theme.brightGreen),
            hexColor(theme.brightYellow), hexColor(theme.brightBlue), hexColor(theme.brightMagenta),
            hexColor(theme.brightCyan), hexColor(theme.brightWhite),
        ]

        terminal.installColors(ansiiColors)
        terminal.nativeBackgroundColor = nsColor(theme.background)
        terminal.nativeForegroundColor = nsColor(theme.foreground)
        terminal.caretColor = nsColor(theme.cursor)
        terminal.selectedTextBackgroundColor = nsColor(theme.selection)
    }

    private static func hexColor(_ hex: String) -> SwiftTerm.Color {
        let (r, g, b) = parseHex(hex)
        return SwiftTerm.Color(red: r * 257, green: g * 257, blue: b * 257)
    }

    private static func nsColor(_ hex: String) -> NSColor {
        let (r, g, b) = parseHex(hex)
        return NSColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: 1)
    }

    private static func parseHex(_ hex: String) -> (UInt16, UInt16, UInt16) {
        var sanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if sanitized.hasPrefix("#") {
            sanitized.removeFirst()
        }
        guard sanitized.count == 6, let value = UInt64(sanitized, radix: 16) else {
            return (0, 0, 0)
        }
        let r = UInt16((value >> 16) & 0xFF)
        let g = UInt16((value >> 8) & 0xFF)
        let b = UInt16(value & 0xFF)
        return (r, g, b)
    }
}
