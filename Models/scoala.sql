USE [master]
GO
/****** Object:  Database [Scoala]    Script Date: 5/31/2021 3:49:43 PM ******/
CREATE DATABASE [Scoala]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Scoala', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Scoala.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Scoala_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Scoala_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Scoala] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Scoala].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Scoala] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Scoala] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Scoala] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Scoala] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Scoala] SET ARITHABORT OFF 
GO
ALTER DATABASE [Scoala] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Scoala] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Scoala] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Scoala] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Scoala] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Scoala] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Scoala] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Scoala] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Scoala] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Scoala] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Scoala] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Scoala] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Scoala] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Scoala] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Scoala] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Scoala] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Scoala] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Scoala] SET RECOVERY FULL 
GO
ALTER DATABASE [Scoala] SET  MULTI_USER 
GO
ALTER DATABASE [Scoala] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Scoala] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Scoala] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Scoala] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Scoala] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Scoala] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Scoala', N'ON'
GO
ALTER DATABASE [Scoala] SET QUERY_STORE = OFF
GO
USE [Scoala]
GO
/****** Object:  Table [dbo].[Absenta]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Absenta](
	[id_absenta] [int] IDENTITY(1,1) NOT NULL,
	[CNP_elev] [nchar](13) NULL,
	[CNP_prof] [nchar](13) NULL,
	[id_materie] [int] NULL,
	[data] [date] NOT NULL,
	[motivabila] [bit] NULL,
	[motivata] [bit] NULL,
	[semestru] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[id_absenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[CNP_admin] [nchar](13) NOT NULL,
	[Nume] [nvarchar](40) NULL,
	[Username] [nvarchar](40) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[CNP_admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clasa]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clasa](
	[id_clasa] [int] IDENTITY(1,1) NOT NULL,
	[id_specializare] [int] NULL,
	[clasa] [nvarchar](3) NULL,
	[CNP_prof] [nchar](13) NOT NULL,
 CONSTRAINT [PK_Clasa] PRIMARY KEY CLUSTERED 
(
	[id_clasa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Elev]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Elev](
	[CNP_elev] [nchar](13) NOT NULL,
	[Nume] [nvarchar](40) NULL,
	[Prenume] [nvarchar](40) NULL,
	[Username] [nvarchar](40) NULL,
	[id_clasa] [int] NULL,
 CONSTRAINT [PK_Elev] PRIMARY KEY CLUSTERED 
(
	[CNP_elev] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inregistrare]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inregistrare](
	[Username] [nvarchar](40) NOT NULL,
	[Parola] [nvarchar](40) NULL,
	[Rol] [nvarchar](5) NULL,
	[activ] [bit] NULL,
 CONSTRAINT [PK_Inregistrare] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materiale_didactice]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materiale_didactice](
	[id_material] [int] IDENTITY(1,1) NOT NULL,
	[cale] [nvarchar](40) NULL,
 CONSTRAINT [PK_Materiale_didactice] PRIMARY KEY CLUSTERED 
(
	[id_material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materie]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materie](
	[id_materie] [int] IDENTITY(1,1) NOT NULL,
	[denumire] [nvarchar](50) NULL,
 CONSTRAINT [PK_Materie] PRIMARY KEY CLUSTERED 
(
	[id_materie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medie]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medie](
	[id_medie] [int] IDENTITY(1,1) NOT NULL,
	[CNP_elev] [nchar](13) NULL,
	[CNP_prof] [nchar](13) NULL,
	[id_materie] [int] NULL,
	[semestru] [int] NULL,
	[nota] [int] NULL,
 CONSTRAINT [PK_Medie] PRIMARY KEY CLUSTERED 
(
	[id_medie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nota]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nota](
	[id_nota] [int] IDENTITY(1,1) NOT NULL,
	[CNP_elev] [nchar](13) NULL,
	[CNP_prof] [nchar](13) NULL,
	[id_materie] [int] NOT NULL,
	[nota] [int] NOT NULL,
	[teza] [bit] NULL,
	[data] [date] NOT NULL,
	[semestru] [int] NOT NULL,
 CONSTRAINT [PK_Nota] PRIMARY KEY CLUSTERED 
(
	[id_nota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prof_materie]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prof_materie](
	[id_materie] [int] NOT NULL,
	[CNP_prof] [nchar](13) NOT NULL,
 CONSTRAINT [PK_Prof_materie] PRIMARY KEY CLUSTERED 
(
	[id_materie] ASC,
	[CNP_prof] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prof_materie_clasa]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prof_materie_clasa](
	[id_materie] [int] NOT NULL,
	[CNP_prof] [nchar](13) NOT NULL,
	[id_clasa] [int] NOT NULL,
	[id_material] [int] NULL,
 CONSTRAINT [PK_prof_materie_clasa_1] PRIMARY KEY CLUSTERED 
(
	[id_materie] ASC,
	[CNP_prof] ASC,
	[id_clasa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[CNP_prof] [nchar](13) NOT NULL,
	[Nume] [nvarchar](40) NULL,
	[Prenume] [nvarchar](40) NULL,
	[Username] [nvarchar](40) NULL,
 CONSTRAINT [PK_Profesor] PRIMARY KEY CLUSTERED 
(
	[CNP_prof] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specializare]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specializare](
	[id_specializare] [int] IDENTITY(1,1) NOT NULL,
	[denumire] [nvarchar](40) NULL,
 CONSTRAINT [PK_Specializare] PRIMARY KEY CLUSTERED 
(
	[id_specializare] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teze]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teze](
	[id_materie] [int] NOT NULL,
	[id_specializare] [int] NOT NULL,
 CONSTRAINT [PK_Teze] PRIMARY KEY CLUSTERED 
(
	[id_materie] ASC,
	[id_specializare] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Absenta] ON 

INSERT [dbo].[Absenta] ([id_absenta], [CNP_elev], [CNP_prof], [id_materie], [data], [motivabila], [motivata], [semestru]) VALUES (8, N'5001012693265', N'2651202251474', 2, CAST(N'2021-05-02' AS Date), 1, 0, 1)
INSERT [dbo].[Absenta] ([id_absenta], [CNP_elev], [CNP_prof], [id_materie], [data], [motivabila], [motivata], [semestru]) VALUES (9, N'5010202451278', N'2651202251474', 7, CAST(N'2021-05-08' AS Date), 1, 1, 1)
INSERT [dbo].[Absenta] ([id_absenta], [CNP_elev], [CNP_prof], [id_materie], [data], [motivabila], [motivata], [semestru]) VALUES (10, N'5010202451278', N'2651202251474', 2, CAST(N'2021-05-08' AS Date), 1, 1, 1)
INSERT [dbo].[Absenta] ([id_absenta], [CNP_elev], [CNP_prof], [id_materie], [data], [motivabila], [motivata], [semestru]) VALUES (11, N'5010202451278', N'1600101363526', 1, CAST(N'2021-05-05' AS Date), 0, 0, 1)
INSERT [dbo].[Absenta] ([id_absenta], [CNP_elev], [CNP_prof], [id_materie], [data], [motivabila], [motivata], [semestru]) VALUES (12, N'5010808253419', N'2651202251474', 2, CAST(N'2021-05-12' AS Date), 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Absenta] OFF
GO
INSERT [dbo].[Admin] ([CNP_admin], [Nume], [Username]) VALUES (N'6000909235689', N'Elena', N'elena.admin')
GO
SET IDENTITY_INSERT [dbo].[Clasa] ON 

INSERT [dbo].[Clasa] ([id_clasa], [id_specializare], [clasa], [CNP_prof]) VALUES (1, 2, N'10B', N'2651202251474')
INSERT [dbo].[Clasa] ([id_clasa], [id_specializare], [clasa], [CNP_prof]) VALUES (2, 1, N'9A', N'2810505323635')
INSERT [dbo].[Clasa] ([id_clasa], [id_specializare], [clasa], [CNP_prof]) VALUES (7, 2, N'12', N'1760507212539')
SET IDENTITY_INSERT [dbo].[Clasa] OFF
GO
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'5000307528270', N'Burlacu', N'Darius', N'darius.burlacu', 1)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'5000507215487', N'Anton', N'Mihai', N'mihai.anton', 1)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'5000912369874', N'Posoiu', N'Dan', N'dan.posoiu', 1)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'5001012693265', N'Andrei', N'Andrei', N'andrei.andrei', 1)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'5001025529685', N'Ivan', N'Sergiu', N'sergiu.ivan', 1)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'5001212121212', N'Anutei', N'Adrian', N'adrian.anutei                           ', 1)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'5010202451278', N'Branza', N'Florin', N'florin.branza', 2)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'5010303665522', N'Ionescu', N'Vlad', N'vlad.ionescu', 2)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'5010808253419', N'Botan', N'Marcel', N'marcel.botan', 2)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'5011201161728', N'Manea', N'Ionut', N'ionut.manea', 2)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'6000409256341', N'Cosma', N'Ioana', N'ioana.cosma                             ', 1)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'6000505326598', N'Amariei', N'Corina', N'corina.amariei', 1)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'6000909252123', N'Ghinea', N'Elena', N'elena.ghinea                            ', 2)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'6001113251447', N'Cenusa', N'Mirabelea', N'mirabela.cenusa', 2)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'6001212090021', N'Popescu', N'Ana', N'ana.popescu', NULL)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'6001212096345', N'Popescu', N'Maria', N'maria.popescu', 1)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'6002105242518', N'Ionescu', N'Dana', N'dana.ionescu', 1)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'6010308142536', N'Iliescu', N'Sara', N'sara.iliescu', 2)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'6010414141516', N'Coman', N'Stefania', N'stefania.coman', 2)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'6010605120435', N'Rusiu', N'Alina', N'alina.rusiu', 2)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'6010909362514', N'Badea', N'Elania', N'elania.Badea', 2)
INSERT [dbo].[Elev] ([CNP_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (N'6011026363515', N'Anutei', N'Mirela', N'mirela.anutei', 2)
GO
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'', NULL, NULL, NULL)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'adrian.anutei', N'adrian', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'alex.mandru', N'alex', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'alina.rusiu', N'alina', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'ana.popescu', N'ana', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'andrei.andrei', N'andrei', N'elev', 0)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'andy.baciu', N'andi', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'cata.ursu', N'cata', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'corina.amariei', N'corina', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'dan.posoiu', N'dan', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'dana.ionescu', N'dana', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'darius.burlacu', N'darius', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'elania.badea', N'elania', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'elena.admin', N'elena', N'admin', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'elena.ghinea', N'elena', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'florin.branza', N'florin', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'ioana.cosma', N'ioana', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'ionut.ghighimoc', N'ionut', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'ionut.manea', N'ionut', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'jbi', N'bp', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'luci.tudor', N'luci', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'marcel.botan', N'marcel', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'mari.bulbuc', N'mari', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'maria.popescu', N'maria', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'marian.pana', N'marian', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'mihai.anton', N'mihai', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'mirabela.cenusa', N'mirabela', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'mirela.anutei', N'mirela', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'oana.escu', N'oana', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'sara.iliescu', N'sara', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'sergiu.ivan', N'sergiu', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'sonia.matache', N'sonia', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'stefania.coman', N'stefania', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'titu.mastan', N'titu', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'tudor.vlad', N'tudor', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'vlad.ionescu', N'vlad', N'elev', 1)
GO
SET IDENTITY_INSERT [dbo].[Materie] ON 

INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (1, N'mate')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (2, N'romana')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (3, N'info')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (4, N'engleza')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (5, N'chimie')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (6, N'logica')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (7, N'latina')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (8, N'fizica')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (9, N'istorie')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (10, N'grografie')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (19, N'sport')
SET IDENTITY_INSERT [dbo].[Materie] OFF
GO
SET IDENTITY_INSERT [dbo].[Medie] ON 

INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (1, N'5000912369874', N'2651202251474', 2, 1, 9)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (2, N'6001113251447', N'2651202251474', 7, 1, 9)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (3, N'5000912369874', N'2810505323635', 4, 1, 9)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (4, N'5000912369874', N'2800212362136', 1, 1, 10)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (5, N'5000912369874', N'2800212362136', 5, 1, 9)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (6, N'5000912369874', N'2722903653298', 3, 1, 9)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (7, N'5000912369874', N'2740101362578', 9, 1, 10)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (8, N'5000912369874', N'1600101363526', 8, 1, 9)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (9, N'6000409256341', N'2651202251474', 2, 1, 4)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (10, N'5000507215487', N'2651202251474', 2, 1, 4)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (11, N'5000912369874', N'2651202251474', 2, 2, 10)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (12, N'5000912369874', N'2810505323635', 4, 2, 10)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (13, N'5000912369874', N'1600101363526', 8, 2, 9)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (14, N'5000912369874', N'2722903653298', 3, 2, 10)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (15, N'5000912369874', N'2800212362136', 5, 2, 10)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (16, N'5000912369874', N'2800212362136', 1, 2, 10)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (17, N'5000912369874', N'2740101362578', 9, 2, 10)
INSERT [dbo].[Medie] ([id_medie], [CNP_elev], [CNP_prof], [id_materie], [semestru], [nota]) VALUES (18, N'5010202451278', N'2651202251474', 2, 1, 7)
SET IDENTITY_INSERT [dbo].[Medie] OFF
GO
SET IDENTITY_INSERT [dbo].[Nota] ON 

INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (1, N'5010202451278', N'1600101363526', 1, 10, 0, CAST(N'2016-10-10' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (2, N'5010202451278', N'1600101363526', 1, 8, 0, CAST(N'2016-12-15' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (3, N'5010202451278', N'2651202251474', 2, 10, 0, CAST(N'2016-02-11' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (4, N'5010202451278', N'1600101363526', 1, 9, 0, CAST(N'2017-02-20' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (5, N'5010202451278', N'2651202251474', 2, 9, 0, CAST(N'2017-03-02' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (6, N'5010202451278', N'2651202251474', 7, 7, 0, CAST(N'2017-03-01' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (17, N'5001012693265', N'2651202251474', 2, 9, 0, CAST(N'2016-02-11' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (18, N'5001012693265', N'2651202251474', 2, 8, 0, CAST(N'2021-05-11' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (19, N'6001113251447', N'2651202251474', 7, 10, 0, CAST(N'2021-05-18' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (20, N'6010308142536', N'2651202251474', 2, 9, 0, CAST(N'2021-05-18' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (21, N'5000507215487', N'2800212362136', 1, 7, 0, CAST(N'2021-05-18' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (22, N'5000507215487', N'2800212362136', 1, 8, 0, CAST(N'2021-05-18' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (23, N'5000507215487', N'2800212362136', 1, 10, 0, CAST(N'2021-05-27' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (24, N'5000507215487', N'2800212362136', 1, 9, 1, CAST(N'2021-05-23' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (25, N'6002105242518', N'2800212362136', 1, 9, 1, CAST(N'2021-05-23' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (26, N'5010808253419', N'2651202251474', 7, 8, 0, CAST(N'2021-05-01' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (27, N'5000912369874', N'2651202251474', 2, 10, 1, CAST(N'2021-05-12' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (28, N'5000912369874', N'2651202251474', 2, 8, 0, CAST(N'2021-05-06' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (29, N'5000912369874', N'2651202251474', 2, 10, 0, CAST(N'2021-04-04' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (30, N'5000912369874', N'2651202251474', 2, 9, 0, CAST(N'2021-02-10' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (31, N'5000912369874', N'2651202251474', 2, 10, 0, CAST(N'2021-03-13' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (32, N'6001113251447', N'2651202251474', 7, 9, 0, CAST(N'2021-05-03' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (33, N'6001113251447', N'2651202251474', 7, 10, 0, CAST(N'2021-04-11' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (34, N'5000912369874', N'2810505323635', 4, 10, 0, CAST(N'2021-04-20' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (35, N'5000912369874', N'2810505323635', 4, 9, 0, CAST(N'2021-04-10' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (36, N'5000912369874', N'2810505323635', 4, 9, 0, CAST(N'2021-03-23' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (37, N'5000912369874', N'2800212362136', 1, 10, 0, CAST(N'2021-05-11' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (38, N'5000912369874', N'2800212362136', 1, 10, 0, CAST(N'2021-04-04' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (39, N'5000912369874', N'2800212362136', 1, 10, 0, CAST(N'2021-04-17' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (40, N'5000912369874', N'2800212362136', 1, 10, 1, CAST(N'2021-05-18' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (41, N'5000912369874', N'2800212362136', 5, 10, 0, CAST(N'2021-05-18' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (42, N'5000912369874', N'2800212362136', 5, 9, 0, CAST(N'2021-05-09' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (43, N'5000912369874', N'2800212362136', 5, 10, 0, CAST(N'2021-04-03' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (44, N'5000912369874', N'2722903653298', 3, 10, 0, CAST(N'2021-05-08' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (45, N'5000912369874', N'2722903653298', 3, 10, 1, CAST(N'2021-05-16' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (46, N'5000912369874', N'2722903653298', 3, 9, 0, CAST(N'2021-05-16' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (47, N'5000912369874', N'2722903653298', 3, 10, 0, CAST(N'2021-04-04' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (48, N'5000912369874', N'2722903653298', 3, 10, 0, CAST(N'2021-03-01' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (49, N'5000912369874', N'2740101362578', 9, 10, 0, CAST(N'2021-05-01' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (50, N'5000912369874', N'2740101362578', 9, 10, 0, CAST(N'2021-04-04' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (51, N'5000912369874', N'2740101362578', 9, 10, 0, CAST(N'2021-03-21' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (52, N'5000912369874', N'1600101363526', 8, 9, 0, CAST(N'2021-05-02' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (53, N'5000912369874', N'1600101363526', 8, 9, 0, CAST(N'2021-03-07' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (54, N'5000912369874', N'1600101363526', 8, 9, 0, CAST(N'2021-05-15' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (55, N'6000409256341', N'2651202251474', 2, 4, 1, CAST(N'2021-05-06' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (56, N'6000409256341', N'2651202251474', 2, 5, 0, CAST(N'2021-05-06' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (57, N'6000409256341', N'2651202251474', 2, 5, 0, CAST(N'2021-05-09' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (58, N'6000409256341', N'2651202251474', 2, 4, 0, CAST(N'2021-06-26' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (59, N'5000507215487', N'2651202251474', 2, 4, 1, CAST(N'2021-05-16' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (60, N'5000507215487', N'2651202251474', 2, 4, 0, CAST(N'2021-05-22' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (61, N'5000507215487', N'2651202251474', 2, 5, 0, CAST(N'2021-05-23' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (62, N'5000507215487', N'2651202251474', 2, 5, 0, CAST(N'2021-06-12' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (63, N'5000912369874', N'2651202251474', 2, 10, 1, CAST(N'2021-05-11' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (64, N'5000912369874', N'2651202251474', 2, 10, 0, CAST(N'2021-05-11' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (65, N'5000912369874', N'2651202251474', 2, 10, 0, CAST(N'2021-05-16' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (66, N'5000912369874', N'2651202251474', 2, 10, 0, CAST(N'2021-05-01' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (67, N'5000912369874', N'2810505323635', 4, 10, 0, CAST(N'2021-05-18' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (68, N'5000912369874', N'2810505323635', 4, 10, 0, CAST(N'2021-05-08' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (69, N'5000912369874', N'2810505323635', 4, 10, 0, CAST(N'2021-05-16' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (70, N'5000912369874', N'1600101363526', 8, 9, 0, CAST(N'2021-05-08' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (71, N'5000912369874', N'1600101363526', 8, 9, 0, CAST(N'2021-05-16' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (72, N'5000912369874', N'1600101363526', 8, 9, 0, CAST(N'2021-05-04' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (73, N'5000912369874', N'2722903653298', 3, 10, 1, CAST(N'2021-05-09' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (74, N'5000912369874', N'2722903653298', 3, 10, 0, CAST(N'2021-05-01' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (75, N'5000912369874', N'2722903653298', 3, 10, 0, CAST(N'2021-05-29' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (76, N'5000912369874', N'2722903653298', 3, 10, 0, CAST(N'2021-04-18' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (77, N'5000912369874', N'2800212362136', 5, 10, 0, CAST(N'2021-05-06' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (78, N'5000912369874', N'2800212362136', 5, 10, 0, CAST(N'2021-05-16' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (79, N'5000912369874', N'2800212362136', 5, 10, 0, CAST(N'2021-05-01' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (80, N'5000912369874', N'2800212362136', 1, 10, 0, CAST(N'2021-05-01' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (81, N'5000912369874', N'2800212362136', 1, 10, 1, CAST(N'2021-05-30' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (82, N'5000912369874', N'2800212362136', 1, 10, 0, CAST(N'2021-05-12' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (83, N'5000912369874', N'2800212362136', 1, 10, 0, CAST(N'2021-04-18' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (84, N'5000912369874', N'2740101362578', 9, 10, 0, CAST(N'2021-05-11' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (85, N'5000912369874', N'2740101362578', 9, 10, 0, CAST(N'2021-05-05' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (86, N'5000912369874', N'2740101362578', 9, 10, 0, CAST(N'2021-05-30' AS Date), 2)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (88, N'5010202451278', N'2651202251474', 2, 7, 1, CAST(N'2021-05-11' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (89, N'5010202451278', N'2651202251474', 2, 8, 0, CAST(N'2021-05-11' AS Date), 1)
INSERT [dbo].[Nota] ([id_nota], [CNP_elev], [CNP_prof], [id_materie], [nota], [teza], [data], [semestru]) VALUES (90, N'5010202451278', N'2651202251474', 2, 8, 0, CAST(N'2021-05-11' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Nota] OFF
GO
INSERT [dbo].[Prof_materie] ([id_materie], [CNP_prof]) VALUES (1, N'1600101363526')
INSERT [dbo].[Prof_materie] ([id_materie], [CNP_prof]) VALUES (1, N'2800212362136')
INSERT [dbo].[Prof_materie] ([id_materie], [CNP_prof]) VALUES (2, N'2651202251474')
INSERT [dbo].[Prof_materie] ([id_materie], [CNP_prof]) VALUES (3, N'2722903653298')
INSERT [dbo].[Prof_materie] ([id_materie], [CNP_prof]) VALUES (4, N'2810505323635')
INSERT [dbo].[Prof_materie] ([id_materie], [CNP_prof]) VALUES (5, N'2800212362136')
INSERT [dbo].[Prof_materie] ([id_materie], [CNP_prof]) VALUES (6, N'2763105363636')
INSERT [dbo].[Prof_materie] ([id_materie], [CNP_prof]) VALUES (7, N'2651202251474')
INSERT [dbo].[Prof_materie] ([id_materie], [CNP_prof]) VALUES (8, N'1600101363526')
INSERT [dbo].[Prof_materie] ([id_materie], [CNP_prof]) VALUES (9, N'2740101362578')
INSERT [dbo].[Prof_materie] ([id_materie], [CNP_prof]) VALUES (9, N'2810505323635')
INSERT [dbo].[Prof_materie] ([id_materie], [CNP_prof]) VALUES (10, N'2740101362578')
INSERT [dbo].[Prof_materie] ([id_materie], [CNP_prof]) VALUES (10, N'2810505323635')
GO
INSERT [dbo].[prof_materie_clasa] ([id_materie], [CNP_prof], [id_clasa], [id_material]) VALUES (1, N'1600101363526', 2, NULL)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [CNP_prof], [id_clasa], [id_material]) VALUES (1, N'2800212362136', 1, NULL)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [CNP_prof], [id_clasa], [id_material]) VALUES (2, N'2651202251474', 1, NULL)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [CNP_prof], [id_clasa], [id_material]) VALUES (2, N'2651202251474', 2, NULL)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [CNP_prof], [id_clasa], [id_material]) VALUES (3, N'2722903653298', 1, NULL)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [CNP_prof], [id_clasa], [id_material]) VALUES (4, N'2810505323635', 1, NULL)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [CNP_prof], [id_clasa], [id_material]) VALUES (4, N'2810505323635', 2, NULL)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [CNP_prof], [id_clasa], [id_material]) VALUES (5, N'2800212362136', 1, NULL)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [CNP_prof], [id_clasa], [id_material]) VALUES (6, N'2763105363636', 2, NULL)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [CNP_prof], [id_clasa], [id_material]) VALUES (7, N'2651202251474', 2, NULL)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [CNP_prof], [id_clasa], [id_material]) VALUES (8, N'1600101363526', 1, NULL)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [CNP_prof], [id_clasa], [id_material]) VALUES (9, N'2740101362578', 1, NULL)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [CNP_prof], [id_clasa], [id_material]) VALUES (9, N'2810505323635', 2, NULL)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [CNP_prof], [id_clasa], [id_material]) VALUES (10, N'2740101362578', 2, NULL)
GO
INSERT [dbo].[Profesor] ([CNP_prof], [Nume], [Prenume], [Username]) VALUES (N'1600101363526', N'Mastan', N'Titu      ', N'titu.mastan')
INSERT [dbo].[Profesor] ([CNP_prof], [Nume], [Prenume], [Username]) VALUES (N'1760507212539', N'Pana', N'Marian', N'marian.pana')
INSERT [dbo].[Profesor] ([CNP_prof], [Nume], [Prenume], [Username]) VALUES (N'2651202251474', N'Tudor', N'Luci', N'luci.tudor')
INSERT [dbo].[Profesor] ([CNP_prof], [Nume], [Prenume], [Username]) VALUES (N'2700509684896', N'Matache', N'Sonia', N'sonia.matache')
INSERT [dbo].[Profesor] ([CNP_prof], [Nume], [Prenume], [Username]) VALUES (N'2722903653298', N'Escu', N'Oana', N'oana.escu')
INSERT [dbo].[Profesor] ([CNP_prof], [Nume], [Prenume], [Username]) VALUES (N'2740101362578', N'Mandru', N'Alex', N'alex.mandru')
INSERT [dbo].[Profesor] ([CNP_prof], [Nume], [Prenume], [Username]) VALUES (N'2763105363636', N'Bulbuc', N'Mariana', N'mari.bulbuc')
INSERT [dbo].[Profesor] ([CNP_prof], [Nume], [Prenume], [Username]) VALUES (N'2800212362136', N'Vlad', N'Tudor', N'tudor.vlad')
INSERT [dbo].[Profesor] ([CNP_prof], [Nume], [Prenume], [Username]) VALUES (N'2810505323635', N'Ursu', N'Cata', N'cata.ursu')
GO
SET IDENTITY_INSERT [dbo].[Specializare] ON 

INSERT [dbo].[Specializare] ([id_specializare], [denumire]) VALUES (1, N'filologie                ')
INSERT [dbo].[Specializare] ([id_specializare], [denumire]) VALUES (2, N'mate-info                ')
INSERT [dbo].[Specializare] ([id_specializare], [denumire]) VALUES (3, N'stiintele-naturii        ')
INSERT [dbo].[Specializare] ([id_specializare], [denumire]) VALUES (4, N'stiinte-sociale          ')
SET IDENTITY_INSERT [dbo].[Specializare] OFF
GO
INSERT [dbo].[Teze] ([id_materie], [id_specializare]) VALUES (1, 2)
INSERT [dbo].[Teze] ([id_materie], [id_specializare]) VALUES (1, 3)
INSERT [dbo].[Teze] ([id_materie], [id_specializare]) VALUES (2, 1)
INSERT [dbo].[Teze] ([id_materie], [id_specializare]) VALUES (2, 2)
INSERT [dbo].[Teze] ([id_materie], [id_specializare]) VALUES (2, 3)
INSERT [dbo].[Teze] ([id_materie], [id_specializare]) VALUES (2, 4)
INSERT [dbo].[Teze] ([id_materie], [id_specializare]) VALUES (3, 2)
INSERT [dbo].[Teze] ([id_materie], [id_specializare]) VALUES (4, 1)
INSERT [dbo].[Teze] ([id_materie], [id_specializare]) VALUES (5, 3)
INSERT [dbo].[Teze] ([id_materie], [id_specializare]) VALUES (7, 4)
INSERT [dbo].[Teze] ([id_materie], [id_specializare]) VALUES (9, 1)
INSERT [dbo].[Teze] ([id_materie], [id_specializare]) VALUES (10, 4)
GO
ALTER TABLE [dbo].[Absenta]  WITH CHECK ADD  CONSTRAINT [FK_Absenta_Elev] FOREIGN KEY([CNP_elev])
REFERENCES [dbo].[Elev] ([CNP_elev])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Absenta] CHECK CONSTRAINT [FK_Absenta_Elev]
GO
ALTER TABLE [dbo].[Absenta]  WITH CHECK ADD  CONSTRAINT [FK_Absenta_Prof_materie] FOREIGN KEY([id_materie], [CNP_prof])
REFERENCES [dbo].[Prof_materie] ([id_materie], [CNP_prof])
GO
ALTER TABLE [dbo].[Absenta] CHECK CONSTRAINT [FK_Absenta_Prof_materie]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Inregistrare1] FOREIGN KEY([Username])
REFERENCES [dbo].[Inregistrare] ([Username])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Inregistrare1]
GO
ALTER TABLE [dbo].[Clasa]  WITH CHECK ADD  CONSTRAINT [FK_Clasa_Profesor] FOREIGN KEY([CNP_prof])
REFERENCES [dbo].[Profesor] ([CNP_prof])
GO
ALTER TABLE [dbo].[Clasa] CHECK CONSTRAINT [FK_Clasa_Profesor]
GO
ALTER TABLE [dbo].[Clasa]  WITH CHECK ADD  CONSTRAINT [FK_Clasa_Specializare] FOREIGN KEY([id_specializare])
REFERENCES [dbo].[Specializare] ([id_specializare])
GO
ALTER TABLE [dbo].[Clasa] CHECK CONSTRAINT [FK_Clasa_Specializare]
GO
ALTER TABLE [dbo].[Elev]  WITH CHECK ADD  CONSTRAINT [FK_Elev_Clasa] FOREIGN KEY([id_clasa])
REFERENCES [dbo].[Clasa] ([id_clasa])
GO
ALTER TABLE [dbo].[Elev] CHECK CONSTRAINT [FK_Elev_Clasa]
GO
ALTER TABLE [dbo].[Elev]  WITH CHECK ADD  CONSTRAINT [FK_Elev_Inregistrare] FOREIGN KEY([Username])
REFERENCES [dbo].[Inregistrare] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Elev] CHECK CONSTRAINT [FK_Elev_Inregistrare]
GO
ALTER TABLE [dbo].[Medie]  WITH CHECK ADD  CONSTRAINT [FK_Medie_Elev] FOREIGN KEY([CNP_elev])
REFERENCES [dbo].[Elev] ([CNP_elev])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Medie] CHECK CONSTRAINT [FK_Medie_Elev]
GO
ALTER TABLE [dbo].[Medie]  WITH CHECK ADD  CONSTRAINT [FK_Medie_Prof_materie] FOREIGN KEY([id_materie], [CNP_prof])
REFERENCES [dbo].[Prof_materie] ([id_materie], [CNP_prof])
GO
ALTER TABLE [dbo].[Medie] CHECK CONSTRAINT [FK_Medie_Prof_materie]
GO
ALTER TABLE [dbo].[Nota]  WITH CHECK ADD  CONSTRAINT [FK_Nota_Elev] FOREIGN KEY([CNP_elev])
REFERENCES [dbo].[Elev] ([CNP_elev])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nota] CHECK CONSTRAINT [FK_Nota_Elev]
GO
ALTER TABLE [dbo].[Nota]  WITH CHECK ADD  CONSTRAINT [FK_Nota_Prof_materie] FOREIGN KEY([id_materie], [CNP_prof])
REFERENCES [dbo].[Prof_materie] ([id_materie], [CNP_prof])
GO
ALTER TABLE [dbo].[Nota] CHECK CONSTRAINT [FK_Nota_Prof_materie]
GO
ALTER TABLE [dbo].[Prof_materie]  WITH CHECK ADD  CONSTRAINT [FK_Prof_materie_Materie] FOREIGN KEY([id_materie])
REFERENCES [dbo].[Materie] ([id_materie])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Prof_materie] CHECK CONSTRAINT [FK_Prof_materie_Materie]
GO
ALTER TABLE [dbo].[Prof_materie]  WITH CHECK ADD  CONSTRAINT [FK_Prof_materie_Profesor] FOREIGN KEY([CNP_prof])
REFERENCES [dbo].[Profesor] ([CNP_prof])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Prof_materie] CHECK CONSTRAINT [FK_Prof_materie_Profesor]
GO
ALTER TABLE [dbo].[prof_materie_clasa]  WITH CHECK ADD  CONSTRAINT [FK_prof_materie_clasa_Clasa] FOREIGN KEY([id_clasa])
REFERENCES [dbo].[Clasa] ([id_clasa])
GO
ALTER TABLE [dbo].[prof_materie_clasa] CHECK CONSTRAINT [FK_prof_materie_clasa_Clasa]
GO
ALTER TABLE [dbo].[prof_materie_clasa]  WITH CHECK ADD  CONSTRAINT [FK_prof_materie_clasa_Materiale_didactice] FOREIGN KEY([id_material])
REFERENCES [dbo].[Materiale_didactice] ([id_material])
GO
ALTER TABLE [dbo].[prof_materie_clasa] CHECK CONSTRAINT [FK_prof_materie_clasa_Materiale_didactice]
GO
ALTER TABLE [dbo].[prof_materie_clasa]  WITH CHECK ADD  CONSTRAINT [FK_prof_materie_clasa_Prof_materie] FOREIGN KEY([id_materie], [CNP_prof])
REFERENCES [dbo].[Prof_materie] ([id_materie], [CNP_prof])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[prof_materie_clasa] CHECK CONSTRAINT [FK_prof_materie_clasa_Prof_materie]
GO
ALTER TABLE [dbo].[Profesor]  WITH CHECK ADD  CONSTRAINT [FK_Profesor_Inregistrare] FOREIGN KEY([Username])
REFERENCES [dbo].[Inregistrare] ([Username])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Profesor] CHECK CONSTRAINT [FK_Profesor_Inregistrare]
GO
ALTER TABLE [dbo].[Teze]  WITH CHECK ADD  CONSTRAINT [FK_Teze_Materie] FOREIGN KEY([id_materie])
REFERENCES [dbo].[Materie] ([id_materie])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teze] CHECK CONSTRAINT [FK_Teze_Materie]
GO
ALTER TABLE [dbo].[Teze]  WITH CHECK ADD  CONSTRAINT [FK_Teze_Specializare] FOREIGN KEY([id_specializare])
REFERENCES [dbo].[Specializare] ([id_specializare])
GO
ALTER TABLE [dbo].[Teze] CHECK CONSTRAINT [FK_Teze_Specializare]
GO
/****** Object:  StoredProcedure [dbo].[AbsenteDirig]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AbsenteDirig]
	@user nvarchar(40)
AS
BEGIN
	select elev.Nume,elev.Prenume,denumire, Absenta.data,absenta.semestru, Absenta.motivabila,Absenta.motivata from clasa inner join elev on
clasa.id_clasa = elev.id_clasa inner join Profesor on Profesor.CNP_prof=clasa.CNP_prof inner join Absenta on Absenta.CNP_elev=elev.CNP_elev
inner join materie on Absenta.id_materie=Materie.id_materie where Profesor.Username=@user
END
GO
/****** Object:  StoredProcedure [dbo].[AbsenteElev]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AbsenteElev]
	@cnp_elev nchar(13)
AS
BEGIN
	select Materie.denumire as materie, Absenta.[data],Absenta.semestru , Absenta.motivabila, Absenta.motivata from
	Materie inner join Prof_materie on (Materie.id_materie=Prof_materie.id_materie) 
	inner join prof_materie_clasa on (Prof_materie.CNP_prof = prof_materie_clasa.CNP_prof and 
	prof_materie_clasa.id_materie = Prof_materie.id_materie)
	inner join  Absenta on ( Absenta.CNP_prof=Prof_materie.CNP_prof and Absenta.id_materie=Prof_materie.id_materie) 
	inner join elev on (prof_materie_clasa.id_clasa= elev.id_clasa and elev.CNP_elev=Absenta.CNP_elev)
	where Absenta.CNP_elev=@cnp_elev order by Absenta.semestru,Materie.denumire;
END
GO
/****** Object:  StoredProcedure [dbo].[AbsenteNDirig]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[AbsenteNDirig]
	@user nvarchar(40)
AS
BEGIN
	select elev.Nume,elev.Prenume,denumire, Absenta.data,absenta.semestru, Absenta.motivabila,Absenta.motivata from clasa inner join elev on
clasa.id_clasa = elev.id_clasa inner join Profesor on Profesor.CNP_prof=clasa.CNP_prof inner join Absenta on Absenta.CNP_elev=elev.CNP_elev
inner join materie on Absenta.id_materie=Materie.id_materie where Profesor.Username=@user and Absenta.motivata='false'
END
GO
/****** Object:  StoredProcedure [dbo].[AbsenteNemotivate]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AbsenteNemotivate]
	@user nvarchar(40)
AS
BEGIN
	select count(*) from clasa inner join elev on
clasa.id_clasa = elev.id_clasa inner join Profesor on Profesor.CNP_prof=clasa.CNP_prof inner join Absenta on Absenta.CNP_elev=elev.CNP_elev
 where Profesor.Username=@user and absenta.motivata='false'
END
GO
/****** Object:  StoredProcedure [dbo].[AbsenteNemotivateElev]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AbsenteNemotivateElev]
	@user nvarchar(40),
	@cnp_elev nvarchar(13)
AS
BEGIN
	select count(*) from clasa inner join elev on
clasa.id_clasa = elev.id_clasa inner join Profesor on Profesor.CNP_prof=clasa.CNP_prof inner join Absenta on Absenta.CNP_elev=elev.CNP_elev
 where Profesor.Username=@user and absenta.motivata='false' and elev.CNP_elev=@cnp_elev
END
GO
/****** Object:  StoredProcedure [dbo].[AddAbsenta]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddAbsenta]
	@cnp_elev nvarchar(13),
	@cnp_prof nvarchar(13),
	@id_materie int,
	@data date,
	@sem int,
	@motivabila bit
AS
BEGIN
	insert into Absenta (CNP_elev,CNP_prof,id_materie,data,semestru,motivabila,motivata)
	values (@cnp_elev,@cnp_prof,@id_materie,@data,@sem,@motivabila,'false')
END
GO
/****** Object:  StoredProcedure [dbo].[AddClasa]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddClasa]
	@clasa nvarchar(3),
	@cnp_prof nvarchar(13),
	@id_specializare int
AS
BEGIN
	Insert into Clasa(clasa,CNP_prof,id_specializare)
	values (@clasa,@cnp_prof,@id_specializare)
END
GO
/****** Object:  StoredProcedure [dbo].[AddElev]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddElev]
	@CNP_elev nchar(13),
	@Nume nvarchar(40),
	@Prenume nvarchar(40),
	@Username nvarchar(40),
	@id_clasa int

AS
BEGIN
	insert into Elev(CNP_elev,Nume,Prenume,Username,id_clasa)
	values(@CNP_elev,@Nume,@Prenume,@Username,@id_clasa)
END
GO
/****** Object:  StoredProcedure [dbo].[AddInregistrare]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddInregistrare]
	@user nvarchar(40),
	@parola nvarchar(40),
	@rol nvarChar(40)
AS
BEGIN
	insert into Inregistrare(Username,Parola,Rol,activ)
	values(@user,@parola,@rol,'true')
END
GO
/****** Object:  StoredProcedure [dbo].[AddMaterie]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddMaterie]
	@denumire nvarchar(50)

AS
BEGIN
	insert into Materie(denumire)
	values(@denumire)
END
GO
/****** Object:  StoredProcedure [dbo].[AddMedie]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddMedie]
	@cnp_elev nvarchar(13),
	@cnp_prof nvarchar(13),
	@id_materie int,
	@sem int,
	@nota int
AS
BEGIN
	insert into Medie(CNP_elev,CNP_prof,id_materie,nota,semestru)
	values (@cnp_elev,@CNP_prof,@id_materie,@nota,@sem)
END
GO
/****** Object:  StoredProcedure [dbo].[AddNota]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddNota]
	@cnp_elev nvarchar(13),
	@cnp_prof nvarchar(13),
	@id_materie int,
	@nota int,
	@data date,
	@sem int,
	@teza bit
AS
BEGIN
	insert into Nota(CNP_elev,CNP_prof,id_materie,nota,data,semestru,teza)
	values (@cnp_elev,@cnp_prof,@id_materie,@nota,@data,@sem,@teza)
END
GO
/****** Object:  StoredProcedure [dbo].[AddProf]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddProf]
	@CNP_prof nchar(13),
	@Nume nvarchar(40),
	@Prenume nvarchar(40),
	@Username nvarchar(40)

AS
BEGIN
	insert into Profesor(CNP_prof,Nume,Prenume,Username)
	values(@CNP_prof,@Nume,@Prenume,@Username)
END
GO
/****** Object:  StoredProcedure [dbo].[AddProfMaterie]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[AddProfMaterie]
	@id_materie int,
	@cnp_prof nvarchar(13)
AS
BEGIN
insert into Prof_materie(id_materie,CNP_prof)
	values(@id_materie,@cnp_prof)
END
GO
/****** Object:  StoredProcedure [dbo].[AddProfMaterieClasa]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[AddProfMaterieClasa]
	@id_materie int,
	@cnp_prof nvarchar(13),
	@id_clasa int
AS
BEGIN
insert into prof_materie_clasa(id_materie,CNP_prof,id_clasa)
	values(@id_materie,@cnp_prof,@id_clasa)
END
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddUser]
	@user nvarchar(40),
	@parola nvarchar(40),
	@rol nvarchar(40)
AS
BEGIN
	insert into Inregistrare(Username,Parola,activ,Rol)
	values(@user,@parola,'true',@rol)
END
GO
/****** Object:  StoredProcedure [dbo].[AnulareNota]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AnulareNota]
	@cnp_elev nvarchar(13),
	@cnp_prof nvarchar(13),
	@id_materie int,
	@nota int,
	@data date,
	@sem int,
	@teza bit
AS
BEGIN
	delete nota where CNP_elev=@cnp_elev and CNP_prof=@cnp_prof and id_materie=@id_materie and nota=@nota and nota.data=@data and 
	semestru=@sem and teza=@teza
END
GO
/****** Object:  StoredProcedure [dbo].[CalculMedie]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CalculMedie]
	@id_materie int,
	@cnp_elev nvarchar(13),
	@cnp_prof nvarchar(13),
	@sem int
AS
BEGIN
	select  avg(nota) from nota where CNP_elev=@cnp_elev and cnp_prof=@cnp_prof and id_materie=@id_materie and teza='false' and semestru=@sem
END
GO
/****** Object:  StoredProcedure [dbo].[CatalogProfAbsente]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CatalogProfAbsente]
@user nvarchar(40)
AS
BEGIN
select clasa,elev.nume, elev.prenume,denumire,data,motivabila,motivata,semestru from profesor inner join prof_materie on Profesor.CNP_prof=Prof_materie.CNP_prof
inner join materie on Materie.id_materie=Prof_materie.id_materie inner join prof_materie_clasa on
Prof_materie.CNP_prof=prof_materie_clasa.CNP_prof and prof_materie_clasa.id_materie = Prof_materie.id_materie inner join clasa on
clasa.id_clasa=prof_materie_clasa.id_clasa inner join elev on elev.id_clasa=clasa.id_clasa inner join absenta on absenta.CNP_elev=Elev.CNP_elev
and absenta.CNP_prof=Profesor.CNP_prof and absenta.id_materie = prof_materie_clasa.id_materie where Profesor.Username=@user order by semestru

END
GO
/****** Object:  StoredProcedure [dbo].[CatalogProfMedii]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[CatalogProfMedii]
@user nvarchar(40)
AS
BEGIN
select clasa,elev.nume, elev.prenume,denumire,nota,semestru from profesor inner join prof_materie on Profesor.CNP_prof=Prof_materie.CNP_prof
inner join materie on Materie.id_materie=Prof_materie.id_materie inner join prof_materie_clasa on
Prof_materie.CNP_prof=prof_materie_clasa.CNP_prof and prof_materie_clasa.id_materie = Prof_materie.id_materie inner join clasa on
clasa.id_clasa=prof_materie_clasa.id_clasa inner join elev on elev.id_clasa=clasa.id_clasa inner join medie on medie.CNP_elev=Elev.CNP_elev
and medie.CNP_prof=Profesor.CNP_prof and medie.id_materie = prof_materie_clasa.id_materie where Profesor.Username=@user order by semestru

END
GO
/****** Object:  StoredProcedure [dbo].[CatalogProfNote]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CatalogProfNote]
@user nvarchar(40)
AS
BEGIN
	select clasa,elev.nume, elev.prenume,denumire,nota,[data],semestru,teza from profesor inner join prof_materie on Profesor.CNP_prof=Prof_materie.CNP_prof
inner join materie on Materie.id_materie=Prof_materie.id_materie inner join prof_materie_clasa on
Prof_materie.CNP_prof=prof_materie_clasa.CNP_prof and prof_materie_clasa.id_materie = Prof_materie.id_materie inner join clasa on
clasa.id_clasa=prof_materie_clasa.id_clasa inner join elev on elev.id_clasa=clasa.id_clasa inner join nota on nota.CNP_elev=Elev.CNP_elev
and nota.CNP_prof=Profesor.CNP_prof and nota.id_materie = prof_materie_clasa.id_materie where Profesor.Username=@user order by semestru

END
GO
/****** Object:  StoredProcedure [dbo].[ClasaDenumire]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ClasaDenumire] 
	@id_clasa int
AS
BEGIN
	select  clasa.clasa from clasa where id_clasa=@id_clasa
END
GO
/****** Object:  StoredProcedure [dbo].[Clase]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Clase] 
AS
BEGIN
	select  clasa.clasa, specializare.denumire, nume,prenume from clasa inner join Specializare on 
	Specializare.id_specializare=clasa.id_specializare
	inner join Profesor on  Profesor.CNP_prof=clasa.CNP_prof
END
GO
/****** Object:  StoredProcedure [dbo].[ClaseProfMaterie]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ClaseProfMaterie]
	@user nvarchar(13),
	@id_materie int
AS
BEGIN
	select clasa.id_clasa, clasa.clasa from Profesor inner join Prof_materie on Profesor.CNP_prof=Prof_materie.CNP_prof 
inner join Materie on materie.id_materie=Prof_materie.id_materie
inner join prof_materie_clasa on prof_materie_clasa.CNP_prof=Prof_materie.CNP_prof and prof_materie_clasa.id_materie=
Prof_materie.id_materie  join clasa on 
clasa.id_clasa=prof_materie_clasa.id_clasa where Username=@user and materie.id_materie=@id_materie
END
GO
/****** Object:  StoredProcedure [dbo].[CNPAdmin]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CNPAdmin]
	@user nchar(13)
AS
BEGIN
	select CNP_admin from Admin where Username=@user
END
GO
/****** Object:  StoredProcedure [dbo].[CnpElev]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CnpElev]
	@user nchar(13)
AS
BEGIN
	select CNP_elev from Elev where Username=@user
END
GO
/****** Object:  StoredProcedure [dbo].[CnpElevNP]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CnpElevNP]
	@nume nvarchar(40),
	@prenume nvarchar(40)
AS
BEGIN
	select cnp_elev from elev where Nume=@nume and Prenume=@prenume
END
GO
/****** Object:  StoredProcedure [dbo].[CnpProf]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CnpProf]
	@user nchar(13)
AS
BEGIN
	select CNP_prof from Profesor where Username=@user
END
GO
/****** Object:  StoredProcedure [dbo].[CnpProfNP]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CnpProfNP]
	@nume nvarchar(40),
	@prenume nvarchar (40)
AS
BEGIN
	select cnp_prof from Profesor where Nume=@nume and Prenume=@prenume
END
GO
/****** Object:  StoredProcedure [dbo].[Corigenti]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Corigenti]
	@cnp_elev nvarChar(13),
	@sem int
AS
BEGIN
	select elev.Nume,elev.Prenume, Materie.denumire,medie.nota,medie.semestru from elev inner join medie on elev.CNP_elev=Medie.CNP_elev
	inner join materie on Materie.id_materie=Medie.id_materie where elev.CNP_elev=@cnp_elev and semestru=@sem and nota<5 
END
GO
/****** Object:  StoredProcedure [dbo].[CorigentiClasa]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CorigentiClasa]
	@cnp_prof nvarchar(40)
AS
BEGIN
		select elev.Nume,elev.Prenume, Materie.denumire,medie.nota,medie.semestru from elev inner join medie on elev.CNP_elev=Medie.CNP_elev
	inner join materie on Materie.id_materie=Medie.id_materie inner join clasa on elev.id_clasa=clasa.id_clasa inner join 
	Profesor on Profesor.CNP_prof=clasa.CNP_prof 
	where Profesor.CNP_prof=@cnp_prof and nota<5 

END
GO
/****** Object:  StoredProcedure [dbo].[DateAdmin]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DateAdmin]
	@user nchar(13)
AS
BEGIN
	select * from Admin where Username=@user
END
GO
/****** Object:  StoredProcedure [dbo].[DateElev]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DateElev]
	@user nchar(13)
AS
BEGIN
	select * from Elev where Username=@user
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAbsenta]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteAbsenta]
	@cnp nvarchar(13)
AS
BEGIN
	delete Absenta where CNP_prof=@cnp
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAbsentaMaterie]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteAbsentaMaterie]
	@id_materie int,
	@cnp nvarChar(40)
AS
BEGIN
	delete Absenta where id_materie=@id_materie and CNP_prof=@cnp
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteClasa]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeleteClasa]
	@id_clasa int
AS
BEGIN
	delete clasa where id_clasa=@id_clasa
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteMaterie]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteMaterie]
	@id_materie int
AS
BEGIN
	delete Materie where id_materie= @id_materie
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteMedie]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteMedie]
	@cnp nvarchar(13)
AS
BEGIN
	delete Medie where CNP_prof=@cnp
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteMedieMaterie]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteMedieMaterie]
	@id_materie int,
	@cnp nvarChar(40)
AS
BEGIN
	delete Medie where id_materie=@id_materie and CNP_prof=@cnp
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteNota]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteNota]
	@cnp nvarchar(13)
AS
BEGIN
	delete Nota where CNP_prof=@cnp
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteNotaMaterie]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteNotaMaterie]
	@id_materie int,
	@cnp nvarChar(40)
AS
BEGIN
	delete Nota where id_materie=@id_materie and CNP_prof=@cnp
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePM]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeletePM]
	@id_materie int,
	@cnp nvarchar(13)
AS
BEGIN
	delete prof_materie where id_materie=@id_materie and CNP_prof=@cnp
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePMC]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeletePMC]
	@id_materie int,
	@cnp nvarchar(40)
AS
BEGIN
	delete prof_materie_clasa where id_materie=@id_materie and CNP_prof=@cnp
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePMCClasa]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeletePMCClasa]
	@id_clasa int
AS
BEGIN
	delete prof_materie_clasa where id_clasa=@id_clasa
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteUser]
	@user nvarchar(40)
AS
BEGIN
	delete Inregistrare where Username=@user
END
GO
/****** Object:  StoredProcedure [dbo].[Diriginte]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Diriginte]
	@user nchar(13)
AS
BEGIN
	select id_clasa from inregistrare inner join profesor on Inregistrare.Username=profesor.Username inner join clasa on
clasa.CNP_prof=Profesor.CNP_prof where Inregistrare.Username=@user
END
GO
/****** Object:  StoredProcedure [dbo].[DiriginteCNP]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DiriginteCNP]
	@cnp nvarchar(13)
AS
BEGIN
	select id_clasa from  profesor  inner join clasa on
clasa.CNP_prof=Profesor.CNP_prof where profesor.CNP_prof=@cnp
END
GO
/****** Object:  StoredProcedure [dbo].[ElevClasa]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ElevClasa]
	@id_clasa int
AS
BEGIN
	
select * from Elev where id_clasa=@id_clasa
END
GO
/****** Object:  StoredProcedure [dbo].[EleviClasa]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EleviClasa]
	@user nvarchar(40)
AS
BEGIN
	select elev.nume,elev.prenume from elev inner join clasa on elev.id_clasa=clasa.id_clasa inner join Profesor on 
	Profesor.CNP_prof=clasa.CNP_prof where Profesor.Username=@user
END
GO
/****** Object:  StoredProcedure [dbo].[EleviInfo]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EleviInfo]
AS
BEGIN
	select Nume, Prenume, Username, CNP_elev, Clasa.clasa, Specializare.denumire as specializare from Elev inner join Clasa on elev.id_clasa=clasa.id_clasa 
	inner join Specializare on clasa.id_specializare=Specializare.id_specializare order by Nume
END
GO
/****** Object:  StoredProcedure [dbo].[ElevInfo]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ElevInfo]
	@user nchar(13)
AS
BEGIN
	select Nume, Prenume, Username, CNP_elev, Clasa.clasa, Specializare.denumire as specializare from Elev inner join Clasa on elev.id_clasa=clasa.id_clasa 
	inner join Specializare on clasa.id_specializare=Specializare.id_specializare
	where Username=@user
END
GO
/****** Object:  StoredProcedure [dbo].[IdClasa]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IdClasa]
	@clasa nvarchar(3)
AS
BEGIN
	select id_clasa from clasa where clasa.clasa=@clasa
END
GO
/****** Object:  StoredProcedure [dbo].[IdMaterie]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IdMaterie]
	@denumire nvarchar(40)
AS
BEGIN
	Select id_materie from materie where denumire=@denumire
END
GO
/****** Object:  StoredProcedure [dbo].[IdSpecializare]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IdSpecializare]
	@denumire nvarchar(40)
AS
BEGIN
	select id_specializare from Specializare where denumire=@denumire
END
GO
/****** Object:  StoredProcedure [dbo].[IdSpecializareClasa]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IdSpecializareClasa]
	@id_clasa int
AS
BEGIN
	select clasa.id_specializare from clasa where id_clasa=@id_clasa
END
GO
/****** Object:  StoredProcedure [dbo].[ListaElevi]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListaElevi]
AS
BEGIN
	select elev.CNP_elev, elev.Nume, elev.Prenume, elev.Username, parola, clasa.clasa,Inregistrare.Rol from
	elev left join clasa on elev.id_clasa=clasa.id_clasa inner join Inregistrare on elev.Username=
	Inregistrare.Username order by nume
END
GO
/****** Object:  StoredProcedure [dbo].[ListaProfi]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ListaProfi]
AS
BEGIN
	select profesor.CNP_prof, profesor.Nume, profesor.Prenume, Profesor.Username, parola, Inregistrare.Rol from
	Profesor inner join Inregistrare on profesor.Username=Inregistrare.Username order by nume
END
GO
/****** Object:  StoredProcedure [dbo].[Logare]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Logare]
	@username nchar(40),
	@parola nchar(40)
AS
DECLARE @ReturnValue int
BEGIN 
	IF EXISTS (SELECT * FROM Inregistrare WHERE Username=@username)
 BEGIN
    SELECT  @ReturnValue = 
            CASE WHEN Parola = @parola AND activ = 1 THEN 1  -- parola corecta cont activ
                ELSE 0                                              
            END
    FROM Inregistrare WHERE Username=@username
END
ELSE IF NOT EXISTS (SELECT * FROM Inregistrare WHERE Username=@username)
 BEGIN
    SET @ReturnValue = 0
END
SELECT @ReturnValue as val
END
GO
/****** Object:  StoredProcedure [dbo].[Materii]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Materii]
AS
BEGIN
select  nume, prenume,materie.denumire,clasa.clasa from materie left join Prof_materie on
materie.id_materie=Prof_materie.id_materie left join Profesor on Profesor.CNP_prof=prof_materie.CNP_prof left join 
prof_materie_clasa on prof_materie_clasa.CNP_prof=Prof_materie.CNP_prof and prof_materie_clasa.id_materie=Prof_materie.id_materie left join 
clasa on clasa.id_clasa = prof_materie_clasa.id_clasa
END
GO
/****** Object:  StoredProcedure [dbo].[MateriiProf]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MateriiProf]
	@user nvarchar(13)
AS
BEGIN
	select materie.id_materie, denumire from Profesor inner join Prof_materie on Profesor.CNP_prof=Prof_materie.CNP_prof 
inner join Materie on materie.id_materie=Prof_materie.id_materie where Username=@user
END
GO
/****** Object:  StoredProcedure [dbo].[MediaFinala]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MediaFinala]
	@cnp_elev nvarChar(13),
	@sem int
AS
BEGIN
	select avg(cast(nota as float))from medie where CNP_elev=@cnp_elev and semestru=@sem
END
GO
/****** Object:  StoredProcedure [dbo].[MediiElev]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[MediiElev]
	@cnp_elev nchar(13)
AS
BEGIN
	select Materie.denumire as materie,Medie.nota,medie.semestru from
	Materie inner join Prof_materie on (Materie.id_materie=Prof_materie.id_materie) 
	inner join prof_materie_clasa on (Prof_materie.CNP_prof = prof_materie_clasa.CNP_prof and 
	prof_materie_clasa.id_materie = Prof_materie.id_materie)
	inner join  Medie on ( Medie.CNP_prof=Prof_materie.CNP_prof and medie.id_materie=Prof_materie.id_materie) 
	inner join elev on (prof_materie_clasa.id_clasa= elev.id_clasa and elev.CNP_elev=medie.CNP_elev)
	where Medie.CNP_elev=@cnp_elev order by Medie.semestru,Materie.denumire;
END
GO
/****** Object:  StoredProcedure [dbo].[MotiveazaAbsenta]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MotiveazaAbsenta]
	@cnp_elev nvarchar(13),
	@cnp_prof nvarchar(13),
	@id_materie int,
	@data date,
	@sem int,
	@motivabila bit
AS
BEGIN
	update Absenta
	set
	motivata='true'
	where CNP_elev=@cnp_elev and CNP_prof=@cnp_prof and id_materie=@id_materie and data=@data and 
	semestru=@sem and motivabila=@motivabila
END
GO
/****** Object:  StoredProcedure [dbo].[NotaTeza]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NotaTeza]
	@id_materie int,
	@cnp_elev nvarchar(13),
	@cnp_prof nvarchar(13),
	@sem int
AS
BEGIN
	select nota from nota where cnp_elev=@cnp_elev and cnp_prof=@cnp_prof and id_materie=@id_materie and teza='true' and semestru=@sem
END
GO
/****** Object:  StoredProcedure [dbo].[NoteElev]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NoteElev]
	@cnp_elev nchar(13)
AS
BEGIN
	select Materie.denumire as materie,Nota.nota, Nota.[data],Nota.semestru,nota.teza from
	Materie inner join Prof_materie on (Materie.id_materie=Prof_materie.id_materie) 
	inner join prof_materie_clasa on (Prof_materie.CNP_prof = prof_materie_clasa.CNP_prof and 
	prof_materie_clasa.id_materie = Prof_materie.id_materie)
	inner join  Nota on ( Nota.CNP_prof=Prof_materie.CNP_prof and Nota.id_materie=Prof_materie.id_materie) 
	inner join elev on (prof_materie_clasa.id_clasa= elev.id_clasa and elev.CNP_elev=nota.CNP_elev)
	where Nota.CNP_elev=@cnp_elev order by Nota.semestru,Materie.denumire;
END
GO
/****** Object:  StoredProcedure [dbo].[NrNote]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NrNote]
	@cnp_elev nchar(13),
	@id_materie int,
	@cnp_prof nvarchar(13),
	@sem int
AS
BEGIN
	select count(*) from elev inner join clasa on clasa.id_clasa=elev.id_clasa inner join 
prof_materie_clasa on clasa.id_clasa=prof_materie_clasa.id_clasa inner join Prof_materie on 
Prof_materie.id_materie=prof_materie_clasa.id_materie and prof_materie_clasa.CNP_prof=Prof_materie.CNP_prof
inner join nota on nota.CNP_elev=elev.CNP_elev and nota.id_materie=prof_materie_clasa.id_materie and
nota.CNP_prof=prof_materie_clasa.CNP_prof where nota.CNP_elev=@cnp_elev and nota.id_materie=@id_materie and nota.CNP_prof=@cnp_prof 
and nota.teza ='false' and semestru=@sem
END
GO
/****** Object:  StoredProcedure [dbo].[ProfCNP]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ProfCNP]
	@id_materie int,
	@cnp_elev nvarchar(13)
AS
BEGIN
	select profesor.cnp_prof from profesor inner join Prof_materie on Profesor.CNP_prof=Prof_materie.CNP_prof inner join prof_materie_clasa on
prof_materie_clasa.CNP_prof=Profesor.CNP_prof and prof_materie_clasa.id_materie=Prof_materie.id_materie inner join clasa on
clasa.id_clasa=prof_materie_clasa.id_clasa inner join elev on elev.id_clasa=clasa.id_clasa where prof_materie.id_materie=@id_materie and 
CNP_elev=@cnp_elev
END
GO
/****** Object:  StoredProcedure [dbo].[Rol]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Rol]
	@username nvarchar(40)
AS
declare @rol int
BEGIN
	Select @rol=
	case when rol='elev' then 1
	     when rol='admin' then 2
		 when rol='prof' then 3
		 end
	from Inregistrare where Username=@username
	     
END
SELECT @rol
GO
/****** Object:  StoredProcedure [dbo].[Specializari]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Specializari]
AS
BEGIN
	select denumire from Specializare
END
GO
/****** Object:  StoredProcedure [dbo].[Teza]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Teza]
	@id_materie int,
	@id_specializare int
AS
BEGIN
	if exists (select * from teze where id_materie=@id_materie and id_specializare=@id_specializare)
 select 1
if not exists (select * from teze where id_materie=@id_materie and id_specializare=@id_specializare)
select 0
END
GO
/****** Object:  StoredProcedure [dbo].[TotalAbsente]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TotalAbsente]
	@user nvarchar(40)
AS
BEGIN
	select count(*) from clasa inner join elev on
clasa.id_clasa = elev.id_clasa inner join Profesor on Profesor.CNP_prof=clasa.CNP_prof inner join Absenta on Absenta.CNP_elev=elev.CNP_elev
 where Profesor.Username=@user
END
GO
/****** Object:  StoredProcedure [dbo].[TotalAbsenteElev]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TotalAbsenteElev]
	@user nvarchar(40),
	@cnp_elev nvarchar(13)
AS
BEGIN
	select count(*) from clasa inner join elev on
clasa.id_clasa = elev.id_clasa inner join Profesor on Profesor.CNP_prof=clasa.CNP_prof inner join Absenta on Absenta.CNP_elev=elev.CNP_elev
 where Profesor.Username=@user and elev.CNP_elev=@cnp_elev
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateClasa]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateClasa]
	@id_specializare int,
	@cnp_prof nvarchar(13),
	@clasa nvarchar(3)
AS
BEGIN
	update Clasa
	set id_specializare=@id_specializare,
	CNP_prof=@cnp_prof
	where clasa=@clasa
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateElev]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateElev]
	@nume nvarchar(40),
	@prenume nvarchar(40),
	@id_clasa int,
	@cnp nvarchar(13)
AS
BEGIN
	update Elev
	set 
	Nume=@nume,
	Prenume=@prenume,
	id_clasa=@id_clasa
	where CNP_elev=@cnp
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateElevClasa]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateElevClasa]
	@id_clasa int
AS
BEGIN
	update Elev
set id_clasa=null
where id_clasa = @id_clasa
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProf]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[UpdateProf]
	@nume nvarchar(40),
	@prenume nvarchar(40),
	@cnp nvarchar(13)
AS
BEGIN
	update Profesor
	set 
	Nume=@nume,
	Prenume=@prenume
	where CNP_prof=@cnp
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateUser]
	@username nvarchar(40),
	@parola nvarchar(40)
AS
BEGIN
	update Inregistrare
	set parola=@parola
	where Username=@username
END
GO
/****** Object:  StoredProcedure [dbo].[vfAbsenta]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[vfAbsenta]
	@cnp_elev nvarchar(13),
	@cnp_prof nvarchar(13),
	@id_materie int,
	@data date,
	@sem int,
	@motivabila bit
AS
BEGIN
	if exists (select * from Absenta where CNP_elev=@cnp_elev and CNP_prof=@cnp_prof and id_materie=@id_materie and data=@data and 
	semestru=@sem and motivabila=@motivabila)
	select 1
	if not exists (select * from Absenta where CNP_elev=@cnp_elev and CNP_prof=@cnp_prof and id_materie=@id_materie and data=@data and 
	semestru=@sem and motivabila=@motivabila)
	select 0
END
GO
/****** Object:  StoredProcedure [dbo].[VfElev]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VfElev]
	@cnp nvarchar(13)
AS
BEGIN
	IF EXISTS (SELECT * FROM Elev where CNP_elev=@cnp) 
begin
	select '1'
	end
IF not EXISTS (SELECT * FROM Elev where CNP_elev=@cnp) 
Begin
	select '0'
	end
END
GO
/****** Object:  StoredProcedure [dbo].[VfInregistrare]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VfInregistrare]
	@user varchar(40)
AS
BEGIN
	IF EXISTS (SELECT * FROM Inregistrare WHERE Username=@user) 
begin
	select '1'
	end
IF not EXISTS (SELECT * FROM Inregistrare WHERE Username=@user) 
Begin
	select '0'
End
END
GO
/****** Object:  StoredProcedure [dbo].[VfMedie]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VfMedie]
	@cnp_elev nvarchar(13),
	@cnp_prof nvarchar(13),
	@sem int,
	@id_materie int
AS
BEGIN
	select nota from Medie where CNP_elev=@cnp_elev and CNP_prof=@cnp_prof and semestru=@sem and id_materie=@id_materie
END
GO
/****** Object:  StoredProcedure [dbo].[vfNota]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[vfNota]
	@cnp_elev nvarchar(13),
	@cnp_prof nvarchar(13),
	@id_materie int,
	@data date,
	@sem int,
	@nota int,
	@teza bit
AS
BEGIN
	if exists (select * from Nota where CNP_elev=@cnp_elev and CNP_prof=@cnp_prof and id_materie=@id_materie and data=@data and 
	semestru=@sem and nota=@nota and teza=@teza)
	select 1
	if not exists (select * from Nota where CNP_elev=@cnp_elev and CNP_prof=@cnp_prof and id_materie=@id_materie and data=@data and 
	semestru=@sem and nota=@nota and teza=@teza)
	select 0
END
GO
/****** Object:  StoredProcedure [dbo].[vfPM]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[vfPM]
	@cnp nvarchar(13),
	@id_materie int
AS
BEGIN
		IF EXISTS (SELECT * FROM Prof_materie where CNP_prof=@cnp and id_materie=@id_materie) 
begin
	select '1'
	end
IF not EXISTS (SELECT * FROM Prof_materie where CNP_prof=@cnp and id_materie=@id_materie) 
Begin
	select '0'
	end
END
GO
/****** Object:  StoredProcedure [dbo].[vfPMC]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[vfPMC]
	@cnp nvarchar(13),
	@id_materie int,
	@id_clasa int
AS
BEGIN
		IF EXISTS (SELECT * FROM prof_materie_clasa where CNP_prof=@cnp and id_materie=@id_materie and id_Clasa=@id_clasa) 
begin
	select '1'
	end
IF not EXISTS (SELECT * FROM Prof_materie_clasa where CNP_prof=@cnp and id_materie=@id_materie and id_Clasa=@id_clasa) 
Begin
	select '0'
	end
END
GO
/****** Object:  StoredProcedure [dbo].[VfProf]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VfProf]
	@cnp nvarchar(13)
AS
BEGIN
	IF EXISTS (SELECT * FROM Profesor where CNP_prof=@cnp) 
begin
	select '1'
	end
IF not EXISTS (SELECT * FROM Profesor where CNP_prof=@cnp) 
Begin
	select '0'
	end
END
GO
/****** Object:  StoredProcedure [dbo].[VizAbsElev]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VizAbsElev]
    @user nvarchar(40),
	@cnp_elev nvarchar(13)
AS
BEGIN
	select elev.nume,elev.prenume, materie.denumire,absenta.data, absenta.semestru, Absenta.motivabila,absenta.motivata from clasa inner join elev on
clasa.id_clasa = elev.id_clasa inner join Profesor on Profesor.CNP_prof=clasa.CNP_prof inner join Absenta on Absenta.CNP_elev=elev.CNP_elev 
inner join materie on Materie.id_materie=Absenta.id_materie
 where Profesor.Username=@user and elev.CNP_elev=@cnp_elev
END
GO
/****** Object:  StoredProcedure [dbo].[VizAbsNElev]    Script Date: 5/31/2021 3:49:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VizAbsNElev]
    @user nvarchar(40),
	@cnp_elev nvarchar(13)
AS
BEGIN
	select elev.Nume,Elev.Prenume, Materie.denumire,absenta.data, absenta.semestru, Absenta.motivabila,absenta.motivata from clasa inner join elev on
clasa.id_clasa = elev.id_clasa inner join Profesor on Profesor.CNP_prof=clasa.CNP_prof inner join Absenta on Absenta.CNP_elev=elev.CNP_elev 
inner join materie on Materie.id_materie=Absenta.id_materie
 where Profesor.Username=@user and absenta.motivata='false' and elev.CNP_elev=@cnp_elev
END
GO
USE [master]
GO
ALTER DATABASE [Scoala] SET  READ_WRITE 
GO
