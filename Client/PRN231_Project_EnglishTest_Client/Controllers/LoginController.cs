using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRN231_Project_EnglishTest_Client.Dto;
using PRN231_Project_EnglishTest_Client.Models;

namespace PRN231_Project_EnglishTest_Client.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> PostLoginAsync(string email, string password)
        {
            LoginDto login = new LoginDto
            {
                Email = email,
                Password = password
            };

            string link = "http://localhost:5166/api/Users/Login";
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage res = await client.PostAsJsonAsync(link, login))
                {
                    if (res.IsSuccessStatusCode)
                    {
                        using (HttpContent content = res.Content)
                        {
                            string result = await content.ReadAsStringAsync();
                            User user = JsonConvert.DeserializeObject<User>(result);


                            // Lưu thông tin user vào Session
                            HttpContext.Session.SetString("Username", user.Username);
                            HttpContext.Session.SetString("Userid", user.UserId.ToString());
                            HttpContext.Session.SetString("Role", user.RoleId.ToString());

                            return RedirectToAction("Index", "Home");
                        }

                    }
                    else
                    {
                        TempData["login"] = "Login fail pls try again!";
                        return RedirectToAction("Index");
                    }
                }
            }
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index");
        }
    }
}
