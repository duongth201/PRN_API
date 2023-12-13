using PRN231_Project_EnglishTest_Client.Models;

namespace PRN231_Project_EnglishTest_Client.DTO.ReviewPage
{
    public class ReviewPageDto
    {
        public Question question { get; set; }
        public List<int> selectedOption { get; set; }
    }
}
