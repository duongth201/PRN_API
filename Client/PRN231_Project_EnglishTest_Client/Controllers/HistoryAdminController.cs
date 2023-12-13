using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRN231_Project_EnglishTest_Client.DTO.AdminHis;
using PRN231_Project_EnglishTest_Client.Models;

namespace PRN231_Project_EnglishTest_Client.Controllers
{
    public class HistoryAdminController : Controller
    {
        public async Task<IActionResult> IndexAsync()
        {
            var role = HttpContext.Session.GetString("Role") == null ? "0" : HttpContext.Session.GetString("Role");
            if (!role.Equals("1"))
            {
                return RedirectToAction("Error", "Home");
            }

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
                            List<Test> test = JsonConvert.DeserializeObject<List<Test>>(result);
                            ViewBag.Tests = test;
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

        public async Task<IActionResult> AdminHis(int testid)
        {
            HttpContext.Session.SetString("testidchart", testid.ToString());
            var role = HttpContext.Session.GetString("Role") == null ? "0" : HttpContext.Session.GetString("Role");
            if (!role.Equals("1"))
            {
                return RedirectToAction("Error", "Home");
            }

            string link = "http://localhost:5166/api/Result/AdminHis/" + testid;
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage res = await client.GetAsync(link))
                {
                    if (res.IsSuccessStatusCode)
                    {
                        using (HttpContent content = res.Content)
                        {
                            string result = await content.ReadAsStringAsync();
                            List<AdminHisDto> adminHis = JsonConvert.DeserializeObject<List<AdminHisDto>>(result);
                            ViewBag.His = adminHis;
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
