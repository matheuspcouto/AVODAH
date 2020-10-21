USE [master]
GO
/****** Object:  Database [Escalas-Metodista]    Script Date: 21/10/2020 15:09:49 ******/
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
/****** Object:  Table [dbo].[Funcao]    Script Date: 21/10/2020 15:09:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcao](
	[idFuncao] [int] IDENTITY(1,1) NOT NULL,
	[desricaoFuncao] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Funcao] PRIMARY KEY CLUSTERED 
(
	[idFuncao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pessoa]    Script Date: 21/10/2020 15:09:49 ******/
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
/****** Object:  Table [dbo].[SubFuncao]    Script Date: 21/10/2020 15:09:49 ******/
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
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 21/10/2020 15:09:49 ******/
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
ALTER TABLE [dbo].[SubFuncao]  WITH CHECK ADD  CONSTRAINT [FK_SubFuncao_Funcao] FOREIGN KEY([idFuncao_fk])
REFERENCES [dbo].[Funcao] ([idFuncao])
GO
ALTER TABLE [dbo].[SubFuncao] CHECK CONSTRAINT [FK_SubFuncao_Funcao]
GO
USE [master]
GO
ALTER DATABASE [Escalas-Metodista] SET  READ_WRITE 
GO
