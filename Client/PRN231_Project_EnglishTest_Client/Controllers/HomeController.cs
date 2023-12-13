using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRN231_Project_EnglishTest_Client.Models;
using System.Diagnostics;
using static System.Net.Mime.MediaTypeNames;

namespace PRN231_Project_EnglishTest_Client.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public async Task<IActionResult> IndexAsync(string? search)
        {

            string link = "http://localhost:5166/api/Test";
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage res = await client.GetAsync(link))
                {
                    if (res.IsSuccessStatusCode)
                    {
                        using (HttpContent content = res.Content)
                        {
                            string result = await content.ReadAsStringAsync();
                            List<Test> tests = JsonConvert.DeserializeObject<List<Test>>(result);
                            if (string.IsNullOrEmpty(search))
                            {
                                ViewBag.Test = tests;
                            }
                            else
                            {
                                ViewBag.Test = tests.Where(x => x.TestName.Contains(search)).ToList();
                            }

                            return View();
                        }
                    }
                    else
                    {
                        return View();
                    }
                }
            }
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}