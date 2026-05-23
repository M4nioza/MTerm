import AppKit
import Foundation
import SwiftTerm

final class TerminalController: TerminalViewDelegate {
    private let session: TerminalSession
    private let onTitleChange: (String) -> Void

    init(session: TerminalSession, onTitleChange: @escaping (String) -> Void) {
        self.session = session
        self.onTitleChange = onTitleChange
    }

    func sizeChanged(source: TerminalView, newCols: Int, newRows: Int) {
    }

    func setTerminalTitle(source: TerminalView, title: String) {
        onTitleChange(title)
    }

    func hostCurrentDirectoryUpdate(source: TerminalView, directory: String?) {
        session.cwd = directory
    }

    func send(source: TerminalView, data: ArraySlice<UInt8>) {
    }

    func scrolled(source: TerminalView, position: Double) {
    }

    func requestOpenLink(source: TerminalView, link: String, params: [String: String]) {
        guard let url = URL(string: link) else { return }
        NSWorkspace.shared.open(url)
    }

    func bell(source: TerminalView) {
    }

    func clipboardCopy(source: TerminalView, content: Data) {
    }

    func iTermContent(source: TerminalView, content: ArraySlice<UInt8>) {
    }

    func rangeChanged(source: TerminalView, startY: Int, endY: Int) {
    }
}
