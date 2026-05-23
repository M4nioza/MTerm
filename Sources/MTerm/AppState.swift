import Observation

@Observable
final class AppState {
    var tabs: [Tab] = [Tab(kind: .terminal, title: "Terminal")]
    var activeTabId: Tab.ID?
    var aiPanelOpen = false
    var activeModelId: String?

    var activeTab: Tab? {
        tabs.first(where: { $0.id == activeTabId })
    }

    func activateTab(_ id: Tab.ID) {
        activeTabId = id
    }

    func newTerminalTab() {
        let tab = Tab(kind: .terminal, title: "Terminal \(tabs.count + 1)")
        tabs.append(tab)
        activeTabId = tab.id
    }

    func closeTab(_ id: Tab.ID) {
        guard tabs.count > 1 else { return }
        tabs.removeAll(where: { $0.id == id })
        if activeTabId == id {
            activeTabId = tabs.last?.id
        }
    }
}
