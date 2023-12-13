using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRN231_Project_EnglishTest_Client.Dto;
using PRN231_Project_EnglishTest_Client.Dto.DoExam;
using PRN231_Project_EnglishTest_Client.Models;

namespace PRN231_Project_EnglishTest_Client.Controllers
{
    public class QuestionController : Controller
    {
        public async Task<IActionResult> IndexAsync(int? testid)
        {
            var role = HttpContext.Session.GetString("Role") == null ? "0" : HttpContext.Session.GetString("Role");
            if (role.Equals("0"))
            {
                return RedirectToAction("Index", "Login");
            }

            var result = new ResultDto()
            {
                UserId = int.Parse(HttpContext.Session.GetString("Userid")),
                TestId = testid,
                Score = 0,
            };

            string link1 = "http://localhost:5166/api/Result";
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage res = await client.PostAsJsonAsync(link1, result))
                {
                    if (res.IsSuccessStatusCode)
                    {
                        using (HttpContent content = res.Content)
                        {
                            string result1 = await content.ReadAsStringAsync();
                            Result result2 = JsonConvert.DeserializeObject<Result>(result1);
                            ViewBag.Result = result2;
                        }
                    }
                    else
                    {
                        return RedirectToAction("Error", "Home");
                    }
                }
            }

            string link = "http://localhost:5166/api/Questions/" + testid;
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage res = await client.GetAsync(link))
                {
                    if (res.IsSuccessStatusCode)
                    {
                        using (HttpContent content = res.Content)
                        {
                            string result1 = await content.ReadAsStringAsync();
                            DoExamDto questions = JsonConvert.DeserializeObject<DoExamDto>(result1);
                            ViewBag.Questions = questions;
                        }
                    }
                    else
                    {
                        return RedirectToAction("Error", "Home");
                    }
                }
            }

            return View();
        }

       
    }
}
