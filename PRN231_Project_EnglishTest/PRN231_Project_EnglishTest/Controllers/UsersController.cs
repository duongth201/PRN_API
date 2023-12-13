using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PRN231_Project_EnglishTest.DTO;
using PRN231_Project_EnglishTest.DTO.SignUp;
using PRN231_Project_EnglishTest.Models;

namespace PRN231_Project_EnglishTest.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly Prn231Project1Context context;
        private IMapper mapper;
        public UsersController(Prn231Project1Context context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }

        // Get all users
        [HttpGet("GetAll")]
        public IActionResult GetAllUsers()
        {
            try
            {
                return Ok(context.Users.Include(x => x.Role).ToList());
            }
            catch
            {
                return BadRequest();
            }
        }

        [HttpPost("Login")]
        public IActionResult Login(LoginDto login)
        {
            try
            {
                var user = context.Users.Include(x => x.Role)
                    .FirstOrDefault(x => x.Email.Equals(login.Email));

                if (user == null)
                {
                    return NotFound();
                }

                if (!user.Password.Equals(login.Password))
                {
                    return Unauthorized();
                }
                else
                {
                    return Ok(user);
                }
            }
            catch
            {
                return BadRequest();
            }
        }

        [HttpPost]
        public IActionResult AddUser(SignUpDto signUpDto)
        {
            try
            {
                if (context.Users
                    .FirstOrDefault(x => x.Username.Equals(signUpDto.Username) || x.Email.Equals(signUpDto.Email)) != null)
                {
                    return BadRequest();
                }

                var user = mapper.Map<User>(signUpDto);
                context.Add(user);
                context.SaveChanges();
                return Ok();
            }
            catch (Exception)
            {

                return BadRequest();
            }
        }
    }
}
