using System;
using System.Collections.Generic;

namespace PRN231_Project_EnglishTest_Client.Dto;

public partial class OptionDto
{
    public int OptionId { get; set; }

    public int? QuestionId { get; set; }

    public string? OptionText { get; set; }

    public bool? IsCorrect { get; set; }

    public virtual QuestionDto? Question { get; set; }

    public virtual ICollection<ResultDetailDto> ResultDetails { get; set; } = new List<ResultDetailDto>();
}

public partial class OptionSubmit
{
    public int? QuestionId { get; set; }

    public string? OptionText { get; set; }

    public bool? IsCorrect { get; set; }
}

