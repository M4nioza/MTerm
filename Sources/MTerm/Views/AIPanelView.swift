import SwiftUI

struct AIPanelView: View {
    @State private var inputText = ""
    @State private var messages: [AIMessage] = []

    var body: some View {
        VStack(spacing: 0) {
            Text("AI Agent")
                .font(.headline)
                .padding(8)

            Divider()

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 8) {
                    ForEach(messages) { message in
                        MessageBubble(message: message)
                    }
                }
                .padding(8)
            }

            Divider()

            HStack(spacing: 4) {
                TextField("Ask about a command...", text: $inputText)
                    .textFieldStyle(.plain)
                    .padding(8)

                Button(action: sendMessage) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.title2)
                }
                .buttonStyle(.plain)
                .disabled(inputText.trimmingCharacters(in: .whitespaces).isEmpty)
                .padding(4)
            }
            .padding(4)
        }
        .background(Color(NSColor.controlBackgroundColor))
    }

    private func sendMessage() {
        let text = inputText.trimmingCharacters(in: .whitespaces)
        guard !text.isEmpty else { return }

        messages.append(AIMessage(role: .user, content: text))
        inputText = ""

        Task {
            let reply = await CommandExplainer().explain(text)
            messages.append(AIMessage(role: .assistant, content: reply))
        }
    }
}

struct MessageBubble: View {
    let message: AIMessage

    var body: some View {
        HStack {
            if message.role == .user {
                Spacer(minLength: 40)
            }

            Text(message.content)
                .font(.callout)
                .padding(8)
                .background(
                    message.role == .user
                        ? Color(NSColor.selectedContentBackgroundColor).opacity(0.2)
                        : Color(NSColor.controlBackgroundColor)
                )
                .cornerRadius(8)

            if message.role == .assistant {
                Spacer(minLength: 40)
            }
        }
    }
}
