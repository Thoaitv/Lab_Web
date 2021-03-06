USE [master]
GO
/****** Object:  Database [Student_Request_Admin]    Script Date: 6/1/2021 8:00:51 AM ******/
CREATE DATABASE [Student_Request_Admin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Student_Request_Admin', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Student_Request_Admin.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Student_Request_Admin_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Student_Request_Admin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Student_Request_Admin] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Student_Request_Admin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Student_Request_Admin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET ARITHABORT OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Student_Request_Admin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Student_Request_Admin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Student_Request_Admin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Student_Request_Admin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET RECOVERY FULL 
GO
ALTER DATABASE [Student_Request_Admin] SET  MULTI_USER 
GO
ALTER DATABASE [Student_Request_Admin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Student_Request_Admin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Student_Request_Admin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Student_Request_Admin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Student_Request_Admin] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Student_Request_Admin] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Student_Request_Admin', N'ON'
GO
ALTER DATABASE [Student_Request_Admin] SET QUERY_STORE = OFF
GO
USE [Student_Request_Admin]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/1/2021 8:00:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](20) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 6/1/2021 8:00:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 6/1/2021 8:00:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[dateCreated] [date] NOT NULL,
	[studentID] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[departmentID] [int] NOT NULL,
 CONSTRAINT [PK__Request__3213E83F4005E4A3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solve]    Script Date: 6/1/2021 8:00:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solve](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[requestID] [int] NOT NULL,
	[accountID] [int] NOT NULL,
	[dateClose] [date] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[solution] [nvarchar](max) NULL,
 CONSTRAINT [PK__Solve__3213E83F98634873] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 6/1/2021 8:00:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[id] [int] NOT NULL,
	[studentID] [nvarchar](30) NOT NULL,
	[studentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Student__3213E83FD8D25941] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [username], [password]) VALUES (1, N'ThoaiTV', N'a')
INSERT [dbo].[Account] ([id], [username], [password]) VALUES (2, N'a', N'a')
INSERT [dbo].[Account] ([id], [username], [password]) VALUES (3, N'test', N'test')
INSERT [dbo].[Account] ([id], [username], [password]) VALUES (4, N'xyz', N'xyz')
INSERT [dbo].[Account] ([id], [username], [password]) VALUES (5, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([id], [name]) VALUES (1, N'Academic Department')
INSERT [dbo].[Department] ([id], [name]) VALUES (2, N'AI')
INSERT [dbo].[Department] ([id], [name]) VALUES (3, N'Engineering')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (1, N'inquery for FE result', CAST(N'2021-05-27' AS Date), 1, N'In query for the result of PRJ321 (1st time). I wanna check my sulotion again.)', 1)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (2, N'Khảo thí', CAST(N'2021-05-27' AS Date), 2, N'Theo Viện Vệ sinh dịch tễ Trung ương, kết quả giải trình tự gene virus 32 mẫu bệnh phẩm Covid-19, phát hiện 4 mẫu nhiễm chủng Ấn Độ song mang đột biến gene của chủng Anh.', 3)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (3, N'Đăng ký miễn điểm danh', CAST(N'2021-05-27' AS Date), 3, N'heo bà Mai, dữ liệu biến chủng B.1.617.2 trên GISAID hiện tại chưa ghi nhận đột biến mất Y144, nên đột biến này vẫn cần theo dõi và nghiên cứu thêm.', 1)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (4, N'Đơn yêu cầu chuyển lớp', CAST(N'2021-05-27' AS Date), 4, N'Bộ Y tế chưa công bố 4 mẫu bệnh phẩm nhiễm đột biến gene này lấy từ bệnh nhân ở tỉnh thành nào.', 1)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (5, N'Register for Coursera''s course ', CAST(N'2021-05-28' AS Date), 5, N'The island of 23 million people had recorded close to zero local infections for months, and demand for the vaccine was so low that only 1% of the population was vaccinated.', 1)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (6, N'Application for re-study', CAST(N'2021-05-28' AS Date), 6, N'Japanese bullet train driver takes bathroom break as train cruises at 90 mph', 1)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (7, N'Đơn xin học lại môn', CAST(N'2021-05-28' AS Date), 7, N'Đến nay, Việt Nam đã ghi nhận tổng cộng 7 biến chủng của nCoV, gồm: B.1.222, B.1.619, D614G, B.1.1.7 (biến chủng Anh), B.1.351, A.23.1 và B.1.617.2 (biến chủng Ấn).', 2)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (8, N'Application for early internship', CAST(N'2021-05-28' AS Date), 8, N'Social media users rave about them and many people in Japan take rail operators'' obsessive dedication to arrive and depart on time for granted.', 2)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (9, N'Đơn xin pass môn', CAST(N'2021-05-28' AS Date), 9, N'Những biến chủng nCoV mới đã phát tán mầm bệnh nhanh hơn trước. Các y bác sĩ phải chạy đua với tốc độ lây nhiễm hàng trăm ca mỗi ngày. Để hỗ trợ lực lượng tuyến đầu, các cá nhân và doanh nghiệp có thể đồng hành cùng báo VnExpress trong chương trình "Tiếp sức cho tâm dịch".', 2)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (10, N'Đơn xin nghỉ học', CAST(N'2021-05-29' AS Date), 10, N'Đợt dịch thứ 4 bùng phát từ ngày 27/4 đến nay. Tổng số ca nhiễm cộng đồng từ ngày 27/4 đến nay là 3785, ghi nhận ở 34 tỉnh thành. Cụ thể, Bắc Giang 1994, Bắc Ninh 761, Hà Nội 364 ca (trong đó Bệnh viện Bệnh nhiệt đới Trung ương 91 ca, 50 ca ở Bệnh viện K), Đà Nẵng 155, TP HCM 98.

', 1)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (11, N'Application for leave of absence from school', CAST(N'2021-05-29' AS Date), 2, N'But sometimes that punctuality comes with a price -- especially if you''re a train operator caught up in Japan''s efficient transport web.', 2)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (12, N'Đơn xin học lại môn', CAST(N'2021-05-29' AS Date), 7, N'Bệnh nhân làm việc tại Công ty TNHH may Tinh Lợi (Khu công nghiệp Lai Vu, H.Kim Thành, Hải Dương), nơi đã công bố 1 F0 là bệnh nhân 4706.', 2)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (13, N'test', CAST(N'2021-05-30' AS Date), 4, N'Bộ Y tế tối 29/5 ghi nhận 143 ca dương tính nCoV, trong đó 141 ca ghi nhận trong nước và 2 ca cách ly ngay sau khi nhập cảnh tại Quảng Nam.

', 3)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (14, N'Đơn xin điểm cao', CAST(N'2021-05-30' AS Date), 1, N'143 ca mới tối nay được ghi nhận từ số 6714-6856, trong đó 141 ca trong nước gồm tại Bắc Giang 67, TP HCM 29, Bắc Ninh 25, Hà Nội 7, Lạng Sơn 7, Hà Nam 3, Hải Dương 2 và Long An một.', 2)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (15, N'Xin điểm Thâp', CAST(N'2021-05-30' AS Date), 3, N'Tổng số ca nhiễm cộng đồng từ ngày 27/4 đến nay lên 3785, ghi nhận ở 34 tỉnh thành. Số ca nhiễm mới nâng tổng số ca ở Bắc Giang lên 1.994, Bắc Ninh 761, Hà Nội 364 ca (trong đó Bệnh viện Bệnh nhiệt đới Trung ương 91 ca, 50 ca ở Bệnh viện K)', 1)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (16, N'Xin kiểm tra', CAST(N'2021-05-31' AS Date), 2, N'Xin kiểm tra lại do nghỉ học', 3)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (17, N'Đơn xin phúc khảo', CAST(N'2021-05-31' AS Date), 5, N'Phúc khảo lại bài thi do có sự chênh lệch về điểm số', 3)
INSERT [dbo].[Request] ([id], [title], [dateCreated], [studentID], [content], [departmentID]) VALUES (18, N'Muốn chuyển môn', CAST(N'2021-05-31' AS Date), 6, N'Chuyển môn học', 2)
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[Solve] ON 

INSERT [dbo].[Solve] ([id], [requestID], [accountID], [dateClose], [status], [solution]) VALUES (1, 1, 1, CAST(N'2021-05-28' AS Date), N'Approved', N'Mark changed, new mark is 8.0 (rebuld and remark student solution)')
INSERT [dbo].[Solve] ([id], [requestID], [accountID], [dateClose], [status], [solution]) VALUES (2, 2, 3, CAST(N'2021-06-28' AS Date), N'Rejected', N'Không chấp nhận')
INSERT [dbo].[Solve] ([id], [requestID], [accountID], [dateClose], [status], [solution]) VALUES (3, 11, 2, CAST(N'2021-05-30' AS Date), N'Rejected', N'No')
INSERT [dbo].[Solve] ([id], [requestID], [accountID], [dateClose], [status], [solution]) VALUES (4, 14, 2, CAST(N'2021-05-30' AS Date), N'Approved', N'a')
INSERT [dbo].[Solve] ([id], [requestID], [accountID], [dateClose], [status], [solution]) VALUES (5, 6, 2, CAST(N'2021-05-30' AS Date), N'Approved', N'Oke em nhaaaaa')
INSERT [dbo].[Solve] ([id], [requestID], [accountID], [dateClose], [status], [solution]) VALUES (6, 12, 2, CAST(N'2021-05-30' AS Date), N'Rejected', N'a')
INSERT [dbo].[Solve] ([id], [requestID], [accountID], [dateClose], [status], [solution]) VALUES (7, 15, 2, CAST(N'2021-05-30' AS Date), N'Approved', N'Muốn thấp có thấp')
INSERT [dbo].[Solve] ([id], [requestID], [accountID], [dateClose], [status], [solution]) VALUES (8, 10, 2, CAST(N'2021-05-30' AS Date), N'Rejected', N'Ai cho nghỉ?')
INSERT [dbo].[Solve] ([id], [requestID], [accountID], [dateClose], [status], [solution]) VALUES (9, 5, 2, CAST(N'2021-05-31' AS Date), N'Approved', N'Chấp nhận')
SET IDENTITY_INSERT [dbo].[Solve] OFF
GO
INSERT [dbo].[Student] ([id], [studentID], [studentName]) VALUES (1, N'HE01', N'Ta Van Thoai')
INSERT [dbo].[Student] ([id], [studentID], [studentName]) VALUES (2, N'HE02', N'Nguyễn Văn A')
INSERT [dbo].[Student] ([id], [studentID], [studentName]) VALUES (3, N'HE03', N'Nguyễn Văn B')
INSERT [dbo].[Student] ([id], [studentID], [studentName]) VALUES (4, N'HE04', N'Nguyễn Văn C')
INSERT [dbo].[Student] ([id], [studentID], [studentName]) VALUES (5, N'HE05', N'Nguyễn Văn D')
INSERT [dbo].[Student] ([id], [studentID], [studentName]) VALUES (6, N'HE06', N'Nguyễn Văn E')
INSERT [dbo].[Student] ([id], [studentID], [studentName]) VALUES (7, N'HE07', N'Nguyễn Văn F')
INSERT [dbo].[Student] ([id], [studentID], [studentName]) VALUES (8, N'HE08', N'Nguyễn Văn G')
INSERT [dbo].[Student] ([id], [studentID], [studentName]) VALUES (9, N'HE09', N'Nguyễn Văn H')
INSERT [dbo].[Student] ([id], [studentID], [studentName]) VALUES (10, N'HE10', N'Nguyễn Văn I')
GO
/****** Object:  Index [UQ__Solve__E3C5DE50942FD0A7]    Script Date: 6/1/2021 8:00:51 AM ******/
ALTER TABLE [dbo].[Solve] ADD  CONSTRAINT [UQ__Solve__E3C5DE50942FD0A7] UNIQUE NONCLUSTERED 
(
	[requestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_departmentID] FOREIGN KEY([departmentID])
REFERENCES [dbo].[Department] ([id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_departmentID]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_studentID] FOREIGN KEY([studentID])
REFERENCES [dbo].[Student] ([id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_studentID]
GO
ALTER TABLE [dbo].[Solve]  WITH CHECK ADD  CONSTRAINT [FK_accountID] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Solve] CHECK CONSTRAINT [FK_accountID]
GO
ALTER TABLE [dbo].[Solve]  WITH CHECK ADD  CONSTRAINT [FK_requestID] FOREIGN KEY([requestID])
REFERENCES [dbo].[Request] ([id])
GO
ALTER TABLE [dbo].[Solve] CHECK CONSTRAINT [FK_requestID]
GO
USE [master]
GO
ALTER DATABASE [Student_Request_Admin] SET  READ_WRITE 
GO
