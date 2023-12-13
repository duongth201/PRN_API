using System;
using System.Collections.Generic;

namespace PRN231_Project_EnglishTest.Dto;

public partial class OptionDto
{
    public int? QuestionId { get; set; }

    public string? OptionText { get; set; }

    public bool? IsCorrect { get; set; }

}
