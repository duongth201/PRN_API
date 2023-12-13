using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRN231_Project_EnglishTest_Client.Models;

namespace PRN231_Project_EnglishTest_Client.Controllers
{
    public class TestController : Controller
    {
        public async Task<IActionResult> IndexAsync(int? id)
        {

            string link = "http://localhost:5166/api/Test/" + id;
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage res = await client.GetAsync(link))
                {
                    if (res.IsSuccessStatusCode)
                    {
                        using (HttpContent content = res.Content)
                        {
                            string result = await content.ReadAsStringAsync();
                            Test test = JsonConvert.DeserializeObject<Test>(result);

                            ViewBag.Test = test;

                            return View();
                        }
                    }
                    else
                    {
                        return RedirectToAction("Error", "Home");
                    }
                }
            }
        }
    }
}
