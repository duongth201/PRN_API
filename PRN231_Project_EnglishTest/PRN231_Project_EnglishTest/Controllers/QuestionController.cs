using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PRN231_Project_EnglishTest.DTO.DoExam;
using PRN231_Project_EnglishTest.Dto;
using PRN231_Project_EnglishTest.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;
using System.Reflection.Metadata;
using System;

namespace PRN231_Project_EnglishTest.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuestionController : ControllerBase
    {
        private readonly Prn231Project1Context context;
        private IMapper mapper;
        public QuestionController(Prn231Project1Context context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }

        [HttpGet]

        public IActionResult GetAllQuestions(int? testId, string? sort)
        {
            try
            {
                // Get all questions from the context
                var questions = context.Questions.Include(o => o.Options).ToList();

                // Filter by testId if it is provided
                if (testId.HasValue)
                {
                    questions = questions.Where(q => q.TestId == testId).ToList();
                }

                // Apply sorting based on the 'sort' parameter
                if (!string.IsNullOrEmpty(sort))
                {
                    switch (sort.ToLower())
                    {
                        case "asc":
                            questions = questions.OrderBy(q => q.QuestionId).ToList();
                            break;
                        case "desc":
                            questions = questions.OrderByDescending(q => q.QuestionId).ToList();
                            break;

                        default:

                            break;
                    }
                }

                // Execute the query and return the results
                var questionList = questions.ToList();
                return Ok(questionList);
            }
            catch (Exception)
            {
                throw;
            }
        }


        [HttpGet("{id}")]
        public IActionResult GetQuestionByQuestionId(int id)
        {
            try
            {
                var question = context.Questions
        .Include(o => o.Options)
        .Where(x => x.QuestionId == id)
        .FirstOrDefault();



                return Ok(question);
            }
            catch (Exception)
            {

                throw;
            }
        }

        [HttpPost]
        public IActionResult AddListQuest(QuestionDto question)
        {
            try
            {
                var q = mapper.Map<Question>(question);
                context.Questions.Add(q);
                context.SaveChanges();
                return Ok();
            }
            catch (Exception)
            {

                return BadRequest();
            }
        }
        [HttpPut("{id}")]
        public IActionResult UpdateQuestion(QuestionDto question, int id)
        {
            try
            {
                var temp = context.Questions.Where(q => q.QuestionId == id).FirstOrDefault();
                if (temp == null)
                    return NotFound();
                var q = mapper.Map<Question>(question);

                temp.QuestionText = q.QuestionText;
                temp.TestId = q.TestId;

                var listOptions = context.Options.Where(o => o.QuestionId == temp.QuestionId).ToList();
                context.Options.RemoveRange(listOptions);

                var resultdetail = context.ResultDetails.Where(rd => rd.QuestionId == temp.QuestionId).ToList();
                context.ResultDetails.RemoveRange(resultdetail);
                temp.Options = q.Options;

                context.Questions.Update(temp);
                context.SaveChanges();
                return Ok();
            }
            catch (Exception)
            {

                return BadRequest();
            }
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteQuestion(int id)
        {
            try
            {
                var temp = context.Questions.Where(q => q.QuestionId == id).FirstOrDefault();

                if (temp == null)
                    return NotFound();

                var listOptions = context.Options.Where(o => o.QuestionId == temp.QuestionId).ToList();
                context.Options.RemoveRange(listOptions);

                var resultdetail = context.ResultDetails.Where(rd => rd.QuestionId == temp.QuestionId).ToList();
                context.ResultDetails.RemoveRange(resultdetail);

                context.Questions.Remove(temp);
                context.SaveChanges();
                return Ok();
            }
            catch (Exception)
            {

                return BadRequest();
            }
        }
    }
}