using Microsoft.AspNetCore.Mvc;
using PRN231_Project_EnglishTest_Client.Dto;
using PRN231_Project_EnglishTest_Client.DTO.SignUp;

namespace PRN231_Project_EnglishTest_Client.Controllers
{
    public class SignUpController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> PostRegisterAsync(string email,string username, string password, string confirmpassword)
        {
            SignUpDto signup = new SignUpDto
            {
                Email = email,
                Username = username,
                Password = password,
                RePassword = confirmpassword,
            };

            if (!password.Equals(confirmpassword))
            {
                TempData["signup"] = "Password and confirm password not match";
                return RedirectToAction("Index");
            }

            string link = "http://localhost:5166/api/Users";
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage res = await client.PostAsJsonAsync(link, signup))
                {
                    if (res.IsSuccessStatusCode)
                    {
                        TempData["signup"] = "Sign up success";
                        // Lưu thông tin user vào Session
                        return RedirectToAction("Index", "Login");
                    }
                    else
                    {
                        TempData["signup"] = "Sign up fail please try again!";
                        return RedirectToAction("Index", "SignUp");
                    }
                }
            }
        }
    }
}
