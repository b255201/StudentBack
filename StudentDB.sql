USE [Student]
GO
/****** Object:  Table [dbo].[Activity_Message]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity_Message](
	[Id] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](50) NULL,
	[title] [nvarchar](100) NULL,
 CONSTRAINT [PK_Activity_Message] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AdultClass]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdultClass](
	[Id] [int] NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Course] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_AdultClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChildClass]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChildClass](
	[Id] [int] NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Course] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ChildClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EDM]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EDM](
	[int] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_EDM] PRIMARY KEY CLUSTERED 
(
	[int] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[elementary_Book]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[elementary_Book](
	[Id] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](50) NULL,
	[title] [nvarchar](100) NULL,
 CONSTRAINT [PK_elementary_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[employee]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee](
	[employeeId] [int] IDENTITY(1,1) NOT NULL,
	[employeeName] [nvarchar](50) NULL,
	[employeeAccount] [nvarchar](50) NOT NULL,
	[employeePwd] [varbinary](60) NOT NULL,
	[employeeSalt] [varbinary](50) NOT NULL,
	[employeeCategoryId] [int] NOT NULL,
	[employeeOnBoardDate] [datetime] NULL,
	[employeeLeaveDate] [datetime] NULL,
	[employeePhoto] [nvarchar](50) NULL,
	[createTime] [datetime] NULL CONSTRAINT [DF_employee_createTime]  DEFAULT (getdate()),
	[modifyTime] [datetime] NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[employeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employeeCategory]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employeeCategory](
	[employeeCategoryID] [int] NOT NULL,
	[employeeCategoryname] [nvarchar](50) NULL,
 CONSTRAINT [PK_employeeCategory] PRIMARY KEY CLUSTERED 
(
	[employeeCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[employeeCategoryDetails]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employeeCategoryDetails](
	[employeeCategoryId] [int] NOT NULL,
	[permissionId] [int] NOT NULL,
	[canAccess] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_employeeCategoryDetails] PRIMARY KEY CLUSTERED 
(
	[employeeCategoryId] ASC,
	[permissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FreeTrail]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FreeTrail](
	[SeqID] [int] NOT NULL,
	[Name] [nvarchar](10) NULL,
	[SchoolName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](50) NULL,
	[LocalPhone] [nvarchar](50) NULL,
	[Course] [nvarchar](100) NULL,
	[CreateTime] [datetime] NULL,
	[Memo] [nvarchar](100) NULL,
 CONSTRAINT [PK_FreeTrail] PRIMARY KEY CLUSTERED 
(
	[SeqID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[High_Book]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[High_Book](
	[Id] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](50) NULL,
	[title] [nvarchar](100) NULL,
 CONSTRAINT [PK_High_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HighClass]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HighClass](
	[Id] [int] NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Course] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_HighClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[junior_Book]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[junior_Book](
	[Id] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](50) NULL,
	[title] [nvarchar](100) NULL,
 CONSTRAINT [PK_junior_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JuniorClass]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JuniorClass](
	[Id] [int] NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Course] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_JuniorClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JuniorHigh_School]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JuniorHigh_School](
	[Id] [int] NOT NULL,
	[Description] [nvarchar](10) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_JuniorHigh_School] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LastNews]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LastNews](
	[Id] [int] NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_LastNews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LessonCalendar]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonCalendar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[Link] [nvarchar](max) NULL,
	[Schedule] [nvarchar](max) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_LessonCalendar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LessonOpt]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonOpt](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Seq] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_LessonOpt] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[permission]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permission](
	[permissionId] [int] NOT NULL,
	[permissionName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[permissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScholarShip]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScholarShip](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Date] [nvarchar](15) NULL,
	[Image] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ScholarShip] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentImpression]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentImpression](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Date] [nvarchar](15) NULL,
	[Image] [nvarchar](max) NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_StudentImpression] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Video]    Script Date: 2019/5/12 下午 04:31:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Date] [nvarchar](15) NULL,
	[href] [nvarchar](max) NULL,
	[CreateTime] [datetime] NULL,
	[Id] [int] NOT NULL,
	[Item] [nvarchar](max) NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Activity_Message] ([Id], [Description], [Image], [title]) VALUES (13, N'50周年', N'50周年.jpg', N'50周年')
INSERT [dbo].[Activity_Message] ([Id], [Description], [Image], [title]) VALUES (16, N'誠徵英文老師', N'誠徵老師-手機.jpg', N'誠徵英文老師')
INSERT [dbo].[Activity_Message] ([Id], [Description], [Image], [title]) VALUES (20, N'英文一字經', N'20181205_英文一字經_壽德樓下立牌_印_工作區域2.jpg', N'英文一字經')
INSERT [dbo].[Activity_Message] ([Id], [Description], [Image], [title]) VALUES (21, N'水晶老師的高中英文精進班', N'水晶英文1-02.jpg', N'英文精進班')
INSERT [dbo].[Activity_Message] ([Id], [Description], [Image], [title]) VALUES (22, N'學測全科總複習', N'1.jpg', N'學測全科總複習')
INSERT [dbo].[AdultClass] ([Id], [title], [Description], [Image], [Course], [CreateTime]) VALUES (1, N'TOEIC如何考高分又拿獎學金呢？', N'劉毅英文獨創模考教材，增加經驗、尊定實力讓您拿高分又拿獎學金，有興趣的同學趕緊填寫預約試聽
', N'04.jpg,05.jpg', N'全民英檢', CAST(N'2019-02-16 18:00:49.130' AS DateTime))
INSERT [dbo].[ChildClass] ([Id], [title], [Description], [Image], [Course], [CreateTime]) VALUES (1, N'ggggg福了!!最厲害的教學課程就在這邊', N'ggggg度，兼備聽、說、讀、寫內容，『段考深度集訓講座』提供『段考必考秘笈』，讓同學輕鬆搞地第一次段考。', N'01.jpg,02.jpg,03.png,04.jpg', N'七年級課程', CAST(N'2019-02-16 17:22:09.203' AS DateTime))
INSERT [dbo].[ChildClass] ([Id], [title], [Description], [Image], [Course], [CreateTime]) VALUES (3, N'gggg同學們有福了!!最厲害的教學課程就在這邊', N'hhhh超學校進度，兼備聽、說、讀、寫內容，『段考深度集訓講座』提供『段考必考秘笈』，讓同學輕鬆搞地第一次段考。', N'05.jpg,06.jpg', N'作文班', CAST(N'2019-02-16 17:28:43.990' AS DateTime))
INSERT [dbo].[ChildClass] ([Id], [title], [Description], [Image], [Course], [CreateTime]) VALUES (4, N'劉毅「英文一字經班」徵求見證', N'由老師協助大家快速把216句輸入右腦，並可以活學活用，隨時可脫口而出，目標是在兩分鐘之內、背完216句。', N'Capture001.png,pexels-photo-207962.jpeg', N'一口氣英文', CAST(N'2018-12-08 17:00:03.143' AS DateTime))
INSERT [dbo].[ChildClass] ([Id], [title], [Description], [Image], [Course], [CreateTime]) VALUES (5, N'sadasd', N'sdadasd', N'1111.png', N'七年級課程', CAST(N'2018-12-08 17:03:21.583' AS DateTime))
SET IDENTITY_INSERT [dbo].[EDM] ON 

INSERT [dbo].[EDM] ([int], [Email]) VALUES (1, N'te@yahoo.com')
SET IDENTITY_INSERT [dbo].[EDM] OFF
INSERT [dbo].[elementary_Book] ([Id], [Description], [Image], [title]) VALUES (1, N'「少兒英語閱讀測驗」，英語閱讀測驗是從小學、國中、高中到大學、研究所、TOEIC、TOEFL等，所有的英文考試必考的題型。我們編排是由簡單到難，循序漸進。也可以把文章當課本一樣朗讀，增加語感。', N'01.jpg', N'少兒英語閱讀測驗(第一冊)')
INSERT [dbo].[elementary_Book] ([Id], [Description], [Image], [title]) VALUES (2, N'「小學生英語聽力測驗」可以培養孩子的專注力。最初可以先聽，再做測驗題。聽力練習要越多越好。第一部份是聽力測驗試題，第二部份 是聽力測驗原文，第三部份是全部的翻譯。有一個訣竅，可以看中文翻譯來聽英文。本書共7回，一回18題，共126題聽力。做完可以馬上「小學生英語聽力測驗」。', N'02.jpg', N'少兒英語聽力測驗(第一冊)')
INSERT [dbo].[elementary_Book] ([Id], [Description], [Image], [title]) VALUES (3, N'「小學生英語聽力測驗」可以培養孩子的專注力。最初可以先聽，再做測驗題。聽力練習要越多越好。第一部份是聽力測驗試題，第二部份 是聽力測驗原文，第三部份是全部的翻譯。有一個訣竅，可以看中文翻譯來聽英文。本書共7回，一回18題，共126題聽力。做完可以馬上做 「小學生英語聽力測驗」。', N'03.jpg', N'少兒英語聽力測驗(第二冊)')
INSERT [dbo].[elementary_Book] ([Id], [Description], [Image], [title]) VALUES (4, N'「少兒英語聽力測驗」可以培養孩子的專注力。最初可以先聽，再做測驗題。聽力練習要越多越好。第一部份是聽力測驗試題，第二部份 是聽力測驗原文，第三部份是全部的翻譯。有一個訣竅，可以看中文翻譯來聽英文。本書共7回，一回18題，共126題聽力。做完本書，可以 使用「小學英檢聽力測驗」繼續練習。', N'04.jpg', N'少兒英語聽力測驗(第三冊)')
INSERT [dbo].[elementary_Book] ([Id], [Description], [Image], [title]) VALUES (5, N'以最輕鬆且好記憶的方式背單字 本書收錄教育部公佈小學生常用600字中的精華字彙，配合發音同步記憶發音雷同之單字。每個單元皆附有QR code, 用手機掃描即可學習每個單字的發音。', N'05.jpg', N'小學生英語字彙輕鬆背')
INSERT [dbo].[elementary_Book] ([Id], [Description], [Image], [title]) VALUES (6, N'劉毅老師特地為小學生量身打造的英語演講專用書籍，讓孩子們能從小就開始培養英語演講能力。', N'06.jpg', N'小學生英語演講')
INSERT [dbo].[elementary_Book] ([Id], [Description], [Image], [title]) VALUES (7, N'利用「小學英檢公佈字彙」600個單字，再衍生出一千多個單字。讓孩子學會用「比較法」背單字，培養興趣，養成背單字的習慣，一生受益。每個單元皆附有QR code，用手機掃描即可學習單字的發音。是準備小學英檢必備的單字書。', N'07.jpg', N'小學英檢公佈字彙輕鬆背')
INSERT [dbo].[elementary_Book] ([Id], [Description], [Image], [title]) VALUES (8, N'家庭聯絡簿紀錄孩子學習的狀況，提供家長與老師溝通的管道，是提昇小朋友學習英語成果的最佳輔助工具。', N'10.jpg', N'家庭聯絡簿')
INSERT [dbo].[elementary_Book] ([Id], [Description], [Image], [title]) VALUES (9, N'本書題目本含有4回模擬考試題目 模擬考試情境，具有考試臨場感。掌握命題重點，有效提升考試實力。 教師手冊附有完整解答與解析 提供錄音稿內容及試題中文翻譯。 內含「聽力、閱讀、寫作、口說」四大項目，幫助小朋友在準備考試的同時也能強化英文能力。 專業外籍人士錄音 試題皆由外籍老師錄音，能讓考生習慣外國人說話的速度以及說話時的語調變化，準確掌握考試時的節奏。 搭配學習小學英檢試題(1)教師手冊使用。', N'11.jpg', N'學習小學英檢試題(1)題本')
INSERT [dbo].[elementary_Book] ([Id], [Description], [Image], [title]) VALUES (10, N'本書題目本含有4回模擬考試題目 模擬考試情境，具有考試臨場感。掌握命題重點，有效提升考試實力。 教師手冊附有完整解答與解析 提供錄音稿內容及試題中文翻譯。 內含「聽力、閱讀、寫作、口說」四大項目，幫助小朋友在準備考試的同時也能強化英文能力。 專業外籍人士錄音 試題皆由外籍老師錄音，能讓考生習慣外國人說話的速度以及說話時的語調變化，準確掌握考試時的節奏。 搭配學習小學英檢試題(1)題本使用。', N'12.jpg', N'學習小學英檢試題(1)教師手冊')
INSERT [dbo].[elementary_Book] ([Id], [Description], [Image], [title]) VALUES (11, N'配合國小英語教育之檢定需求，依據國際語言能力標準─歐洲語言共同參考架構(CEFR)能力指標，向下延伸「全民英檢」(GEPT)能力架構。 小學英檢，作為和「全民英檢」銜接的橋樑，是「初級英檢」前哨站。一樣分成「聽、說、讀、寫」四個項目，包含英語全方面的使用能力。從小學時，便開始有四項能力並重的發展。 「小學英檢閱讀測驗」共8回，每回依照常用600字的程度來編撰，適合銜接未來「全民英檢初級」測驗。', N'13.jpg', N'學習小學英檢閱讀測驗(1)教師手冊')
INSERT [dbo].[elementary_Book] ([Id], [Description], [Image], [title]) VALUES (12, N'配合國小英語教育之檢定需求，依據國際語言能力標準─歐洲語言共同參考架構(CEFR)能力指標，向下延伸「全民英檢」(GEPT)能力架構。 
小學英檢，作為和「全民英檢」銜接的橋樑，是「初級英檢」前哨站。一樣分成「聽、說、讀、寫」四個項目，包含英語全方面的使用能力。從小學時，便開始有四項能力並重的發展。 
「小學英檢閱讀測驗」共8回，每回依照常用600字的程度來編撰，適合銜接未來「全民英檢初級」測驗。', N'14.jpg', N'學習小學英檢閱讀測驗(1)題本')
INSERT [dbo].[elementary_Book] ([Id], [Description], [Image], [title]) VALUES (13, N'配合國小英語教育之檢定需求，依據國際語言能力標準─歐洲語言共同參考架構(CEFR)能力指標，向下延伸「全民英檢」(GEPT)能力架構。 
小學英檢，作為和「全民英檢」銜接的橋樑，是「初級英檢」前哨站。一樣分成「聽、說、讀、寫」四個項目，包含英語全方面的使用能力。從小學時，便開始有四項能力並重的發展。 
「小學英檢聽力測驗」共12回，每回依照常用600字的程度來編撰，適合銜接未來「全民英檢初級」測驗。 
掌握命題重點，有效提升考試實力。 

教師手冊附有完整版解答與解析 
提供錄音稿內容及試題中文翻譯。 

專業外籍人士錄音 
試題皆由外籍老師錄音，能讓考生習慣外國人說話的速度以及說話時的語調變化，準確掌握考試時的節奏。 
搭配學習小學英檢聽力測驗(1)題本使用', N'16.jpg', N'學習小學英檢聽力測驗(1)教師手冊')
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([employeeId], [employeeName], [employeeAccount], [employeePwd], [employeeSalt], [employeeCategoryId], [employeeOnBoardDate], [employeeLeaveDate], [employeePhoto], [createTime], [modifyTime]) VALUES (1, N'Admin', N'Aa123456', 0xA3659284F5294CB8C617235AA35B3C5C4184526F4CED872DD5DD5C606C7EEF10D6F3C3D29B5C08424A3F9003421C63EC, 0x8C9AC935DF85747F5BC577202869FF440FEAEB83, 0, CAST(N'2018-06-30 20:55:01.757' AS DateTime), NULL, NULL, CAST(N'2018-06-30 20:55:02.277' AS DateTime), NULL)
INSERT [dbo].[employee] ([employeeId], [employeeName], [employeeAccount], [employeePwd], [employeeSalt], [employeeCategoryId], [employeeOnBoardDate], [employeeLeaveDate], [employeePhoto], [createTime], [modifyTime]) VALUES (2, N'kkk', N'admin', 0x6D7E77FC6BEFBE15DECA3B30D599E21119EDE3B227426CB96526247EFDA8B228D3926F63B2879E77B13DF7B6CE004CE1, 0x52D89A3AAA2A66EA7E3228508F0ED575D7E231D5, 0, CAST(N'2018-07-14 19:51:12.383' AS DateTime), NULL, NULL, CAST(N'2018-07-14 19:51:12.383' AS DateTime), NULL)
INSERT [dbo].[employee] ([employeeId], [employeeName], [employeeAccount], [employeePwd], [employeeSalt], [employeeCategoryId], [employeeOnBoardDate], [employeeLeaveDate], [employeePhoto], [createTime], [modifyTime]) VALUES (3, N'kai', N'kai255201', 0x7A75B94E4154D2FD14E6FEE7FF5C633CB4351E5898ADA4821A1CBD25D7452AB93A8D1D282D91B0A9DC41EE65AEFDA0C6, 0x5C259AFF2BD48D8FCAF9C134ADE6A1C7A3C0F1B0, 0, CAST(N'2018-07-15 06:56:20.233' AS DateTime), NULL, NULL, CAST(N'2018-07-15 06:56:20.233' AS DateTime), NULL)
INSERT [dbo].[employee] ([employeeId], [employeeName], [employeeAccount], [employeePwd], [employeeSalt], [employeeCategoryId], [employeeOnBoardDate], [employeeLeaveDate], [employeePhoto], [createTime], [modifyTime]) VALUES (4, N'kai', N'kai255201', 0x676ED0AE8C1DD0A98D5124D2C88632DF2BEA18F15953E6FDC864B0D0256963424BDCF80E9B1045954C8C2348E3E2A77E, 0x776D08A298074F85AC2D778BE1D7352C0884F23F, 0, CAST(N'2018-07-15 06:56:29.757' AS DateTime), NULL, NULL, CAST(N'2018-07-15 06:56:29.757' AS DateTime), NULL)
INSERT [dbo].[employee] ([employeeId], [employeeName], [employeeAccount], [employeePwd], [employeeSalt], [employeeCategoryId], [employeeOnBoardDate], [employeeLeaveDate], [employeePhoto], [createTime], [modifyTime]) VALUES (5, N'楷', N'b255201', 0x75A57ED613CAFAF754FF62BD3722A5ADA4F81E3A9806940DF7E7B1DDE9162609B3226742175B1CB16C5CA908CCC7CBC4, 0xEEAE90384448CA2D38A93B384C26C1824D290BEA, 0, CAST(N'2018-07-15 08:28:16.723' AS DateTime), NULL, NULL, CAST(N'2018-07-15 08:28:16.723' AS DateTime), NULL)
INSERT [dbo].[employee] ([employeeId], [employeeName], [employeeAccount], [employeePwd], [employeeSalt], [employeeCategoryId], [employeeOnBoardDate], [employeeLeaveDate], [employeePhoto], [createTime], [modifyTime]) VALUES (6, N'鄭鈞隆', N'jason', 0x6FA5FB4A236D33CE1F73327845CBE09EA09B181692C07A3DED06ED5445DCA4D4B9A55DAD85A268CA717FF1BEE8B51ACF, 0x181456C991D389CCC6270836357F6CFE1B6B6304, 0, CAST(N'2018-07-15 08:40:50.107' AS DateTime), NULL, NULL, CAST(N'2018-07-15 08:40:50.107' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[employee] OFF
INSERT [dbo].[employeeCategory] ([employeeCategoryID], [employeeCategoryname]) VALUES (0, N'Administrator')
INSERT [dbo].[employeeCategory] ([employeeCategoryID], [employeeCategoryname]) VALUES (1, N'CEO')
INSERT [dbo].[employeeCategory] ([employeeCategoryID], [employeeCategoryname]) VALUES (2, N'Manager')
INSERT [dbo].[employeeCategory] ([employeeCategoryID], [employeeCategoryname]) VALUES (3, N'Supervisor')
INSERT [dbo].[employeeCategory] ([employeeCategoryID], [employeeCategoryname]) VALUES (4, N'GeneralStaff')
INSERT [dbo].[employeeCategoryDetails] ([employeeCategoryId], [permissionId], [canAccess]) VALUES (0, 1, 1)
INSERT [dbo].[employeeCategoryDetails] ([employeeCategoryId], [permissionId], [canAccess]) VALUES (0, 2, 1)
INSERT [dbo].[employeeCategoryDetails] ([employeeCategoryId], [permissionId], [canAccess]) VALUES (0, 3, 1)
INSERT [dbo].[employeeCategoryDetails] ([employeeCategoryId], [permissionId], [canAccess]) VALUES (0, 4, 1)
INSERT [dbo].[employeeCategoryDetails] ([employeeCategoryId], [permissionId], [canAccess]) VALUES (0, 5, 1)
INSERT [dbo].[employeeCategoryDetails] ([employeeCategoryId], [permissionId], [canAccess]) VALUES (1, 1, 1)
INSERT [dbo].[employeeCategoryDetails] ([employeeCategoryId], [permissionId], [canAccess]) VALUES (1, 2, 1)
INSERT [dbo].[employeeCategoryDetails] ([employeeCategoryId], [permissionId], [canAccess]) VALUES (1, 3, 0)
INSERT [dbo].[employeeCategoryDetails] ([employeeCategoryId], [permissionId], [canAccess]) VALUES (1, 4, 0)
INSERT [dbo].[employeeCategoryDetails] ([employeeCategoryId], [permissionId], [canAccess]) VALUES (1, 5, 1)
INSERT [dbo].[employeeCategoryDetails] ([employeeCategoryId], [permissionId], [canAccess]) VALUES (4, 1, 0)
INSERT [dbo].[employeeCategoryDetails] ([employeeCategoryId], [permissionId], [canAccess]) VALUES (4, 2, 0)
INSERT [dbo].[employeeCategoryDetails] ([employeeCategoryId], [permissionId], [canAccess]) VALUES (4, 3, 0)
INSERT [dbo].[employeeCategoryDetails] ([employeeCategoryId], [permissionId], [canAccess]) VALUES (4, 4, 0)
INSERT [dbo].[employeeCategoryDetails] ([employeeCategoryId], [permissionId], [canAccess]) VALUES (4, 5, 0)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (1, N'kkkk', NULL, N'b255@', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (2, N'黃', N'', N'', N'5555555', N'', NULL, CAST(N'2018-06-10 09:47:22.567' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (3, N'qq', N'', N'', N'12345678', N'', NULL, CAST(N'2018-06-17 06:13:25.193' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (4, N'test', N'q', N'b@yahoo.com.tw', N'091234567', N'123567', N'高二三英文課程', CAST(N'2018-06-17 06:25:58.377' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (5, N'莊語夏', N'靜修女中國中部', N'peedan2@gmail.com', N'0960290113', N'', N'高一英文課程', CAST(N'2018-06-19 03:25:44.260' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (6, N'楊博順', N'台中科技大學', N's1410533036@gms.nutc.edu.tw', N'0983597778', N'0983597778', N'TOEIC新制多益課程', CAST(N'2018-06-27 11:50:03.113' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (7, N'葉姿麟', N'新埔', N'a0936050895@hotmail.com', N'0936050895', N'', N'GEPT全民英檢中級複試班', CAST(N'2018-06-27 15:42:11.257' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (8, N'王佑恩', N'敦化國中', N'scarlettkung@gmail.com', N'0955628821', N'0955628821', N'國七升國八超前進度班', CAST(N'2018-07-07 14:29:10.047' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (9, N'test1', N'qq', N'', N'122345', N'', N'小六升國七精熟銜接班', CAST(N'2018-07-15 06:54:38.950' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (10, N'Lydia', N'', N'', N'0953131916', N'', N'小六升國七精熟銜接班', CAST(N'2018-07-24 07:30:13.610' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (11, N'Lydia', N'', N'', N'0953131916', N'', N'小六升國七精熟銜接班', CAST(N'2018-07-24 07:30:14.080' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (12, N'陳泓達', N'五常國中', N'chen112123@gmail.com', N'0985345582', N'', N'國七升國八超前進度班', CAST(N'2018-07-26 09:36:37.437' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (13, N'Test222', N'', N'', N'0912345678', N'', N'小六升國七精熟銜接班', CAST(N'2018-07-29 10:11:01.907' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (14, N'吳肇恒', N'建國中學', N'daniel4292kee@gmail.com', N'0900025341', N'', N'高一英文課程', CAST(N'2018-07-30 09:44:25.950' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (15, N'廖紫杏', N'中山女中', N'v1812.v1812@gmail.com', N'0955189810', N'0973361925', N'高二三英文課程', CAST(N'2018-07-31 14:29:47.687' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (16, N'謝丞博', N'苗栗ˇ建台中學', N'applealruda@gmail.com', N'0917716839', N'0916357169', N'高二三英文課程', CAST(N'2018-08-02 05:39:12.297' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (17, N'謝丞博', N'苗栗ˇ建台中學', N'applealruda@gmail.com', N'0917716839', N'0916357169', N'高二三英文課程', CAST(N'2018-08-02 05:39:17.277' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (18, N'林儀宣', N'中山女', N'a47850325@gmail.com', N'0986657837', N'', N'高一英文課程', CAST(N'2018-08-03 13:46:04.840' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (19, N'SARAH', N'NTUB', N'sarah.924@hotmail.com', N'0911009924', N'0911009924', N'TOEIC新制多益課程', CAST(N'2018-08-07 01:49:20.183' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (20, N'SARAH', N'NTUB', N'sarah.924@hotmail.com', N'0911009924', N'0911009924', N'TOEIC新制多益課程', CAST(N'2018-08-07 01:49:20.557' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (21, N'林琬庭', N'景美女主', N't0990110105@gmail.com', N'0988697599', N'', N'高二三英文課程', CAST(N'2018-08-07 16:07:16.297' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (22, N'林琬庭', N'景美女主', N't0990110105@gmail.com', N'0988697599', N'', N'高二三英文課程', CAST(N'2018-08-07 16:07:20.820' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (23, N'林琬庭', N'景美女中', N't0990110105@gmail.com', N'0988697599', N'', N'高二三英文課程', CAST(N'2018-08-08 04:11:28.207' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (24, N'陳柔云', N'', N'zoe121230@gmail.com', N'0978586006', N'0228923648', N'學測保證班', CAST(N'2018-08-09 01:02:12.387' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (25, N'陳柔竹', N'', N'zoe121230@gmail.com', N'0978586006', N'0228923648', N'學測保證班', CAST(N'2018-08-09 01:02:25.800' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (26, N'鄭琲勳', N'', N'景美女中', N'0935238178', N'0935238178', N'高二三英文課程', CAST(N'2018-08-09 11:25:24.507' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (27, N'王翊翰', N'慧燈中學', N'xyz5858@yahoo.com.tw', N'09', N'37928280', N'高一英文課程', CAST(N'2018-08-10 01:39:17.363' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (28, N'王翊翰', N'慧燈中學', N'xyz5858@yahoo.com.tw', N'0937928280', N'0937928280', N'高一英文課程', CAST(N'2018-08-10 01:39:45.913' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (29, N'KAI', N'', N'2E14141@yahoo.com', N'0912345222', N'', N'小六升國七精熟銜接班', CAST(N'2018-08-11 12:52:17.593' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (30, N'彭琨棟', N'文化大學', N'', N'0912258805', N'', N'TOEIC新制多益課程', CAST(N'2018-08-23 04:49:44.863' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (31, N'彭琨棟', N'文化大學', N'', N'0912258805', N'', N'TOEIC新制多益課程', CAST(N'2018-08-23 04:49:48.990' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (32, N'彭琨棟', N'文化大學', N'', N'0912258805', N'', N'TOEIC新制多益課程', CAST(N'2018-08-23 04:49:50.977' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (33, N'tes001', N'', N'', N'0912345689', N'', N'小六升國七精熟銜接班', CAST(N'2018-08-26 07:05:37.267' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (34, N'tes002', N'', N'', N'0912345689', N'', N'會考保證班', CAST(N'2018-08-26 07:05:52.043' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (35, N'tes002', N'', N'', N'0912345689', N'', N'會考保證班', CAST(N'2018-08-26 07:07:22.403' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (36, N'朱倢瑩', N'實踐國中', N'', N'0955330065', N'', N'會考保證班', CAST(N'2018-08-29 12:54:09.367' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (37, N'林芝', N'', N'gem317@hotmail.com.tw', N'0918560865', N'', N'TOEIC新制多益課程', CAST(N'2018-08-31 04:46:25.343' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (38, N'陳靜怡', N'', N'angelacat0213@gmail.com', N'0963038095', N'', N'TOEIC新制多益課程', CAST(N'2018-08-31 06:52:52.430' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (39, N'陳靜怡', N'', N'angelacat0213@gmail.com', N'0963038095', N'', N'TOEIC新制多益課程', CAST(N'2018-08-31 07:05:55.407' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (40, N'鄭宇柔', N'聖心女中', N'Lucy0910910717@yahoo.com.tw', N'0981287925', N'', N'學測保證班', CAST(N'2018-09-05 07:55:26.433' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (41, N'邢先生', N'介壽', N'tewhei@gmail.com', N'0958986251', N'', N'國七升國八超前進度班', CAST(N'2018-09-12 15:37:24.227' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (42, N'董芮瑄', N'東門國小', N'renee.apple@msa.hinet.net', N'0928856167', N'', N'小六升國七精熟銜接班', CAST(N'2018-09-13 09:23:07.787' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (43, N'阮尚喆', N'格致', N'jason28473307yahoo@gmail.com', N'0963757860', N'', N'高二三英文課程', CAST(N'2018-09-13 15:07:06.667' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (44, N'陳名群', N'格致中學', N'peter0975937669a@gmail.com', N'0975937669', N'', N'高二三英文課程', CAST(N'2018-09-13 15:14:15.107' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (45, N'陳名群', N'格致中學', N'peter0975937669a@gmail.com', N'0975937669', N'', N'高二三英文課程', CAST(N'2018-09-13 15:14:19.570' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (46, N'周俊廷', N'格致中學', N'junting0922868@gmail.com', N'0909689262', N'', N'高二三英文課程', CAST(N'2018-09-14 13:28:07.130' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (47, N'陳遠達', N'前台中班因當兵保留課程的學生 ', N'stu099337788@gmail.com', N'0977391966', N'', N'其他', CAST(N'2018-09-19 05:30:05.097' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (48, N'林郅澔', N'道明高中', N'', N'0918308157', N'', N'小六升國七精熟銜接班', CAST(N'2018-09-26 19:15:15.153' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (49, N'林郅澔', N'道明高中', N'', N'0918308157', N'', N'小六升國七精熟銜接班', CAST(N'2018-09-26 19:15:21.143' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (50, N'林郅澔', N'道明高中', N'', N'0918308157', N'', N'小六升國七精熟銜接班', CAST(N'2018-09-26 19:15:21.233' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (51, N'test6', N'', N'le26273878@gmail.com', N'0912345678', N'', N'中低收入戶及原或新住民學生，免費英語課程', CAST(N'2018-10-07 08:23:07.177' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (52, N'王芳蕙', N'', N'circle199@yahoo.com.tw', N'0919702971', N'', N'軍公教人員免費全民英檢班', CAST(N'2018-10-13 09:56:23.597' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (53, N'鄭如紜', N'城市科大', N'god498@yahoo.com.tw', N'0929087008', N'', N'TOEIC新制多益課程', CAST(N'2018-10-25 08:26:02.357' AS DateTime), NULL)
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (54, N'林冠宏', N'建國中學', N'daniel101103@gmail.com', N'0968652535', N'0968652535', N'學測保證班', CAST(N'2018-11-11 16:47:27.540' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (55, N'葉雯心', N'中興大學', N'twywh0401@gmail.com', N'0930875150', N'', N'TOEIC新制多益課程', CAST(N'2018-11-27 15:31:34.277' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (56, N'洪浚凱', N'松山高中', N'', N'0903657391', N'', N'高一英文課程', CAST(N'2018-12-01 09:53:50.277' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (57, N'test', NULL, N'aaa@yahoo.com.tw', N'0912345678', N'234567891', N'軍公教人員免費全民英檢班', CAST(N'2018-12-01 18:42:04.023' AS DateTime), N'qqqqq')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (60, N'彭鈺翔', N'板橋國小', N'fgu93@yahoo.com.tw', N'0922187301', N'0229653785', N'小六升國七精熟銜接班', CAST(N'2018-12-03 20:06:04.187' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (61, N'彭鈺雯', N'中和高中', N'fgu93@yahoo.com.tw', N'0922187301', N'0229653785', N'高二三英文課程', CAST(N'2018-12-03 20:12:01.480' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (62, N'謝心舫', N'松山高中', N'', N'0908530103', N'', N'高一英文課程', CAST(N'2018-12-03 22:50:31.410' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (63, N'李堃誠', N'台大', N'b04701124@ntu.edu.tw', N'0988566094', N'', N'TOEIC新制多益課程', CAST(N'2018-12-05 20:09:07.717' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (65, N'周芯如', N'永吉國中', N'', N'0928325460', N'27616894', N'會考保證班', CAST(N'2018-12-06 18:45:40.507' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (66, N'sa', N's', N'', N'1234567890', N'', N'會考保證班', CAST(N'2018-12-08 19:54:24.943' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (67, N'aaaa', N'', N'', N'0912345678', N'', N'學測全科總複習班保證班', CAST(N'2019-01-28 00:07:10.253' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (68, N'aaa', N'', N'', N'0912345678', N'', N'高中英文課程', CAST(N'2019-01-28 00:08:47.473' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (69, N'fff', N'', N'', N'0912345678', N'', N'全程外語主題課程', CAST(N'2019-01-28 00:09:13.180' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (70, N'ttt', N'', N'', N'0912345678', N'', N'高中英文課程', CAST(N'2019-01-28 00:19:49.243' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (71, N'ttt', N'', N'', N'0912345678', N'', N'高中英文課程', CAST(N'2019-01-28 00:22:34.877' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (72, N'v', N'', N'', N'0912345678', N'', N'會考保證班', CAST(N'2019-01-28 00:23:32.617' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (73, N'aaaa', N'', N'', N'0912345678', N'', N'國七升國八超前進度班', CAST(N'2019-01-28 00:23:56.250' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (74, N'ttt', N'', N'', N'0912345678', N'', N'國七升國八超前進度班', CAST(N'2019-01-28 00:24:47.857' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (75, N'v', N'', N'', N'0912345678', N'', N'全程外語主題課程', CAST(N'2019-01-28 00:25:55.510' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (76, N'g', N'', N'', N'0912345678', N'', N'小六升國七精熟銜接班', CAST(N'2019-01-28 00:27:03.300' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (77, N'r', N'', N'', N'0912345678', N'', N'指考英文數學課程', CAST(N'2019-01-28 00:27:41.483' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (78, N'b', N'', N'', N'0912345678', N'', N'小六升國七精熟銜接班', CAST(N'2019-01-28 00:28:54.743' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (79, N'h', N'', N'', N'0912345678', N'', N'指考英文數學課程', CAST(N'2019-01-28 00:29:15.190' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (80, N'adas', N'ds', N'', N'0912345678', N'', N'hhhh', CAST(N'2019-02-09 19:45:32.527' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (81, N'test', N'', N'pan801209@gmail.com', N'1234567890', N'', N'aaaa', CAST(N'2019-02-10 13:43:04.723' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (82, N'qwe', N'', N'admin@example.com', N'1234567890', N'', N'其他', CAST(N'2019-02-10 13:44:20.430' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (83, N'aaaa', N'', N'', N'0912345678', N'', N'全程外語主題課程', CAST(N'2019-02-10 14:48:56.657' AS DateTime), N'')
INSERT [dbo].[FreeTrail] ([SeqID], [Name], [SchoolName], [Email], [Phone], [LocalPhone], [Course], [CreateTime], [Memo]) VALUES (84, N'v', N'', N'', N'0912345678', N'', N'TOEIC新制多益課程', CAST(N'2019-02-10 14:49:15.007' AS DateTime), N'')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (1, N'「指定科目考試」是進入大學的主要管道，自104學年度起，各大學會依照科系的需求，分發入學採計指定科目考試，各招生校系採計科目降為3到5科作為招生入學的標準。因此「指考」每一年度的考題，對考生而言都非常重要，都具有參考及練習的價值。 

為了提供同學珍貴的資料，我們特別蒐集了107年度指考各科試題，做成「107年指定科目考試各科試題詳解」，書後並附有大考中心所公佈的各科選擇題參考答案。', N'01.jpg', N'107年指定科目考試各科試題詳解')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (2, N'學習出版公司以最迅速的腳步，出版「106年指定科目考試各科試題詳解」，展現出最驚人的效率。本書包含106年度「指定科目考試」各科試題：英語、數學、社會、自然和國文，書後附有各科選擇題答案。另外，在英語科詳解後面，還附上了英語試題修正意見。 

這本書的完成，要感謝各科名師全力協助解題： 

英文 /	劉 毅 老師 
數學 /	劉 星 老師 
物理 /	陳怡婷 老師 
國文 /	李雅清 老師 
化學 /	陳 毅 老師 
生物 /	詹宗岳 老師 
地理 /	劉成霖 老師 
歷史 /	洪 浩 老師 
公民與社會 / 羅 文 老師', N'03.jpg', N'106年指定科目考試各科試題詳解')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (3, N'人類的記憶有限, 超出7000字範圍的單字少用,背了也會忘記,反而造成學習的障礙 準備大考的目標應該以教育部公布的7000字的範圍為目標, 把7000字背得滾瓜爛熟, 再做以7000字為範圍的閱讀測驗, 不斷地複習及應用。', N'08.jpg', N'7000字文意選填詳解')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (4, N'克漏字測驗是考生最頭痛的一大題，屬於綜合題型，出題方向包括文意、組織、文法概念等。 本書精心設計7000字克漏字測驗，書中所有文章都有完整的翻譯和註釋,針對所有問題,都有詳盡的解說,在本書的幫助下,你的文法程度和閱讀能力都會大為增進,不再害怕克漏字測驗，是準備學測與指考最重要的參考資料。', N'09.jpg', N'7000字克漏字詳解')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (5, N'人類的記憶有限，超出7000字範圍的單字少用，背了也會忘記，反而造成學習的障礙。準備大學入學考試，應該以教育部公布的「高中常用7000字」為目標，把7000字背得滾瓜爛熟，再做以7000字為範圍的試題，不斷地複習及應用，進步才快。「篇章結構」是每年「大學入學指定科目考試」的必考題型，也是同學覺得較困難的部分，一定要多練習，才能得高分。', N'10.jpg', N'7000字篇章結構詳解')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (6, N'人類的記憶有限, 超出7000字範圍的單字少用,背了也會忘記,反而造成學習的障礙 
準備大考的目標應該以教育部公布的7000字的範圍為目標, 把7000字背得滾瓜爛熟, 再做以7000字為範圍的閱讀測驗, 不斷地複習及應用。', N'11.jpg', N'7000字閱讀測驗教本')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (7, N'精選六份學測英文模擬試題，按照大學入學學科能力測驗的題型命題，以高中常用7000字的範圍，鎖定蛋黃區的單字，把7000字背到滾瓜爛熟，遇到超出範圍的單字，也能猜到它的意思。唯有做7000字範圍的試題，才會越做越有信心。 每份試題都在”劉毅英文”實際考過，效果極佳。附有翻譯和註釋，單字均標明級數，對錯答案都有明確交代。只要熟讀六份試題，再做其他題目就輕鬆了。', N'12.jpg', N'7000字學測試題詳解')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (8, N'所有字彙依照難易程度，分為六級，第一級最簡單，第六級最困難。 
每一組九個字，當成一個字來背，主要是按照字尾或字首發音排列，所以，會唸就會寫。 
先放在短期記憶中，不斷背熟，變成直覺，就終生不忘記。 
「一分鐘背9個字」以三字為一組，9字為一回，一個Unit九回共81個字，用背單字不背字母的方式，快速把單字背完。 

※顛覆傳統 
一個一個字背太慢，背到後面，前面忘記。一改傳統方式，背單字更有趣了！ 

※創新編排 
版面、單字經過巧妙安排，九個字當一個字背，超乎想像，讓你背書有效率。 

※高效記憶 
不斷熟背，變成直覺，就能終生不忘記，唯有不忘記，才能累積。 

※不背拼字 
利用相同字首、字尾編排，整理出規則，會唸就會拼，背單字變得超簡單！ 

※不做白工 
電腦統計，準確地鎖定「高中常用7000字」，用不到的、不考的字，不用浪費時間背！ 

顛覆傳統的單字背誦方法，透過版面及單字安排，將九個字當一個字背，讓背書更有效率。不斷背熟，變成直覺，就能夠成為終生的長期記憶，並透過電腦統計，鎖定高中常用7000字範圍。', N'13.jpg', N'一分鐘背9個單字')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (9, N'「升大學詞彙3500」是根據2018年大陸高考考綱公布的，高中生畢業時要會的3500字編輯而成，是大陸大學入試的命題範圍。本書去蕪存菁，把不重要的，如a, an, the, about等，太簡單的單字去掉，難背的單字附有「記憶技巧」，重要單字附有「同義字」和 
「反義字」，關鍵字附有「典型考題」，大學入試常考的核心單字，以紅色字標示。', N'14.jpg', N'升大學詞彙3500')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (10, N'資料最新，書中精彩的解說，猶如在課堂上聆聽英文名師講解 。', N'16.jpg', N'升高中常考成語')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (11, N'本書利用智慧型手機，掃描每個Unit右上方的QR碼，就可以聽到該Unit的錄音內容，不需要CD player，方便外出使用。 

※永不忘記--會說出來的單字，永不忘記。 
　　人類先學會說簡單的話，受過教育的人就說有深度的話，所謂「深度」，就是使用較難的單字。這項新發明是讓你先學會說話，再背單字。英文單字無限多，不能亂背，超出範圍的，由於少用，即使背了也會忘記。 
※用文法學英文，不如背短句，句子短，背得才快。 
　　句子要短、要用得到，能脫口把生字說出來，碰到與自己想法不同的，再查「文法寶典」，這是學英文最佳的方法。 
極短句，加上單字，是最好的組合，說出來讓人佩服。用這種會話背單字的方法，背一些隨時可以使用的句子，越背越喜歡背，說出來的話又有深度。 
※快速記憶--以三句一組，背短句比背單字還快。 
　　劉毅老師「用會話背7000字」的發明，將「高中常用7000字」融入日常生活會話，每一句話都用得到，都可以主動和外國人說，使學英文變得很簡單，每12回為一個Unit，編排成句型，每句皆為5個字以內的極短句，三句一組，九句一回，讀者可以一回接一回背下來，背短句比背單字還快。每一個Unit背到2分鐘之內，變成直覺，就終生不會忘記， 也可以先聽美籍播音員的錄音，每回9句重覆聽，背起來就更容易了。 
※實用會話--每句話都用得到，可以主動和外國人說。 
　　美國人說話的時候，不一定每個句子都有主詞、動詞、受詞等，人類先有語言，才有文法，學會話要學美國人說出來的話。美國人說和寫不一樣，所以分成spoken English和written English，而我們所學的文法偏重於書寫英文，你學的和聽到的不一樣，英文怎麼學得好？我們應該先學口說英語。 
　　很多年前，我們就想到把7000字用嘴巴說出來，而美籍編輯做不到，這次想盡方法做到了。英文單字無限多，不能亂背，超出範圍的，由於少用，即使背了也會忘記。7000字是高中學生課本和大學入學考題的範圍，很常用，能夠說出來的單字更常用。唯有把7000字背得滾瓜爛熟，再看到少數不認識的單字，就不會害怕。說多了，單字增加，英文也流利，也可以寫作文。', N'17.jpg', N'用會話背7000字')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (12, N'美國人不論演講、寫文章，都喜歡用First，Second，Third，Finally，In conclusion等轉承語，把整篇演講稿或文章串聯起來。並不一定要用老套，也可以把First改成Firstly或First of all，To begin with，或To start with，甚至用For starters，For openers，For one thing等。 

凡是作文想不出來，接下來該怎麼寫的時候，就可以用Next，Also， Again或What’s more，Moreover，Furthermore；想要強調什麼事的時候，可以用In fact，In reality，In actuality等。要解釋前面所說的話時，就可以說That is to say之類的。 
舉例說明時，可以說：For example，For instance，Take…for example. 或Take… 
as an example. 同學只要會寫英文句子（不會寫就背「一口氣背會話」），再背了轉承語，就很會寫作文了。 

「如何寫英文作文」從頭到尾把英文作文該怎麼寫，敘述得一清二楚，言簡意賅。從標題、主題句、推展句，到結尾句，加上最完整的轉承語，並附上歷屆學測、指考試題來驗證。', N'19.jpg', N'如何寫英文作文')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (13, N'7000字背誦法寶 五種方法+OBE 

1. 鎖定7000字 
不超出常用7000字範圍，不做白工。 

2. 用盡方法 
以「字根」、「字首」、「字尾」、「比較」、「詞類變化」，一次背一長串。 

3. 一口氣英語 
三字一組，九句一回，一群字、一群字背。 

4. 終生不忘 
把九個字背到變成直覺，終生不忘，如此才能累積。', N'20.jpg', N'時速破百單字快速記憶')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (14, N'以「高中生必背4500字」為命題範圍，每10頁一回測驗，共30回，地毯式複習，加深印象。做詞彙題能夠增加閱讀能力，詞彙題滿分，其他綜合測驗、文意選填、篇章結構、閱讀測驗、翻譯、作文，只要稍加努力，就能完全征服。將本書當課本一樣每天朗讀，效果奇佳。每條題目都有詳細解答，節省查字典的時間', N'21.jpg', N'高中生必背4500字測驗')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (15, N'「高中7000字測驗題庫」以大考中心公佈的「高中常用7000字」為範圍，完全依照「學測」與「指考」詞彙題的命題趨勢，精心設計40回測驗。每一回有10題詞彙測驗及5題慣用語測驗，每條題目均有中文翻譯及註釋，能節省讀者查字典的時間；每個選項還附有詞類變化、同反義字、字根分析、背誦技巧、常考片語，或例句說明等補充資料，讓讀者加深印象，徹底了解每個單字的用法。每做完一回之後，一定要徹底檢討，如此字彙實力必能在短時間內大幅提升，考起試來會更加得心應手。', N'22.jpg', N'高中7000字測驗題庫')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (16, N'根據2018年教育部新公佈的「高中生必背4500字」編輯而成，是大學入試的命題範圍。大學入試常考的核心單字，以紅色字標示。「高中生必背4500字隨身背」輕薄短小，方便攜帶，讓讀者可隨時隨地背單字。', N'23.jpg', N'高中生必背4500字隨身背')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (17, N'電腦選出大學入試中最常考的字彙，去蕪存菁，分類編排，每個單字均標明級數，不會超出考試範圍。分類加上分級，更有助於記憶，並利用「比較法」，使難的單字更好背。書中附有QR碼，每一組單字由美籍老師唸一遍，同學跟著唸一遍，不需要看書，就可以背下來。只要很短的時間，就可以複習全部的單字。', N'25.jpg', N'高中常考3500分類輕鬆背')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (18, N'「高中常用7000字」是高中課本及大學入試的範圍。「高中常用7000字」共分6級，第6級最難，卻是考試新趨勢，是考試成敗的關鍵。本書是「高中常用7000字」的背誦法寶。用「比較法」，化繁為簡，使難的單字更好背。學會這種方法，能使你快速背好「高中常用6000～7000字」。', N'26.jpg', N'第6級單字輕鬆背')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (19, N'「高中常用7000字」是高中課本及大學入試的範圍。「高中常用7000字」共分6級，第6級最難，卻是考試新趨勢，是考試成敗的關鍵。本套DVD收錄劉毅老師2017年8月5日上課的精華，全場爆滿，高潮迭起，每一分鐘都精彩。', N'27.jpg', N'第6級單字輕鬆背講座實況DVD')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (20, N'本書資料來源，是大考中心所編制的「學科能力測驗英文科參考詞彙表」，經過統計，選出最精華的4000字，每個單字都有例句，方便記憶。', N'28.jpg', N'學測4000字隨身背')
INSERT [dbo].[High_Book] ([Id], [Description], [Image], [title]) VALUES (21, N'「學科能力測驗」實施以來，考試的題型包含 : ⑴選擇題⑵詞彙題、⑶克漏字、⑷文意選填、⑸閱讀測驗、⑹簡答題、⑺中翻英、⑻看圖說故事…等。內含99-106年大學入學學科能力測驗英文試題的分析及詳解。', N'29.jpg', N'歷屆大學學測英文試題詳解(2)')
INSERT [dbo].[HighClass] ([Id], [title], [Description], [Image], [Course], [CreateTime]) VALUES (1, N'升高一精緻英數課程', N'多年教學經驗的英數老師，教您如何不只拿高分，還要拿獎金如有需要請填寫預約試聽，我們將有專人為您服務', N'0001-A.jpg,0001-B.jpg,0003-A.jpg,0004-B.jpg', N'高一課程', CAST(N'2018-10-21 09:17:13.447' AS DateTime))
INSERT [dbo].[HighClass] ([Id], [title], [Description], [Image], [Course], [CreateTime]) VALUES (2, N'英文界ＬＶ！高二、三學測救星', N'教您如何精確準備考題', N'201810211702.jpg,201810211702_頁面_2.jpg', N'高二課程', CAST(N'2018-10-21 09:22:01.997' AS DateTime))
INSERT [dbo].[HighClass] ([Id], [title], [Description], [Image], [Course], [CreateTime]) VALUES (3, N'高三同學開課簡章', N'由教學多年英文老師，教您如何準備大範圍的英文考試，趕快跟著我們的腳步如有興趣請填寫預約試聽', N'201810211702-1.jpg', N'高三課程', CAST(N'2018-10-21 09:28:40.390' AS DateTime))
INSERT [dbo].[HighClass] ([Id], [title], [Description], [Image], [Course], [CreateTime]) VALUES (4, N'學測頂標保證班', N'還在煩惱如何準備大型考試嗎？快來劉毅學測保證班，讓我們快速教導您如何達到頂標，如有興趣請填寫預約試聽，我們將有專人為您服務', N'8.jpg,7.jpg,6.jpg,45.jpg', N'學測總複習', CAST(N'2018-12-05 21:42:07.067' AS DateTime))
INSERT [dbo].[HighClass] ([Id], [title], [Description], [Image], [Course], [CreateTime]) VALUES (5, N'學測全科總複習', N'顧好高二下進度，再全力衝刺總複習，快來劉毅學測全科班，讓跟著我們的課程規劃，顧好進度與複習，如有興趣請填寫預約試聽，我們將有專人為您服務', N'1.jpg,2A.jpg,3.jpg,45.jpg', N'學測總複習', CAST(N'2018-12-05 21:45:19.700' AS DateTime))
INSERT [dbo].[HighClass] ([Id], [title], [Description], [Image], [Course], [CreateTime]) VALUES (6, N'qerer高中英文精進班', N'eqrr水晶老師歡迎同學帶著問題來上課，為了提升段考應試實力，針對綜合版本加上課外教材，以加強字彙量及文法為首要任務，有效解決課業問題，趕快填寫預約試聽，我們將有專人為您服務', N'1111.png,18.jpg', N'高二課程', CAST(N'2019-02-16 18:00:12.113' AS DateTime))
INSERT [dbo].[junior_Book] ([Id], [Description], [Image], [title]) VALUES (1, N'全書收集「105年國中教育會考」試題，由各科名師提供詳細解答，是考前複習的關鍵資料。 書末整理有大考中心公佈之「選擇題答案」、「各科考試標準一覽表」及各科「成績人數百分比累計表」，讓考生確切掌握考試脈動。', N'01.jpg', N'105年國中教育會考各科試題詳解')
INSERT [dbo].[junior_Book] ([Id], [Description], [Image], [title]) VALUES (2, N'劉毅老師於2017年8月26日，舉辦「國中2000分類輕鬆背」講座， 2000字是國中會考的命題範圍，利用「分類」和「比較法」背單字，容易背 不容易忘。', N'03.jpg', N'國中2000分類輕鬆背講座實況DVD')
INSERT [dbo].[junior_Book] ([Id], [Description], [Image], [title]) VALUES (3, N'本書根據「九年一貫英語教學課程」編輯，為國中生必須認識的2000個英文單字，去蕪存菁，分類編排，易學易背；用「比較法」，使難的單字更好背。', N'04.jpg', N'國中2000分類輕鬆背')
INSERT [dbo].[junior_Book] ([Id], [Description], [Image], [title]) VALUES (4, N'本書根據「九年一貫英語教學課程」編輯，為國中生必須認識的2000個英文單字，去蕪存菁，分類編排，易學易背；用「比較法」，使難的單字更好背。', N'05.jpg', N'國中2000分類輕鬆背教本')
INSERT [dbo].[junior_Book] ([Id], [Description], [Image], [title]) VALUES (5, N'本書根據「九年一貫英語教學課程」編輯，為國中生必須認識的2000個英文單字，去蕪存菁，分類編排，易學易背；用「比較法」，使難的單字更好背。', N'05.jpg', N'國中2000分類輕鬆背教本')
INSERT [dbo].[junior_Book] ([Id], [Description], [Image], [title]) VALUES (6, N'本書蒐集各校段考試題，將文法規則作整體歸納，共有50回，題題具代表性， 做完練習後，所有文法難題迎刃而解，九年一貫基本學力測驗必備。', N'06.jpg', N'國中常考英文法(教本)')
INSERT [dbo].[junior_Book] ([Id], [Description], [Image], [title]) VALUES (7, N'通過國中教育會考，是升高中的學生最重要的一件事。本書收錄八回國中會考英語模擬試題，全部依據教育部公布的試題取材和命題原則出題，題型包含聽力測驗和閱讀測驗，提供同學練習機會，同學只要勤加練習，必然會有好成績。 本書聽力測驗附有錄音QR碼，另外還有教師手冊。', N'08.jpg', N'國中會考英語模擬試題3')
INSERT [dbo].[junior_Book] ([Id], [Description], [Image], [title]) VALUES (8, N'本書為教師手冊(書+MP3)，共十五回，每回有二十一題。完全仿照國中會考的英語聽力題型，包含圖片、問答、長對話和敘述。範圍多元有趣，除了可以作為準備英語聽力考試的用書，也適合作為日常生活對話的教材，內容符合英語情境，用字道地，非常適合生活上英語的需求。做完這十五回，必能熟悉國中教育會考英語科聽力測驗模式，一舉獲得高分。 
如需測驗題請購買國中會考英語聽力進階測驗本 ', N'11.jpg', N'國中會考英語聽力進階教師手冊')
INSERT [dbo].[junior_Book] ([Id], [Description], [Image], [title]) VALUES (9, N'本書為教學測驗本(題目本)，共十五回，每回有二十一題。完全仿照國中會考的英語聽力題型，包含圖片、問答、長對話和敘述。範圍多元有趣，除了可以作為準備英語聽力考試的用書，也適合作為日常生活對話的教材，內容符合英語情境，用字道地，非常適合生活上英語的需求。做完這十五回，必能熟悉國中教育會考英語科聽力測驗模式，一舉獲得高分。 
如需詳解與聽力MP3請購買國中會考英語聽力進階教師手冊(書+MP3)', N'12.jpg', N'國中會考英語聽力進階測驗本')
INSERT [dbo].[junior_Book] ([Id], [Description], [Image], [title]) VALUES (10, N'通過國中教育會考，是升高中的學生最重要的一件事。本書收錄八回國中會考英語模擬試題，全部依據教育部公布的試題取材和命題原則出題，題型包含聽力測驗和閱讀測驗，提供同學練習機會，同學只要勤加練習，必然會有好成績。 本書聽力測驗附有錄音QR碼，另外還有學生用書。', N'13.jpg', N'國中會考英語模擬試題3教師手冊')
INSERT [dbo].[junior_Book] ([Id], [Description], [Image], [title]) VALUES (11, N'收錄35回閱讀測驗，每一回測驗仿造 
會考閱讀題型編寫，貼近實戰會考內容。 

本書特色 

˙準備新式會考閱讀測驗，一定要多做題目。 
˙新式會考閱讀測驗同時具有「圖表」和「文字」， 
相互參照作答；內容生活化，圖文並茂，寓教於樂， 
為準備會考不可或缺的資料。本書另附有學生用題本。', N'16.jpg', N'國中會考閱讀測驗進階（1）教師手冊')
INSERT [dbo].[junior_Book] ([Id], [Description], [Image], [title]) VALUES (12, N'收錄35回閱讀測驗，每一回測驗仿造 
會考閱讀題型編寫，貼近實戰會考內容。 

本書特色 

˙準備新式會考閱讀測驗，一定要多做題目。 
˙新式會考閱讀測驗同時具有「圖表」和「文字」， 
相互參照作答；內容生活化，圖文並茂，寓教於樂， 
為準備會考不可或缺的資料。本書另附有教師手冊。', N'17.jpg', N'國中會考閱讀測驗進階（1）題本')
INSERT [dbo].[junior_Book] ([Id], [Description], [Image], [title]) VALUES (13, N'2014年起國中教育會考取代基本學力測驗，歷屆考題考過的觀念，再出現的機率頗高，故考前充分利用「歷屆國中會考英文試題全集(珍藏本)」，仔細複習歷屆試題是必要的！ 
本書包含103~105年國中教育會考英語科試題分析與詳解。', N'18.jpg', N'歷屆國中會考英文試題全集(珍藏本)')
INSERT [dbo].[JuniorClass] ([Id], [title], [Description], [Image], [Course], [CreateTime]) VALUES (2, N'國八神絕保證班，高額獎金來挑戰!越早領先別人，越有贏家資本!', N'"神"一般的師資團隊
"絕"對高的激勵獎金，獎金最高3萬，未達前10名(或學期總成績低於85分)無效退費!
107年10月底前申請截止。', N'2-1.jpg,2-2.jpg,2-3.jpg,2-4.jpg', N'八年級課程', CAST(N'2018-10-14 08:50:34.517' AS DateTime))
INSERT [dbo].[JuniorClass] ([Id], [title], [Description], [Image], [Course], [CreateTime]) VALUES (3, N'qweqweq5A++金榜保證班', N'wqewqe見證奇蹟『保證有效』成績考好獎學金最高10萬，同學們還在猶豫嗎？趕快填寫預約試聽單，讓我們用全國最優質的教學帶領你們上最高學府。', N'1111.png,kkk.jpg', N'八年級課程', CAST(N'2019-02-16 17:59:14.313' AS DateTime))
INSERT [dbo].[JuniorHigh_School] ([Id], [Description], [Image]) VALUES (1, N'課程時間', N'01.png')
INSERT [dbo].[JuniorHigh_School] ([Id], [Description], [Image]) VALUES (2, N'獎學金', N'02.png')
INSERT [dbo].[JuniorHigh_School] ([Id], [Description], [Image]) VALUES (3, N'國、高中英文學習差異', N'03.png')
INSERT [dbo].[JuniorHigh_School] ([Id], [Description], [Image]) VALUES (4, N'教學團隊', N'04.png')
INSERT [dbo].[JuniorHigh_School] ([Id], [Description], [Image]) VALUES (5, N'高一目標', N'05.png')
INSERT [dbo].[LastNews] ([Id], [title], [Description], [CreateTime]) VALUES (1, N'學測頂標保證班', N'全科複習課程，打破章節利用循環式主題複習，目標達到科科15級分；模擬考超前學校模考範圍，以戰養戰，讓成績立即見效；配合每週週考範圍，檢測學生學習狀況，追蹤成績，完善輔導機制，解決學生學習的惡性循環。', CAST(N'2018-10-06 08:18:22.693' AS DateTime))
INSERT [dbo].[LastNews] ([Id], [title], [Description], [CreateTime]) VALUES (2, N'小六升國七精熟銜接班', N'超前學校進度，兼備聽、說、讀、寫等課外內容，並於段考前開設「段考深度集訓講座」，讓同學在班上名列前矛！', CAST(N'2018-10-06 08:19:00.993' AS DateTime))
INSERT [dbo].[LastNews] ([Id], [title], [Description], [CreateTime]) VALUES (3, N'全民英檢', N'獎學金制度︰凡在班期間，取得中級英檢證書，可得獎學金$5,000元', CAST(N'2018-10-06 13:41:07.683' AS DateTime))
INSERT [dbo].[LastNews] ([Id], [title], [Description], [CreateTime]) VALUES (4, N'高效英語會話', N'想自助旅行卻擔心英文無法與人溝通？菜單看不懂？害怕迷路？常常想跟朋友聊最新用語卻不知如何開口？想玩寶可夢卻看不懂使用說明？快加入劉毅英文你想要的會話主題通通有！也不怕時間太忙有學費划不來的狀況！上課時間︰時間彈性，憑課堂券上課，可邀請親朋好友一起上課且不限期限。上課特色︰互動式教學，注重學員，個別的學習', CAST(N'2018-10-06 13:41:55.417' AS DateTime))
INSERT [dbo].[LastNews] ([Id], [title], [Description], [CreateTime]) VALUES (5, N'TOEIC新制多益課程', N'所有保證班班系學員，一次繳費，上到考取保證的分數為止，每年需要參加一次測驗，考取證照前，決不額外收費', CAST(N'2018-10-06 13:42:15.400' AS DateTime))
INSERT [dbo].[LastNews] ([Id], [title], [Description], [CreateTime]) VALUES (6, N'軍公教警消(含退休或約聘)人員免費', N'●劉毅英文軍公教警消(含退休或約聘)人員免費全民英檢初級、中級、中高級課程，一期四個月英檢課程完全免費(原價9900)，僅收教材、書籍費用1000元                                                     ●上課地址:台北市中正區許昌街17號6樓                                                                               ●報名專線:(02) 2389-5212', CAST(N'2018-10-06 13:43:24.550' AS DateTime))
INSERT [dbo].[LastNews] ([Id], [title], [Description], [CreateTime]) VALUES (7, N'中低收入戶及新住民和原住民學生，免費參加英語課程', N'財團法人臺北市一口氣英語教育基金會 函

機關地址：臺北市中正區許昌街17號6樓之6
聯絡電話：02-2389-5212
電子信箱：learnbook@learnbook.com.tw
承辦人: 
受文者：
發文日期：中華民國一百零七年十月五日 星期五
發文字號：教基字第1071005號
速別：普通
密等及解密條件或保密期限：普通
附件：如文

主旨：辦理台北市、新北市各國中小及高中，中低收入戶及新住民和原住民學生，免費參加英語課程。

說明：
一、	為支持政府推動英語為第二官方語言，同時加強學生外語能力，本基金會將與劉毅英文教育機構合作，補助中低收入戶及新住民學生免費參加國小、國中、高中英語課程。
二、	每個人可享英語課程及教材、書籍完全免費，專案至年底12月31日止。


三、	各班系課程：
   國小課程:兒童美語作文班、國七精熟銜接班、火箭進度班、單字戰    
   
            鬥營，KK音標保證班，、全民英檢班、西洋歌曲教唱班。
 
        國中課程:國九保證班、國八進度班、國九進度班。
        
        高中課程:多益班、學測全科班、學測保證班、高一單科班、高二數

                 學班、高二英文班。
        
                                         ※詳細課程內容請來電諮詢。
四、	上課地點：台北市中正區許昌街17號6F
五、	報名日期：即日起開始報名，額滿為止。
六、	報名資格：限國小、國中、高中，中低收入戶及新住民學生。
七、	報名專線：(02)2389-5212 
正本：台北市、新北市各公私立國小、國中、高中註冊組。
副本：本基金會業務組

', CAST(N'2018-10-06 13:53:13.357' AS DateTime))
INSERT [dbo].[LastNews] ([Id], [title], [Description], [CreateTime]) VALUES (9, N'【國中部】考A++像呼吸一樣簡單！【會考0風險–單科保証班】抓緊最忽略的科目！未達A以上僅收書費1900元！', N'選你要害那一科！想進前三志願？五科大範圍您命中率高？或50週年有保障？等二模覺醒來不及！錢買不到流逝時間！『劉毅會考0風險說明會』名額有限，就是要你精熟到A++不行！', CAST(N'2018-10-07 09:37:25.717' AS DateTime))
INSERT [dbo].[LastNews] ([Id], [title], [Description], [CreateTime]) VALUES (11, N'【國中部】破除同業造謠！分享國九全科保證班「無效退費」的機密！別說出去☆見證者親身說法', N'【劉毅5A++保證班】模考救星！獎學金最高10萬！未達標準依約退費！劉毅50週年重金打造5A、5A+、5A++保證班，一模榜單證明實力！週六日下午2:00、7:00說明會現場驚喜！台北市中正區許昌街17號6樓(M8出口對面)，搶分專線02-23895212早鳥優惠29900元限時搶位，現在看到的價格再也找不到！', CAST(N'2018-10-28 10:54:55.890' AS DateTime))
INSERT [dbo].[LastNews] ([Id], [title], [Description], [CreateTime]) VALUES (12, N'蝦米?!在劉毅英文當英文老師每年居然可以休假一個月?而且還是帶薪休假!? ', N'蝦米?!在劉毅英文當英文老師每年居然可以休假一個月?而且還是帶薪休假!? 聽都沒聽過的福利政策，劉毅老師親自面談，歡迎對教英文有興趣的夥伴一起加入!', CAST(N'2018-10-30 10:07:02.727' AS DateTime))
INSERT [dbo].[LastNews] ([Id], [title], [Description], [CreateTime]) VALUES (13, N'補教名師超創意，「一字經」打破語言障礙', N'「英文一字經」強調用聯想的方式，套用更短的句子，讓學習者可以更加快速，有邏輯的去背誦，舉一反三，一個單字可以連結第二，第三個單字，往往學完一篇，一段文章就能脫口而出，成效驚人。
完整報導：https://www.i-media.tw/news/detail.html?id=11309', CAST(N'2018-11-05 21:22:22.530' AS DateTime))
INSERT [dbo].[LastNews] ([Id], [title], [Description], [CreateTime]) VALUES (14, N'停課通知', N'<p>
	<span style="font-size:16px;">＊因班內生大多數都要返鄉投票<span style="color: rgb(84, 84, 84); font-family: arial, sans-serif;">，所以週六有停課</span><span style="font-family: arial, sans-serif;">。</span></span></p>
<p>
	<span style="font-size:16px;"><span style="font-family: arial, sans-serif;">&nbsp; &nbsp; &nbsp; 停課班級如下</span></span></p>
<ol>
	<li>
		<span style="font-size:16px;"><span style="font-family: arial, helvetica, sans-serif;">週六英檢中高級9:30~12:00 (停課)</span></span></li>
	<li>
		<span style="font-size:16px;"><span style="font-family: arial, helvetica, sans-serif;">週六英檢初級15:00~17:30 (停課)</span></span></li>
</ol>
', CAST(N'2018-11-18 13:22:25.217' AS DateTime))
INSERT [dbo].[LastNews] ([Id], [title], [Description], [CreateTime]) VALUES (15, N'帶著英文課業的問題來..', N'<p>
	<span style="color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; background-color: rgb(245, 245, 245);">水晶老師歡迎同學帶著問題來上課，為了提升段考應試實力，針對綜合版本加上課外教材，以加強字彙量及文法為首要任務，有效解決課業問題，趕快填寫預約試聽，我們將有專人為您服務</span></p>
', CAST(N'2018-12-05 21:56:38.160' AS DateTime))
INSERT [dbo].[LastNews] ([Id], [title], [Description], [CreateTime]) VALUES (16, N'cxc', N'<p>
	sdsadad</p>
', CAST(N'2018-12-08 15:23:34.070' AS DateTime))
INSERT [dbo].[LastNews] ([Id], [title], [Description], [CreateTime]) VALUES (17, N'twst', N'<p>
	qqqq</p>
', CAST(N'2018-12-16 17:35:30.587' AS DateTime))
INSERT [dbo].[LastNews] ([Id], [title], [Description], [CreateTime]) VALUES (18, N'wqe', N'<p>
	wqeweq</p>
', CAST(N'2018-12-23 14:21:06.317' AS DateTime))
SET IDENTITY_INSERT [dbo].[LessonCalendar] ON 

INSERT [dbo].[LessonCalendar] ([Id], [Title], [Department], [Link], [Schedule], [CreateTime]) VALUES (32, N'1', N'兒美-', N'http://www.learnschool.com.tw/HighLesson/Detail/11', N'm_7', CAST(N'2019-01-06 15:51:28.617' AS DateTime))
INSERT [dbo].[LessonCalendar] ([Id], [Title], [Department], [Link], [Schedule], [CreateTime]) VALUES (33, N'test', N'國中-', N'http://www.learnschool.com.tw/HighLesson/Detail/11', N'a_1', CAST(N'2019-01-06 15:51:53.363' AS DateTime))
INSERT [dbo].[LessonCalendar] ([Id], [Title], [Department], [Link], [Schedule], [CreateTime]) VALUES (34, N'英文一字經班', N'高中-', N'http://www.learnschool.com.tw', N'e_3', CAST(N'2019-01-06 15:52:39.180' AS DateTime))
INSERT [dbo].[LessonCalendar] ([Id], [Title], [Department], [Link], [Schedule], [CreateTime]) VALUES (35, N'nnnn', N'高中-', N'http://www.learnschool.com.tw', N'e_4', CAST(N'2019-01-06 15:54:07.360' AS DateTime))
INSERT [dbo].[LessonCalendar] ([Id], [Title], [Department], [Link], [Schedule], [CreateTime]) VALUES (36, N'sad', N'高中-', N'http://www.learnschool.com.tw', N'e_5', CAST(N'2019-01-06 15:54:18.727' AS DateTime))
INSERT [dbo].[LessonCalendar] ([Id], [Title], [Department], [Link], [Schedule], [CreateTime]) VALUES (37, N'aaa', N'國中-', N'http://www.learnschool.com.tw', N'a_6', CAST(N'2019-01-06 15:54:30.737' AS DateTime))
INSERT [dbo].[LessonCalendar] ([Id], [Title], [Department], [Link], [Schedule], [CreateTime]) VALUES (38, N'英文一字經班', N'國中-', N'http://www.learnschool.com.tw/HighLesson/Detail/11', N'e_2', CAST(N'2019-01-06 15:54:42.207' AS DateTime))
SET IDENTITY_INSERT [dbo].[LessonCalendar] OFF
SET IDENTITY_INSERT [dbo].[LessonOpt] ON 

INSERT [dbo].[LessonOpt] ([Id], [Seq], [Description]) VALUES (1, N'1', N'小六升國七精熟銜接班')
INSERT [dbo].[LessonOpt] ([Id], [Seq], [Description]) VALUES (2, N'2', N'國七升國八超前進度班')
INSERT [dbo].[LessonOpt] ([Id], [Seq], [Description]) VALUES (3, N'3', N'會考保證班')
INSERT [dbo].[LessonOpt] ([Id], [Seq], [Description]) VALUES (4, N'4', N'高中英文課程')
INSERT [dbo].[LessonOpt] ([Id], [Seq], [Description]) VALUES (5, N'5', N'高中數學課程')
INSERT [dbo].[LessonOpt] ([Id], [Seq], [Description]) VALUES (6, N'6', N'指考英文數學課程')
INSERT [dbo].[LessonOpt] ([Id], [Seq], [Description]) VALUES (7, N'7', N'學測全科總複習班保證班')
INSERT [dbo].[LessonOpt] ([Id], [Seq], [Description]) VALUES (8, N'8', N'TOEIC新制多益課程')
INSERT [dbo].[LessonOpt] ([Id], [Seq], [Description]) VALUES (9, N'9', N'GEPT全民英檢中級複試班')
INSERT [dbo].[LessonOpt] ([Id], [Seq], [Description]) VALUES (10, N'10', N'全程外語主題課程')
INSERT [dbo].[LessonOpt] ([Id], [Seq], [Description]) VALUES (11, N'11', N'Test')
SET IDENTITY_INSERT [dbo].[LessonOpt] OFF
INSERT [dbo].[permission] ([permissionId], [permissionName]) VALUES (1, N'employeeindex')
INSERT [dbo].[permission] ([permissionId], [permissionName]) VALUES (2, N'employeeedit')
INSERT [dbo].[permission] ([permissionId], [permissionName]) VALUES (3, N'employeeinsert')
INSERT [dbo].[permission] ([permissionId], [permissionName]) VALUES (4, N'employeedelete')
INSERT [dbo].[permission] ([permissionId], [permissionName]) VALUES (5, N'posindex')
INSERT [dbo].[ScholarShip] ([Id], [Title], [Description], [Date], [Image], [CreateTime]) VALUES (3, N'穿軍裝深山徘徊15年　鄉民撞見它落荒逃：無臉幽靈盯著我', N'瑞士曾流傳著一個都市傳說，許多居民都表示自己曾經看過一名身穿軍裝、戴著防毒面具的無臉幽靈，據傳他在森林裡長達15年的時間，沒有人知道他究竟是男是女，而曾經親眼見證的居民則是對未知的「它」十分惶恐。', N'', N'1.png', CAST(N'2018-12-09 13:33:26.557' AS DateTime))
INSERT [dbo].[ScholarShip] ([Id], [Title], [Description], [Date], [Image], [CreateTime]) VALUES (4, N'防彈少年團在台「吸金2.2億」　驚喜「逆應援」逼哭台粉', N'南韓夯團防彈少年團（BTS）以首爾為起點展開世界巡演《LOVE YOURSELF》，一路從北美、歐洲到日本，終於8日在桃園國際棒球場開唱，全場2萬多張門票早在開賣當日即秒殺，連續2天預計動員超過5萬名歌迷到場，吸金2.2億元新台幣，創下韓國團體在台灣的票房新紀錄。', N'2018-10-23', N'2.png', CAST(N'2018-12-09 13:34:30.063' AS DateTime))
INSERT [dbo].[StudentImpression] ([Id], [Title], [Description], [Date], [Image], [CreateTime]) VALUES (1, N'徐OO同學', N'<p style="box-sizing: border-box; color: rgb(85, 85, 85); font-size: 18px; line-height: 1.8; margin: 0px 0px 10px;">
	<span style="font-size:14px;"><a style="box-sizing: border-box; background-color: transparent; color: rgb(51, 51, 51); outline: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px;">感謝劉毅英文讓我有此次機會可以領取這次的獎學金<span style="box-sizing: border-box; font-family: arial, sans-serif;">。</span></a></span></p>
<p style="box-sizing: border-box; color: rgb(85, 85, 85); font-size: 18px; line-height: 1.8; margin: 0px 0px 10px;">
	<span style="font-size:14px;"><a style="box-sizing: border-box; background-color: transparent; color: rgb(51, 51, 51); outline: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px;">我要感謝琇瑩老師<span style="box-sizing: border-box; color: rgb(84, 84, 84); font-family: arial, sans-serif;">，莉莎老師用心的教導</span><span style="box-sizing: border-box; color: rgb(84, 84, 84); font-family: arial, sans-serif;">，<span style="box-sizing: border-box; background-color: rgb(255, 160, 122);">寫了段考前補習班所提供的題本</span></span><span style="box-sizing: border-box; color: rgb(84, 84, 84); font-family: arial, sans-serif;">，</span></a></span></p>
<p>
	<span style="font-size:14px;"></span></p>
<p style="box-sizing: border-box; color: rgb(85, 85, 85); font-size: 18px; line-height: 1.8; margin: 0px 0px 10px;">
	<span style="font-size:14px;"><a style="box-sizing: border-box; background-color: transparent; color: rgb(51, 51, 51); outline: 0px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 16px;"><span style="box-sizing: border-box; color: rgb(84, 84, 84); font-family: arial, sans-serif;">讓我在段考時得心應手</span><span style="box-sizing: border-box; color: rgb(84, 84, 84); font-family: arial, sans-serif;">，所有所有難題都能迎刃而解</span><span style="box-sizing: border-box; font-family: arial, sans-serif;">。</span></a></span></p>
', N' 2018-12-01', N'sh.jpg', CAST(N'2018-12-01 20:32:15.810' AS DateTime))
INSERT [dbo].[StudentImpression] ([Id], [Title], [Description], [Date], [Image], [CreateTime]) VALUES (2, N'vcxvcx', N'<p>
	cxvcxvvxc</p>
', N'2018-10-23', N'SSS.png', CAST(N'2018-12-08 15:35:52.060' AS DateTime))
INSERT [dbo].[Video] ([Title], [Description], [Date], [href], [CreateTime], [Id], [Item]) VALUES (N'補教名師超創意，「一字經」打破語言障礙', N'劉毅在補教界享有盛名，現年七十多歲的他曾憑藉細心研發的「一口氣英語」系列，在兩岸颳起背誦英語，用嘴學英語的旋風。近年來也指導出不少名師，對教育界與補教界都有卓越貢獻，今年在教學熱誠與學生的簇擁下，再度推出「英文一字經」，一經推出就受到兩岸教育界的關注與推崇。', N'2018-11-10', N'https://www.youtube.com/embed/a_GLIOkur94?ecver=1', CAST(N'2018-11-10 15:29:44.983' AS DateTime), 1, N'媒體報導')
INSERT [dbo].[Video] ([Title], [Description], [Date], [href], [CreateTime], [Id], [Item]) VALUES (N'補教名師超創意，「一字經」打破語言障礙', N'劉毅在補教界享有盛名，現年七十多歲的他曾憑藉細心研發的「一口氣英語」系列，在兩岸颳起背誦英語，用嘴學英語的旋風。近年來也指導出不少名師，對教育界與補教界都有卓越貢獻，今年在教學熱誠與學生的簇擁下，再度推出「英文一字經」，一經推出就受到兩岸教育界的關注與推崇。', N'2018-11-10', N'https://www.youtube.com/embed/a_GLIOkur94?ecver=1', CAST(N'2018-11-10 15:29:44.983' AS DateTime), 2, N'上課實況')
INSERT [dbo].[Video] ([Title], [Description], [Date], [href], [CreateTime], [Id], [Item]) VALUES (N'兒美部 ', N'生動活潑的英文上課影片', N'2018-12-09', N'https://www.youtube.com/embed/-6hy-ICDntE', CAST(N'2018-12-09 18:45:46.067' AS DateTime), 3, N'上課實況')
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_employeeCategory] FOREIGN KEY([employeeCategoryId])
REFERENCES [dbo].[employeeCategory] ([employeeCategoryID])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_employeeCategory]
GO
ALTER TABLE [dbo].[employeeCategoryDetails]  WITH CHECK ADD  CONSTRAINT [FK_employeeCategoryDetails_employeeCategory] FOREIGN KEY([employeeCategoryId])
REFERENCES [dbo].[employeeCategory] ([employeeCategoryID])
GO
ALTER TABLE [dbo].[employeeCategoryDetails] CHECK CONSTRAINT [FK_employeeCategoryDetails_employeeCategory]
GO
ALTER TABLE [dbo].[employeeCategoryDetails]  WITH CHECK ADD  CONSTRAINT [FK_employeeCategoryDetails_permission] FOREIGN KEY([permissionId])
REFERENCES [dbo].[permission] ([permissionId])
GO
ALTER TABLE [dbo].[employeeCategoryDetails] CHECK CONSTRAINT [FK_employeeCategoryDetails_permission]
GO
