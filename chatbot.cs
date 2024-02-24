using System;
using System.Collections.Generic;
using OpenAI;

class Program
{
    static void Main(string[] args)
    {
        string apiKey = "MY_API_KEY";
        OpenAI.APIKey = apiKey;

        var messages = new List<Dictionary<string, string>>();
        string systemMsg = "Write Prompt";
        messages.Add(new Dictionary<string, string> { { "role", "system" }, { "content", systemMsg } });

        Console.WriteLine("Your new assistant is ready!");
        string userInput = "";
        while (userInput != "quit()")
        {
            userInput = Console.ReadLine();
            messages.Add(new Dictionary<string, string> { { "role", "user" }, { "content", userInput } });
            var response = OpenAI.ChatCompletion.Create(
                model: "gpt-3.5-turbo",
                messages: messages);
            string reply = response.Choices[0].Message.Content;
            messages.Add(new Dictionary<string, string> { { "role", "assistant" }, { "content", reply } });
            Console.WriteLine($"\n{reply}\n");
        }
    }
}
