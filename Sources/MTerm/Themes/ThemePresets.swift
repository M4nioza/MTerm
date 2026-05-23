import Foundation

struct ThemePresets {
    static var all: [ThemeDefinition] {
        [.default, nord, tokyoNight, catppuccin, gruvbox]
    }

    static let nord = ThemeDefinition(
        id: "nord",
        name: "Nord",
        author: "Arctic Ice Studio",
        background: "#2E3440",
        foreground: "#D8DEE9",
        cursor: "#D8DEE9",
        selection: "#434C5E",
        black: "#3B4252", red: "#BF616A", green: "#A3BE8C",
        yellow: "#EBCB8B", blue: "#81A1C1", magenta: "#B48EAD",
        cyan: "#88C0D0", white: "#E5E9F0",
        brightBlack: "#4C566A", brightRed: "#BF616A", brightGreen: "#A3BE8C",
        brightYellow: "#EBCB8B", brightBlue: "#81A1C1", brightMagenta: "#B48EAD",
        brightCyan: "#8FBCBB", brightWhite: "#ECEFF4"
    )

    static let tokyoNight = ThemeDefinition(
        id: "tokyo-night",
        name: "Tokyo Night",
        author: "Enkia",
        background: "#1A1B26",
        foreground: "#A9B1D6",
        cursor: "#C0CAF5",
        selection: "#364A82",
        black: "#1D202F", red: "#F7768E", green: "#9ECE6A",
        yellow: "#E0AF68", blue: "#7AA2F7", magenta: "#BB9AF7",
        cyan: "#7DCFFF", white: "#A9B1D6",
        brightBlack: "#414868", brightRed: "#F7768E", brightGreen: "#9ECE6A",
        brightYellow: "#E0AF68", brightBlue: "#7AA2F7", brightMagenta: "#BB9AF7",
        brightCyan: "#7DCFFF", brightWhite: "#C0CAF5"
    )

    static let catppuccin = ThemeDefinition(
        id: "catppuccin",
        name: "Catppuccin Mocha",
        author: "Catppuccin",
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

    static let gruvbox = ThemeDefinition(
        id: "gruvbox",
        name: "Gruvbox Dark",
        author: "Pavel Pertsev",
        background: "#282828",
        foreground: "#EBDBB2",
        cursor: "#EBDBB2",
        selection: "#3C3836",
        black: "#282828", red: "#CC241D", green: "#98971A",
        yellow: "#D79921", blue: "#458588", magenta: "#B16286",
        cyan: "#689D6A", white: "#A89984",
        brightBlack: "#928374", brightRed: "#FB4934", brightGreen: "#B8BB26",
        brightYellow: "#FABD2F", brightBlue: "#83A598", brightMagenta: "#D3869B",
        brightCyan: "#8EC07C", brightWhite: "#EBDBB2"
    )
}
