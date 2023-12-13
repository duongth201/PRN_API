using System;
using System.Collections.Generic;

namespace PRN231_Project_EnglishTest.Dto;

public partial class QuestionDto
{
    public int? TestId { get; set; }

    public string? QuestionText { get; set; }

    public virtual ICollection<OptionDto> Options { get; set; } = new List<OptionDto>();
}
