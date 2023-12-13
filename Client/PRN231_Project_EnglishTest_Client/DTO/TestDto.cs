using System;
using System.Collections.Generic;

namespace PRN231_Project_EnglishTest_Client.Dto;

public partial class TestDto
{
    public int TestId { get; set; }

    public string? TestName { get; set; }

    public string? TestDescription { get; set; }

    public int? Duration { get; set; }

    public virtual ICollection<QuestionDto> Questions { get; set; } = new List<QuestionDto>();

    public virtual ICollection<ResultDto> Results { get; set; } = new List<ResultDto>();
}
