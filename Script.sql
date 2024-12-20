USE [master]
GO
/****** Object:  Database [MasterFloorDB]    Script Date: 18.11.2024 16:24:06 ******/
CREATE DATABASE [MasterFloorDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MasterFloorDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MasterFloorDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MasterFloorDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MasterFloorDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MasterFloorDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MasterFloorDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MasterFloorDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MasterFloorDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MasterFloorDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MasterFloorDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MasterFloorDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MasterFloorDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MasterFloorDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MasterFloorDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MasterFloorDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MasterFloorDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MasterFloorDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MasterFloorDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MasterFloorDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MasterFloorDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MasterFloorDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MasterFloorDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MasterFloorDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MasterFloorDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MasterFloorDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MasterFloorDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MasterFloorDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MasterFloorDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MasterFloorDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MasterFloorDB] SET  MULTI_USER 
GO
ALTER DATABASE [MasterFloorDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MasterFloorDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MasterFloorDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MasterFloorDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MasterFloorDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MasterFloorDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MasterFloorDB] SET QUERY_STORE = OFF
GO
USE [MasterFloorDB]
GO
/****** Object:  Table [dbo].[Adres]    Script Date: 18.11.2024 16:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdresIndex] [nvarchar](25) NOT NULL,
	[RegionId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[StreetId] [int] NOT NULL,
	[HouseNum] [int] NOT NULL,
 CONSTRAINT [PK_Adres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 18.11.2024 16:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 18.11.2024 16:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DefectRate] [decimal](4, 4) NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner]    Script Date: 18.11.2024 16:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[NameId] [int] NOT NULL,
	[DirectorSurname] [nvarchar](50) NOT NULL,
	[DirectorName] [nvarchar](50) NOT NULL,
	[DirectorPatronym] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[AdresId] [int] NOT NULL,
	[ITN] [nvarchar](20) NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_Partner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerName]    Script Date: 18.11.2024 16:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerName](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PartnerName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerProduct]    Script Date: 18.11.2024 16:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ParnerId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
 CONSTRAINT [PK_PartnerProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerType]    Script Date: 18.11.2024 16:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PartnerType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18.11.2024 16:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Articul] [nvarchar](25) NOT NULL,
	[MinCost] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 18.11.2024 16:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProductMultiply] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 18.11.2024 16:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street]    Script Date: 18.11.2024 16:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Street] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adres] ON 

INSERT [dbo].[Adres] ([Id], [AdresIndex], [RegionId], [CityId], [StreetId], [HouseNum]) VALUES (1, N'652050', 3, 5, 1, 15)
INSERT [dbo].[Adres] ([Id], [AdresIndex], [RegionId], [CityId], [StreetId], [HouseNum]) VALUES (2, N'164500', 1, 3, 5, 18)
INSERT [dbo].[Adres] ([Id], [AdresIndex], [RegionId], [CityId], [StreetId], [HouseNum]) VALUES (3, N'188910', 4, 1, 2, 21)
INSERT [dbo].[Adres] ([Id], [AdresIndex], [RegionId], [CityId], [StreetId], [HouseNum]) VALUES (4, N'143960', 5, 2, 4, 51)
INSERT [dbo].[Adres] ([Id], [AdresIndex], [RegionId], [CityId], [StreetId], [HouseNum]) VALUES (5, N'309500', 2, 4, 3, 122)
SET IDENTITY_INSERT [dbo].[Adres] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Name]) VALUES (1, N'Приморск')
INSERT [dbo].[City] ([Id], [Name]) VALUES (2, N'Реутов')
INSERT [dbo].[City] ([Id], [Name]) VALUES (3, N'Северодвинск')
INSERT [dbo].[City] ([Id], [Name]) VALUES (4, N'Старый Оскол')
INSERT [dbo].[City] ([Id], [Name]) VALUES (5, N'Юрга')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([Id], [DefectRate]) VALUES (1, CAST(0.0010 AS Decimal(4, 4)))
INSERT [dbo].[MaterialType] ([Id], [DefectRate]) VALUES (2, CAST(0.0095 AS Decimal(4, 4)))
INSERT [dbo].[MaterialType] ([Id], [DefectRate]) VALUES (3, CAST(0.0028 AS Decimal(4, 4)))
INSERT [dbo].[MaterialType] ([Id], [DefectRate]) VALUES (4, CAST(0.0055 AS Decimal(4, 4)))
INSERT [dbo].[MaterialType] ([Id], [DefectRate]) VALUES (5, CAST(0.0034 AS Decimal(4, 4)))
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[Partner] ON 

INSERT [dbo].[Partner] ([Id], [TypeId], [NameId], [DirectorSurname], [DirectorName], [DirectorPatronym], [Email], [Phone], [AdresId], [ITN], [Rating]) VALUES (1, 1, 1, N'Иванова', N'Александра', N'Ивановна', N'aleksandraivanova@ml.ru', N'493 123 45 67', 1, N'2222455179', 7)
INSERT [dbo].[Partner] ([Id], [TypeId], [NameId], [DirectorSurname], [DirectorName], [DirectorPatronym], [Email], [Phone], [AdresId], [ITN], [Rating]) VALUES (2, 3, 3, N'Петров', N'Василий', N'Петрович', N'vppetrov@vl.ru', N'987 123 56 78', 2, N'3333888520', 7)
INSERT [dbo].[Partner] ([Id], [TypeId], [NameId], [DirectorSurname], [DirectorName], [DirectorPatronym], [Email], [Phone], [AdresId], [ITN], [Rating]) VALUES (3, 4, 5, N'Соловьев', N'Андрей', N'Николаевич', N'ansolovev@st.ru', N'812 223 32 00', 3, N'4440391035', 7)
INSERT [dbo].[Partner] ([Id], [TypeId], [NameId], [DirectorSurname], [DirectorName], [DirectorPatronym], [Email], [Phone], [AdresId], [ITN], [Rating]) VALUES (4, 2, 4, N'Воробьева', N'Екатерина', N'Валерьевна', N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', 4, N'1111520857', 5)
INSERT [dbo].[Partner] ([Id], [TypeId], [NameId], [DirectorSurname], [DirectorName], [DirectorPatronym], [Email], [Phone], [AdresId], [ITN], [Rating]) VALUES (5, 1, 2, N'Степанов', N'Степан', N'Сергеевич', N'stepanov@stepan.ru', N'912 888 33 33', 5, N'5552431140', 10)
SET IDENTITY_INSERT [dbo].[Partner] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerName] ON 

INSERT [dbo].[PartnerName] ([Id], [Name]) VALUES (1, N'База Строитель')
INSERT [dbo].[PartnerName] ([Id], [Name]) VALUES (2, N'МонтажПро')
INSERT [dbo].[PartnerName] ([Id], [Name]) VALUES (3, N'Паркет 29')
INSERT [dbo].[PartnerName] ([Id], [Name]) VALUES (4, N'Ремонт и отделка')
INSERT [dbo].[PartnerName] ([Id], [Name]) VALUES (5, N'Стройсервис')
SET IDENTITY_INSERT [dbo].[PartnerName] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerProduct] ON 

INSERT [dbo].[PartnerProduct] ([Id], [ProductId], [ParnerId], [Count], [SaleDate]) VALUES (1, 1, 1, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductId], [ParnerId], [Count], [SaleDate]) VALUES (2, 3, 1, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductId], [ParnerId], [Count], [SaleDate]) VALUES (3, 4, 1, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductId], [ParnerId], [Count], [SaleDate]) VALUES (4, 2, 2, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductId], [ParnerId], [Count], [SaleDate]) VALUES (5, 5, 2, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductId], [ParnerId], [Count], [SaleDate]) VALUES (6, 3, 2, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductId], [ParnerId], [Count], [SaleDate]) VALUES (7, 1, 2, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductId], [ParnerId], [Count], [SaleDate]) VALUES (8, 1, 3, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductId], [ParnerId], [Count], [SaleDate]) VALUES (9, 2, 3, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductId], [ParnerId], [Count], [SaleDate]) VALUES (10, 4, 4, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductId], [ParnerId], [Count], [SaleDate]) VALUES (11, 3, 4, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductId], [ParnerId], [Count], [SaleDate]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductId], [ParnerId], [Count], [SaleDate]) VALUES (13, 3, 5, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductId], [ParnerId], [Count], [SaleDate]) VALUES (14, 4, 5, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductId], [ParnerId], [Count], [SaleDate]) VALUES (15, 1, 5, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[PartnerProduct] ([Id], [ProductId], [ParnerId], [Count], [SaleDate]) VALUES (16, 2, 5, 25000, CAST(N'2024-06-12' AS Date))
SET IDENTITY_INSERT [dbo].[PartnerProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerType] ON 

INSERT [dbo].[PartnerType] ([Id], [Name]) VALUES (1, N'ЗАО')
INSERT [dbo].[PartnerType] ([Id], [Name]) VALUES (2, N'ОАО')
INSERT [dbo].[PartnerType] ([Id], [Name]) VALUES (3, N'ООО')
INSERT [dbo].[PartnerType] ([Id], [Name]) VALUES (4, N'ПАО')
SET IDENTITY_INSERT [dbo].[PartnerType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Articul], [MinCost]) VALUES (1, 3, N'Паркетная доска Ясень темный однополосная 14 мм', N'8758385', CAST(4456.90 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Articul], [MinCost]) VALUES (2, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', N'8858958', CAST(7330.99 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Articul], [MinCost]) VALUES (3, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', N'7750282', CAST(1799.33 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Articul], [MinCost]) VALUES (4, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', N'7028748', CAST(3890.41 AS Decimal(18, 2)))
INSERT [dbo].[Product] ([Id], [TypeId], [Name], [Articul], [MinCost]) VALUES (5, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', N'5012543', CAST(5450.59 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([Id], [Name], [ProductMultiply]) VALUES (1, N'Ламинат', CAST(2.35 AS Decimal(5, 2)))
INSERT [dbo].[ProductType] ([Id], [Name], [ProductMultiply]) VALUES (2, N'Массивная доска', CAST(5.15 AS Decimal(5, 2)))
INSERT [dbo].[ProductType] ([Id], [Name], [ProductMultiply]) VALUES (3, N'Паркетная доска', CAST(4.34 AS Decimal(5, 2)))
INSERT [dbo].[ProductType] ([Id], [Name], [ProductMultiply]) VALUES (4, N'Пробковое покрытие', CAST(1.50 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([Id], [Name]) VALUES (1, N'Архангельская область')
INSERT [dbo].[Region] ([Id], [Name]) VALUES (2, N'Белгородская область')
INSERT [dbo].[Region] ([Id], [Name]) VALUES (3, N'Кемеровская область')
INSERT [dbo].[Region] ([Id], [Name]) VALUES (4, N'Ленинградская область')
INSERT [dbo].[Region] ([Id], [Name]) VALUES (5, N'Московская область')
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Street] ON 

INSERT [dbo].[Street] ([Id], [Name]) VALUES (1, N'Лесная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (2, N'Парковая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (3, N'Рабочая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (4, N'Свободы')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (5, N'Строителей')
SET IDENTITY_INSERT [dbo].[Street] OFF
GO
ALTER TABLE [dbo].[Adres]  WITH CHECK ADD  CONSTRAINT [FK_Adres_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Adres] CHECK CONSTRAINT [FK_Adres_City]
GO
ALTER TABLE [dbo].[Adres]  WITH CHECK ADD  CONSTRAINT [FK_Adres_Region] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([Id])
GO
ALTER TABLE [dbo].[Adres] CHECK CONSTRAINT [FK_Adres_Region]
GO
ALTER TABLE [dbo].[Adres]  WITH CHECK ADD  CONSTRAINT [FK_Adres_Street] FOREIGN KEY([StreetId])
REFERENCES [dbo].[Street] ([Id])
GO
ALTER TABLE [dbo].[Adres] CHECK CONSTRAINT [FK_Adres_Street]
GO
ALTER TABLE [dbo].[Partner]  WITH CHECK ADD  CONSTRAINT [FK_Partner_Adres] FOREIGN KEY([AdresId])
REFERENCES [dbo].[Adres] ([Id])
GO
ALTER TABLE [dbo].[Partner] CHECK CONSTRAINT [FK_Partner_Adres]
GO
ALTER TABLE [dbo].[Partner]  WITH CHECK ADD  CONSTRAINT [FK_Partner_PartnerName] FOREIGN KEY([NameId])
REFERENCES [dbo].[PartnerName] ([Id])
GO
ALTER TABLE [dbo].[Partner] CHECK CONSTRAINT [FK_Partner_PartnerName]
GO
ALTER TABLE [dbo].[Partner]  WITH CHECK ADD  CONSTRAINT [FK_Partner_PartnerType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[PartnerType] ([Id])
GO
ALTER TABLE [dbo].[Partner] CHECK CONSTRAINT [FK_Partner_PartnerType]
GO
ALTER TABLE [dbo].[PartnerProduct]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProduct_Partner] FOREIGN KEY([ParnerId])
REFERENCES [dbo].[Partner] ([Id])
GO
ALTER TABLE [dbo].[PartnerProduct] CHECK CONSTRAINT [FK_PartnerProduct_Partner]
GO
ALTER TABLE [dbo].[PartnerProduct]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProduct_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[PartnerProduct] CHECK CONSTRAINT [FK_PartnerProduct_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
USE [master]
GO
ALTER DATABASE [MasterFloorDB] SET  READ_WRITE 
GO
