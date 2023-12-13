using System;
using System.Collections.Generic;

namespace PRN231_Project_EnglishTest_Client.Models;

public partial class ResultDetail
{
    public int ResultDetailId { get; set; }

    public int ResultId { get; set; }

    public int QuestionId { get; set; }

    public int? OptionId { get; set; }

    public virtual Option? Option { get; set; }

    public virtual Question Question { get; set; } = null!;

    public virtual Result Result { get; set; } = null!;
}
