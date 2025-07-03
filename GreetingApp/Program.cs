using System;

namespace GreetingApp
{
    public static class Greet
    {
        public static string GetMessage(string name)
        {
            return $"Hello, {name}!";
        }

        public static void Main(string[] args)
        {
            Console.WriteLine("Enter your name:");
            var name = Console.ReadLine();
            Console.WriteLine(GetMessage(name));
        }
    }
}
