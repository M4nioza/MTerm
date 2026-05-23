import SwiftUI
import SwiftTerm

struct TerminalTabView: View {
    @State private var session = TerminalSession()
    @State private var title: String

    init() {
        self._title = State(initialValue: "Terminal")
    }

    var body: some View {
        TerminalViewRepresentable(
            session: session,
            onTitleChange: { newTitle in
                title = newTitle
                session.title = newTitle
            }
        )
    }
}

struct TerminalViewRepresentable: NSViewRepresentable {
    let session: TerminalSession
    let onTitleChange: (String) -> Void

    func makeNSView(context: Context) -> LocalProcessTerminalView {
        let terminal = LocalProcessTerminalView(frame: .zero)
        context.coordinator.controller = TerminalController(
            session: session,
            onTitleChange: onTitleChange
        )
        context.coordinator.terminal = terminal
        terminal.terminalDelegate = context.coordinator.controller
        terminal.nativeBackgroundColor = NSColor(red: 0x1E/255, green: 0x1E/255, blue: 0x2E/255, alpha: 1)
        terminal.nativeForegroundColor = NSColor(red: 0xCD/255, green: 0xD6/255, blue: 0xF4/255, alpha: 1)
        terminal.configureNativeColors()
        terminal.startProcess()
        return terminal
    }

    func updateNSView(_ nsView: LocalProcessTerminalView, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    final class Coordinator {
        var controller: TerminalController?
        var terminal: LocalProcessTerminalView?
    }
}
