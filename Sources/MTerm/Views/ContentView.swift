import SwiftUI

struct ContentView: View {
    @Environment(AppState.self) private var appState
    @State private var themeEngine = ThemeEngine()

    var body: some View {
        HSplitView {
            if appState.aiPanelOpen {
                AIPanelView()
                    .frame(minWidth: 280, maxWidth: 400)
            }

            VStack(spacing: 0) {
                TabBarView()
                    .environment(appState)

                ZStack {
                    if let tab = appState.activeTab {
                        switch tab.kind {
                        case .terminal:
                            TerminalTabView()
                        case .editor:
                            Text("Editor")
                        case .preview:
                            Text("Preview")
                        case .markdown:
                            Text("Markdown")
                        case .aiDiff:
                            Text("AI Diff")
                        case .gitDiff:
                            Text("Git Diff")
                        case .gitHistory:
                            Text("Git History")
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(minWidth: 600, minHeight: 400)
    }
}

struct TabBarView: View {
    @Environment(AppState.self) private var appState

    var body: some View {
        HStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(appState.tabs) { tab in
                        TabItemView(tab: tab)
                            .environment(appState)
                    }
                }
            }

            Spacer()

            Button(action: { appState.newTerminalTab() }) {
                Image(systemName: "plus")
                    .padding(8)
            }
            .buttonStyle(.plain)

            Button(action: { appState.aiPanelOpen.toggle() }) {
                Image(systemName: "brain")
                    .padding(8)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 8)
        .frame(height: 32)
        .background(Color(NSColor.controlBackgroundColor))
    }
}

struct TabItemView: View {
    @Environment(AppState.self) private var appState
    let tab: Tab

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: iconName)
                .font(.caption)

            Text(tab.title)
                .font(.caption)
                .lineLimit(1)

            if appState.tabs.count > 1 {
                Button(action: { appState.closeTab(tab.id) }) {
                    Image(systemName: "xmark")
                        .font(.caption2)
                        .padding(2)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(
            tab.id == appState.activeTabId
                ? Color(NSColor.selectedContentBackgroundColor).opacity(0.3)
                : Color.clear
        )
        .cornerRadius(4)
        .onTapGesture { appState.activateTab(tab.id) }
    }

    private var iconName: String {
        switch tab.kind {
        case .terminal: "terminal"
        case .editor: "doc.text"
        case .preview: "safari"
        case .markdown: "doc.richtext"
        case .aiDiff: "arrow.left.arrow.right"
        case .gitDiff: "doc.text.magnifyingglass"
        case .gitHistory: "clock.arrow.circlepath"
        }
    }
}
