import Foundation
import Observation

@Observable
final class TerminalSession: Identifiable {
    let id: UUID
    var title: String
    var cwd: String?

    init(id: UUID = UUID(), title: String = "Terminal") {
        self.id = id
        self.title = title
    }
}
