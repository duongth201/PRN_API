using AutoMapper;
using PRN231_Project_EnglishTest.Dto;
using PRN231_Project_EnglishTest.DTO;
using PRN231_Project_EnglishTest.DTO.SignUp;
using PRN231_Project_EnglishTest.Models;
using System.IO;

namespace PRN231_Project_EnglishTest.AutoMapper
{
    public class MapperProfile : Profile
    {
        public MapperProfile()
        {
            UserMap();
            ResultMap();
            TestMap();
            ResultDetailMap();
            QuestionsMap();
            OptionsMap();
        }

        public void TestMap()
        {
            CreateMap<TestDto, Test>();
        }

        public void ResultMap()
        {
            CreateMap<ResultDto, Result>();
        }

        public void ResultDetailMap()
        {
            CreateMap<ResultDetailDto, ResultDetail>();
        }

        public void UserMap()
        {
            CreateMap<SignUpDto, User>()
                .ForMember(des => des.RoleId, src => src.MapFrom(x => 3));
        }

        public void QuestionsMap()
        {
            CreateMap<QuestionDto, Question>();
        }
        public void OptionsMap()
        {
            CreateMap<OptionDto, Option>();
        }
    }
}
