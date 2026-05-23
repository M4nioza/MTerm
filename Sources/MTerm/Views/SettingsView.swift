import SwiftUI

struct SettingsView: View {
    var body: some View {
        TabView {
            GeneralSettingsTab()
                .tabItem { Label("General", systemImage: "gearshape") }

            ThemeSettingsTab()
                .tabItem { Label("Themes", systemImage: "paintpalette") }

            AISettingsTab()
                .tabItem { Label("AI", systemImage: "brain") }
        }
        .frame(width: 500, height: 400)
    }
}

struct GeneralSettingsTab: View {
    @AppStorage("fontSize") private var fontSize: Double = 13
    @AppStorage("fontName") private var fontName = "SF Mono"

    var body: some View {
        Form {
            Picker("Font", selection: $fontName) {
                Text("SF Mono").tag("SF Mono")
                Text("Menlo").tag("Menlo")
                Text("Monaco").tag("Monaco")
                Text("JetBrains Mono").tag("JetBrains Mono")
            }

            Slider(value: $fontSize, in: 8...32, step: 1) {
                Text("Font Size: \(Int(fontSize))")
            }
        }
        .padding()
    }
}

struct ThemeSettingsTab: View {
    var body: some View {
        Text("Theme settings coming soon")
            .padding()
    }
}

struct AISettingsTab: View {
    var body: some View {
        Text("AI settings coming soon")
            .padding()
    }
}
