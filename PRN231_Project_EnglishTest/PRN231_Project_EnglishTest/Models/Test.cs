using System;
using System.Collections.Generic;

namespace PRN231_Project_EnglishTest.Models;

public partial class Test
{
    public int TestId { get; set; }

    public string? TestName { get; set; }

    public string? TestDescription { get; set; }

    public int? Duration { get; set; }

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();

    public virtual ICollection<Result> Results { get; set; } = new List<Result>();
}
