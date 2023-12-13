using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRN231_Project_EnglishTest_Client.DTO.Chart;
using PRN231_Project_EnglishTest_Client.Models;

namespace PRN231_Project_EnglishTest_Client.Controllers
{
    public class ChartController : Controller
    {
        public async Task<IActionResult> IndexAsync(int testid)
        {
            var role = HttpContext.Session.GetString("Role") == null ? "0" : HttpContext.Session.GetString("Role");
            if (!role.Equals("1"))
            {
                return RedirectToAction("Error", "Home");
            }

            string link = "http://localhost:5166/api/Result/Chart/" + testid.ToString();
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage res = await client.GetAsync(link))
                {
                    if (res.IsSuccessStatusCode)
                    {
                        using (HttpContent content = res.Content)
                        {
                            string result = await content.ReadAsStringAsync();
                            ChartDto chart = JsonConvert.DeserializeObject<ChartDto>(result);
                            string data = "[" + chart.Moc0 + ","
                                + chart.Moc1 + ","
                                + chart.Moc2 + ","
                                + chart.Moc3 + ","
                                + chart.Moc4 + ","
                                + chart.Moc5 + ","
                                + chart.Moc6 + ","
                                + chart.Moc7 + ","
                                + chart.Moc8 + ","
                                + chart.Moc9 + ","
                                + chart.Moc10 +
                                "]";

                            ViewBag.ChartData = data;
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
