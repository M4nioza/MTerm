import Foundation

enum TabKind: Equatable {
    case terminal
    case editor
    case preview
    case markdown
    case aiDiff
    case gitDiff
    case gitHistory
}

struct Tab: Identifiable, Equatable {
    let id: UUID
    var kind: TabKind
    var title: String

    init(id: UUID = UUID(), kind: TabKind, title: String) {
        self.id = id
        self.kind = kind
        self.title = title
    }
}
