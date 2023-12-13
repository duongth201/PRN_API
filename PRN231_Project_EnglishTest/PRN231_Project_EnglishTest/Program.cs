using AutoMapper;
using Microsoft.AspNetCore.OData;
using Microsoft.EntityFrameworkCore;
using PRN231_Project_EnglishTest.AutoMapper;
using PRN231_Project_EnglishTest.Models;

namespace PRN231_Project_EnglishTest
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            builder.Services.AddControllers().AddJsonOptions(option =>
            {
                option.JsonSerializerOptions.ReferenceHandler = System.Text.Json.Serialization.ReferenceHandler.IgnoreCycles;
            });

            builder.Services.AddControllers().AddOData(option => option.Select().Filter()
                .Count().OrderBy().Expand());

            builder.Services.AddDbContext<Prn231Project1Context>(options =>
                options.UseSqlServer(builder.Configuration.GetConnectionString("DbConnection"))
            );

            // add automapper
            var mappingConfig = new MapperConfiguration(mc =>
            {
                mc.AddProfile(new MapperProfile());
            });

            IMapper mapper = mappingConfig.CreateMapper();
            builder.Services.AddSingleton(mapper);

            //Add-start
            builder.Services.AddSwaggerGen();
            builder.Services.AddControllers();
            builder.Services.AddCors();
            builder.Services.AddCors(act =>
            {
                act.AddPolicy("_MainPolicy", options =>
                {
                    options.AllowAnyHeader();
                    options.AllowAnyMethod();
                    options.AllowAnyOrigin();
                });
            });

            //Add - end

            var app = builder.Build();

            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }
            app.MapControllers();

            app.UseCors("_MainPolicy");


            app.Run();

        }
    }
}