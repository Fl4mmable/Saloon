USE [master]
GO
/****** Object:  Database [BeautySalon]    Script Date: 20-Dec-23 12:49:20 AM ******/
CREATE DATABASE [BeautySalon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BeautySalon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.ADMIN\MSSQL\DATA\BeautySalon.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BeautySalon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.ADMIN\MSSQL\DATA\BeautySalon_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BeautySalon] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BeautySalon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BeautySalon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BeautySalon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BeautySalon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BeautySalon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BeautySalon] SET ARITHABORT OFF 
GO
ALTER DATABASE [BeautySalon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BeautySalon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BeautySalon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BeautySalon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BeautySalon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BeautySalon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BeautySalon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BeautySalon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BeautySalon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BeautySalon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BeautySalon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BeautySalon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BeautySalon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BeautySalon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BeautySalon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BeautySalon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BeautySalon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BeautySalon] SET RECOVERY FULL 
GO
ALTER DATABASE [BeautySalon] SET  MULTI_USER 
GO
ALTER DATABASE [BeautySalon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BeautySalon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BeautySalon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BeautySalon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BeautySalon] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BeautySalon] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BeautySalon] SET QUERY_STORE = ON
GO
ALTER DATABASE [BeautySalon] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BeautySalon]
GO
/****** Object:  Table [dbo].[client]    Script Date: 20-Dec-23 12:49:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[surname] [nvarchar](50) NULL,
	[phone_number] [nvarchar](50) NULL,
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[day_of_week]    Script Date: 20-Dec-23 12:49:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[day_of_week](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_day_of_week] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 20-Dec-23 12:49:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[surname] [nvarchar](50) NULL,
	[post_id] [int] NULL,
	[phone_number] [nvarchar](50) NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Graphic]    Script Date: 20-Dec-23 12:49:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Graphic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[jobstart] [time](7) NULL,
	[jobend] [time](7) NULL,
 CONSTRAINT [PK_Graphic] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[history]    Script Date: 20-Dec-23 12:49:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_service] [date] NULL,
	[status_id] [int] NULL,
	[service_list_id] [int] NULL,
	[client_id] [int] NULL,
	[time] [time](7) NULL,
 CONSTRAINT [PK_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 20-Dec-23 12:49:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Records]    Script Date: 20-Dec-23 12:49:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Records](
	[ID] [int] NOT NULL,
	[id_client] [int] NULL,
	[id_employee] [int] NULL,
	[id_day_of_week] [int] NULL,
	[timestart] [nvarchar](50) NULL,
	[timeend] [nvarchar](50) NULL,
	[id_service] [int] NULL,
	[date] [nvarchar](50) NULL,
 CONSTRAINT [PK_Records] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service]    Script Date: 20-Dec-23 12:49:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[cost] [numeric](18, 2) NULL,
	[duration] [int] NULL,
 CONSTRAINT [PK_service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_list]    Script Date: 20-Dec-23 12:49:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_list](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[service_id] [int] NULL,
	[employee_id] [int] NULL,
 CONSTRAINT [PK_service_list] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 20-Dec-23 12:49:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeWork]    Script Date: 20-Dec-23 12:49:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeWork](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NULL,
	[day_of_week_id] [int] NULL,
	[ID_Graphic] [int] NULL,
 CONSTRAINT [PK_TimeWork] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[client] ON 

INSERT [dbo].[client] ([id], [name], [surname], [phone_number]) VALUES (1, N'Кирилл', N'Егоров', N'89638600155')
INSERT [dbo].[client] ([id], [name], [surname], [phone_number]) VALUES (2, N'Максим', N'Володин', N'89194720809')
SET IDENTITY_INSERT [dbo].[client] OFF
GO
SET IDENTITY_INSERT [dbo].[day_of_week] ON 

INSERT [dbo].[day_of_week] ([id], [name]) VALUES (1, N'Monday')
INSERT [dbo].[day_of_week] ([id], [name]) VALUES (2, N'Tuesday')
INSERT [dbo].[day_of_week] ([id], [name]) VALUES (3, N'Wednesday')
INSERT [dbo].[day_of_week] ([id], [name]) VALUES (4, N'Thursday')
INSERT [dbo].[day_of_week] ([id], [name]) VALUES (5, N'Friday')
INSERT [dbo].[day_of_week] ([id], [name]) VALUES (6, N'Sunday')
INSERT [dbo].[day_of_week] ([id], [name]) VALUES (7, N'Saturday')
SET IDENTITY_INSERT [dbo].[day_of_week] OFF
GO
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([id], [name], [surname], [post_id], [phone_number]) VALUES (1, N'Василий', N'Опрыскиватель', 1, N'89482758375')
INSERT [dbo].[employee] ([id], [name], [surname], [post_id], [phone_number]) VALUES (2, N'Надежна', N'Сорнякова', 2, N'84728472894')
INSERT [dbo].[employee] ([id], [name], [surname], [post_id], [phone_number]) VALUES (3, N'Хахарин', N'Кирилл', 3, N'79197651234')
SET IDENTITY_INSERT [dbo].[employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Graphic] ON 

INSERT [dbo].[Graphic] ([ID], [jobstart], [jobend]) VALUES (1, CAST(N'10:00:00' AS Time), CAST(N'20:00:00' AS Time))
INSERT [dbo].[Graphic] ([ID], [jobstart], [jobend]) VALUES (2, CAST(N'10:00:00' AS Time), CAST(N'18:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Graphic] OFF
GO
SET IDENTITY_INSERT [dbo].[history] ON 

INSERT [dbo].[history] ([id], [date_service], [status_id], [service_list_id], [client_id], [time]) VALUES (1, CAST(N'2023-10-12' AS Date), 1, 1, 1, NULL)
INSERT [dbo].[history] ([id], [date_service], [status_id], [service_list_id], [client_id], [time]) VALUES (2, CAST(N'2023-10-12' AS Date), 1, 2, 2, NULL)
SET IDENTITY_INSERT [dbo].[history] OFF
GO
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([id], [name]) VALUES (1, N'Мастер-маникюра')
INSERT [dbo].[post] ([id], [name]) VALUES (2, N'Парикмахер')
INSERT [dbo].[post] ([id], [name]) VALUES (3, N'Колорист')
INSERT [dbo].[post] ([id], [name]) VALUES (4, N'Администратор')
INSERT [dbo].[post] ([id], [name]) VALUES (5, N'Уборщик')
SET IDENTITY_INSERT [dbo].[post] OFF
GO
INSERT [dbo].[Records] ([ID], [id_client], [id_employee], [id_day_of_week], [timestart], [timeend], [id_service], [date]) VALUES (0, 2, 1, 3, N'11:00', N'12:00', 1, N'04.10.2023 12:00:00 ')
INSERT [dbo].[Records] ([ID], [id_client], [id_employee], [id_day_of_week], [timestart], [timeend], [id_service], [date]) VALUES (1, 2, 1, 5, N'15:00', N'16:00', 1, N'01-Dec-23 12:00:00 AM')
GO
SET IDENTITY_INSERT [dbo].[service] ON 

INSERT [dbo].[service] ([id], [name], [cost], [duration]) VALUES (1, N'Стрижка "Летний арбуз"', CAST(10000.00 AS Numeric(18, 2)), 60)
INSERT [dbo].[service] ([id], [name], [cost], [duration]) VALUES (2, N'Стрижка "Модель KILLA"', CAST(1000.00 AS Numeric(18, 2)), 30)
INSERT [dbo].[service] ([id], [name], [cost], [duration]) VALUES (3, N'Стрижка "Dungeon master"', CAST(500.00 AS Numeric(18, 2)), 10)
INSERT [dbo].[service] ([id], [name], [cost], [duration]) VALUES (4, N'Окрашивание "Привет мама"', CAST(5000.00 AS Numeric(18, 2)), 90)
INSERT [dbo].[service] ([id], [name], [cost], [duration]) VALUES (5, N'Окрашивание "Секвойя"', CAST(150000.00 AS Numeric(18, 2)), 90)
INSERT [dbo].[service] ([id], [name], [cost], [duration]) VALUES (6, N'Окрашивание "Огуречик"', CAST(7000.00 AS Numeric(18, 2)), 90)
INSERT [dbo].[service] ([id], [name], [cost], [duration]) VALUES (7, N'Маникюр "Помидор"', CAST(2500.00 AS Numeric(18, 2)), 90)
INSERT [dbo].[service] ([id], [name], [cost], [duration]) VALUES (8, N'Маникюр "ПКП"', CAST(3000.00 AS Numeric(18, 2)), 90)
INSERT [dbo].[service] ([id], [name], [cost], [duration]) VALUES (9, N'Маникюр "ЛЕХА"', CAST(100000.00 AS Numeric(18, 2)), 90)
SET IDENTITY_INSERT [dbo].[service] OFF
GO
SET IDENTITY_INSERT [dbo].[service_list] ON 

INSERT [dbo].[service_list] ([id], [service_id], [employee_id]) VALUES (1, 1, 2)
INSERT [dbo].[service_list] ([id], [service_id], [employee_id]) VALUES (2, 2, 2)
INSERT [dbo].[service_list] ([id], [service_id], [employee_id]) VALUES (3, 3, 2)
INSERT [dbo].[service_list] ([id], [service_id], [employee_id]) VALUES (4, 4, 3)
INSERT [dbo].[service_list] ([id], [service_id], [employee_id]) VALUES (5, 5, 3)
INSERT [dbo].[service_list] ([id], [service_id], [employee_id]) VALUES (6, 6, 3)
INSERT [dbo].[service_list] ([id], [service_id], [employee_id]) VALUES (7, 7, 1)
INSERT [dbo].[service_list] ([id], [service_id], [employee_id]) VALUES (8, 8, 1)
INSERT [dbo].[service_list] ([id], [service_id], [employee_id]) VALUES (9, 9, 1)
SET IDENTITY_INSERT [dbo].[service_list] OFF
GO
SET IDENTITY_INSERT [dbo].[status] ON 

INSERT [dbo].[status] ([id], [name]) VALUES (1, N'Забронировано')
INSERT [dbo].[status] ([id], [name]) VALUES (3, N'Закончено')
SET IDENTITY_INSERT [dbo].[status] OFF
GO
SET IDENTITY_INSERT [dbo].[TimeWork] ON 

INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (1, 1, 1, 1)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (2, 2, 3, 1)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (3, 3, 5, 1)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (4, 1, 2, 1)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (5, 1, 3, 1)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (6, 1, 4, 1)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (7, 1, 5, 1)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (8, 1, 6, 2)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (9, 1, 7, 2)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (10, 2, 1, 1)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (11, 2, 2, 1)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (12, 2, 4, 1)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (13, 2, 5, 1)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (14, 2, 6, 2)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (15, 2, 7, 2)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (16, 3, 1, 1)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (17, 3, 2, 1)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (18, 3, 3, 1)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (19, 3, 4, 1)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (20, 3, 6, 2)
INSERT [dbo].[TimeWork] ([id], [employee_id], [day_of_week_id], [ID_Graphic]) VALUES (21, 3, 7, 2)
SET IDENTITY_INSERT [dbo].[TimeWork] OFF
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_post] FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([id])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_post]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD  CONSTRAINT [FK_history_client] FOREIGN KEY([client_id])
REFERENCES [dbo].[client] ([id])
GO
ALTER TABLE [dbo].[history] CHECK CONSTRAINT [FK_history_client]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD  CONSTRAINT [FK_history_service_list] FOREIGN KEY([service_list_id])
REFERENCES [dbo].[service_list] ([id])
GO
ALTER TABLE [dbo].[history] CHECK CONSTRAINT [FK_history_service_list]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD  CONSTRAINT [FK_history_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[history] CHECK CONSTRAINT [FK_history_status]
GO
ALTER TABLE [dbo].[Records]  WITH CHECK ADD  CONSTRAINT [FK_Records_client] FOREIGN KEY([id_client])
REFERENCES [dbo].[client] ([id])
GO
ALTER TABLE [dbo].[Records] CHECK CONSTRAINT [FK_Records_client]
GO
ALTER TABLE [dbo].[Records]  WITH CHECK ADD  CONSTRAINT [FK_Records_day_of_week] FOREIGN KEY([id_day_of_week])
REFERENCES [dbo].[day_of_week] ([id])
GO
ALTER TABLE [dbo].[Records] CHECK CONSTRAINT [FK_Records_day_of_week]
GO
ALTER TABLE [dbo].[Records]  WITH CHECK ADD  CONSTRAINT [FK_Records_employee] FOREIGN KEY([id_employee])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[Records] CHECK CONSTRAINT [FK_Records_employee]
GO
ALTER TABLE [dbo].[Records]  WITH CHECK ADD  CONSTRAINT [FK_Records_service] FOREIGN KEY([id_service])
REFERENCES [dbo].[service] ([id])
GO
ALTER TABLE [dbo].[Records] CHECK CONSTRAINT [FK_Records_service]
GO
ALTER TABLE [dbo].[service_list]  WITH CHECK ADD  CONSTRAINT [FK_service_list_employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[service_list] CHECK CONSTRAINT [FK_service_list_employee]
GO
ALTER TABLE [dbo].[service_list]  WITH CHECK ADD  CONSTRAINT [FK_service_list_service] FOREIGN KEY([service_id])
REFERENCES [dbo].[service] ([id])
GO
ALTER TABLE [dbo].[service_list] CHECK CONSTRAINT [FK_service_list_service]
GO
ALTER TABLE [dbo].[TimeWork]  WITH CHECK ADD  CONSTRAINT [FK_TimeWork_day_of_week] FOREIGN KEY([day_of_week_id])
REFERENCES [dbo].[day_of_week] ([id])
GO
ALTER TABLE [dbo].[TimeWork] CHECK CONSTRAINT [FK_TimeWork_day_of_week]
GO
ALTER TABLE [dbo].[TimeWork]  WITH CHECK ADD  CONSTRAINT [FK_TimeWork_employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[TimeWork] CHECK CONSTRAINT [FK_TimeWork_employee]
GO
ALTER TABLE [dbo].[TimeWork]  WITH CHECK ADD  CONSTRAINT [FK_TimeWork_Graphic] FOREIGN KEY([ID_Graphic])
REFERENCES [dbo].[Graphic] ([ID])
GO
ALTER TABLE [dbo].[TimeWork] CHECK CONSTRAINT [FK_TimeWork_Graphic]
GO
USE [master]
GO
ALTER DATABASE [BeautySalon] SET  READ_WRITE 
GO
