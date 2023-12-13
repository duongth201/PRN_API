using System;
using System.Collections.Generic;

namespace PRN231_Project_EnglishTest.Models;

public partial class Question
{
    public int QuestionId { get; set; }

    public int? TestId { get; set; }

    public string? QuestionText { get; set; }

    public virtual ICollection<Option> Options { get; set; } = new List<Option>();

    public virtual ICollection<ResultDetail> ResultDetails { get; set; } = new List<ResultDetail>();

    public virtual Test? Test { get; set; }
}
