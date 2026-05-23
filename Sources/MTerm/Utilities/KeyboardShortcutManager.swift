import AppKit
import SwiftUI

struct Shortcut: Identifiable {
    let id: String
    let title: String
    let keys: [KeyEquivalent]
    let modifiers: EventModifiers
}

struct ShortcutGroup {
    let name: String
    let shortcuts: [Shortcut]
}

final class KeyboardShortcutManager {
    static let shared = KeyboardShortcutManager()

    var groups: [ShortcutGroup] = []

    private init() {
        groups = Self.defaultGroups
    }

    static let defaultGroups: [ShortcutGroup] = [
        ShortcutGroup(name: "Tabs", shortcuts: [
            Shortcut(id: "tab.new", title: "New Tab", keys: [.init("t")], modifiers: .command),
            Shortcut(id: "tab.close", title: "Close Tab", keys: [.init("w")], modifiers: .command),
            Shortcut(id: "tab.next", title: "Next Tab", keys: [.tab], modifiers: .control),
            Shortcut(id: "tab.prev", title: "Previous Tab", keys: [.init("~")], modifiers: [.command, .shift]),
        ]),
        ShortcutGroup(name: "View", shortcuts: [
            Shortcut(id: "view.toggleAI", title: "Toggle AI Panel", keys: [.init("i")], modifiers: [.command, .shift]),
            Shortcut(id: "view.toggleSidebar", title: "Toggle Sidebar", keys: [.init("b")], modifiers: [.command, .shift]),
        ]),
        ShortcutGroup(name: "Pane", shortcuts: [
            Shortcut(id: "pane.splitRight", title: "Split Right", keys: [.init("d")], modifiers: [.command, .shift]),
            Shortcut(id: "pane.splitDown", title: "Split Down", keys: [.init("D")], modifiers: [.command, .shift]),
        ]),
    ]
}
