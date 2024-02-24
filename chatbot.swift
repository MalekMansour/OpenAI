// IOS Version
import OpenAI

let apiKey = "MY_API_KEY"
OpenAI.apiKey = apiKey

var messages = [[String: String]]()
let systemMsg = "Write Prompt"
messages.append(["role": "system", "content": systemMsg])

print("Your new assistant is ready!")
var userInput = ""
while userInput != "quit()" {
    if let input = readLine() {
        userInput = input
        messages.append(["role": "user", "content": input])
        let response = try? OpenAI.ChatCompletion.create(
            model: "gpt-3.5-turbo",
            messages: messages)
        if let reply = response?.choices[0].message.content {
            messages.append(["role": "assistant", "content": reply])
            print("\n\(reply)\n")
        }
    }
}
