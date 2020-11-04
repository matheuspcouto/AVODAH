USE [Escalas-Metodista]
GO
/****** Object:  Table [dbo].[Funcao]    Script Date: 04/11/2020 17:56:17 ******/
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
/****** Object:  Table [dbo].[Pessoa]    Script Date: 04/11/2020 17:56:17 ******/
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
/****** Object:  Table [dbo].[SubFuncao]    Script Date: 04/11/2020 17:56:17 ******/
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
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 04/11/2020 17:56:17 ******/
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
