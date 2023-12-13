using System;
using System.Collections.Generic;

namespace PRN231_Project_EnglishTest.Dto;

public partial class UserDto
{
    public int UserId { get; set; }

    public string? Username { get; set; }

    public string? Password { get; set; }

    public string? Email { get; set; }

    public int? RoleId { get; set; }

    public virtual ICollection<ResultDto> Results { get; set; } = new List<ResultDto>();

    public virtual RoleDto? Role { get; set; }
}
