require 'openai'

OpenAI.api_key = "MY_API_KEY"

messages = []
system_msg = "Write Prompt"
messages << {role: "system", content: system_msg}

puts "Your new assistant is ready!"
