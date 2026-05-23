import Observation

struct ThemeDefinition: Codable, Equatable {
    var id: String
    var name: String
    var author: String
    var background: String
    var foreground: String
    var cursor: String
    var selection: String
    var black: String
    var red: String
    var green: String
    var yellow: String
    var blue: String
    var magenta: String
    var cyan: String
    var white: String
    var brightBlack: String
    var brightRed: String
    var brightGreen: String
    var brightYellow: String
    var brightBlue: String
    var brightMagenta: String
    var brightCyan: String
    var brightWhite: String

    static let `default` = ThemeDefinition(
        id: "default",
        name: "Default",
        author: "MTerm",
        background: "#1E1E2E",
        foreground: "#CDD6F4",
        cursor: "#F5E0DC",
        selection: "#45475A",
        black: "#45475A", red: "#F38BA8", green: "#A6E3A1",
        yellow: "#F9E2AF", blue: "#89B4FA", magenta: "#F5C2E7",
        cyan: "#94E2D5", white: "#BAC2DE",
        brightBlack: "#585B70", brightRed: "#F38BA8", brightGreen: "#A6E3A1",
        brightYellow: "#F9E2AF", brightBlue: "#89B4FA", brightMagenta: "#F5C2E7",
        brightCyan: "#94E2D5", brightWhite: "#A6ADC8"
    )
}

@Observable
final class ThemeEngine {
    var themes: [ThemeDefinition] = [.default]
    var activeThemeId: String = ThemeDefinition.default.id

    var activeTheme: ThemeDefinition {
        themes.first(where: { $0.id == activeThemeId }) ?? .default
    }
}
