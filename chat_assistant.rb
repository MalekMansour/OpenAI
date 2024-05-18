require 'openai'

OpenAI.api_key = "MY_API_KEY"

messages = []
system_msg = "Write Prompt"
messages << {role: "system", content: system_msg}

puts "Your new assistant is ready!"
loop do
  print "> "
  message = gets.chomp
  break if message == "quit()"
  
  messages << {role: "user", content: message}
  response = OpenAI::ChatCompletion.create(
    model: "gpt-3.5-turbo",
    messages: messages
  )
  reply = response["choices"][0]["message"]["content"]
  messages << {role: "assistant", content: reply}
  puts "\n#{reply}\n"
end
