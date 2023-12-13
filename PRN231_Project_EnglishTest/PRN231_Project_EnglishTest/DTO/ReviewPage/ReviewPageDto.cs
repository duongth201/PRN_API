using PRN231_Project_EnglishTest.Models;

namespace PRN231_Project_EnglishTest.DTO.ReviewPage
{
    public class ReviewPageDto
    {
        public Question question { get; set; }
        public List<int> selectedOption { get; set; }
    }
}
