import Foundation

enum MessageRole {
    case user
    case assistant
    case system
}

struct AIMessage: Identifiable {
    let id: UUID
    let role: MessageRole
    let content: String

    init(id: UUID = UUID(), role: MessageRole, content: String) {
        self.id = id
        self.role = role
        self.content = content
    }
}
