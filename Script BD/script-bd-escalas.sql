USE [master]
GO
/****** Object:  Database [Escalas-Metodista]    Script Date: 04/10/2021 08:55:10 ******/
CREATE DATABASE [Escalas-Metodista]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Escalas-Metodista', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Escalas-Metodista.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Escalas-Metodista_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Escalas-Metodista_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Escalas-Metodista] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Escalas-Metodista].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Escalas-Metodista] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET ARITHABORT OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Escalas-Metodista] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Escalas-Metodista] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Escalas-Metodista] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Escalas-Metodista] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Escalas-Metodista] SET  MULTI_USER 
GO
ALTER DATABASE [Escalas-Metodista] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Escalas-Metodista] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Escalas-Metodista] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Escalas-Metodista] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Escalas-Metodista] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Escalas-Metodista] SET QUERY_STORE = OFF
GO
USE [Escalas-Metodista]
GO
/****** Object:  Table [dbo].[Data]    Script Date: 04/10/2021 08:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data](
	[idData] [int] IDENTITY(1,1) NOT NULL,
	[descricaoData] [date] NOT NULL,
 CONSTRAINT [PK_Data] PRIMARY KEY CLUSTERED 
(
	[idData] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Data_Escala]    Script Date: 04/10/2021 08:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data_Escala](
	[idData_fk] [int] NOT NULL,
	[idEscala_fk] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Escala]    Script Date: 04/10/2021 08:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Escala](
	[idEscala] [int] IDENTITY(1,1) NOT NULL,
	[nomeEscala] [varchar](50) NOT NULL,
	[dataInicio] [date] NOT NULL,
	[dataFim] [date] NOT NULL,
	[tipoEscala_fk] [int] NOT NULL,
	[intervalo_fk] [int] NOT NULL,
	[usuarioCriador] [int] NOT NULL,
 CONSTRAINT [PK_Escala] PRIMARY KEY CLUSTERED 
(
	[idEscala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcao]    Script Date: 04/10/2021 08:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcao](
	[idFuncao] [int] IDENTITY(1,1) NOT NULL,
	[descricaoFuncao] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Funcao] PRIMARY KEY CLUSTERED 
(
	[idFuncao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Intervalo]    Script Date: 04/10/2021 08:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Intervalo](
	[idIntervalo] [int] IDENTITY(1,1) NOT NULL,
	[descricaoIntervalo] [nchar](10) NULL,
 CONSTRAINT [PK_Intervalo] PRIMARY KEY CLUSTERED 
(
	[idIntervalo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Observacao]    Script Date: 04/10/2021 08:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Observacao](
	[idObservacao] [int] IDENTITY(1,1) NOT NULL,
	[textoObservacao] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Observacao] PRIMARY KEY CLUSTERED 
(
	[idObservacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Observacao_Escala]    Script Date: 04/10/2021 08:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Observacao_Escala](
	[idObservacao_fk] [int] NOT NULL,
	[idEscala_fk] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pessoa]    Script Date: 04/10/2021 08:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoa](
	[idPessoa] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[sobrenome] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[senha] [varchar](30) NOT NULL,
	[tipoUsuario_fk] [int] NOT NULL,
	[funcaoPrincipal_fk] [int] NOT NULL,
	[funcaoSecundaria_fk] [int] NULL,
	[dataCadastro] [date] NOT NULL,
	[status] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Pessoa] PRIMARY KEY CLUSTERED 
(
	[idPessoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pessoa_Escala]    Script Date: 04/10/2021 08:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoa_Escala](
	[idPessoa_fk] [int] NOT NULL,
	[idEscala_fk] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubFuncao]    Script Date: 04/10/2021 08:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubFuncao](
	[idSubFuncao] [int] IDENTITY(1,1) NOT NULL,
	[idFuncao_fk] [int] NOT NULL,
	[descricao] [varchar](40) NOT NULL,
 CONSTRAINT [PK_SubFuncao] PRIMARY KEY CLUSTERED 
(
	[idSubFuncao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEscala]    Script Date: 04/10/2021 08:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEscala](
	[idTipoEscala] [int] IDENTITY(1,1) NOT NULL,
	[descricaoTipoEscala] [varchar](10) NOT NULL,
 CONSTRAINT [PK_TipoEscala] PRIMARY KEY CLUSTERED 
(
	[idTipoEscala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 04/10/2021 08:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[idTipoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](30) NOT NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[idTipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Funcao] ON 

INSERT [dbo].[Funcao] ([idFuncao], [descricaoFuncao]) VALUES (1, N'LOUVOR')
INSERT [dbo].[Funcao] ([idFuncao], [descricaoFuncao]) VALUES (2, N'COMUNICAÇÃO(SOMA)')
INSERT [dbo].[Funcao] ([idFuncao], [descricaoFuncao]) VALUES (3, N'CÉLULAS')
INSERT [dbo].[Funcao] ([idFuncao], [descricaoFuncao]) VALUES (4, N'SALINHA')
SET IDENTITY_INSERT [dbo].[Funcao] OFF
SET IDENTITY_INSERT [dbo].[Intervalo] ON 

INSERT [dbo].[Intervalo] ([idIntervalo], [descricaoIntervalo]) VALUES (1, N'Diária    ')
INSERT [dbo].[Intervalo] ([idIntervalo], [descricaoIntervalo]) VALUES (2, N'Semanal   ')
INSERT [dbo].[Intervalo] ([idIntervalo], [descricaoIntervalo]) VALUES (3, N'Mensal    ')
INSERT [dbo].[Intervalo] ([idIntervalo], [descricaoIntervalo]) VALUES (4, N'Trimestral')
SET IDENTITY_INSERT [dbo].[Intervalo] OFF
SET IDENTITY_INSERT [dbo].[Pessoa] ON 

INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (1, N'MATHEUS', N'PIMENTEL', N'matheuspcouto70@gmail.com', N'mat123', 1, 6, 5, CAST(N'2021-02-25' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (2, N'MARIA EDUARDA', N'BECKER', N'maria@maria.com', N'itamar123', 2, 12, 2, CAST(N'2021-03-07' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (3, N'EUCLIDES ', N'SILVA', N'euclides@euclides.com', N'euclides123', 2, 1, 5, CAST(N'0001-01-01' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (4, N'HAVYLA', N'FERREIRA', N'havylaferreira4@gmail.com', N'havynha123', 2, 4, 5, CAST(N'2021-04-17' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (5, N'JÚLIA', N'PIMENTEL', N'juliapcouto18@gmail.com', N'ju123', 2, 12, 2, CAST(N'2021-06-04' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (6, N'JOÃO PEDRO', N'LUZ', N'pepeu@pepeu.com', N'pepeu123', 2, 9, NULL, CAST(N'2021-06-04' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (7, N'VIVIAN', N'SESTARI', N'viv@viv.com', N'viv123', 2, 16, 17, CAST(N'2021-06-04' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (8, N'EDIL', N'JÚNIOR', N'edil@edil.com', N'edil123', 2, 18, 2, CAST(N'2021-06-04' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (9, N'ÂNGELA', N'BECKER', N'ang@ang.com', N'ang123', 2, 1, 2, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (10, N'JAQUELINE', N'MARINHO', N'jaq@jaq.com', N'jaq123', 2, 1, 5, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (11, N'SUELENY', N'SILVA', N'su@su.com', N'su123', 2, 2, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (12, N'ALLICYA', N'PINHEIRO', N'allicya@allicya.com', N'ali123', 2, 7, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (13, N'DAYANE', N'JUNKER', N'day@day.com', N'day123', 2, 8, 5, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (14, N'HEITOR', N'METODISTA', N'heitor@heitor.com', N'heitor123', 2, 5, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (15, N'JESSICA', N'PINHEIRO', N'jesk@jesk.com', N'jesk123', 2, 9, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (16, N'GIOVANA', N'JHORYS', N'gio@gio.com', N'gio123', 2, 7, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (17, N'JOÃO VITOR', N'ALVES', N'jv@jv.com', N'jv123', 2, 1, 6, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (18, N'LUCIENE', N'NETO', N'lu@lu.com', N'lu123', 2, 2, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (19, N'LUIZ GUILHERME', N'SILVA', N'luix@luix.com', N'luix123', 2, 11, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (20, N'LUCAS ', N'COLLET', N'luket@luket.com', N'luket123', 2, 8, 9, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (21, N'MARCOS', N'FERNANDES', N'marcola@marcola.com', N'marcola123', 2, 11, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (22, N'OTTO', N'SILVA', N'otto@otto.com', N'otto123', 2, 2, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (23, N'MACENAS', N'SARGENTO', N'macenas@macenas.com', N'macenas123', 2, 2, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (24, N'MATEUS', N'SIQUEIRA', N'siqueira@siqueira.com', N'siqueira123', 2, 2, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (25, N'VICTOR', N'VINGADOR', N'vingas@vingas.com', N'vingas123', 2, 2, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (26, N'VINICIUS', N'SARAIVA', N'vini@vini.com', N'vini123', 2, 11, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (27, N'VICTOR', N'LUCAS', N'vitin@vitin.com', N'vitin123', 2, 11, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (28, N'ÂNDRIO', N'DIAS', N'andrio@andrio.com', N'andrio123', 2, 9, 8, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (29, N'JOÁS', N'REIS', N'joas@joas.com', N'joas123', 2, 6, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (30, N'POWLLANA', N'POW', N'pow@pow.com', N'pow123', 2, 2, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (31, N'KÊNISE', N'LÔRRAYNE', N'ken@ken.com', N'ken123', 2, 2, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (32, N'ANA', N'CLARA', N'ana@ana.com', N'ana123', 2, 2, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (33, N'ALINE', N'AQUINO', N'aline@aline.com', N'aline123', 2, 2, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (34, N'HEVERSON', N'SILVA', N'hev@hev.com', N'hev123', 2, 10, NULL, CAST(N'2021-08-18' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (35, N'ELANA', N'LUZ', N'elana@elana.com', N'elana123', 2, 16, 17, CAST(N'2021-08-21' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (36, N'KARINA', N'GOMES', N'karina@karina.com', N'karina123', 2, 3, 14, CAST(N'2021-08-22' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (1009, N'THIANA', N'THILLER', N'thiana@thiana.com', N'04WYYA', 2, 14, 15, CAST(N'0001-01-01' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (1010, N'LIGYA', N'ELIZABETE', N'ligya@ligya.com', N'JUI5CL', 2, 12, 13, CAST(N'2021-09-01' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (1011, N'DAYANE ', N'FEITOSA', N'dayfeitosa@dayfeitosa.com', N'S2DKKA', 2, 3, 4, CAST(N'2021-09-01' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (1019, N'CÉLULA HESED', N'', N'', N'QZMBDG', 3, 22, 24, CAST(N'2021-09-14' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (1020, N'CÉLULA KLÊTOS', N'', N'', N'', 3, 22, 24, CAST(N'2021-09-14' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (1021, N'CÉLULA CHADAH', N'', N'', N'0R37FV', 3, 23, NULL, CAST(N'2021-09-14' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (1022, N'CÉLULA ÁGAPE', N'', N'', N'', 3, 23, NULL, CAST(N'2021-09-14' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (1023, N'CÉLULA RENOVO', N'', N'', N'', 3, 22, 24, CAST(N'2021-09-15' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (1024, N'CÉLULA DUNAMIS', N'', N'', N'', 3, 23, NULL, CAST(N'2021-09-15' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (1025, N'CÉLULA HAVILAH', N'', N'', N'', 3, 22, 24, CAST(N'2021-09-15' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (1026, N'CÉLULA VITA', N'', N'', N'', 3, 22, 24, CAST(N'2021-09-15' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (1027, N'CÉLULA SERVOS DO REI', N'', N'', N'', 3, 22, 24, CAST(N'2021-09-15' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (1028, N'CÉLULA SIGA ME', N'', N'', N'', 3, 23, NULL, CAST(N'2021-09-15' AS Date), N'Ativo')
INSERT [dbo].[Pessoa] ([idPessoa], [nome], [sobrenome], [email], [senha], [tipoUsuario_fk], [funcaoPrincipal_fk], [funcaoSecundaria_fk], [dataCadastro], [status]) VALUES (1029, N'CÉLULA AGENTES DO REINO', N'', N'', N'', 3, 22, 24, CAST(N'2021-09-15' AS Date), N'Ativo')
SET IDENTITY_INSERT [dbo].[Pessoa] OFF
SET IDENTITY_INSERT [dbo].[SubFuncao] ON 

INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (1, 1, N'VOZ (MINIST)')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (2, 1, N'VOZ (BACK)')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (3, 2, N'STORIES')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (4, 2, N'VÍDEO')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (5, 1, N'VIOLÃO')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (6, 1, N'GUITARRA')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (7, 1, N'TECLADO')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (8, 1, N'BAIXO')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (9, 1, N'BATERIA')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (10, 1, N'PERCURSSÃO')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (11, 1, N'MÍDIA E SOM')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (12, 2, N'IMAGEM')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (13, 2, N'EDIÇÃO')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (14, 2, N'LEGENDA')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (15, 2, N'ENTREVISTA')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (16, 4, N'PROF - 0 A 4 ANOS')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (17, 4, N'PROF - 4 A 7 ANOS')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (18, 4, N'PROF - 8 A 11 ANOS')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (22, 3, N'LIMPEZA - TEMPLO')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (23, 3, N'LANCHE')
INSERT [dbo].[SubFuncao] ([idSubFuncao], [idFuncao_fk], [descricao]) VALUES (24, 3, N'LIMPEZA - CORREDOR')
SET IDENTITY_INSERT [dbo].[SubFuncao] OFF
SET IDENTITY_INSERT [dbo].[TipoUsuario] ON 

INSERT [dbo].[TipoUsuario] ([idTipoUsuario], [descricao]) VALUES (1, N'Administrador')
INSERT [dbo].[TipoUsuario] ([idTipoUsuario], [descricao]) VALUES (2, N'Padrão')
INSERT [dbo].[TipoUsuario] ([idTipoUsuario], [descricao]) VALUES (3, N'Célula')
SET IDENTITY_INSERT [dbo].[TipoUsuario] OFF
ALTER TABLE [dbo].[Data_Escala]  WITH CHECK ADD  CONSTRAINT [FK_Data_Escala_Data] FOREIGN KEY([idData_fk])
REFERENCES [dbo].[Data] ([idData])
GO
ALTER TABLE [dbo].[Data_Escala] CHECK CONSTRAINT [FK_Data_Escala_Data]
GO
ALTER TABLE [dbo].[Data_Escala]  WITH CHECK ADD  CONSTRAINT [FK_Data_Escala_Escala] FOREIGN KEY([idEscala_fk])
REFERENCES [dbo].[Escala] ([idEscala])
GO
ALTER TABLE [dbo].[Data_Escala] CHECK CONSTRAINT [FK_Data_Escala_Escala]
GO
ALTER TABLE [dbo].[Escala]  WITH CHECK ADD  CONSTRAINT [FK_Escala_Intervalo] FOREIGN KEY([intervalo_fk])
REFERENCES [dbo].[Intervalo] ([idIntervalo])
GO
ALTER TABLE [dbo].[Escala] CHECK CONSTRAINT [FK_Escala_Intervalo]
GO
ALTER TABLE [dbo].[Escala]  WITH CHECK ADD  CONSTRAINT [FK_Escala_TipoEscala] FOREIGN KEY([tipoEscala_fk])
REFERENCES [dbo].[TipoEscala] ([idTipoEscala])
GO
ALTER TABLE [dbo].[Escala] CHECK CONSTRAINT [FK_Escala_TipoEscala]
GO
ALTER TABLE [dbo].[Observacao_Escala]  WITH CHECK ADD  CONSTRAINT [FK_Observacao_Escala_Escala] FOREIGN KEY([idEscala_fk])
REFERENCES [dbo].[Escala] ([idEscala])
GO
ALTER TABLE [dbo].[Observacao_Escala] CHECK CONSTRAINT [FK_Observacao_Escala_Escala]
GO
ALTER TABLE [dbo].[Observacao_Escala]  WITH CHECK ADD  CONSTRAINT [FK_Observacao_Escala_Observacao] FOREIGN KEY([idObservacao_fk])
REFERENCES [dbo].[Observacao] ([idObservacao])
GO
ALTER TABLE [dbo].[Observacao_Escala] CHECK CONSTRAINT [FK_Observacao_Escala_Observacao]
GO
ALTER TABLE [dbo].[Pessoa]  WITH CHECK ADD  CONSTRAINT [FK_Pessoa_SubFuncao] FOREIGN KEY([funcaoPrincipal_fk])
REFERENCES [dbo].[SubFuncao] ([idSubFuncao])
GO
ALTER TABLE [dbo].[Pessoa] CHECK CONSTRAINT [FK_Pessoa_SubFuncao]
GO
ALTER TABLE [dbo].[Pessoa]  WITH CHECK ADD  CONSTRAINT [FK_Pessoa_SubFuncao1] FOREIGN KEY([funcaoSecundaria_fk])
REFERENCES [dbo].[SubFuncao] ([idSubFuncao])
GO
ALTER TABLE [dbo].[Pessoa] CHECK CONSTRAINT [FK_Pessoa_SubFuncao1]
GO
ALTER TABLE [dbo].[Pessoa]  WITH CHECK ADD  CONSTRAINT [FK_Pessoa_TipoUsuario] FOREIGN KEY([tipoUsuario_fk])
REFERENCES [dbo].[TipoUsuario] ([idTipoUsuario])
GO
ALTER TABLE [dbo].[Pessoa] CHECK CONSTRAINT [FK_Pessoa_TipoUsuario]
GO
ALTER TABLE [dbo].[Pessoa_Escala]  WITH CHECK ADD  CONSTRAINT [FK_Pessoa_Escala_Escala] FOREIGN KEY([idEscala_fk])
REFERENCES [dbo].[Escala] ([idEscala])
GO
ALTER TABLE [dbo].[Pessoa_Escala] CHECK CONSTRAINT [FK_Pessoa_Escala_Escala]
GO
ALTER TABLE [dbo].[Pessoa_Escala]  WITH CHECK ADD  CONSTRAINT [FK_Pessoa_Escala_Pessoa] FOREIGN KEY([idPessoa_fk])
REFERENCES [dbo].[Pessoa] ([idPessoa])
GO
ALTER TABLE [dbo].[Pessoa_Escala] CHECK CONSTRAINT [FK_Pessoa_Escala_Pessoa]
GO
ALTER TABLE [dbo].[SubFuncao]  WITH CHECK ADD  CONSTRAINT [FK_SubFuncao_Funcao] FOREIGN KEY([idFuncao_fk])
REFERENCES [dbo].[Funcao] ([idFuncao])
GO
ALTER TABLE [dbo].[SubFuncao] CHECK CONSTRAINT [FK_SubFuncao_Funcao]
GO
USE [master]
GO
ALTER DATABASE [Escalas-Metodista] SET  READ_WRITE 
GO
