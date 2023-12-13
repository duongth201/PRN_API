using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRN231_Project_EnglishTest_Client.Dto.DoExam;
using PRN231_Project_EnglishTest_Client.Models;

namespace PRN231_Project_EnglishTest_Client.Controllers
{
    public class ResultController : Controller
    {
        public async Task<IActionResult> ResultPage(int resultid)
        {
            string link = "http://localhost:5166/api/Result/" + resultid.ToString();
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage res = await client.GetAsync(link))
                {
                    if (res.IsSuccessStatusCode)
                    {
                        using (HttpContent content = res.Content)
                        {
                            string result1 = await content.ReadAsStringAsync();
                            Result result = JsonConvert.DeserializeObject<Result>(result1);
                            var usersession = HttpContext.Session.GetString("Userid") == null ? "0" : HttpContext.Session.GetString("Userid");

                            if (result == null)
                            {
                                return RedirectToAction("Error", "Home");
                            }
                            else
                            {
                                if (!result.UserId.ToString().Equals(usersession))
                                {
                                    return RedirectToAction("Error", "Home");
                                }

                                ViewBag.Result = result;
                                return View();
                            }
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
