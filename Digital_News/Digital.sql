USE [master]
GO
/****** Object:  Database [Digital_News]    Script Date: 5/22/2021 1:16:39 PM ******/
CREATE DATABASE [Digital_News]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Digital_News', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Digital_News.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Digital_News_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Digital_News_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Digital_News] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Digital_News].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Digital_News] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Digital_News] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Digital_News] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Digital_News] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Digital_News] SET ARITHABORT OFF 
GO
ALTER DATABASE [Digital_News] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Digital_News] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Digital_News] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Digital_News] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Digital_News] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Digital_News] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Digital_News] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Digital_News] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Digital_News] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Digital_News] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Digital_News] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Digital_News] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Digital_News] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Digital_News] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Digital_News] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Digital_News] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Digital_News] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Digital_News] SET RECOVERY FULL 
GO
ALTER DATABASE [Digital_News] SET  MULTI_USER 
GO
ALTER DATABASE [Digital_News] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Digital_News] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Digital_News] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Digital_News] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Digital_News] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Digital_News] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Digital_News', N'ON'
GO
ALTER DATABASE [Digital_News] SET QUERY_STORE = OFF
GO
USE [Digital_News]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 5/22/2021 1:16:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[id] [int] NOT NULL,
	[article] [text] NOT NULL,
	[content] [text] NOT NULL,
	[shortContent] [text] NOT NULL,
	[image] [nvarchar](50) NOT NULL,
	[author] [nvarchar](50) NULL,
	[time] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Articles] ([id], [article], [content], [shortContent], [image], [author], [time]) VALUES (1, N'What is Lorem Ipsum?', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', N'eye.jpg', N'thoai', CAST(N'2021-05-16T20:22:30.913' AS DateTime))
INSERT [dbo].[Articles] ([id], [article], [content], [shortContent], [image], [author], [time]) VALUES (2, N'Why do we use it?
', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).

', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout', N'eye.jpg', N'thoai2', CAST(N'2021-05-16T20:23:21.447' AS DateTime))
INSERT [dbo].[Articles] ([id], [article], [content], [shortContent], [image], [author], [time]) VALUES (3, N'Where does it come from?
', N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old', N'eye.jpg', N'thoai3', CAST(N'2021-05-16T20:23:58.097' AS DateTime))
INSERT [dbo].[Articles] ([id], [article], [content], [shortContent], [image], [author], [time]) VALUES (4, N'Where can I get some?
', N'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.

', N'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable', N'eye.jpg', N'thoai4', CAST(N'2021-05-16T20:24:19.530' AS DateTime))
INSERT [dbo].[Articles] ([id], [article], [content], [shortContent], [image], [author], [time]) VALUES (5, N'Origins and Discovery', N'Until recently, the prevailing view assumed lorem ipsum was born as a nonsense text. “It''s not Latin, though it looks like it, and it actually says nothing,” Before & After magazine answered a curious reader, “Its ‘words’ loosely approximate the frequency with which letters occur in English, which is why at a glance it looks pretty real.”

As Cicero would put it, “Um, not so fast.”

The placeholder text, beginning with the line “Lorem ipsum dolor sit amet, consectetur adipiscing elit”, looks like Latin because in its youth, centuries ago, it was Latin.

Richard McClintock, a Latin scholar from Hampden-Sydney College, is credited with discovering the source behind the ubiquitous filler text. In seeing a sample of lorem ipsum, his interest was piqued by consectetur—a genuine, albeit rare, Latin word. Consulting a Latin dictionary led McClintock to a passage from De Finibus Bonorum et Malorum (“On the Extremes of Good and Evil”), a first-century B.C. text from the Roman philosopher Cicero.

', N'Lorem ipsum began as scrambled, nonsensical Latin derived from Cicero''s 1st-century BC text De Finibus Bonorum et Malorum.

', N'eye.jpg', N'thoai5', CAST(N'2021-05-19T00:19:11.840' AS DateTime))
INSERT [dbo].[Articles] ([id], [article], [content], [shortContent], [image], [author], [time]) VALUES (6, N'Fuzzy Beginnings', N'So how did the classical Latin become so incoherent? According to McClintock, a 15th century typesetter likely scrambled part of Cicero''s De Finibus in order to provide placeholder text to mockup various fonts for a type specimen book.

It''s difficult to find examples of lorem ipsum in use before Letraset made it popular as a dummy text in the 1960s, although McClintock says he remembers coming across the lorem ipsum passage in a book of old metal type samples. So far he hasn''t relocated where he once saw the passage, but the popularity of Cicero in the 15th century supports the theory that the filler text has been used for centuries.

', N'Creation timelines for the standard lorem ipsum passage vary, with some citing the 15th century and others the 20th.

', N'eye.jpg', N'thoai6', CAST(N'2021-05-19T00:19:42.487' AS DateTime))
INSERT [dbo].[Articles] ([id], [article], [content], [shortContent], [image], [author], [time]) VALUES (7, N'The standard Lorem Ipsum passage, used since the 1500s
', N'"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', N'eye.jpg', N'thoai7', CAST(N'2021-05-16T20:25:26.377' AS DateTime))
INSERT [dbo].[Articles] ([id], [article], [content], [shortContent], [image], [author], [time]) VALUES (8, N'1914 translation by H. Rackham
', N'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?', N'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness', N'eye.jpg', N'thoai8', CAST(N'2021-05-16T23:34:11.413' AS DateTime))
GO
ALTER TABLE [dbo].[Articles] ADD  DEFAULT (getdate()) FOR [time]
GO
USE [master]
GO
ALTER DATABASE [Digital_News] SET  READ_WRITE 
GO
