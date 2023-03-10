USE [master]
GO
/****** Object:  Database [inventarization]    Script Date: 19.12.2022 16:31:16 ******/
CREATE DATABASE [inventarization]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'inventarization', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DEV\MSSQL\DATA\inventarization.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'inventarization_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DEV\MSSQL\DATA\inventarization_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [inventarization] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [inventarization].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [inventarization] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [inventarization] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [inventarization] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [inventarization] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [inventarization] SET ARITHABORT OFF 
GO
ALTER DATABASE [inventarization] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [inventarization] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [inventarization] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [inventarization] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [inventarization] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [inventarization] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [inventarization] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [inventarization] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [inventarization] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [inventarization] SET  DISABLE_BROKER 
GO
ALTER DATABASE [inventarization] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [inventarization] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [inventarization] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [inventarization] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [inventarization] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [inventarization] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [inventarization] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [inventarization] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [inventarization] SET  MULTI_USER 
GO
ALTER DATABASE [inventarization] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [inventarization] SET DB_CHAINING OFF 
GO
ALTER DATABASE [inventarization] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [inventarization] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [inventarization] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [inventarization] SET QUERY_STORE = OFF
GO
USE [inventarization]
GO
/****** Object:  Table [dbo].[device]    Script Date: 19.12.2022 16:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[device](
	[device_number] [int] NOT NULL,
	[device_name] [nvarchar](30) NOT NULL,
	[region_id] [int] NOT NULL,
	[storage_number] [int] NOT NULL,
	[status_id] [int] NOT NULL,
 CONSTRAINT [PK_device] PRIMARY KEY CLUSTERED 
(
	[device_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 19.12.2022 16:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[employee_id] [int] NOT NULL,
	[employee_lastName] [nvarchar](30) NOT NULL,
	[empoyee_firstName] [nvarchar](30) NOT NULL,
	[employee_patronymic] [nvarchar](30) NULL,
	[employee_birth] [date] NOT NULL,
	[employee_login] [nvarchar](30) NOT NULL,
	[employee_password] [nvarchar](30) NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[region]    Script Date: 19.12.2022 16:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[region](
	[region_id] [int] NOT NULL,
	[region_name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_region] PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[repair_work]    Script Date: 19.12.2022 16:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[repair_work](
	[work_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[device_number] [int] NOT NULL,
	[date_of_start] [date] NOT NULL,
	[date_of_end] [date] NOT NULL,
 CONSTRAINT [PK_repair_work] PRIMARY KEY CLUSTERED 
(
	[work_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 19.12.2022 16:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [int] NOT NULL,
	[role_name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 19.12.2022 16:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[status_id] [int] NOT NULL,
	[status_name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[storage]    Script Date: 19.12.2022 16:31:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storage](
	[storage_number] [int] NOT NULL,
	[storage_name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_storage] PRIMARY KEY CLUSTERED 
(
	[storage_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[device] ([device_number], [device_name], [region_id], [storage_number], [status_id]) VALUES (188299, N'Устройство 1', 1, 27781, 1)
INSERT [dbo].[device] ([device_number], [device_name], [region_id], [storage_number], [status_id]) VALUES (482278, N'Устройство 2', 2, 27781, 2)
INSERT [dbo].[device] ([device_number], [device_name], [region_id], [storage_number], [status_id]) VALUES (826478, N'Устройство 3', 3, 27782, 1)
INSERT [dbo].[device] ([device_number], [device_name], [region_id], [storage_number], [status_id]) VALUES (923575, N'Устройство 4', 2, 27783, 1)
INSERT [dbo].[device] ([device_number], [device_name], [region_id], [storage_number], [status_id]) VALUES (936647, N'Устройство 5', 3, 27782, 2)
GO
INSERT [dbo].[employee] ([employee_id], [employee_lastName], [empoyee_firstName], [employee_patronymic], [employee_birth], [employee_login], [employee_password], [role_id]) VALUES (1, N'Иванов', N'Фёдор', N'Сергеевич', CAST(N'1987-09-14' AS Date), N'fedor_ivanov', N'7vTb47', 1)
INSERT [dbo].[employee] ([employee_id], [employee_lastName], [empoyee_firstName], [employee_patronymic], [employee_birth], [employee_login], [employee_password], [role_id]) VALUES (2, N'Григорьев', N'Антон', N'Михайлович', CAST(N'1965-11-03' AS Date), N'anton_grigorev', N'jRc47d', 2)
INSERT [dbo].[employee] ([employee_id], [employee_lastName], [empoyee_firstName], [employee_patronymic], [employee_birth], [employee_login], [employee_password], [role_id]) VALUES (3, N'Павлова', N'Дарья', N'Дмитриевна', CAST(N'1991-06-25' AS Date), N'darya_pavlova', N'kidb&*', 1)
INSERT [dbo].[employee] ([employee_id], [employee_lastName], [empoyee_firstName], [employee_patronymic], [employee_birth], [employee_login], [employee_password], [role_id]) VALUES (4, N'Кузнецов', N'Константин', N'Викторович', CAST(N'1974-02-18' AS Date), N'kostya_kuznetcov', N'83gbcf', 2)
GO
INSERT [dbo].[region] ([region_id], [region_name]) VALUES (1, N'Район 1')
INSERT [dbo].[region] ([region_id], [region_name]) VALUES (2, N'Район 2')
INSERT [dbo].[region] ([region_id], [region_name]) VALUES (3, N'Район 3')
GO
INSERT [dbo].[repair_work] ([work_id], [employee_id], [device_number], [date_of_start], [date_of_end]) VALUES (1, 2, 188299, CAST(N'2022-08-19' AS Date), CAST(N'2022-08-26' AS Date))
INSERT [dbo].[repair_work] ([work_id], [employee_id], [device_number], [date_of_start], [date_of_end]) VALUES (2, 4, 482278, CAST(N'2022-09-11' AS Date), CAST(N'2022-09-13' AS Date))
INSERT [dbo].[repair_work] ([work_id], [employee_id], [device_number], [date_of_start], [date_of_end]) VALUES (3, 2, 826478, CAST(N'2022-10-01' AS Date), CAST(N'2022-10-07' AS Date))
INSERT [dbo].[repair_work] ([work_id], [employee_id], [device_number], [date_of_start], [date_of_end]) VALUES (4, 2, 923575, CAST(N'2022-10-09' AS Date), CAST(N'2022-10-16' AS Date))
INSERT [dbo].[repair_work] ([work_id], [employee_id], [device_number], [date_of_start], [date_of_end]) VALUES (5, 4, 936647, CAST(N'2022-11-05' AS Date), CAST(N'2022-11-09' AS Date))
INSERT [dbo].[repair_work] ([work_id], [employee_id], [device_number], [date_of_start], [date_of_end]) VALUES (6, 4, 188299, CAST(N'2022-11-06' AS Date), CAST(N'2022-11-16' AS Date))
INSERT [dbo].[repair_work] ([work_id], [employee_id], [device_number], [date_of_start], [date_of_end]) VALUES (7, 2, 826478, CAST(N'2022-12-01' AS Date), CAST(N'2022-12-04' AS Date))
INSERT [dbo].[repair_work] ([work_id], [employee_id], [device_number], [date_of_start], [date_of_end]) VALUES (8, 4, 923575, CAST(N'2022-12-04' AS Date), CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (1, N'Администратор')
INSERT [dbo].[role] ([role_id], [role_name]) VALUES (2, N'Рабочий')
GO
INSERT [dbo].[status] ([status_id], [status_name]) VALUES (1, N'Рабочее')
INSERT [dbo].[status] ([status_id], [status_name]) VALUES (2, N'Не рабочее')
GO
INSERT [dbo].[storage] ([storage_number], [storage_name]) VALUES (27781, N'Склад 1')
INSERT [dbo].[storage] ([storage_number], [storage_name]) VALUES (27782, N'Склад 2')
INSERT [dbo].[storage] ([storage_number], [storage_name]) VALUES (27783, N'Склад 3')
GO
ALTER TABLE [dbo].[device]  WITH CHECK ADD  CONSTRAINT [FK_device_region] FOREIGN KEY([region_id])
REFERENCES [dbo].[region] ([region_id])
GO
ALTER TABLE [dbo].[device] CHECK CONSTRAINT [FK_device_region]
GO
ALTER TABLE [dbo].[device]  WITH CHECK ADD  CONSTRAINT [FK_device_status] FOREIGN KEY([status_id])
REFERENCES [dbo].[status] ([status_id])
GO
ALTER TABLE [dbo].[device] CHECK CONSTRAINT [FK_device_status]
GO
ALTER TABLE [dbo].[device]  WITH CHECK ADD  CONSTRAINT [FK_device_storage] FOREIGN KEY([storage_number])
REFERENCES [dbo].[storage] ([storage_number])
GO
ALTER TABLE [dbo].[device] CHECK CONSTRAINT [FK_device_storage]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([role_id])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_role]
GO
ALTER TABLE [dbo].[repair_work]  WITH CHECK ADD  CONSTRAINT [FK_repair_work_device] FOREIGN KEY([device_number])
REFERENCES [dbo].[device] ([device_number])
GO
ALTER TABLE [dbo].[repair_work] CHECK CONSTRAINT [FK_repair_work_device]
GO
ALTER TABLE [dbo].[repair_work]  WITH CHECK ADD  CONSTRAINT [FK_repair_work_employee] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([employee_id])
GO
ALTER TABLE [dbo].[repair_work] CHECK CONSTRAINT [FK_repair_work_employee]
GO
USE [master]
GO
ALTER DATABASE [inventarization] SET  READ_WRITE 
GO
