USE [master]
GO
/****** Object:  Database [JGonzalezDapper]    Script Date: 07/10/2022 02:27:32 p. m. ******/
CREATE DATABASE [JGonzalezDapper]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JGonzalezDapper', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JGonzalezDapper.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JGonzalezDapper_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JGonzalezDapper_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JGonzalezDapper] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JGonzalezDapper].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JGonzalezDapper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET ARITHABORT OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [JGonzalezDapper] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [JGonzalezDapper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JGonzalezDapper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JGonzalezDapper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET  ENABLE_BROKER 
GO
ALTER DATABASE [JGonzalezDapper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JGonzalezDapper] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JGonzalezDapper] SET  MULTI_USER 
GO
ALTER DATABASE [JGonzalezDapper] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JGonzalezDapper] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JGonzalezDapper] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JGonzalezDapper] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [JGonzalezDapper]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioAdd]    Script Date: 07/10/2022 02:27:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioAdd]
@Nombre VARCHAR(50),
@ApellidoPaterno VARCHAR(50),
@ApellidoMaterno VARCHAR(50),
@FechaNacimiento VARCHAR(20),
@Sexo CHAR(2),
@Email VARCHAR(100),
@IdRol INT,
@Password VARCHAR(100),
@UserName VARCHAR(10)
AS
	INSERT INTO [Usuario]--TABLA 
           ([Nombre]
           ,[ApellidoPaterno]
           ,[ApellidoMaterno]
           ,[FechaNacimiento]
           ,[Sexo]
           ,[Email]
		   ,[IdRol]
		   ,[Password]
		   ,[UserName])--COLUMNAS 
     VALUES
           (@Nombre,
		   @ApellidoPaterno,
		   @ApellidoMaterno,
		   CONVERT(DATE,@FechaNacimiento,105),--dd--MM-yyyy
		   @Sexo,
		   @Email,
		   @IdRol,
		   @Password,
		   @UserName)--DATOS

GO
/****** Object:  StoredProcedure [dbo].[UsuarioDeleteById]    Script Date: 07/10/2022 02:27:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioDeleteById]
@IdUsuario INT
AS
	DELETE
	  FROM [Usuario]
	  WHERE IdUsuario = @IdUsuario


GO
/****** Object:  StoredProcedure [dbo].[UsuarioGetAll]    Script Date: 07/10/2022 02:27:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioGetAll]
AS
	SELECT [IdUsuario]
		  ,[Nombre]
		  ,[ApellidoPaterno]
		  ,[ApellidoMaterno]
		  ,[FechaNacimiento]
		  ,[Sexo]
		  ,[Email]
		  ,IdRol
		  ,Password
		  ,UserName
	  FROM [Usuario]

GO
/****** Object:  StoredProcedure [dbo].[UsuarioGetById]    Script Date: 07/10/2022 02:27:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioGetById]
@IdUsuario INT
AS
	SELECT [IdUsuario]
		  ,[Nombre]
		  ,[ApellidoPaterno]
		  ,[ApellidoMaterno]
		  ,[FechaNacimiento]
		  ,[Sexo]
		  ,[Email]
		  ,IdRol
		  ,Password
		  ,UserName
	  FROM [Usuario]
	  WHERE IdUsuario = @IdUsuario


GO
/****** Object:  Table [dbo].[Rol]    Script Date: 07/10/2022 02:27:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 07/10/2022 02:27:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApellidoPaterno] [varchar](50) NOT NULL,
	[ApellidoMaterno] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NULL,
	[Sexo] [char](2) NULL,
	[Email] [varchar](100) NULL,
	[IdRol] [int] NULL,
	[Password] [varchar](100) NULL,
	[UserName] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IdRol], [Nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[Rol] ([IdRol], [Nombre]) VALUES (2, N'Usuario')
INSERT [dbo].[Rol] ([IdRol], [Nombre]) VALUES (3, N'Invitado')
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [FechaNacimiento], [Sexo], [Email], [IdRol], [Password], [UserName]) VALUES (1, N'Alberto', N'González', N'Gutiérrez', CAST(N'1998-07-20' AS Date), N'M ', N'juanito@gmail.com', 1, N'jua123', N'juanHD')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [FechaNacimiento], [Sexo], [Email], [IdRol], [Password], [UserName]) VALUES (2, N'Arantza', N'Juan', N'Alfonso', CAST(N'1998-09-09' AS Date), N'F ', N'ajuan@gmail.com', 3, N'ara123', N'arantzaHD')
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [FechaNacimiento], [Sexo], [Email], [IdRol], [Password], [UserName]) VALUES (8, N'Francisco', N'Gonzalez', N'Jimenez', CAST(N'1990-04-02' AS Date), N'M ', N'fgonzalez@gmail.com', 2, N'123456', N'papaHD')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
USE [master]
GO
ALTER DATABASE [JGonzalezDapper] SET  READ_WRITE 
GO
