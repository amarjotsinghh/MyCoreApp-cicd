using Xunit;
using GreetingApp;

namespace GreetingApp.Tests
{
    public class GreetTests
    {
        [Fact]
        public void GetMessage_ReturnsCorrectGreeting()
        {
            var result = Greet.GetMessage("Amarjot");
            Assert.Equal("Hello, Amarjot!", result);
        }
    }
}
