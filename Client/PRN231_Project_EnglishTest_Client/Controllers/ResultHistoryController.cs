using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRN231_Project_EnglishTest_Client.DTO.ResultHistory;
using PRN231_Project_EnglishTest_Client.DTO.ReviewPage;

namespace PRN231_Project_EnglishTest_Client.Controllers
{
    public class ResultHistoryController : Controller
    {
        public async Task<IActionResult> IndexAsync(int? userid, int? testid)
        {
            var role = HttpContext.Session.GetString("Role") == null ? "0" : HttpContext.Session.GetString("Role");
            var usersession = HttpContext.Session.GetString("Userid") == null ? "0" : HttpContext.Session.GetString("Userid");
            if (!role.Equals("1") && !usersession.Equals(userid.ToString()))
            {
                return RedirectToAction("Error", "Home");
            }

            string link = "http://localhost:5166/api/Result/GetByUserId/" + userid;
            using (HttpClient client = new HttpClient()) 
            {
                using (HttpResponseMessage res = await client.GetAsync(link))
                {
                    if (res.IsSuccessStatusCode)
                    {
                        using (HttpContent content = res.Content)
                        {
                            string result = await content.ReadAsStringAsync();
                            List<ResultHistory> rh = JsonConvert.DeserializeObject<List<ResultHistory>>(result);
                            
                            if (testid != null)
                            {
                                rh = rh.Where(x => x.Testid == testid).ToList();
                            }
                            ViewBag.ResultHistory = rh;
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
