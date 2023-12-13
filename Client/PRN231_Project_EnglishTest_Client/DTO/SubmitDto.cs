namespace PRN231_Project_EnglishTest_Client.Dto
{
    public class SubmitDto
    {
        public int testId { get; set; }
        public int resultId { get; set; }
        public List<ResultDetailDto> listAnswer { get; set; }
    }
}
