using System.Globalization;
using Microsoft.AspNetCore.Mvc;

namespace Server.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PortfolioPostController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<PortfolioPostController> _logger;

        public PortfolioPostController(ILogger<PortfolioPostController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<PortfolioPost> Get()
        {
            return Enumerable.Range(1, 5).Select(index => new PortfolioPost
                {
                    Title = DateTime.Now.AddDays(index).ToString(CultureInfo.InvariantCulture),
                    Description = Summaries[Random.Shared.Next(Summaries.Length)]
                })
                .ToArray();
        }
    }
}