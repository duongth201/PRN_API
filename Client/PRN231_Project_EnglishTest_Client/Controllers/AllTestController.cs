using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRN231_Project_EnglishTest_Client.Models;

namespace PRN231_Project_EnglishTest_Client.Controllers
{
    public class AllTestController : Controller
    {
       
        public async Task<IActionResult> Index()
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
                            List<Test> test = JsonConvert.DeserializeObject<List<Test>>(result);

                            ViewBag.AllTest = test;

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
        public async Task<IActionResult> Detail(int id)
        {

            string link = "http://localhost:5166/api/Question?testId=" + id;
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage res = await client.GetAsync(link))
                {
                    if (res.IsSuccessStatusCode)
                    {
                        using (HttpContent content = res.Content)
                        {
                            string result = await content.ReadAsStringAsync();
                            List<Question> ques = JsonConvert.DeserializeObject<List<Question>>(result);

                            ViewBag.GetQuesById = ques;
                            ViewBag.TestId = id;
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

        public async Task<IActionResult> Create()
        {

            
            using (HttpClient client = new HttpClient())
            {
                return View();
            }
        }
        public async Task<IActionResult> PostCreate(string textname, string textdecription, int duration)
        {
            Test t = new Test
            {
                TestName = textname,
                TestDescription = textdecription,
                Duration = duration
            };
            string link = "http://localhost:5166/api/Test";
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage res = await client.PostAsJsonAsync(link, t))
                {
                    if (res.IsSuccessStatusCode)
                    {
                        using (HttpContent content = res.Content)
                        {


                            return RedirectToAction("Index", "AllTest");
                        }
                    }
                    else
                    {
                        return RedirectToAction("Error", "AllTest");
                    }
                }
            }
        }

        public async Task<IActionResult> Edit(int id)
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

                            ViewBag.GetTestById = test;
                            ViewBag.EditId = id;
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
        public async Task<IActionResult> PutEdit(int id, string textname, string textdecription, int duration)
        {
            Test t = new Test
            {
                TestName = textname,
                TestDescription = textdecription,
                Duration = duration
            };
            string link = "http://localhost:5166/api/Test/" + id;
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage res = await client.PutAsJsonAsync(link, t))
                {
                    if (res.IsSuccessStatusCode)
                    {
                        using (HttpContent content = res.Content)
                        {


                            return RedirectToAction("Index", "AllTest");
                        }
                    }
                    else
                    {
                        return RedirectToAction("Error", "AllTest");
                    }
                }
            }
        }
        public async Task<IActionResult> Delete(int id)
        {
            string link = "http://localhost:5166/api/Test/" + id;
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage res = await client.DeleteAsync(link))
                {
                    if (res.IsSuccessStatusCode)
                    {
                        using (HttpContent content = res.Content)
                        {


                            return RedirectToAction("Index", "AllTest");
                        }
                    }
                    else
                    {
                        return RedirectToAction("Error", "AllTest");
                    }
                }
            }
        }

        public async Task<IActionResult> CreateQues(int id)
        {


            using (HttpClient client = new HttpClient())
            {
                ViewBag.createTestId = id;
                return View();
            }
        }
        public async Task<IActionResult> PostCreateQuestion(int id, string questionText, string optionsData)
        {
            List<Option> options = Newtonsoft.Json.JsonConvert.DeserializeObject<List<Option>>(optionsData);
            Question que = new Question
            {
                TestId= id,
                QuestionText = questionText,
                Options = options
            };

            List<Question> questions = new List<Question>();
            questions.Add(que);
            string link = "http://localhost:5166/api/Questions/addQuestions";
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage res = await client.PostAsJsonAsync(link, questions))
                {
                    if (res.IsSuccessStatusCode)
                    {
                        using (HttpContent content = res.Content)
                        {


                            return RedirectToAction("Index", "AllTest");
                        }
                    }
                    else
                    {
                        return RedirectToAction("Error", "AllTest");
                    }
                }
            }
        }





        public async Task<IActionResult> DeleteQuestion(int id)
        {
            string link = "http://localhost:5166/api/Question/" + id;
            using (HttpClient client = new HttpClient())
            {
                using (HttpResponseMessage res = await client.DeleteAsync(link))
                {
                    if (res.IsSuccessStatusCode)
                    {
                        using (HttpContent content = res.Content)
                        {


                            return RedirectToAction("Index", "AllTest");
                        }
                    }
                    else
                    {
                        return RedirectToAction("Error", "AllTest");
                    }
                }
            }
        }




    }
}
