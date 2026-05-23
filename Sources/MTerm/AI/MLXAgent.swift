import Foundation

struct MLXAgent {
    private(set) var isAvailable = false
    private(set) var loadedModelId: String?

    mutating func loadModel(id: String) async throws {
        loadedModelId = id
        isAvailable = true
    }

    func generate(prompt: String) async throws -> String {
        throw AgentError.modelNotLoaded
    }
}

enum AgentError: Error, LocalizedError {
    case modelNotLoaded

    var errorDescription: String? {
        switch self {
        case .modelNotLoaded: "No MLX model loaded. Configure a model in Settings > AI."
        }
    }
}
