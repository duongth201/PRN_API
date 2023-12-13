using PRN231_Project_EnglishTest.Dto;
using PRN231_Project_EnglishTest.Models;

namespace PRN231_Project_EnglishTest.DTO
{
    public class SubmitDto
    {
        public int testId { get; set; }
        public int resultId { get; set; }
        public List<ResultDetailDto> listAnswer { get; set; }
    }
}
