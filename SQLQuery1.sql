USE [master]
GO
CREATE DATABASE [PRN231_Project1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRN231_Project1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PRN231_Project1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRN231_Project1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PRN231_Project1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PRN231_Project1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRN231_Project1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRN231_Project1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRN231_Project1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRN231_Project1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRN231_Project1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRN231_Project1] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRN231_Project1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRN231_Project1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRN231_Project1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRN231_Project1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRN231_Project1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRN231_Project1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRN231_Project1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRN231_Project1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRN231_Project1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRN231_Project1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRN231_Project1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRN231_Project1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRN231_Project1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRN231_Project1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRN231_Project1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRN231_Project1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRN231_Project1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRN231_Project1] SET RECOVERY FULL 
GO
ALTER DATABASE [PRN231_Project1] SET  MULTI_USER 
GO
ALTER DATABASE [PRN231_Project1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRN231_Project1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRN231_Project1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRN231_Project1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRN231_Project1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRN231_Project1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRN231_Project1', N'ON'
GO
ALTER DATABASE [PRN231_Project1] SET QUERY_STORE = ON
GO
ALTER DATABASE [PRN231_Project1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PRN231_Project1]
GO
/****** Object:  Table [dbo].[Options]    Script Date: 24/07/2023 8:36:31 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[option_id] [int] IDENTITY(1,1) NOT NULL,
	[question_id] [int] NULL,
	[option_text] [varchar](255) NULL,
	[is_correct] [bit] NULL,
 CONSTRAINT [PK__Options__F4EACE1B87C873AE] PRIMARY KEY CLUSTERED 
(
	[option_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 24/07/2023 8:36:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[question_id] [int] IDENTITY(1,1) NOT NULL,
	[test_id] [int] NULL,
	[question_text] [varchar](255) NULL,
 CONSTRAINT [PK__Question__2EC21549DD41282C] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultDetail]    Script Date: 24/07/2023 8:36:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultDetail](
	[result_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[result_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[option_id] [int] NULL,
 CONSTRAINT [PK__ResultDe__5A2A2EDFFB993053] PRIMARY KEY CLUSTERED 
(
	[result_detail_id] ASC,
	[result_id] ASC,
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Results]    Script Date: 24/07/2023 8:36:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Results](
	[result_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[test_id] [int] NULL,
	[score] [float] NULL,
	[start_at] [datetime] NULL,
	[submitted_at] [datetime] NULL,
 CONSTRAINT [PK__Results__AFB3C31638F4E8D4] PRIMARY KEY CLUSTERED 
(
	[result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 24/07/2023 8:36:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] NOT NULL,
	[role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tests]    Script Date: 24/07/2023 8:36:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tests](
	[test_id] [int] IDENTITY(1,1) NOT NULL,
	[test_name] [varchar](255) NULL,
	[test_description] [varchar](255) NULL,
	[duration] [int] NULL,
 CONSTRAINT [PK__Tests__F3FF1C02E75255C7] PRIMARY KEY CLUSTERED 
(
	[test_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24/07/2023 8:36:32 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK__Users__B9BE370F423B85B8] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Options] ON 
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (1, 1, N'it were done carefully', 1)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (2, 1, N'being done careful', 1)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (3, 2, N'will have lost', 1)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (4, 2, N'will be losing', 0)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (5, 4, N'have lost', 0)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (6, 4, N'will have lost', 1)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (7, 5, N'so that', 0)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (8, 5, N'because', 1)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (9, 6, N'of', 1)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (10, 6, N'in', 0)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (11, 7, N'Once finishing her lecture', 1)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (12, 7, N'After she finishes speaking', 0)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (13, 8, N'including', 0)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (14, 8, N'to be included', 1)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (15, 9, N'Are you going to bed', 0)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (16, 9, N'Do you watch TV very often', 1)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (17, 10, N'The quality of e-books is poor', 0)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (18, 10, N'Customers are not paying for them.', 1)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (19, 11, N'The harder you practise, the best results vou will have.', 0)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (20, 11, N'The harder you practise, the better results vou will have.', 1)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (21, 12, N'We’re excited about Quang’s having won a scholarship.', 1)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (22, 12, N'Quang’s excited about a scholarship’s having won us.', 0)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (23, 13, N'No earlier had the play started than there was a power failure.', 0)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (24, 13, N'Hardly had the play started when there was a power failure.', 1)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (25, 1, N'Hello its me', 0)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (26, 1, N'Wrong answer!!', 0)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (27, 2, N'Wrong answer!!', 0)
GO
INSERT [dbo].[Options] ([option_id], [question_id], [option_text], [is_correct]) VALUES (28, 2, N'Wrong answer!!', 0)
GO
SET IDENTITY_INSERT [dbo].[Options] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 
GO
INSERT [dbo].[Questions] ([question_id], [test_id], [question_text]) VALUES (1, 1, N'Donald Trump is _______president of _______United States')
GO
INSERT [dbo].[Questions] ([question_id], [test_id], [question_text]) VALUES (2, 1, N'If _______, that tree would look more impressive')
GO
INSERT [dbo].[Questions] ([question_id], [test_id], [question_text]) VALUES (4, 1, N'By the year 2060, many people currently employed _______the job.')
GO
INSERT [dbo].[Questions] ([question_id], [test_id], [question_text]) VALUES (5, 1, N'Nam is motivated to study _______he knows that a good education can improve his life.')
GO
INSERT [dbo].[Questions] ([question_id], [test_id], [question_text]) VALUES (6, 1, N'We should make full use _______the Internet as it is an endless source of information')
GO
INSERT [dbo].[Questions] ([question_id], [test_id], [question_text]) VALUES (7, 1, N'_______, she received a big applause.')
GO
INSERT [dbo].[Questions] ([question_id], [test_id], [question_text]) VALUES (8, 1, N'The new students hope _______ in many of the school’s social activities.')
GO
INSERT [dbo].[Questions] ([question_id], [test_id], [question_text]) VALUES (9, 1, N'Jack is talking to Mary about watching TV.')
GO
INSERT [dbo].[Questions] ([question_id], [test_id], [question_text]) VALUES (10, 1, N'Why are publishers unhappy about the popularity of e-books in Russia?')
GO
INSERT [dbo].[Questions] ([question_id], [test_id], [question_text]) VALUES (11, 1, N'If you practise harder, you will have better results.')
GO
INSERT [dbo].[Questions] ([question_id], [test_id], [question_text]) VALUES (12, 10, N'Quang won a scholarship. We are excited about that fact.')
GO
INSERT [dbo].[Questions] ([question_id], [test_id], [question_text]) VALUES (13, 10, N'Just after the play started there was a power failure.')
GO
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[ResultDetail] ON 
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (1, 1, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (15, 16, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (16, 16, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (17, 16, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (18, 16, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (19, 16, 6, 9)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (20, 16, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (21, 16, 8, 13)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (22, 17, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (23, 17, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (24, 17, 4, 6)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (25, 17, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (26, 17, 6, 9)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (27, 17, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (28, 17, 8, 13)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (29, 18, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (30, 18, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (31, 18, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (32, 18, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (33, 18, 6, 9)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (34, 18, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (35, 18, 8, 13)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (36, 19, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (37, 19, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (38, 19, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (39, 19, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (40, 19, 6, 9)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (41, 19, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (42, 19, 8, 13)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (43, 20, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (44, 20, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (45, 20, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (46, 20, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (47, 20, 6, 9)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (48, 20, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (49, 20, 8, 13)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (50, 21, 1, 2)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (51, 21, 2, 4)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (52, 21, 4, 6)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (53, 21, 5, 8)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (54, 21, 6, 10)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (55, 21, 7, 12)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (56, 21, 8, 13)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (57, 22, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (58, 22, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (59, 22, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (60, 22, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (61, 22, 6, 9)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (62, 22, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (63, 22, 8, 14)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (64, 23, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (65, 23, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (66, 23, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (67, 23, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (68, 23, 6, 9)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (69, 23, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (70, 23, 8, 14)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (71, 24, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (72, 24, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (73, 24, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (74, 24, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (75, 24, 6, 9)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (76, 24, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (77, 24, 8, 13)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (78, 25, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (79, 25, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (80, 25, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (81, 25, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (82, 25, 6, 9)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (83, 25, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (84, 25, 8, 14)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (85, 27, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (86, 28, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (87, 28, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (88, 29, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (89, 29, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (90, 29, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (91, 29, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (92, 29, 6, 9)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (93, 29, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (94, 29, 8, 13)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (95, 30, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (96, 30, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (97, 30, 4, 6)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (98, 30, 5, 8)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (99, 30, 6, 10)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (100, 30, 7, 12)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (101, 30, 8, 14)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (102, 31, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (103, 31, 2, 4)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (104, 31, 4, 6)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (105, 31, 5, 8)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (106, 31, 6, 10)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (107, 31, 7, 12)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (108, 31, 8, 14)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (109, 37, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (110, 37, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (111, 41, 8, 13)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (112, 41, 8, 13)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (123, 46, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (124, 46, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (125, 46, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (126, 46, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (127, 46, 6, 9)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (128, 46, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (129, 46, 8, 13)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (130, 46, 9, 15)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (131, 46, 10, 17)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (132, 46, 11, 19)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (133, 47, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (134, 47, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (135, 47, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (136, 47, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (137, 47, 6, 9)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (138, 47, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (139, 47, 8, 13)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (140, 47, 9, 15)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (141, 47, 10, 17)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (142, 47, 11, 19)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (143, 48, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (144, 48, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (145, 48, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (146, 48, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (147, 48, 6, 9)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (148, 48, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (149, 48, 8, 13)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (150, 48, 9, 15)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (151, 48, 10, 17)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (152, 48, 11, 19)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (153, 49, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (154, 49, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (155, 49, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (156, 49, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (157, 49, 6, 9)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (158, 49, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (159, 49, 8, 13)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (160, 49, 9, 15)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (161, 49, 10, 17)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (162, 49, 11, 19)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (163, 50, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (164, 50, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (165, 50, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (166, 50, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (167, 50, 6, 9)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (168, 50, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (169, 50, 8, 13)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (170, 50, 9, 15)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (171, 50, 10, 17)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (172, 50, 11, 19)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (173, 51, 1, 2)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (174, 51, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (175, 51, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (176, 51, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (177, 51, 6, 10)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (178, 51, 7, 12)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (179, 51, 9, 15)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (180, 51, 10, 18)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (181, 51, 11, 19)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (182, 56, 11, 19)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (183, 61, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (184, 61, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (185, 61, 4, 6)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (186, 61, 5, 8)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (187, 61, 6, 10)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (188, 61, 7, 12)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (189, 61, 8, 13)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (190, 61, 9, 15)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (191, 61, 10, 17)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (192, 61, 11, 19)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (193, 73, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (194, 74, 11, 19)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (195, 76, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (196, 77, 12, 21)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (197, 77, 13, 24)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (198, 78, 12, 21)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (199, 78, 13, 23)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (200, 80, 12, 21)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (201, 80, 13, 23)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (202, 81, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (203, 81, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (204, 81, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (205, 81, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (206, 82, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (207, 82, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (208, 90, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (209, 90, 1, 2)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (210, 91, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (211, 92, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (212, 93, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (213, 93, 1, 2)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (214, 94, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (215, 94, 4, 5)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (216, 94, 5, 7)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (217, 94, 6, 9)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (218, 94, 7, 11)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (219, 94, 1, 2)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (220, 95, 12, 21)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (221, 95, 13, 24)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (222, 96, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (223, 96, 1, 2)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (224, 97, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (225, 97, 1, 2)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (226, 98, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (227, 98, 1, 2)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (228, 99, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (229, 99, 1, 2)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (230, 100, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (231, 100, 1, 2)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (232, 101, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (233, 101, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (234, 101, 1, 2)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (235, 102, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (236, 102, 1, 2)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (237, 103, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (238, 103, 1, 2)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (239, 104, 1, 2)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (240, 106, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (241, 106, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (242, 106, 1, 2)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (243, 109, 2, 3)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (244, 109, 4, 6)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (245, 109, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (246, 109, 1, 2)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (247, 110, 2, 28)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (248, 110, 4, 6)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (249, 110, 5, 8)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (250, 110, 1, 1)
GO
INSERT [dbo].[ResultDetail] ([result_detail_id], [result_id], [question_id], [option_id]) VALUES (251, 110, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[ResultDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Results] ON 
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (1, 3, 1, 5, CAST(N'2023-07-17T18:26:58.793' AS DateTime), CAST(N'2023-07-17T19:43:17.857' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (16, 3, 1, 5.71, CAST(N'2023-07-21T13:35:54.723' AS DateTime), CAST(N'2023-07-21T13:36:13.343' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (17, 3, 1, 7.14, CAST(N'2023-07-21T14:10:56.683' AS DateTime), CAST(N'2023-07-21T14:11:20.223' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (18, 3, 1, 5.71, CAST(N'2023-07-21T14:17:40.447' AS DateTime), CAST(N'2023-07-21T14:17:51.347' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (19, 3, 1, 5.71, CAST(N'2023-07-21T14:25:03.883' AS DateTime), CAST(N'2023-07-21T14:25:13.780' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (20, 3, 1, 5.71, CAST(N'2023-07-21T14:26:45.267' AS DateTime), CAST(N'2023-07-21T14:26:56.200' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (21, 3, 1, 2.86, CAST(N'2023-07-21T14:40:53.540' AS DateTime), CAST(N'2023-07-21T14:41:01.080' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (22, 3, 1, 7.14, CAST(N'2023-07-21T14:59:27.940' AS DateTime), CAST(N'2023-07-21T14:59:44.427' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (23, 3, 1, 7.14, CAST(N'2023-07-21T15:00:56.230' AS DateTime), CAST(N'2023-07-21T15:01:07.143' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (24, 3, 1, 5.71, CAST(N'2023-07-21T15:02:30.057' AS DateTime), CAST(N'2023-07-21T15:02:38.527' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (25, 3, 1, 7.14, CAST(N'2023-07-21T15:02:46.180' AS DateTime), CAST(N'2023-07-21T15:02:52.807' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (27, 3, 1, 1.43, CAST(N'2023-07-21T15:14:43.833' AS DateTime), CAST(N'2023-07-21T15:14:55.887' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (28, 3, 1, 2.86, CAST(N'2023-07-21T15:18:43.163' AS DateTime), CAST(N'2023-07-21T15:18:51.687' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (29, 3, 1, 5.71, CAST(N'2023-07-21T15:59:07.233' AS DateTime), CAST(N'2023-07-21T15:59:19.493' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (30, 3, 1, 7.14, CAST(N'2023-07-21T16:00:51.677' AS DateTime), CAST(N'2023-07-21T16:01:02.083' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (31, 3, 1, 5.71, CAST(N'2023-07-21T16:02:40.567' AS DateTime), CAST(N'2023-07-21T16:02:55.820' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (33, 3, 1, 0, CAST(N'2023-07-21T16:07:55.170' AS DateTime), CAST(N'2023-07-21T16:08:04.647' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (34, 3, 1, 0, CAST(N'2023-07-21T16:21:09.197' AS DateTime), CAST(N'2023-07-21T16:21:13.637' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (35, 3, 1, 0, CAST(N'2023-07-21T16:23:51.037' AS DateTime), CAST(N'2023-07-21T16:23:56.130' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (36, 3, 1, 0, CAST(N'2023-07-21T16:26:14.380' AS DateTime), CAST(N'2023-07-21T16:26:19.457' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (37, 3, 1, 2.86, CAST(N'2023-07-21T16:29:39.497' AS DateTime), CAST(N'2023-07-21T16:29:47.187' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (39, 3, 1, 0, CAST(N'2023-07-21T17:01:59.897' AS DateTime), CAST(N'2023-07-21T17:03:02.563' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (40, 3, 1, 0, CAST(N'2023-07-21T17:03:18.087' AS DateTime), CAST(N'2023-07-21T17:03:52.467' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (41, 3, 1, 0, CAST(N'2023-07-21T17:05:22.283' AS DateTime), CAST(N'2023-07-21T17:06:29.997' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (42, 3, 1, 0, CAST(N'2023-07-21T17:08:45.463' AS DateTime), CAST(N'2023-07-21T17:08:50.210' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (46, 4, 1, 4, CAST(N'2023-07-24T02:35:24.823' AS DateTime), CAST(N'2023-07-24T02:35:56.513' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (47, 4, 1, 4, CAST(N'2023-07-24T02:48:03.587' AS DateTime), CAST(N'2023-07-24T02:48:14.093' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (48, 4, 1, 4, CAST(N'2023-07-24T02:48:33.533' AS DateTime), CAST(N'2023-07-24T02:49:04.933' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (49, 4, 1, 4, CAST(N'2023-07-24T02:49:52.630' AS DateTime), CAST(N'2023-07-24T02:50:01.873' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (50, 1, 1, 4, CAST(N'2023-07-24T02:51:47.803' AS DateTime), CAST(N'2023-07-24T02:51:58.483' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (51, 4, 1, 2, CAST(N'2023-07-24T06:47:42.903' AS DateTime), CAST(N'2023-07-24T06:47:55.280' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (52, 4, 1, 0, CAST(N'2023-07-24T06:50:01.117' AS DateTime), CAST(N'2023-07-24T06:51:02.840' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (53, 4, 1, 0, CAST(N'2023-07-24T06:52:32.257' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (54, 4, 1, 0, CAST(N'2023-07-24T06:52:36.493' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (55, 4, 1, 0, CAST(N'2023-07-24T06:54:37.533' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (56, 4, 1, 0, CAST(N'2023-07-24T06:54:42.163' AS DateTime), CAST(N'2023-07-24T06:54:46.323' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (57, 4, 1, 0, CAST(N'2023-07-24T06:56:40.403' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (58, 4, 1, 0, CAST(N'2023-07-24T06:56:44.973' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (59, 4, 1, 0, CAST(N'2023-07-24T06:56:47.050' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (60, 4, 1, 0, CAST(N'2023-07-24T06:58:32.787' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (61, 4, 1, 4, CAST(N'2023-07-24T06:59:20.883' AS DateTime), CAST(N'2023-07-24T06:59:31.883' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (62, 1, 1, 0, CAST(N'2023-07-24T07:00:46.590' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (63, 4, 1, 0, CAST(N'2023-07-24T07:40:46.797' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (64, 1, 1, 0, CAST(N'2023-07-24T07:54:24.510' AS DateTime), CAST(N'2023-07-24T07:55:53.257' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (65, 4, 1, 0, CAST(N'2023-07-24T07:56:24.370' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (66, 4, 1, 0, CAST(N'2023-07-24T07:56:32.447' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (67, 4, 1, 0, CAST(N'2023-07-24T07:56:37.317' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (68, 4, 1, 0, CAST(N'2023-07-24T08:02:24.803' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (69, 4, 1, 0, CAST(N'2023-07-24T08:02:29.487' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (70, 4, 1, 0, CAST(N'2023-07-24T08:02:48.533' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (71, 4, 1, 0, CAST(N'2023-07-24T08:03:06.023' AS DateTime), CAST(N'2023-07-24T08:03:11.223' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (72, 4, 1, 0, CAST(N'2023-07-24T08:03:56.380' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (73, 4, 1, 1, CAST(N'2023-07-24T08:04:01.393' AS DateTime), CAST(N'2023-07-24T08:04:09.057' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (74, 4, 1, 0, CAST(N'2023-07-24T08:04:30.267' AS DateTime), CAST(N'2023-07-24T08:04:33.627' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (75, 4, 1, 0, CAST(N'2023-07-24T08:04:37.937' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (76, 4, 1, 1, CAST(N'2023-07-24T08:11:53.097' AS DateTime), CAST(N'2023-07-24T08:11:56.740' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (77, 4, 10, 10, CAST(N'2023-07-24T08:15:46.397' AS DateTime), CAST(N'2023-07-24T08:15:51.970' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (78, 1, 10, 5, CAST(N'2023-07-24T08:16:17.827' AS DateTime), CAST(N'2023-07-24T08:16:21.073' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (79, 4, 10, 0, CAST(N'2023-07-24T08:28:58.043' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (80, 4, 10, 5, CAST(N'2023-07-24T08:29:57.200' AS DateTime), CAST(N'2023-07-24T08:30:04.607' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (81, 4, 1, 2, CAST(N'2023-07-24T08:59:01.413' AS DateTime), CAST(N'2023-07-24T09:00:06.797' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (82, 4, 1, 1, CAST(N'2023-07-24T09:05:24.870' AS DateTime), CAST(N'2023-07-24T09:13:21.517' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (83, 4, 1, 0, CAST(N'2023-07-24T09:13:29.420' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (84, 4, 1, 0, CAST(N'2023-07-24T09:15:10.263' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (85, 4, 1, 0, CAST(N'2023-07-24T09:16:49.857' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (86, 4, 1, 0, CAST(N'2023-07-24T09:17:33.050' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (87, 4, 1, 0, CAST(N'2023-07-24T09:20:25.937' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (88, 4, 1, 0, CAST(N'2023-07-24T09:22:15.100' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (89, 4, 1, 0, CAST(N'2023-07-24T09:23:22.347' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (90, 4, 1, 2, CAST(N'2023-07-24T09:24:18.957' AS DateTime), CAST(N'2023-07-24T09:24:31.560' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (91, 4, 1, 0.09, CAST(N'2023-07-24T09:30:30.030' AS DateTime), CAST(N'2023-07-24T09:30:34.097' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (92, 4, 1, 0.5, CAST(N'2023-07-24T09:36:16.413' AS DateTime), CAST(N'2023-07-24T09:36:28.217' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (93, 4, 1, 1, CAST(N'2023-07-24T09:37:15.033' AS DateTime), CAST(N'2023-07-24T09:37:24.123' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (94, 4, 1, 3.5, CAST(N'2023-07-24T09:37:31.493' AS DateTime), CAST(N'2023-07-24T09:37:50.547' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (95, 4, 10, 10, CAST(N'2023-07-24T09:38:42.460' AS DateTime), CAST(N'2023-07-24T09:38:45.110' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (96, 4, 1, 1, CAST(N'2023-07-24T09:38:52.873' AS DateTime), CAST(N'2023-07-24T09:38:56.440' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (97, 4, 1, 1, CAST(N'2023-07-24T09:42:47.503' AS DateTime), CAST(N'2023-07-24T09:42:52.673' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (98, 4, 1, 1, CAST(N'2023-07-24T09:47:57.417' AS DateTime), CAST(N'2023-07-24T09:48:01.770' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (99, 4, 1, 1, CAST(N'2023-07-24T09:50:53.973' AS DateTime), CAST(N'2023-07-24T09:50:58.440' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (100, 4, 1, 1, CAST(N'2023-07-24T09:53:25.243' AS DateTime), CAST(N'2023-07-24T09:53:28.903' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (101, 4, 1, 2, CAST(N'2023-07-24T09:55:03.150' AS DateTime), CAST(N'2023-07-24T09:55:09.003' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (102, 4, 1, 1, CAST(N'2023-07-24T09:56:48.120' AS DateTime), CAST(N'2023-07-24T09:56:52.023' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (103, 4, 1, 1, CAST(N'2023-07-24T09:58:13.877' AS DateTime), CAST(N'2023-07-24T09:58:17.637' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (104, 4, 1, 0.5, CAST(N'2023-07-24T09:58:27.657' AS DateTime), CAST(N'2023-07-24T09:58:31.597' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (105, 4, 1, 0, CAST(N'2023-07-24T10:00:34.160' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (106, 4, 1, 2, CAST(N'2023-07-24T10:10:00.037' AS DateTime), CAST(N'2023-07-24T10:10:53.583' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (107, 4, 1, 0, CAST(N'2023-07-24T10:24:31.557' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (108, 4, 1, 0, CAST(N'2023-07-24T10:24:41.173' AS DateTime), NULL)
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (109, 4, 1, 3, CAST(N'2023-07-24T11:19:15.627' AS DateTime), CAST(N'2023-07-24T11:19:22.987' AS DateTime))
GO
INSERT [dbo].[Results] ([result_id], [user_id], [test_id], [score], [start_at], [submitted_at]) VALUES (110, 4, 1, 3, CAST(N'2023-07-24T11:24:27.490' AS DateTime), CAST(N'2023-07-24T11:24:33.753' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Results] OFF
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'admin')
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'teacher')
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (3, N'student')
GO
SET IDENTITY_INSERT [dbo].[Tests] ON 
GO
INSERT [dbo].[Tests] ([test_id], [test_name], [test_description], [duration]) VALUES (1, N'English test 1', N'test 1', 1)
GO
INSERT [dbo].[Tests] ([test_id], [test_name], [test_description], [duration]) VALUES (10, N'English Test 2', N'English Test 2', 1)
GO
SET IDENTITY_INSERT [dbo].[Tests] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role_id]) VALUES (1, N'admin', N'admin', N'admin@gmail.com', 1)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role_id]) VALUES (2, N'duoc', N'duoc', N'duoc@gmail.com', 2)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role_id]) VALUES (3, N'duocnq', N'duocnq', N'duocnq@gmail.com', 3)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role_id]) VALUES (4, N'duocdeptrai', N'12345678', N'duocnq2@gmail.com', 3)
GO
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [role_id]) VALUES (5, N'duocthu2', N'12345678', N'duocnq3@gmail.com', 3)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Options]  WITH CHECK ADD  CONSTRAINT [FK__Options__questio__3E52440B] FOREIGN KEY([question_id])
REFERENCES [dbo].[Questions] ([question_id])
GO
ALTER TABLE [dbo].[Options] CHECK CONSTRAINT [FK__Options__questio__3E52440B]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK__Questions__test___3B75D760] FOREIGN KEY([test_id])
REFERENCES [dbo].[Tests] ([test_id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK__Questions__test___3B75D760]
GO
ALTER TABLE [dbo].[ResultDetail]  WITH CHECK ADD  CONSTRAINT [FK__ResultDet__optio__59063A47] FOREIGN KEY([option_id])
REFERENCES [dbo].[Options] ([option_id])
GO
ALTER TABLE [dbo].[ResultDetail] CHECK CONSTRAINT [FK__ResultDet__optio__59063A47]
GO
ALTER TABLE [dbo].[ResultDetail]  WITH CHECK ADD  CONSTRAINT [FK__ResultDet__quest__5812160E] FOREIGN KEY([question_id])
REFERENCES [dbo].[Questions] ([question_id])
GO
ALTER TABLE [dbo].[ResultDetail] CHECK CONSTRAINT [FK__ResultDet__quest__5812160E]
GO
ALTER TABLE [dbo].[ResultDetail]  WITH CHECK ADD  CONSTRAINT [FK__ResultDet__resul__571DF1D5] FOREIGN KEY([result_id])
REFERENCES [dbo].[Results] ([result_id])
GO
ALTER TABLE [dbo].[ResultDetail] CHECK CONSTRAINT [FK__ResultDet__resul__571DF1D5]
GO
ALTER TABLE [dbo].[Results]  WITH CHECK ADD  CONSTRAINT [FK__Results__test_id__4222D4EF] FOREIGN KEY([test_id])
REFERENCES [dbo].[Tests] ([test_id])
GO
ALTER TABLE [dbo].[Results] CHECK CONSTRAINT [FK__Results__test_id__4222D4EF]
GO
ALTER TABLE [dbo].[Results]  WITH CHECK ADD  CONSTRAINT [FK__Results__user_id__412EB0B6] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Results] CHECK CONSTRAINT [FK__Results__user_id__412EB0B6]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [PRN231_Project1] SET  READ_WRITE 
GO
