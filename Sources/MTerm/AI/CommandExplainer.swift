import Foundation

struct CommandExplainer {
    func explain(_ command: String) async -> String {
        let trimmed = command.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return "Type a command to get an explanation." }

        if let manPage = await fetchManPage(for: trimmed) {
            return manPage
        }

        return "No documentation found for '\(trimmed)'. Try a more specific command."
    }

    private func fetchManPage(for command: String) async -> String? {
        await withCheckedContinuation { continuation in
            let task = Process()
            task.executableURL = URL(fileURLWithPath: "/usr/bin/man")
            task.arguments = [command]

            let pipe = Pipe()
            task.standardOutput = pipe

            do {
                try task.run()
                task.waitUntilExit()

                guard task.terminationStatus == 0 else {
                    continuation.resume(returning: nil)
                    return
                }

                let data = pipe.fileHandleForReading.readDataToEndOfFile()
                guard let output = String(data: data, encoding: .utf8) else {
                    continuation.resume(returning: nil)
                    return
                }

                let lines = output.components(separatedBy: .newlines)
                    .filter { !$0.isEmpty }
                    .prefix(20)
                    .joined(separator: "\n")

                continuation.resume(returning: lines.isEmpty ? nil : lines)
            } catch {
                continuation.resume(returning: nil)
            }
        }
    }
}
