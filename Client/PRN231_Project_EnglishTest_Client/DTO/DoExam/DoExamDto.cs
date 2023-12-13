using PRN231_Project_EnglishTest_Client.Models;

namespace PRN231_Project_EnglishTest_Client.Dto.DoExam
{
    public class DoExamDto
    {
        public string TestName { get; set; }
        public int Durantion { get; set; }
        public List<Question> questions { get; set; } = new List<Question>();
    }
}
