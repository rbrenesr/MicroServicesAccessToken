USE [master]
GO
/****** Object:  Database [ufinet_test]    Script Date: 6/30/2022 1:29:31 PM ******/
CREATE DATABASE [ufinet_test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ufinet_test', FILENAME = N'D:\softwareInstalled\Microsoft SQL Server\MSSQL15.SQL02\MSSQL\DATA\ufinet_test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'unifet_test_log', FILENAME = N'D:\softwareInstalled\Microsoft SQL Server\MSSQL15.SQL02\MSSQL\DATA\ufinet_test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ufinet_test] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ufinet_test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ufinet_test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ufinet_test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ufinet_test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ufinet_test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ufinet_test] SET ARITHABORT OFF 
GO
ALTER DATABASE [ufinet_test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ufinet_test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ufinet_test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ufinet_test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ufinet_test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ufinet_test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ufinet_test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ufinet_test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ufinet_test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ufinet_test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ufinet_test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ufinet_test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ufinet_test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ufinet_test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ufinet_test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ufinet_test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ufinet_test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ufinet_test] SET RECOVERY FULL 
GO
ALTER DATABASE [ufinet_test] SET  MULTI_USER 
GO
ALTER DATABASE [ufinet_test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ufinet_test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ufinet_test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ufinet_test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ufinet_test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ufinet_test] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ufinet_test', N'ON'
GO
ALTER DATABASE [ufinet_test] SET QUERY_STORE = OFF
GO
USE [ufinet_test]
GO
/****** Object:  Table [dbo].[tbl_cliente]    Script Date: 6/30/2022 1:29:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cliente](
	[cli_intID] [int] IDENTITY(1,1) NOT NULL,
	[cli_chrDocIdenticacion] [varchar](100) NOT NULL,
	[cli_chrNombre] [varchar](150) NOT NULL,
	[cli_chrApellidos] [varchar](150) NOT NULL,
	[cli_chrMail] [varchar](150) NOT NULL,
 CONSTRAINT [PK_tbl_cliente] PRIMARY KEY CLUSTERED 
(
	[cli_intID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_doc_enc]    Script Date: 6/30/2022 1:29:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_doc_enc](
	[doc_intID] [int] IDENTITY(1,1) NOT NULL,
	[cli_intID] [nchar](10) NOT NULL,
	[doc_chrTipo] [char](3) NOT NULL,
	[doc_chrConsecutivo] [varchar](50) NOT NULL,
	[doc_fecFecha] [datetime] NOT NULL,
	[doc_monSubTotal] [decimal](20, 6) NOT NULL,
	[doc_monImpuesto] [decimal](20, 6) NOT NULL,
	[doc_monDescuento] [decimal](20, 2) NOT NULL,
	[doc_monTotal] [decimal](20, 6) NOT NULL,
 CONSTRAINT [PK_tbl_doc_enc_1] PRIMARY KEY CLUSTERED 
(
	[doc_intID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_docdet]    Script Date: 6/30/2022 1:29:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_docdet](
	[docdet_intID] [int] IDENTITY(1,1) NOT NULL,
	[doc_intID] [int] NOT NULL,
	[item_intID] [int] NOT NULL,
	[docdet_monCantidad] [decimal](20, 6) NOT NULL,
	[docdet_monPrecioUnitario] [decimal](20, 6) NOT NULL,
	[docdet_monSubTotal] [decimal](20, 6) NOT NULL,
	[docdet_monImpuesto] [decimal](20, 6) NOT NULL,
	[docdet_monDescuento] [decimal](20, 6) NOT NULL,
	[docdet_monTotal] [decimal](20, 6) NOT NULL,
 CONSTRAINT [PK_tbl_docdet_1] PRIMARY KEY CLUSTERED 
(
	[docdet_intID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_item]    Script Date: 6/30/2022 1:29:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_item](
	[item_intID] [int] IDENTITY(1,1) NOT NULL,
	[item_chrDescripcion] [varchar](250) NOT NULL,
	[item_monPrecio] [decimal](20, 2) NOT NULL,
 CONSTRAINT [PK_tbl_item] PRIMARY KEY CLUSTERED 
(
	[item_intID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_docdet] ADD  CONSTRAINT [DF_tbl_docdet_docdet_monCantidad]  DEFAULT ((0)) FOR [docdet_monCantidad]
GO
ALTER TABLE [dbo].[tbl_docdet] ADD  CONSTRAINT [DF_tbl_docdet_docdet_monPrecioUnitario]  DEFAULT ((0)) FOR [docdet_monPrecioUnitario]
GO
ALTER TABLE [dbo].[tbl_docdet] ADD  CONSTRAINT [DF_tbl_docdet_docdet_monSubTotal]  DEFAULT ((0)) FOR [docdet_monSubTotal]
GO
ALTER TABLE [dbo].[tbl_docdet] ADD  CONSTRAINT [DF_tbl_docdet_docdet_monImpuesto]  DEFAULT ((0)) FOR [docdet_monImpuesto]
GO
ALTER TABLE [dbo].[tbl_docdet] ADD  CONSTRAINT [DF_tbl_docdet_docdet_monDescuento]  DEFAULT ((0)) FOR [docdet_monDescuento]
GO
ALTER TABLE [dbo].[tbl_docdet] ADD  CONSTRAINT [DF_tbl_docdet_docdet_monTotal]  DEFAULT ((0)) FOR [docdet_monTotal]
GO
ALTER TABLE [dbo].[tbl_doc_enc]  WITH CHECK ADD  CONSTRAINT [FK_tbl_doc_enc_tbl_cliente] FOREIGN KEY([doc_intID])
REFERENCES [dbo].[tbl_cliente] ([cli_intID])
GO
ALTER TABLE [dbo].[tbl_doc_enc] CHECK CONSTRAINT [FK_tbl_doc_enc_tbl_cliente]
GO
ALTER TABLE [dbo].[tbl_docdet]  WITH CHECK ADD  CONSTRAINT [FK_tbl_docdet_tbl_doc_enc] FOREIGN KEY([doc_intID])
REFERENCES [dbo].[tbl_doc_enc] ([doc_intID])
GO
ALTER TABLE [dbo].[tbl_docdet] CHECK CONSTRAINT [FK_tbl_docdet_tbl_doc_enc]
GO
ALTER TABLE [dbo].[tbl_docdet]  WITH CHECK ADD  CONSTRAINT [FK_tbl_docdet_tbl_item] FOREIGN KEY([item_intID])
REFERENCES [dbo].[tbl_item] ([item_intID])
GO
ALTER TABLE [dbo].[tbl_docdet] CHECK CONSTRAINT [FK_tbl_docdet_tbl_item]
GO
USE [master]
GO
ALTER DATABASE [ufinet_test] SET  READ_WRITE 
GO
