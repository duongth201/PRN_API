using System;
using System.Collections.Generic;

namespace PRN231_Project_EnglishTest_Client.Dto;

public partial class QuestionDto
{
    public int QuestionId { get; set; }

    public int? TestId { get; set; }

    public string? QuestionText { get; set; }

    public virtual ICollection<OptionDto> Options { get; set; } = new List<OptionDto>();

    public virtual ICollection<ResultDetailDto> ResultDetails { get; set; } = new List<ResultDetailDto>();

    public virtual TestDto? Test { get; set; }
}
