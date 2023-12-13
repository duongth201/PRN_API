using System;
using System.Collections.Generic;

namespace PRN231_Project_EnglishTest_Client.Models;

public partial class User
{
    public int UserId { get; set; }

    public string? Username { get; set; }

    public string? Password { get; set; }

    public string? Email { get; set; }

    public int? RoleId { get; set; }

    public virtual ICollection<Result> Results { get; set; } = new List<Result>();

    public virtual Role? Role { get; set; }
}
