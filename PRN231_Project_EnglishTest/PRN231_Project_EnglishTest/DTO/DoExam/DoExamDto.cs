using Microsoft.AspNetCore.OData.Query;
using Microsoft.EntityFrameworkCore.Metadata;
using PRN231_Project_EnglishTest.Dto;
using PRN231_Project_EnglishTest.Models;

namespace PRN231_Project_EnglishTest.DTO.DoExam
{
    public class DoExamDto
    {
        public string TestName { get; set; }
        public int Durantion { get; set; }
        public List<Question> questions { get; set; } = new List<Question>();
    }
}
