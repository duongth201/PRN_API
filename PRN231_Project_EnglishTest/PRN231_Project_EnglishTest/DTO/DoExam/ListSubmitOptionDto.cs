namespace PRN231_Project_EnglishTest.DTO.DoExam
{
    public class ListSubmitOptionDto
    {
        public int resultid { get; set; }
        public int testid { get; set; }
        public int userid { get; set; }
        public List<int> selectedOptions { get; set; } = new List<int>();
    }
}
