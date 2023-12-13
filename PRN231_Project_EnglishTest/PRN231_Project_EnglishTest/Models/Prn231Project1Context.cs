using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace PRN231_Project_EnglishTest.Models;

public partial class Prn231Project1Context : DbContext
{
    public Prn231Project1Context()
    {
    }

    public Prn231Project1Context(DbContextOptions<Prn231Project1Context> options)
        : base(options)
    {
    }

    public virtual DbSet<Option> Options { get; set; }

    public virtual DbSet<Question> Questions { get; set; }

    public virtual DbSet<Result> Results { get; set; }

    public virtual DbSet<ResultDetail> ResultDetails { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Test> Tests { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=(local)\\SQLEXPRESS01;database=PRNPRJ4;Integrated security=true;TrustServerCertificate=true;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Option>(entity =>
        {
            entity.HasKey(e => e.OptionId).HasName("PK__Options__F4EACE1B87C873AE");

            entity.Property(e => e.OptionId).HasColumnName("option_id");
            entity.Property(e => e.IsCorrect).HasColumnName("is_correct");
            entity.Property(e => e.OptionText)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("option_text");
            entity.Property(e => e.QuestionId).HasColumnName("question_id");

            entity.HasOne(d => d.Question).WithMany(p => p.Options)
                .HasForeignKey(d => d.QuestionId)
                .HasConstraintName("FK__Options__questio__3E52440B");
        });

        modelBuilder.Entity<Question>(entity =>
        {
            entity.HasKey(e => e.QuestionId).HasName("PK__Question__2EC21549DD41282C");

            entity.Property(e => e.QuestionId).HasColumnName("question_id");
            entity.Property(e => e.QuestionText)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("question_text");
            entity.Property(e => e.TestId).HasColumnName("test_id");

            entity.HasOne(d => d.Test).WithMany(p => p.Questions)
                .HasForeignKey(d => d.TestId)
                .HasConstraintName("FK__Questions__test___3B75D760");
        });

        modelBuilder.Entity<Result>(entity =>
        {
            entity.HasKey(e => e.ResultId).HasName("PK__Results__AFB3C31638F4E8D4");

            entity.Property(e => e.ResultId).HasColumnName("result_id");
            entity.Property(e => e.Score).HasColumnName("score");
            entity.Property(e => e.StartAt)
                .HasColumnType("datetime")
                .HasColumnName("start_at");
            entity.Property(e => e.SubmittedAt)
                .HasColumnType("datetime")
                .HasColumnName("submitted_at");
            entity.Property(e => e.TestId).HasColumnName("test_id");
            entity.Property(e => e.UserId).HasColumnName("user_id");

            entity.HasOne(d => d.Test).WithMany(p => p.Results)
                .HasForeignKey(d => d.TestId)
                .HasConstraintName("FK__Results__test_id__4222D4EF");

            entity.HasOne(d => d.User).WithMany(p => p.Results)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__Results__user_id__412EB0B6");
        });

        modelBuilder.Entity<ResultDetail>(entity =>
        {
            entity.HasKey(e => new { e.ResultDetailId, e.ResultId, e.QuestionId }).HasName("PK__ResultDe__5A2A2EDFFB993053");

            entity.ToTable("ResultDetail");

            entity.Property(e => e.ResultDetailId)
                .ValueGeneratedOnAdd()
                .HasColumnName("result_detail_id");
            entity.Property(e => e.ResultId).HasColumnName("result_id");
            entity.Property(e => e.QuestionId).HasColumnName("question_id");
            entity.Property(e => e.OptionId).HasColumnName("option_id");

            entity.HasOne(d => d.Option).WithMany(p => p.ResultDetails)
                .HasForeignKey(d => d.OptionId)
                .HasConstraintName("FK__ResultDet__optio__59063A47");

            entity.HasOne(d => d.Question).WithMany(p => p.ResultDetails)
                .HasForeignKey(d => d.QuestionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ResultDet__quest__5812160E");

            entity.HasOne(d => d.Result).WithMany(p => p.ResultDetails)
                .HasForeignKey(d => d.ResultId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ResultDet__resul__571DF1D5");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.ToTable("Role");

            entity.Property(e => e.RoleId)
                .ValueGeneratedNever()
                .HasColumnName("role_id");
            entity.Property(e => e.RoleName)
                .HasMaxLength(50)
                .HasColumnName("role_name");
        });

        modelBuilder.Entity<Test>(entity =>
        {
            entity.HasKey(e => e.TestId).HasName("PK__Tests__F3FF1C02E75255C7");

            entity.Property(e => e.TestId).HasColumnName("test_id");
            entity.Property(e => e.Duration).HasColumnName("duration");
            entity.Property(e => e.TestDescription)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("test_description");
            entity.Property(e => e.TestName)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("test_name");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__Users__B9BE370F423B85B8");

            entity.Property(e => e.UserId).HasColumnName("user_id");
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("email");
            entity.Property(e => e.Password)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("password");
            entity.Property(e => e.RoleId).HasColumnName("role_id");
            entity.Property(e => e.Username)
                .HasMaxLength(255)
                .IsUnicode(false)
                .HasColumnName("username");

            entity.HasOne(d => d.Role).WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .HasConstraintName("FK_Users_Role");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
