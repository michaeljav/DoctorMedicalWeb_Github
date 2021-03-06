USE [master]
GO
/****** Object:  Database [DoctorMedicalWeb]    Script Date: 04/20/2017 04:07:04 p.m. ******/
CREATE DATABASE [DoctorMedicalWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DoctorMedicalWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER_2012\MSSQL\DATA\DoctorMedicalWeb.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DoctorMedicalWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER_2012\MSSQL\DATA\DoctorMedicalWeb_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DoctorMedicalWeb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DoctorMedicalWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DoctorMedicalWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DoctorMedicalWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DoctorMedicalWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DoctorMedicalWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DoctorMedicalWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DoctorMedicalWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [DoctorMedicalWeb] SET  MULTI_USER 
GO
ALTER DATABASE [DoctorMedicalWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DoctorMedicalWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DoctorMedicalWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DoctorMedicalWeb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DoctorMedicalWeb]
GO
/****** Object:  User [udoc]    Script Date: 04/20/2017 04:07:04 p.m. ******/
CREATE USER [udoc] FOR LOGIN [ldoc] WITH DEFAULT_SCHEMA=[sdoc]
GO
ALTER ROLE [db_owner] ADD MEMBER [udoc]
GO
/****** Object:  Schema [sdoc]    Script Date: 04/20/2017 04:07:04 p.m. ******/
CREATE SCHEMA [sdoc]
GO
/****** Object:  StoredProcedure [sdoc].[sp_Auditoria]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  procedure [sdoc].[sp_Auditoria]
  (
  
@PaisSecuencia int,
@clinSecuencia int,
@ConsSecuencia int,
@DoctSecuencia int,
@PersSecuencia int,
@TPersSecuencia int,
@AudiFechaMaquina datetime,
@AudiFechaServidor datetime,
@AudiValorOriginal varchar(MAX),
@AudiValorNuevo varchar(MAX),
@UsuaCodigo int,
@AudiIpMaquina int,
@PagiSecuencia int,
@TablSecuencia int,
@Accisecuencia int
  -- @Count int OUTPUT
  )
 AS
BEGIN
BEGIN TRY

  BEGIN TRANSACTION 
  DECLARE @CountMax INT = (SELECT isnull(MAX(AudiSecuencia),0) FROM sdoc.Auditoria WITH (TABLOCKX))+1;

    
  INSERT INTO sdoc.Auditoria(AudiSecuencia,PaisSecuencia,clinSecuencia,ConsSecuencia,DoctSecuencia,PersSecuencia,TPersSecuencia,AudiFechaMaquina,AudiFechaServidor,AudiValorOriginal,AudiValorNuevo,UsuaCodigo,AudiIpMaquina,PagiSecuencia,TablSecuencia,Accisecuencia) 
                     Values (@CountMax,@PaisSecuencia,@clinSecuencia,@ConsSecuencia,@DoctSecuencia,@PersSecuencia,@TPersSecuencia,@AudiFechaMaquina,@AudiFechaServidor,@AudiValorOriginal,@AudiValorNuevo,@UsuaCodigo,@AudiIpMaquina,@PagiSecuencia,@TablSecuencia,@Accisecuencia)
  --SET @Count = SCOPE_IDENTITY();
  select * from sdoc.Auditoria where AudiSecuencia=@CountMax;
  COMMIT TRANSACTION;

END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
  THROW;
END CATCH
END



















































GO
/****** Object:  Table [sdoc].[Acciones]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Acciones](
	[AcciSecuencia] [int] NOT NULL,
	[AcciNombre] [varchar](50) NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Alergia]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[Alergia](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[AlerSecuencia] [int] NOT NULL,
	[AlerNombre] [nvarchar](max) NOT NULL,
	[AlerDescripcion] [nvarchar](max) NULL,
 CONSTRAINT [PK_Alergia] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[AlerSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[AnalisisClinico]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[AnalisisClinico](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[AClinSecuencia] [int] NOT NULL,
	[AClinCodigo] [nvarchar](max) NULL,
	[AClinNombre] [nvarchar](max) NOT NULL,
	[AClinDescripcion] [nvarchar](max) NULL,
	[AClinTipoDeMuestra] [nvarchar](max) NULL,
	[AClinTiempoDeProceso] [nvarchar](max) NULL,
	[AClinCondicionesDelPaciente] [nvarchar](max) NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_AnalisisClinico] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[AClinSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[ArchivosPaciente]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[ArchivosPaciente](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMHistSecuencia_fk] [int] NOT NULL,
	[APaciSecuencia] [int] NOT NULL,
	[TAPaciSecuencia_fk] [int] NOT NULL,
	[APaciFecha] [datetime] NOT NULL,
	[APaciCodigo] [nvarchar](max) NULL,
	[APaciImagen] [image] NOT NULL,
	[APaciDescripcion] [nvarchar](max) NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_ArchivosPaciente] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[CMHistSecuencia_fk] ASC,
	[APaciSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Auditoria]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Auditoria](
	[AudiSecuencia] [int] NOT NULL,
	[PaisSecuencia] [int] NULL,
	[ClinSecuencia] [int] NULL,
	[ConsSecuencia] [int] NULL,
	[DoctSecuencia] [int] NULL,
	[PersSecuencia] [int] NULL,
	[TPersSecuencia] [int] NULL,
	[AudiFechaMaquina] [datetime] NULL,
	[AudiFechaServidor] [datetime] NULL,
	[AudiValorOriginal] [varchar](max) NULL,
	[AudiValorNuevo] [varchar](max) NULL,
	[UsuaCodigo] [int] NULL,
	[AudiIpMaquina] [nvarchar](max) NULL,
	[PagiSecuencia] [nvarchar](max) NULL,
	[TablSecuencia] [int] NULL,
	[Accion] [nvarchar](max) NULL,
	[DescripcionError] [nvarchar](max) NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Auditoria] PRIMARY KEY CLUSTERED 
(
	[AudiSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[CategoriaPersonal]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[CategoriaPersonal](
	[DoctSecuencia_fk] [int] NOT NULL,
	[CPersSecuencia] [int] NOT NULL,
	[CPersNombre] [varchar](max) NOT NULL,
	[UsuaSecuencia] [int] NULL,
	[CPersFechaCreacion] [datetime] NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[CPersFechaModificacion] [datetime] NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_CategoriaPersonal] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[CPersSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Cirugia]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[Cirugia](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[CiruSecuencia] [int] NOT NULL,
	[CiruCodigo] [nvarchar](max) NULL,
	[CiruNombre] [nvarchar](max) NOT NULL,
	[CiruDescripcion] [nvarchar](max) NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Cirugia] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[CiruSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Cita]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Cita](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[PersSecuencia_fk] [int] NULL,
	[CPersSecuencia_fk] [int] NULL,
	[CitaSecuencia] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Tiempo] [time](7) NOT NULL,
	[CitaLlego] [bit] NOT NULL,
	[CitaAtendido] [bit] NOT NULL,
	[CitaCancelada] [bit] NOT NULL,
	[CitaCancelacionMotivo] [varchar](max) NOT NULL,
	[FactSecuencia_fk] [int] NULL,
	[CitaMotivoCita] [varchar](max) NOT NULL,
	[CitaFechaModificacion] [datetime] NOT NULL,
	[UsuaSecuenciaCreacion] [int] NOT NULL,
	[CitaFechaCreacion] [datetime] NOT NULL,
	[UsuaSecuenciaModificacion] [int] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Cita] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[Fecha] ASC,
	[Tiempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Clinica]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[Clinica](
	[clinSecuencia] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[clinRazonSocial] [nvarchar](max) NOT NULL,
	[clinEstablecimiento] [nvarchar](max) NULL,
	[clinOrganismoSuperior] [nvarchar](max) NULL,
	[clinDireccion] [nvarchar](max) NULL,
	[clinTelefono] [nvarchar](max) NULL,
	[clinTelefono2] [nvarchar](max) NULL,
	[clinRNC] [int] NULL,
	[clinFax] [int] NULL,
	[clinPaginaWeb] [nvarchar](max) NULL,
	[clinEmail] [nvarchar](max) NULL,
	[clinFotoName] [nvarchar](max) NULL,
	[clinFotoPath] [nvarchar](max) NULL,
	[clinCuerpoCartaCabecera] [nvarchar](max) NULL,
	[clinCuerpoCartaPie] [nvarchar](max) NULL,
	[clinLatitud] [decimal](18, 2) NULL,
	[clinLongitud] [decimal](18, 2) NULL,
	[clinEstaBorrado] [bit] NULL,
	[usuaSecuenciaCreacion] [int] NULL,
	[usuaSecuenciaModificacion] [int] NULL,
	[clinFechaCreacion] [datetime] NULL,
	[clinFechaModificacion] [datetime] NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Clinica] PRIMARY KEY CLUSTERED 
(
	[clinSecuencia] ASC,
	[PaisSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[ConsultaMedica]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[ConsultaMedica](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[clinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMediSecuencia] [int] NOT NULL,
	[CMediFecha] [datetime] NULL,
	[CMediHora] [time](7) NULL,
	[CMediUnidadesMedidaTalla] [nvarchar](max) NULL,
	[CMediTalla] [decimal](18, 2) NULL,
	[CMediUnidadesMedidaPeso] [nvarchar](max) NULL,
	[CMediPeso] [decimal](18, 2) NULL,
	[GSangSecuencia_fk] [int] NOT NULL,
	[CMediEmbarazada] [bit] NOT NULL,
	[CMediEmbarazadaFecha] [datetime] NULL,
	[CMediEmbarazadaSemanas] [int] NULL,
	[CMediEmbarazadaDias] [int] NULL,
	[CMediEmbarazadaMeses] [int] NULL,
	[CMediEmbarazadaMesActualDias] [int] NULL,
	[CMediEmbarazadaFechaPromedioParto] [datetime] NULL,
	[CMediAntecedentePadre] [nvarchar](max) NULL,
	[CMediAntecedenteMadre] [nvarchar](max) NULL,
	[CMediAntecedenteHermanos] [nvarchar](max) NULL,
	[CMediAntecedenteOtros] [nvarchar](max) NULL,
	[CMediMenarquia] [nvarchar](max) NULL,
	[CMediPatronMenstrual] [nvarchar](max) NULL,
	[CMediMensutracionDuracion] [nvarchar](max) NULL,
	[CMediDismenorrea] [bit] NOT NULL,
	[CMediPrimerCoito] [int] NULL,
	[CMediDispareunia] [bit] NOT NULL,
	[CMediVidaSexualActiva] [bit] NOT NULL,
	[CMediNumeroParejasSexual] [int] NULL,
	[CMediFechaUltimoParto] [datetime] NULL,
	[CMediFechaUltimoAborto] [datetime] NULL,
	[CMediFechaUltimaMenstruacion] [datetime] NULL,
	[CMediMenopausia] [int] NULL,
	[CMediGestacionVeces] [int] NULL,
	[CMediPartosVeces] [int] NULL,
	[CMediAbortosVeces] [int] NULL,
	[CMediCesariasVeces] [int] NULL,
	[CMediEctopico] [int] NULL,
	[CMediTensionArterial] [nvarchar](max) NULL,
	[CMediFrecuenciaCardiaca] [nvarchar](max) NULL,
	[CMediTiroides] [nvarchar](max) NULL,
	[CMediPulmones] [nvarchar](max) NULL,
	[CMediCorazon] [nvarchar](max) NULL,
	[CMediMamas] [nvarchar](max) NULL,
	[CMediAbdomen] [nvarchar](max) NULL,
	[CMediGenitalesExternos] [nvarchar](max) NULL,
	[CMediTactoVaginal] [nvarchar](max) NULL,
	[CMediExtremidadesInferiores] [nvarchar](max) NULL,
	[CMediFechaProbableParto] [datetime] NULL,
	[CMediFechaUltimoPapanicolau] [datetime] NULL,
	[UsuaSecuenciaCreacion] [int] NULL,
	[UsuaFechaCreacion] [datetime] NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[UsuaFechaModificacion] [datetime] NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_ConsultaMedica] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[clinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[CMediSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[ConsultaMedicaCirugia]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[ConsultaMedicaCirugia](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMediSecuencia_fk] [int] NOT NULL,
	[CiruSecuencia_fk] [int] NOT NULL,
	[CiruComentario] [nvarchar](max) NULL,
	[EdadCirugia] [int] NULL,
 CONSTRAINT [PK_ConsultaMedicaCirugia] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[CMediSecuencia_fk] ASC,
	[CiruSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[ConsultaMedicaEnfermeda]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[ConsultaMedicaEnfermeda](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMediSecuencia_fk] [int] NOT NULL,
	[EnfeSecuencia_fk] [int] NOT NULL,
	[EnfeComentario] [nvarchar](max) NULL,
	[EnfermedadActiva] [bit] NOT NULL,
	[FechaDeDiagnostico] [datetime] NULL,
	[EnfermedadInfecciosa] [bit] NOT NULL,
	[EdadMomentoDiagnosticado] [int] NULL,
 CONSTRAINT [PK_ConsultaMedicaEnfermeda] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[CMediSecuencia_fk] ASC,
	[EnfeSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[ConsultaMedicaEnfermedaFamiliar]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[ConsultaMedicaEnfermedaFamiliar](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMediSecuencia_fk] [int] NOT NULL,
	[EnfeSecuencia_fk] [int] NOT NULL,
	[Familiar] [nvarchar](max) NULL,
	[EnfeComentario] [nvarchar](max) NULL,
	[EnfermedadActiva] [bit] NOT NULL,
	[FechaDeDiagnostico] [datetime] NULL,
	[EnfermedadInfecciosa] [bit] NOT NULL,
	[EdadMomentoDiagnosticado] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[ConsultaMedicaHistorial]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[ConsultaMedicaHistorial](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMHistSecuencia] [int] NOT NULL,
	[CMediProximaConsultaEnDias] [nvarchar](max) NULL,
	[CMHistFechaUltimaRegla] [datetime] NULL,
	[CMHistIndiceMasaCorporal] [decimal](18, 2) NULL,
	[CMediEmbarazada] [bit] NOT NULL,
	[CMediEmbarazadaFecha] [datetime] NULL,
	[CMediEmbarazadaSemanas] [int] NULL,
	[CMediEmbarazadaDias] [int] NULL,
	[CMediEmbarazadaMeses] [int] NULL,
	[CMediEmbarazadaMesActualDias] [int] NULL,
	[CMediEmbarazadaFechaPromedioParto] [datetime] NULL,
	[CMHistUnidadesMedidaPeso] [nvarchar](max) NULL,
	[CMHistPeso] [decimal](18, 2) NULL,
	[CMHistUnidadesMedidaTalla] [nvarchar](max) NULL,
	[CMHistTalla] [decimal](18, 2) NULL,
	[CMHistCodigo] [nvarchar](max) NULL,
	[CMHistFecha] [datetime] NULL,
	[CMHistHora] [time](7) NULL,
	[CitaSecuencia_fk] [int] NULL,
	[CMHistTiroides] [nvarchar](max) NULL,
	[CMHistPulmones] [nvarchar](max) NULL,
	[CMHistCorazon] [nvarchar](max) NULL,
	[CMHistMamas] [nvarchar](max) NULL,
	[CMHistAbdomen] [nvarchar](max) NULL,
	[CMHistGenitalesExternos] [nvarchar](max) NULL,
	[CMHistTactoVaginal] [nvarchar](max) NULL,
	[CMHistExtremidadesInferiores] [nvarchar](max) NULL,
	[CMHistComentario] [nvarchar](max) NULL,
	[TensionArterial] [nvarchar](max) NULL,
	[frecuenciaCardiaca] [nvarchar](max) NULL,
	[UsuaSecuenciaCreacion] [int] NULL,
	[UsuaFechaCreacion] [datetime] NOT NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[UsuaFechaModificacion] [datetime] NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_ConsultaMedicaHistorial] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[CMHistSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[ConsultaMedicaHistorialDiagnostico]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[ConsultaMedicaHistorialDiagnostico](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMHistSecuencia] [int] NOT NULL,
	[DiagSecuencia] [int] NOT NULL,
	[DiagComentario] [nvarchar](max) NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_ConsultaMedicaHistorialDiagnostico] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[CMHistSecuencia] ASC,
	[DiagSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[ConsultaMedicaHistorialEnfermeda]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[ConsultaMedicaHistorialEnfermeda](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMHistSecuencia_fk] [int] NOT NULL,
	[EnfeSecuencia_fk] [int] NOT NULL,
	[EnfeComentario] [nvarchar](max) NULL,
	[EnfermedadActiva] [bit] NOT NULL,
	[FechaDeDiagnostico] [datetime] NULL,
	[EnfermedadInfecciosa] [bit] NOT NULL,
	[EdadMomentoDiagnosticado] [int] NULL,
 CONSTRAINT [PK_ConsultaMedicaHistorialEnfermeda] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[CMHistSecuencia_fk] ASC,
	[EnfeSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[ConsultaMedicaHistorialEvaluacionFisica]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[ConsultaMedicaHistorialEvaluacionFisica](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMHistSecuencia_fk] [int] NOT NULL,
	[EFisiComentario] [nvarchar](max) NULL,
	[EFisiSecuencia_fk] [int] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_ConsultaMedicaHistorialEvaluacionFisica] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[CMHistSecuencia_fk] ASC,
	[EFisiSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[ConsultaMedicaHistorialMotivoConsulta]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[ConsultaMedicaHistorialMotivoConsulta](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMHistSecuencia_fk] [int] NOT NULL,
	[MotiComentario] [nvarchar](max) NULL,
	[MConsSecuencia_fk] [int] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_ConsultorioMedicoHistorialMotivoConsulta] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[CMHistSecuencia_fk] ASC,
	[MConsSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[ConsultaMedicaHistorialTratamiento]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[ConsultaMedicaHistorialTratamiento](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMHistSecuencia_fk] [int] NOT NULL,
	[TratComentario] [nvarchar](max) NULL,
	[TratSecuencia_fk] [int] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_ConsultaMedicaHistorialTratamiento] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[CMHistSecuencia_fk] ASC,
	[TratSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[ConsultaMedicalHistorialAlergias]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[ConsultaMedicalHistorialAlergias](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMHistSecuencia_fk] [int] NOT NULL,
	[AlerSecuencia_fk] [int] NOT NULL,
	[AlerComentario] [nvarchar](max) NULL,
 CONSTRAINT [PK_ConsultaMedicalHistorialAlergias] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[CMHistSecuencia_fk] ASC,
	[AlerSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Consultorio]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[Consultorio](
	[DoctSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ConsCodigo] [nvarchar](max) NOT NULL,
	[ConsDescripcion] [nvarchar](max) NULL,
	[ConsDireccion] [nvarchar](max) NULL,
	[ConsTelefono] [nvarchar](max) NULL,
	[ConsExtencion] [nvarchar](max) NULL,
	[ConsTelefono2] [nvarchar](max) NULL,
	[ConsExtension2] [nvarchar](max) NULL,
	[UsuaSecuenciaCreacion] [int] NULL,
	[ConsFechaCreacion] [datetime] NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[ConsFechaModificacion] [datetime] NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Consultorio] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[ConsSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Diagnostico]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[Diagnostico](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[DiagSecuencia] [int] NOT NULL,
	[DiagCodigo] [nvarchar](max) NULL,
	[DiagNombre] [nvarchar](max) NOT NULL,
	[DiagDescripcion] [nvarchar](max) NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Diagnostico] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[DiagSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Doctor]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[Doctor](
	[DoctSecuencia] [int] NOT NULL,
	[UsuSecuencia] [int] NOT NULL,
	[DoctCUPRE] [nvarchar](max) NULL,
	[DoctDocumento] [nvarchar](max) NULL,
	[TDSecuencia] [int] NULL,
	[DoctNombre] [nvarchar](max) NULL,
	[DoctApellido] [nvarchar](max) NULL,
	[DoctFechaNacimiento] [datetime] NULL,
	[EspeSecuencia] [int] NOT NULL,
	[DoctDireccion] [nvarchar](max) NULL,
	[DoctTelefono] [nvarchar](max) NULL,
	[DoctCelular] [nvarchar](max) NULL,
	[UsuaSecuenciaCreacion] [int] NULL,
	[DoctFechaCreacion] [datetime] NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[DoctFechaModificacion] [datetime] NULL,
	[DoctGenero] [nvarchar](max) NULL,
	[PaisSecuencia] [int] NOT NULL,
	[DoctFotoPath] [nvarchar](max) NULL,
	[DoctFotoNombre] [nvarchar](max) NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Enfermedad]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[Enfermedad](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[EnfeSecuencia] [int] NOT NULL,
	[EnfeNombre] [nvarchar](max) NOT NULL,
	[EnfeDescripcion] [nvarchar](max) NULL,
 CONSTRAINT [PK_Enfermedad] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[EnfeSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Especialidades]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Especialidades](
	[EspeSecuencia] [int] NOT NULL,
	[EspeNombre] [varchar](50) NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Especialidades] PRIMARY KEY CLUSTERED 
(
	[EspeSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[EspecialidadFormularioCampos]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[EspecialidadFormularioCampos](
	[EspeSecuencia_fk] [int] NOT NULL,
	[FormSecuencia_fk] [int] NOT NULL,
	[FCampSecuencia_fk] [int] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_EspecialidadFormularioCampos] PRIMARY KEY CLUSTERED 
(
	[EspeSecuencia_fk] ASC,
	[FormSecuencia_fk] ASC,
	[FCampSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[EstadoAgenda]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[EstadoAgenda](
	[EAgenSecuencia] [int] NOT NULL,
	[EAgenEstado] [varchar](50) NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[EvaluacionFisica]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[EvaluacionFisica](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[EFisiSecuencia] [int] NOT NULL,
	[EFisiCodigoNombre] [nvarchar](max) NOT NULL,
	[EFisiDescripcion] [nvarchar](max) NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_EvaluacionFisica_1] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[EFisiSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Factura]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Factura](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[PersSecuencia_fk] [int] NULL,
	[CPersSecuencia_fk] [int] NULL,
	[FactSecuencia] [int] NOT NULL,
	[FactCodigo] [int] NULL,
	[FactFecha] [smalldatetime] NOT NULL,
	[FEstaSecuencia_fk] [int] NOT NULL,
	[CFisCodigo] [int] NULL,
	[FactNCF] [varchar](25) NULL,
	[TPagoSecuencia_fk] [int] NULL,
	[FactReclamado] [decimal](18, 4) NOT NULL,
	[FactCobertura] [decimal](18, 4) NOT NULL,
	[FactSubtotal] [decimal](18, 4) NOT NULL,
	[FactItbis] [decimal](18, 4) NOT NULL,
	[FactDescuento] [decimal](18, 4) NOT NULL,
	[FactTotal] [decimal](18, 4) NOT NULL,
	[UsuaSecuencia] [int] NOT NULL,
	[FactPorDescuento] [decimal](18, 2) NULL,
	[FactPagado] [decimal](18, 4) NULL,
	[UsuaSecuenciaCreacion] [int] NOT NULL,
	[FactFechaCreacion] [datetime] NOT NULL,
	[UsuaSecuenciaModificacion] [int] NOT NULL,
	[FactFechaModificacion] [datetime] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Factura_1] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[FactSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[FacturaDetalle]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[FacturaDetalle](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[FactSecuencia] [int] NOT NULL,
	[FDetaSecuencia] [int] NOT NULL,
	[FacCodigo] [int] NOT NULL,
	[ProcSecuencia_fk] [int] NOT NULL,
	[FDetaFecha] [smalldatetime] NOT NULL,
	[FDetaCantidad] [decimal](10, 2) NOT NULL,
	[FDetaReclamado] [decimal](18, 4) NOT NULL,
	[FDetaItbis] [decimal](18, 4) NOT NULL,
	[FDetaDescuento] [decimal](18, 4) NOT NULL,
	[FDetaCobertura] [decimal](18, 4) NOT NULL,
	[FDetaDiferencia] [decimal](18, 4) NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_FacturaDetalle] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[FactSecuencia] ASC,
	[FDetaSecuencia] ASC,
	[ProcSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[FacturaEstado]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[FacturaEstado](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[FEstaSecuencia] [int] NOT NULL,
	[FEstaNombre] [varchar](max) NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_FacturaEstado] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[FEstaSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[FormularioCampos]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[FormularioCampos](
	[FCampSecuencia] [int] NOT NULL,
	[FCampIdNombre] [varchar](50) NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_FormularioCampos] PRIMARY KEY CLUSTERED 
(
	[FCampSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Formularios]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Formularios](
	[FormSecuencia] [int] NOT NULL,
	[FormDescripcion] [varchar](50) NOT NULL,
	[TFormSecuencia_fk] [int] NOT NULL,
	[FormPantalla] [nvarchar](50) NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Formularios] PRIMARY KEY CLUSTERED 
(
	[FormSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[FormulariosAccion]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[FormulariosAccion](
	[FAcciSecuencia] [int] NOT NULL,
	[FormSecuencia_fk] [int] NOT NULL,
	[AcciSecuencia_fk] [int] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_FormulariosAccion] PRIMARY KEY CLUSTERED 
(
	[FAcciSecuencia] ASC,
	[FormSecuencia_fk] ASC,
	[AcciSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[GrupoSanguineo]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[GrupoSanguineo](
	[GSangSecuencia] [int] NOT NULL,
	[GSangNombre] [varchar](50) NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_GrupoSanguineo] PRIMARY KEY CLUSTERED 
(
	[GSangSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[HorariosDiaTrabajo]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[HorariosDiaTrabajo](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[HDTrabSecuencia] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Tiempo] [time](7) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Aplicado] [bit] NOT NULL,
	[HDTrabFechaModificacion] [datetime] NOT NULL,
	[UsuaSecuenciaCreacion] [int] NOT NULL,
	[HDTrabFechaCreacion] [datetime] NOT NULL,
	[UsuaSecuenciaModificacion] [int] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_HorariosDiaTrabajo_1] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[Fecha] ASC,
	[Tiempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[ImagenDoctor]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[ImagenDoctor](
	[ImagSecuencia] [int] NOT NULL,
	[Imagen] [varbinary](max) NOT NULL,
	[DoctSecuencia_fk] [int] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_ImagenDoctor] PRIMARY KEY CLUSTERED 
(
	[ImagSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Imagenes]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[Imagenes](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[ImagSecuencia] [int] NOT NULL,
	[ImagCodigo] [nvarchar](max) NULL,
	[ImagNombre] [nvarchar](max) NOT NULL,
	[ImagDescripcion] [nvarchar](max) NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Imagenes] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[ImagSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[InstitucionAseguradoraPlanes]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[InstitucionAseguradoraPlanes](
	[DoctSecuencia] [int] NOT NULL,
	[ClinSecuencia] [int] NOT NULL,
	[ConsSecuencia] [int] NOT NULL,
	[IAsegSecuencia] [int] NOT NULL,
	[IAPlanSecuencia] [int] NOT NULL,
	[IAPlanDescripcion] [nvarchar](max) NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_InstitucionAseguradoraPlanes_1] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia] ASC,
	[ClinSecuencia] ASC,
	[ConsSecuencia] ASC,
	[IAsegSecuencia] ASC,
	[IAPlanSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[InstitucionesAseguradoras]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[InstitucionesAseguradoras](
	[DoctSecuencia] [int] NOT NULL,
	[ClinSecuencia] [int] NOT NULL,
	[ConsSecuencia] [int] NOT NULL,
	[IAsegSecuencia] [int] NOT NULL,
	[IAsegCodigo] [int] NULL,
	[IAsegNombre] [nvarchar](max) NOT NULL,
	[IAsegRNC] [int] NOT NULL,
	[IAsegTelefono] [nvarchar](max) NOT NULL,
	[IAsegCorreo] [nvarchar](max) NULL,
	[IAsegWeb] [nvarchar](max) NULL,
	[usuaSecuenciaCreacion] [int] NULL,
	[usuaSecuenciaModificacion] [int] NULL,
	[IAsegFechaCreacion] [datetime] NULL,
	[IAsegFechaModificacion] [datetime] NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_InstitucionesAseguradoras] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia] ASC,
	[ClinSecuencia] ASC,
	[ConsSecuencia] ASC,
	[IAsegSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[LoginProvider]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[LoginProvider](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UsuaSecuencia] [nvarchar](128) NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_LoginProvider] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UsuaSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Medicamento]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[Medicamento](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[MediSecuencia] [int] NOT NULL,
	[MediCodigo] [nvarchar](max) NULL,
	[MediNombre] [nvarchar](max) NOT NULL,
	[MediLaboratorio] [nvarchar](max) NULL,
	[MediFamilia] [nvarchar](max) NULL,
	[MediDescripcion] [nvarchar](max) NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Medicamento] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[MediSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Moneda]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Moneda](
	[MoneSecuencia] [int] NOT NULL,
	[MoneMoneda] [varchar](50) NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Moneda] PRIMARY KEY CLUSTERED 
(
	[MoneSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[MotivoConsulta]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[MotivoConsulta](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[MConsSecuencia] [int] NOT NULL,
	[MConsMotivoConsulta] [nvarchar](max) NULL,
	[MConsDescripcion] [nvarchar](max) NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_MotivoConsulta] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[MConsSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Paciente]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[Paciente](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia] [int] NOT NULL,
	[PaciCodigo] [nvarchar](max) NULL,
	[PaciDocumento] [nvarchar](max) NULL,
	[TDSecuencia] [int] NOT NULL,
	[PaciNumeroSeguroSocial] [int] NULL,
	[IAsegSecuencia] [int] NULL,
	[IAPlanSecuencia] [int] NULL,
	[PaciNumeroPoliza] [int] NULL,
	[EsMenor] [bit] NOT NULL,
	[PaciNombre] [nvarchar](max) NULL,
	[PaciApellido1] [nvarchar](max) NULL,
	[PaciApellido2] [nvarchar](max) NULL,
	[PaciApodo] [nvarchar](max) NULL,
	[PaciFechaNacimiento] [datetime] NULL,
	[PaciLugarNacimiento] [nvarchar](max) NULL,
	[PaciEdad] [int] NULL,
	[PaciEmail] [nvarchar](max) NULL,
	[PaciFacebook] [nvarchar](max) NULL,
	[PaciDireccion] [nvarchar](max) NULL,
	[PaciTelefono] [nvarchar](max) NULL,
	[PaciCelular] [nvarchar](max) NULL,
	[PaciCodigoPostal] [int] NULL,
	[PaciEstadoCivil] [nvarchar](max) NULL,
	[PaciProfesion] [nvarchar](max) NULL,
	[PaciNombreEmergencia] [nvarchar](max) NULL,
	[PaciApellidoEmergencia] [nvarchar](max) NULL,
	[PaciDireccionEmergencia] [nvarchar](max) NULL,
	[PaciTelefonoEmergencia] [nvarchar](max) NULL,
	[UsuaSecuenciaCreacion] [int] NULL,
	[UsuaFechaCreacion] [datetime] NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[UsuaFechaModificacion] [datetime] NULL,
	[PaciFotoPath] [nvarchar](max) NULL,
	[PaciFotoNombre] [nvarchar](max) NULL,
	[PaciGenero] [nvarchar](max) NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Paciente_1] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[PacienteFoto]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[PacienteFoto](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia] [int] NOT NULL,
	[PFotoSecuencia] [int] NOT NULL,
	[PFoto] [image] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_PacienteFoto] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia] ASC,
	[PFotoSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Pais]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Pais](
	[PaisSecuencia] [int] NOT NULL,
	[PaisNombre] [varchar](100) NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[PaisSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[PediatraParto]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[PediatraParto](
	[Lugar] [nchar](10) NULL,
	[cesaria] [bit] NULL,
	[posicionCefalica] [bit] NULL,
	[posicionPodalica] [bit] NULL,
	[apgar] [varchar](50) NULL,
	[partogamma] [nchar](10) NULL,
	[anestesiaNO] [bit] NULL,
	[anestesiaraquidea] [bit] NULL,
	[anestesiaperidural] [bit] NULL,
	[anestesiatotal] [bit] NULL,
	[observaciones] [varchar](50) NULL,
	[pesokg] [decimal](18, 0) NULL,
	[alturacm] [decimal](18, 0) NULL,
	[pccm] [decimal](18, 0) NULL,
	[ombligoDIas] [int] NULL,
	[OMBLIGOOBSERVACIONES] [nchar](10) NULL,
	[EstaDesabilitado] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[PEDIATRIAeMBARAZO]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[PEDIATRIAeMBARAZO](
	[GESTACIONNumero] [int] NULL,
	[obstetra] [varchar](50) NULL,
	[duracionSemanas] [int] NULL,
	[diabetes] [bit] NULL,
	[hipertension] [bit] NULL,
	[tramatismo] [bit] NULL,
	[infrecciones] [varchar](50) NULL,
	[asma] [varchar](50) NULL,
	[mediacion] [varchar](50) NULL,
	[observacion] [varchar](50) NULL,
	[EstaDesabilitado] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Personal]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Personal](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PersSecuencia] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[PersDocumento] [varchar](50) NOT NULL,
	[TDSecuencia_fk] [int] NOT NULL,
	[UsuaSecuencia] [int] NULL,
	[PersNombre] [varchar](50) NOT NULL,
	[PersApellido] [varchar](50) NOT NULL,
	[PersFechaNacimiento] [datetime] NULL,
	[PersDireccion] [varchar](150) NULL,
	[CPersSecuencia_FK] [int] NOT NULL,
	[PersTelefono] [varchar](50) NULL,
	[PersCelular] [varchar](50) NULL,
	[EstaActivo] [bit] NOT NULL,
	[PersGenero] [varchar](max) NULL,
	[UsuaCreacion] [int] NULL,
	[PersFechaCreacion] [datetime] NULL,
	[UsuaModificacion] [int] NULL,
	[PersFechaModificacion] [datetime] NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PersSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Planes]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Planes](
	[PlanSecuencia] [int] NOT NULL,
	[PlanDescripcion] [varchar](50) NULL,
	[Precio] [decimal](18, 2) NULL,
	[MoneSecuencia_fk] [int] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Planes] PRIMARY KEY CLUSTERED 
(
	[PlanSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[PlanFactura]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[PlanFactura](
	[UsuSecuencia] [int] NOT NULL,
	[PFactSecuencia] [int] NOT NULL,
	[PFactCodigo] [int] NULL,
	[PFactFecha] [smalldatetime] NOT NULL,
	[PFEstaSecuencia_fk] [int] NOT NULL,
	[CFisCodigo] [int] NULL,
	[PFactNCF] [varchar](25) NULL,
	[TPagoSecuencia_fk] [int] NULL,
	[PFactReclamado] [decimal](18, 4) NOT NULL,
	[PFactCobertura] [decimal](18, 4) NOT NULL,
	[PFactSubtotal] [decimal](18, 4) NOT NULL,
	[PFactItbis] [decimal](18, 4) NOT NULL,
	[PFactDescuento] [decimal](18, 4) NOT NULL,
	[PFactTotal] [decimal](18, 4) NOT NULL,
	[UsuaSecuencia] [int] NOT NULL,
	[PFactPorDescuento] [decimal](18, 2) NULL,
	[PFactPagado] [decimal](18, 4) NULL,
	[UsuaSecuenciaCreacion] [int] NOT NULL,
	[PFactFechaCreacion] [datetime] NOT NULL,
	[UsuaSecuenciaModificacion] [int] NOT NULL,
	[PFactFechaModificacion] [datetime] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_PlanFactura] PRIMARY KEY CLUSTERED 
(
	[UsuSecuencia] ASC,
	[PFactSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[PlanFacturaDetalle]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[PlanFacturaDetalle](
	[PFDetaSecuencia] [int] NOT NULL,
	[UsuSecuencia] [int] NOT NULL,
	[PFactSecuencia] [int] NOT NULL,
	[PlanSecuencia_fk] [int] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_PlanFacturaDetalle] PRIMARY KEY CLUSTERED 
(
	[PFDetaSecuencia] ASC,
	[UsuSecuencia] ASC,
	[PFactSecuencia] ASC,
	[PlanSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[PlanFormularios]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[PlanFormularios](
	[PFSecuencia] [int] NOT NULL,
	[PlanSecuencia_fk] [int] NOT NULL,
	[FormSecuencia_fk] [int] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_PlanFormularios_1] PRIMARY KEY CLUSTERED 
(
	[PlanSecuencia_fk] ASC,
	[FormSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[PlanFormularios_copia]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[PlanFormularios_copia](
	[PFSecuencia] [int] NOT NULL,
	[PlanSecuencia_fk] [int] NOT NULL,
	[FormSecuencia_fk] [int] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
	[FormSecuencia] [int] NOT NULL,
	[FormDescripcion] [varchar](50) NOT NULL,
	[TFormSecuencia_fk] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Procedimientos]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Procedimientos](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[ProcSecuencia] [int] NOT NULL,
	[ProcCodigo] [varchar](50) NULL,
	[ProcNombre] [varchar](50) NOT NULL,
	[ProcDescripcion] [varchar](1000) NOT NULL,
	[MoneSecuencia_fk] [int] NULL,
	[ProcPrecio] [decimal](18, 2) NOT NULL,
	[ProcItbis] [decimal](18, 2) NULL,
	[CContSecuencia] [int] NULL,
	[UsuaSecuenciaCreacion] [int] NOT NULL,
	[ProcFechaCreacion] [datetime] NOT NULL,
	[UsuaSecuenciaModificacion] [int] NOT NULL,
	[ProcFechaModificacion] [datetime] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Procedimientos] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[ProcSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[RecetaAnalisisClinico]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[RecetaAnalisisClinico](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[ReceSecuencia_fk] [int] NOT NULL,
	[AClinSecuencia_fk] [int] NOT NULL,
	[RAClinSecuencia] [int] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_RecetaAnalisisClinico] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[ReceSecuencia_fk] ASC,
	[AClinSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[RecetaImagenes]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[RecetaImagenes](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[ReceSecuencia_fk] [int] NOT NULL,
	[ImagSecuencia_fk] [int] NOT NULL,
	[RImagSecuencia] [int] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_RecetaImagenes] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[ReceSecuencia_fk] ASC,
	[ImagSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[RecetaMedicamentos]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[RecetaMedicamentos](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[ReceSecuencia_fk] [int] NOT NULL,
	[MediSecuencia_fk] [int] NOT NULL,
	[RMediSecuencia] [int] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_RecetaMedicamentos] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[ReceSecuencia_fk] ASC,
	[MediSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[RecetaPacienteVacunas]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[RecetaPacienteVacunas](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[VacuSecuencia_fk] [int] NOT NULL,
	[ReceSecuencia_fk] [int] NOT NULL,
	[CMHistSecuencia_fk] [int] NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_RecetaPacienteVacunas] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[VacuSecuencia_fk] ASC,
	[ReceSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Recetas]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[Recetas](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[ReceSecuencia] [int] NOT NULL,
	[CMHistSecuencia_fk] [int] NULL,
	[ReceFecha] [datetime] NOT NULL,
	[ReceInstruccionesFarmacia] [nvarchar](max) NULL,
	[ReceInstruccionesAlPaciente] [nvarchar](max) NULL,
	[ReceComentario] [nvarchar](max) NULL,
	[UsuaSecuenciaCreacion] [int] NULL,
	[UsuaFechaCreacion] [datetime] NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[UsuaFechaModificacion] [datetime] NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Recetas] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[ReceSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Representante]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Representante](
	[ReprDocumento] [varchar](50) NOT NULL,
	[TDocumento] [int] NOT NULL,
	[ReprPadrNombre] [varchar](100) NOT NULL,
	[ReprApellido] [varchar](100) NOT NULL,
	[ReprParentezco] [varchar](50) NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Representante] PRIMARY KEY CLUSTERED 
(
	[ReprDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Role]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Role](
	[RoleSecuencia] [int] NOT NULL,
	[RoleDescripcion] [varchar](max) NOT NULL,
	[UsuaSecuencia] [int] NULL,
	[RoleFechaCreacion] [datetime] NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[RoleFechaModificacion] [datetime] NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[RolFormularios]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[RolFormularios](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[RFSecuencia] [int] NOT NULL,
	[RoleSecuencia_fk] [int] NOT NULL,
	[FormSecuencia_fk] [int] NOT NULL,
	[PlanSecuencia_fk] [int] NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_RolFormularios] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[RFSecuencia] ASC,
	[RoleSecuencia_fk] ASC,
	[FormSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[TipoArchivoPaciente]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[TipoArchivoPaciente](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[TAPaciSecuencia] [int] NOT NULL,
	[TAPaciNombre] [varchar](max) NOT NULL,
 CONSTRAINT [PK_TipoArchivoPaciente] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[TAPaciSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[TipoCompromiso]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[TipoCompromiso](
	[TCompSecuencia] [int] NOT NULL,
	[TCompCodigo] [varchar](50) NULL,
	[TCompNombre] [varchar](50) NOT NULL,
	[TCompDescripcion] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[TipoDocumento]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[TipoDocumento](
	[TDSecuencia] [int] NOT NULL,
	[TDDocumento] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TipoDocumente] PRIMARY KEY CLUSTERED 
(
	[TDSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[TipoFormulario]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[TipoFormulario](
	[TFormSecuencia] [int] NOT NULL,
	[TFormDescripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_TipoFormulario] PRIMARY KEY CLUSTERED 
(
	[TFormSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[TipoIndicacion]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[TipoIndicacion](
	[TIndiSecuencia] [int] NOT NULL,
	[TIndiIndicacion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_TipoIndicacion] PRIMARY KEY CLUSTERED 
(
	[TIndiSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[TipoPago]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[TipoPago](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[TPagoSecuencia] [int] NOT NULL,
 CONSTRAINT [PK_TipoPago] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[TPagoSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Tratamiento]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[Tratamiento](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[TratSecuencia] [int] NOT NULL,
	[TratCodigo] [nvarchar](max) NULL,
	[TratNombre] [nvarchar](max) NOT NULL,
	[TratDescripcion] [nvarchar](max) NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Tratamiento] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[TratSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[UsoMedicamentos]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[UsoMedicamentos](
	[UMediSecuencia] [int] NOT NULL,
	[UMediCodigo] [varchar](50) NULL,
	[UMediViaAdministracion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UsoMedicamentos] PRIMARY KEY CLUSTERED 
(
	[UMediSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Usuario]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[Usuario](
	[UsuaSecuencia] [int] NOT NULL,
	[UsuaEmail] [nvarchar](max) NOT NULL,
	[UsuaClave] [nvarchar](max) NOT NULL,
	[UsuaNombre] [nvarchar](max) NOT NULL,
	[UsuaApellido] [nvarchar](max) NOT NULL,
	[UsuaFechaNacimiento] [datetime] NULL,
	[UsuaGenero] [nvarchar](max) NULL,
	[RoleSecuencia_fk] [int] NULL,
	[UsuaIntentos] [int] NOT NULL,
	[PaisSecuencia] [int] NOT NULL,
	[PlanSecuencia_fk] [int] NULL,
	[EspeSecuencia_fk] [int] NULL,
	[UsuaSecuenciaCreacion] [int] NULL,
	[UsuaFechaCreacion] [datetime] NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[UsuaFechaModificacion] [datetime] NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[UsuaSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[UsuarioConsultorio]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[UsuarioConsultorio](
	[UsuaSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[clinSecuencia_fk] [int] NOT NULL,
	[UConsSecuencia] [int] NOT NULL,
	[clinRazonSocial] [nvarchar](max) NULL,
	[ConsCodigo] [nvarchar](max) NULL,
	[ConsDescripcion] [nvarchar](max) NULL,
	[UsuaSecuenciaCreacion] [int] NULL,
	[UConsFechaCreacion] [datetime] NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[UConsFechaModificacion] [datetime] NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_UsuarioConsultorio_1] PRIMARY KEY CLUSTERED 
(
	[UsuaSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Vacunas]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Vacunas](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[VacuSecuencia] [int] NOT NULL,
	[VacuNombre] [varchar](max) NOT NULL,
	[AEdadAnio] [int] NULL,
	[AEdadMeses] [int] NULL,
	[AEdadDias] [int] NULL,
 CONSTRAINT [PK_Vacunas] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[VacuSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [sdoc].[vw_ConsultorioDoctor]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

create view [sdoc].[vw_ConsultorioDoctor] as
select con.[DoctSecuencia_fk]
      ,con.[ClinSecuencia_fk]
      ,con.[ConsSecuencia]
      ,con.[PaisSecuencia_fk]
      ,con.[ConsCodigo]
      ,con.[ConsDescripcion]
     ,clin.[clinSecuencia]   
      ,clin.[clinRazonSocial]  
    
	  from [sdoc].[Consultorio] con
	  inner join [sdoc].[Clinica] clin
	  on con.ClinSecuencia_fk = clin.clinSecuencia






























GO
/****** Object:  View [sdoc].[vw_ListDeFormuriosbyRolyUser]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   view [sdoc].[vw_ListDeFormuriosbyRolyUser] as
SELECT  

 u.UsuaSecuencia
,rf.PlanSecuencia_fk
,rf.RoleSecuencia_fk
,rf.DoctSecuencia_fk
,rf.RFSecuencia
,rf.FormSecuencia_fk
,f.FormDescripcion
,f.TFormSecuencia_fk
,f.FormPantalla


  FROM 
   [sdoc].[Usuario] u
   inner join   [sdoc].[RolFormularios] rf
on u.RoleSecuencia_fk =rf.RoleSecuencia_fk
    inner join [sdoc].[Formularios] f
on f.FormSecuencia = rf.FormSecuencia_fk



















































GO
/****** Object:  View [sdoc].[vw_planFormulario]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view  [sdoc].[vw_planFormulario] as
SELECT  p.[PlanSecuencia]
      ,p.[PlanDescripcion]
      ,p.[Precio]
      ,p.[MoneSecuencia_fk]
	  ,pf.[PFSecuencia]
      ,pf.[PlanSecuencia_fk]
      ,pf.[FormSecuencia_fk]
	  ,f.FormDescripcion
	  ,f.formPantalla
  FROM [DoctorMedicalWeb].[sdoc].[Planes] p 
  inner join [DoctorMedicalWeb].[sdoc].[PlanFormularios] pf
  on p.plansecuencia = pf.plansecuencia_fk
  inner join sdoc.Formularios f
  on pf.FormSecuencia_fk = f.FormSecuencia































GO
/****** Object:  View [sdoc].[vw_UsuarioConsultorios]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO














   CREATE view [sdoc].[vw_UsuarioConsultorios] as
  --Vista para saber los  clinica consultorio que tiene un doctor Tiene tambien el usuario
  select 
  (isnull(dc.clinRazonSocial,'')+' '+ isnull(dc.[ConsCodigo],'')+' '+ isnull(dc.[ConsDescripcion],'')) AS NombreConsultorio,
dc.UsuaSecuencia_fk
,dc.PaisSecuencia_fk
,dc.clinSecuencia_fk
,dc.ConsSecuencia_fk
,dc.UConsSecuencia
,dc.clinRazonSocial
,dc.ConsCodigo
,dc.ConsDescripcion
,dc.EstaDesabilitado


,usu.UsuaSecuencia
,usu.UsuaEmail
,usu.UsuaClave
,usu.UsuaNombre
,usu.UsuaApellido
--,usu.UsuaFechaNacimiento
,usu.UsuaGenero
,usu.RoleSecuencia_fk
,usu.UsuaIntentos
,usu.PaisSecuencia
,usu.PlanSecuencia_fk
,usu.EspeSecuencia_fk

,usu.UsuaSecuenciaCreacion
,usu.UsuaFechaCreacion
,usu.UsuaSecuenciaModificacion
,usu.UsuaFechaModificacion



 from sdoc.usuario usu
  inner join [sdoc].[UsuarioConsultorio] dc
			 on usu.usuasecuencia  = dc.UsuaSecuencia_fk


  
































GO
/****** Object:  View [sdoc].[vw_UsuarioDoctor]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

create view [sdoc].[vw_UsuarioDoctor] as
SELECT 
u.[UsuaSecuencia]
      ,u.[UsuaEmail]
      ,u.[UsuaClave]
      ,u.[UsuaNombre]
      ,u.[UsuaApellido]
      ,u.[UsuaFechaNacimiento]
      ,u.[UsuaGenero]
      ,u.[RoleSecuencia_fk]
      ,u.[UsuaIntentos]
      ,u.[PaisSecuencia]
      ,u.[PlanSecuencia_fk]
      ,u.[EspeSecuencia_fk]

      ,u.[UsuaSecuenciaCreacion]
      ,u.[UsuaFechaCreacion]
      ,u.[UsuaSecuenciaModificacion]
      ,u.[UsuaFechaModificacion]
	  ,d.[DoctSecuencia]    
      ,d.[DoctCUPRE]
      ,d.[DoctDocumento]
      ,d.[TDSecuencia]
      ,d.[DoctNombre]
      ,d.[DoctApellido]
      ,d.[DoctFechaNacimiento]
      ,d.[EspeSecuencia]
      ,d.[DoctDireccion]
      ,d.[DoctTelefono]
      ,d.[DoctCelular]

      
      ,d.[DoctFechaCreacion]
      
      ,d.[DoctFechaModificacion]

      ,d.[DoctGenero]
      
  FROM [sdoc].[Usuario] u
  inner join sdoc.Doctor d
  on u.UsuaSecuencia = d.UsuSecuencia
  
  






































GO
/****** Object:  View [sdoc].[vw_UsuariosPersonalDelDoctor]    Script Date: 04/20/2017 04:07:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [sdoc].[vw_UsuariosPersonalDelDoctor] as
select 
usu.UsuaSecuencia
,usu.UsuaEmail
,usu.UsuaClave
,usu.UsuaNombre
,usu.UsuaApellido
,usu.UsuaFechaNacimiento
,usu.UsuaGenero
,usu.RoleSecuencia_fk
,usu.UsuaIntentos
,usu.PaisSecuencia
,usu.PlanSecuencia_fk
,usu.EspeSecuencia_fk

,usu.UsuaSecuenciaCreacion
,usu.UsuaFechaCreacion
,usu.UsuaSecuenciaModificacion
,usu.UsuaFechaModificacion 

,per.DoctSecuencia_fk
,per.PersSecuencia
--,per.PaisSecuencia_fk
--,per.PersDocumento
--,per.TDSecuencia_fk
--,per.UsuaSecuencia
--,per.PersNombre
--,per.PersApellido
--,per.PersFechaNacimiento
--,per.PersDireccion
--,per.CPersSecuencia_FK
--,per.PersTelefono
--,per.PersCelular
--,per.EstaActivo
--,per.PersGenero
--,per.UsuaCreacion

--,per.UsuaModificacion
--,per.PersFechaModificacion
from [sdoc].[Usuario] usu
inner join [sdoc].[Personal] per
on usu.usuaSecuencia = per.UsuaSecuencia
































GO
INSERT [sdoc].[Alergia] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [AlerSecuencia], [AlerNombre], [AlerDescripcion]) VALUES (1, 1, 1, 1, 1, N'alergia', N'desci')
INSERT [sdoc].[Alergia] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [AlerSecuencia], [AlerNombre], [AlerDescripcion]) VALUES (1, 1, 1, 1, 2, N'alergia2', N'des')
INSERT [sdoc].[AnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [AClinSecuencia], [AClinCodigo], [AClinNombre], [AClinDescripcion], [AClinTipoDeMuestra], [AClinTiempoDeProceso], [AClinCondicionesDelPaciente], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, NULL, N'analisi modifdi', N'adnadffsf3 modifdid', NULL, NULL, NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 19:42:09.037' AS DateTime), CAST(N'2017-04-11 19:42:09.047' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 19:42:53.983' AS DateTime), CAST(N'2017-04-11 19:42:53.983' AS DateTime), NULL, NULL, 1, N'::1', N'pag_RolePages', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 19:43:09.300' AS DateTime), CAST(N'2017-04-11 19:43:09.300' AS DateTime), NULL, NULL, 1, N'::1', N'pag_RolePages', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (4, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 19:43:31.597' AS DateTime), CAST(N'2017-04-11 19:43:31.597' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (5, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 19:44:47.140' AS DateTime), CAST(N'2017-04-11 19:44:47.140' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Medicamentos', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (6, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 19:45:05.450' AS DateTime), CAST(N'2017-04-11 19:45:05.450' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Medicamentos', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (7, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 19:45:20.547' AS DateTime), CAST(N'2017-04-11 19:45:20.547' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Medicamentos', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (8, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 19:45:37.310' AS DateTime), CAST(N'2017-04-11 19:45:37.310' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Medicamentos', NULL, N'Borrar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (9, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 19:45:48.187' AS DateTime), CAST(N'2017-04-11 19:45:48.187' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Medicamentos', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (10, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 19:46:07.547' AS DateTime), CAST(N'2017-04-11 19:46:07.547' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Medicamentos', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (11, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 19:46:19.467' AS DateTime), CAST(N'2017-04-11 19:46:19.467' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Medicamentos', NULL, N'Borrar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (12, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 20:50:42.743' AS DateTime), CAST(N'2017-04-11 20:50:42.753' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (13, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 20:51:12.647' AS DateTime), CAST(N'2017-04-11 20:51:12.647' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Imagenes', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (14, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 20:51:21.560' AS DateTime), CAST(N'2017-04-11 20:51:21.560' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Imagenes', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (15, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 20:51:31.900' AS DateTime), CAST(N'2017-04-11 20:51:31.900' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Imagenes', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (16, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 20:51:51.893' AS DateTime), CAST(N'2017-04-11 20:51:51.893' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Imagenes', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (17, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 20:51:57.887' AS DateTime), CAST(N'2017-04-11 20:51:57.887' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Imagenes', NULL, N'Borrar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (18, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 20:52:16.623' AS DateTime), CAST(N'2017-04-11 20:52:16.623' AS DateTime), NULL, NULL, 1, N'::1', N'pag_AnalisisClinico', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (19, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 20:52:28.443' AS DateTime), CAST(N'2017-04-11 20:52:28.443' AS DateTime), NULL, NULL, 1, N'::1', N'pag_AnalisisClinico', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (20, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 20:52:38.913' AS DateTime), CAST(N'2017-04-11 20:52:38.913' AS DateTime), NULL, NULL, 1, N'::1', N'pag_AnalisisClinico', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (21, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 20:52:45.147' AS DateTime), CAST(N'2017-04-11 20:52:45.147' AS DateTime), NULL, NULL, 1, N'::1', N'pag_AnalisisClinico', NULL, N'Borrar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (22, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-11 22:09:08.120' AS DateTime), CAST(N'2017-04-11 22:09:08.153' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (23, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 11:39:46.267' AS DateTime), CAST(N'2017-04-12 11:39:46.300' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (24, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 12:11:58.533' AS DateTime), CAST(N'2017-04-12 12:11:58.677' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (25, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 12:20:31.227' AS DateTime), CAST(N'2017-04-12 12:20:31.233' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (26, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 12:25:37.760' AS DateTime), CAST(N'2017-04-12 12:25:37.763' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (27, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 12:52:48.230' AS DateTime), CAST(N'2017-04-12 12:52:48.237' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (28, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 13:11:09.343' AS DateTime), CAST(N'2017-04-12 13:11:09.347' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (29, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 13:11:37.547' AS DateTime), CAST(N'2017-04-12 13:11:37.553' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (30, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 13:11:47.527' AS DateTime), CAST(N'2017-04-12 13:11:47.527' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (31, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 13:25:08.407' AS DateTime), CAST(N'2017-04-12 13:25:08.407' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (32, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 13:32:51.897' AS DateTime), CAST(N'2017-04-12 13:32:51.900' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (33, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 13:38:41.477' AS DateTime), CAST(N'2017-04-12 13:38:41.483' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (34, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 13:50:54.473' AS DateTime), CAST(N'2017-04-12 13:50:54.477' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (35, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 14:10:50.887' AS DateTime), CAST(N'2017-04-12 14:10:50.890' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (36, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 14:13:59.767' AS DateTime), CAST(N'2017-04-12 14:13:59.773' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (37, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 14:36:37.013' AS DateTime), CAST(N'2017-04-12 14:36:37.017' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (38, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 14:39:14.707' AS DateTime), CAST(N'2017-04-12 14:39:14.707' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (39, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 14:39:15.577' AS DateTime), CAST(N'2017-04-12 14:39:15.577' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Error', N'The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.', 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (40, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 14:42:59.333' AS DateTime), CAST(N'2017-04-12 14:42:59.337' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (41, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 14:44:07.820' AS DateTime), CAST(N'2017-04-12 14:44:07.820' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (42, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 14:49:01.143' AS DateTime), CAST(N'2017-04-12 14:49:01.150' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (43, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 14:49:34.963' AS DateTime), CAST(N'2017-04-12 14:49:34.963' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (44, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 15:11:17.583' AS DateTime), CAST(N'2017-04-12 15:11:17.593' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (45, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 15:22:58.863' AS DateTime), CAST(N'2017-04-12 15:22:58.870' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (46, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 15:37:02.140' AS DateTime), CAST(N'2017-04-12 15:37:02.243' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (47, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 15:38:20.937' AS DateTime), CAST(N'2017-04-12 15:38:20.937' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Paciente', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (48, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 15:41:15.773' AS DateTime), CAST(N'2017-04-12 15:41:15.780' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (49, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 15:42:37.947' AS DateTime), CAST(N'2017-04-12 15:42:37.947' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (50, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 16:00:58.727' AS DateTime), CAST(N'2017-04-12 16:00:58.727' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (51, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 16:01:55.750' AS DateTime), CAST(N'2017-04-12 16:01:55.750' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Error', N'Violation of PRIMARY KEY constraint ''PK_Recetas''. Cannot insert duplicate key in object ''sdoc.Recetas''. The duplicate key value is (1, 1, 1, 1, 1, 1).
The statement has been terminated.', 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (52, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 16:03:55.880' AS DateTime), CAST(N'2017-04-12 16:03:55.883' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (53, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 16:04:53.690' AS DateTime), CAST(N'2017-04-12 16:04:53.690' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (54, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 16:37:49.603' AS DateTime), CAST(N'2017-04-12 16:37:49.607' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (55, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 16:40:40.150' AS DateTime), CAST(N'2017-04-12 16:40:40.153' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (56, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 16:45:44.470' AS DateTime), CAST(N'2017-04-12 16:45:44.470' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (57, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-12 16:45:46.800' AS DateTime), CAST(N'2017-04-12 16:45:46.800' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Error', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_RecetaAnalisisClinico_AnalisisClinico". The conflict occurred in database "DoctorMedicalWeb", table "sdoc.AnalisisClinico".
The statement has been terminated.', 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (58, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 08:01:31.447' AS DateTime), CAST(N'2017-04-13 08:01:31.457' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (59, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 08:02:58.357' AS DateTime), CAST(N'2017-04-13 08:02:58.357' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (60, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 08:13:07.663' AS DateTime), CAST(N'2017-04-13 08:13:07.667' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (61, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 08:15:46.250' AS DateTime), CAST(N'2017-04-13 08:15:46.250' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (62, 1, 2, 2, 2, 0, NULL, CAST(N'2017-04-13 08:18:40.337' AS DateTime), CAST(N'2017-04-13 08:18:40.337' AS DateTime), NULL, NULL, 2, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (63, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 08:31:46.423' AS DateTime), CAST(N'2017-04-13 08:31:46.440' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (64, 1, 2, 2, 2, 0, NULL, CAST(N'2017-04-13 08:32:28.633' AS DateTime), CAST(N'2017-04-13 08:32:28.633' AS DateTime), NULL, NULL, 2, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (65, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 08:32:37.600' AS DateTime), CAST(N'2017-04-13 08:32:37.600' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (66, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 08:57:34.197' AS DateTime), CAST(N'2017-04-13 08:57:34.200' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (67, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 09:04:50.847' AS DateTime), CAST(N'2017-04-13 09:04:50.853' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (68, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 09:10:32.787' AS DateTime), CAST(N'2017-04-13 09:10:32.790' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (69, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 09:12:59.353' AS DateTime), CAST(N'2017-04-13 09:12:59.353' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (70, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 09:15:33.800' AS DateTime), CAST(N'2017-04-13 09:15:33.800' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (71, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 09:21:34.723' AS DateTime), CAST(N'2017-04-13 09:21:34.723' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (72, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 09:37:28.420' AS DateTime), CAST(N'2017-04-13 09:37:28.427' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (73, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 09:47:26.477' AS DateTime), CAST(N'2017-04-13 09:47:26.480' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (74, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 09:52:06.387' AS DateTime), CAST(N'2017-04-13 09:52:06.390' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (75, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 09:52:50.547' AS DateTime), CAST(N'2017-04-13 09:52:50.547' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Error', N'Object reference not set to an instance of an object.', 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (76, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 10:01:51.047' AS DateTime), CAST(N'2017-04-13 10:01:51.053' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (77, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 10:04:03.077' AS DateTime), CAST(N'2017-04-13 10:04:03.080' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (78, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 10:07:44.087' AS DateTime), CAST(N'2017-04-13 10:07:44.087' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (79, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 10:08:19.593' AS DateTime), CAST(N'2017-04-13 10:08:19.593' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Error', N'Object reference not set to an instance of an object.', 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (80, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 10:12:41.440' AS DateTime), CAST(N'2017-04-13 10:12:41.440' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Error', N'Object reference not set to an instance of an object.', 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (81, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 10:25:42.023' AS DateTime), CAST(N'2017-04-13 10:25:42.027' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (82, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 10:26:47.367' AS DateTime), CAST(N'2017-04-13 10:26:47.367' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (83, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 10:27:01.313' AS DateTime), CAST(N'2017-04-13 10:27:01.313' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (84, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 10:27:12.490' AS DateTime), CAST(N'2017-04-13 10:27:12.490' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (85, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 10:29:33.383' AS DateTime), CAST(N'2017-04-13 10:29:33.383' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Paciente', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (86, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 10:30:02.573' AS DateTime), CAST(N'2017-04-13 10:30:02.573' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (87, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 10:40:16.973' AS DateTime), CAST(N'2017-04-13 10:40:16.977' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (88, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 10:42:12.023' AS DateTime), CAST(N'2017-04-13 10:42:12.027' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (89, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 10:56:26.803' AS DateTime), CAST(N'2017-04-13 10:56:26.820' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (90, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 10:58:22.773' AS DateTime), CAST(N'2017-04-13 10:58:22.777' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (91, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 10:59:42.360' AS DateTime), CAST(N'2017-04-13 10:59:42.367' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (92, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:01:31.137' AS DateTime), CAST(N'2017-04-13 11:01:31.140' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (93, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:07:22.820' AS DateTime), CAST(N'2017-04-13 11:07:22.827' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (94, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:12:36.457' AS DateTime), CAST(N'2017-04-13 11:12:36.460' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (95, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:14:28.967' AS DateTime), CAST(N'2017-04-13 11:14:28.967' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Borrar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (96, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:15:04.223' AS DateTime), CAST(N'2017-04-13 11:15:04.223' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (97, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:15:30.143' AS DateTime), CAST(N'2017-04-13 11:15:30.143' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (98, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:16:43.930' AS DateTime), CAST(N'2017-04-13 11:16:43.930' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (99, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:17:05.197' AS DateTime), CAST(N'2017-04-13 11:17:05.197' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (100, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:17:14.247' AS DateTime), CAST(N'2017-04-13 11:17:14.247' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
GO
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (101, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:17:24.540' AS DateTime), CAST(N'2017-04-13 11:17:24.540' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (102, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:23:56.547' AS DateTime), CAST(N'2017-04-13 11:23:56.550' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (103, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:24:32.927' AS DateTime), CAST(N'2017-04-13 11:24:32.927' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (104, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:25:47.730' AS DateTime), CAST(N'2017-04-13 11:25:47.730' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (105, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:26:10.227' AS DateTime), CAST(N'2017-04-13 11:26:10.227' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (106, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:26:29.637' AS DateTime), CAST(N'2017-04-13 11:26:29.637' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Borrar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (107, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:26:57.687' AS DateTime), CAST(N'2017-04-13 11:26:57.687' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (108, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:35:08.257' AS DateTime), CAST(N'2017-04-13 11:35:08.257' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (109, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:35:39.240' AS DateTime), CAST(N'2017-04-13 11:35:39.240' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (110, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:37:01.857' AS DateTime), CAST(N'2017-04-13 11:37:01.857' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Borrar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (111, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:40:12.307' AS DateTime), CAST(N'2017-04-13 11:40:12.307' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Borrar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (112, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 11:40:19.883' AS DateTime), CAST(N'2017-04-13 11:40:19.883' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Borrar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (113, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 20:31:29.920' AS DateTime), CAST(N'2017-04-13 20:31:29.920' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (114, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 20:36:37.557' AS DateTime), CAST(N'2017-04-13 20:36:37.557' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (115, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 20:49:47.373' AS DateTime), CAST(N'2017-04-13 20:49:47.380' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (116, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-13 23:17:06.157' AS DateTime), CAST(N'2017-04-13 23:17:06.163' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (117, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-14 16:01:47.397' AS DateTime), CAST(N'2017-04-14 16:01:47.430' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (118, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-14 16:19:38.167' AS DateTime), CAST(N'2017-04-14 16:19:38.177' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (119, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-15 22:33:14.087' AS DateTime), CAST(N'2017-04-15 22:33:14.097' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (120, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-16 07:58:46.950' AS DateTime), CAST(N'2017-04-16 07:58:46.957' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (121, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-16 10:03:29.267' AS DateTime), CAST(N'2017-04-16 10:03:29.277' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (122, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-17 09:53:36.250' AS DateTime), CAST(N'2017-04-17 09:53:36.257' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (123, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-17 10:30:55.183' AS DateTime), CAST(N'2017-04-17 10:30:55.183' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (124, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-17 10:31:24.003' AS DateTime), CAST(N'2017-04-17 10:31:24.003' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (125, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-17 11:38:09.157' AS DateTime), CAST(N'2017-04-17 11:38:09.157' AS DateTime), NULL, NULL, 1, N'::1', N'pag_EvaluacionFisica', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (126, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-17 12:14:27.357' AS DateTime), CAST(N'2017-04-17 12:14:27.363' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (127, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-17 12:41:25.190' AS DateTime), CAST(N'2017-04-17 12:41:25.193' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (128, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-17 13:45:09.247' AS DateTime), CAST(N'2017-04-17 13:45:09.253' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (129, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-17 14:06:28.213' AS DateTime), CAST(N'2017-04-17 14:06:28.213' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'pag_EvaluacionFisica', NULL, N'Editar', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (130, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-17 14:16:36.827' AS DateTime), CAST(N'2017-04-17 14:16:36.840' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (131, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-17 15:30:49.110' AS DateTime), CAST(N'2017-04-17 15:30:49.117' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (132, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-17 15:54:56.107' AS DateTime), CAST(N'2017-04-17 15:54:56.110' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (133, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-17 16:02:04.503' AS DateTime), CAST(N'2017-04-17 16:02:04.507' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (134, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-18 08:52:36.643' AS DateTime), CAST(N'2017-04-18 08:52:36.647' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (135, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-18 10:24:41.513' AS DateTime), CAST(N'2017-04-18 10:24:41.513' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (136, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-18 11:08:39.153' AS DateTime), CAST(N'2017-04-18 11:08:39.163' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (137, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-18 11:44:26.657' AS DateTime), CAST(N'2017-04-18 11:44:26.660' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (138, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-18 13:16:30.397' AS DateTime), CAST(N'2017-04-18 13:16:30.400' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (139, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-18 13:50:44.753' AS DateTime), CAST(N'2017-04-18 13:50:44.767' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (140, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-18 14:30:21.940' AS DateTime), CAST(N'2017-04-18 14:30:21.943' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (141, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-18 15:50:32.407' AS DateTime), CAST(N'2017-04-18 15:50:32.410' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (142, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-18 15:59:56.787' AS DateTime), CAST(N'2017-04-18 15:59:56.790' AS DateTime), NULL, NULL, 1, N'127.0.0.1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (143, 1, 1, 1, 1, 0, NULL, CAST(N'2017-04-20 08:56:09.607' AS DateTime), CAST(N'2017-04-20 08:56:09.610' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [sdoc].[CategoriaPersonal] ([DoctSecuencia_fk], [CPersSecuencia], [CPersNombre], [UsuaSecuencia], [CPersFechaCreacion], [UsuaSecuenciaModificacion], [CPersFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, N'Secretaria', 1, CAST(N'2017-04-03 08:10:14.173' AS DateTime), NULL, CAST(N'2017-04-03 08:10:14.173' AS DateTime), 0)
INSERT [sdoc].[CategoriaPersonal] ([DoctSecuencia_fk], [CPersSecuencia], [CPersNombre], [UsuaSecuencia], [CPersFechaCreacion], [UsuaSecuenciaModificacion], [CPersFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, N'Secretaria', 2, CAST(N'2017-04-03 11:18:26.397' AS DateTime), NULL, CAST(N'2017-04-03 11:18:26.397' AS DateTime), 0)
INSERT [sdoc].[CategoriaPersonal] ([DoctSecuencia_fk], [CPersSecuencia], [CPersNombre], [UsuaSecuencia], [CPersFechaCreacion], [UsuaSecuenciaModificacion], [CPersFechaModificacion], [EstaDesabilitado]) VALUES (3, 1, N'Secretaria', 3, CAST(N'2017-02-12 12:01:41.787' AS DateTime), 3, CAST(N'2017-02-12 13:49:44.427' AS DateTime), 0)
INSERT [sdoc].[CategoriaPersonal] ([DoctSecuencia_fk], [CPersSecuencia], [CPersNombre], [UsuaSecuencia], [CPersFechaCreacion], [UsuaSecuenciaModificacion], [CPersFechaModificacion], [EstaDesabilitado]) VALUES (3, 2, N'Doctor Suplente', 3, CAST(N'2017-02-12 12:01:50.747' AS DateTime), 3, CAST(N'2017-02-12 13:31:41.637' AS DateTime), 0)
INSERT [sdoc].[Clinica] ([clinSecuencia], [PaisSecuencia_fk], [clinRazonSocial], [clinEstablecimiento], [clinOrganismoSuperior], [clinDireccion], [clinTelefono], [clinTelefono2], [clinRNC], [clinFax], [clinPaginaWeb], [clinEmail], [clinFotoName], [clinFotoPath], [clinCuerpoCartaCabecera], [clinCuerpoCartaPie], [clinLatitud], [clinLongitud], [clinEstaBorrado], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [clinFechaCreacion], [clinFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, N'Abel Gonzales', N'sdfsd', NULL, N'Independencia #101', N'(809) 682-6001', NULL, 6541, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, CAST(N'2017-03-30 10:13:07.000' AS DateTime), CAST(N'2017-03-30 10:52:11.313' AS DateTime), 0)
INSERT [sdoc].[Clinica] ([clinSecuencia], [PaisSecuencia_fk], [clinRazonSocial], [clinEstablecimiento], [clinOrganismoSuperior], [clinDireccion], [clinTelefono], [clinTelefono2], [clinRNC], [clinFax], [clinPaginaWeb], [clinEmail], [clinFotoName], [clinFotoPath], [clinCuerpoCartaCabecera], [clinCuerpoCartaPie], [clinLatitud], [clinLongitud], [clinEstaBorrado], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [clinFechaCreacion], [clinFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, N'clinRazonSocial', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [sdoc].[Consultorio] ([DoctSecuencia_fk], [ConsSecuencia], [ClinSecuencia_fk], [PaisSecuencia_fk], [ConsCodigo], [ConsDescripcion], [ConsDireccion], [ConsTelefono], [ConsExtencion], [ConsTelefono2], [ConsExtension2], [UsuaSecuenciaCreacion], [ConsFechaCreacion], [UsuaSecuenciaModificacion], [ConsFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, N'codi', N'Conul1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [sdoc].[Consultorio] ([DoctSecuencia_fk], [ConsSecuencia], [ClinSecuencia_fk], [PaisSecuencia_fk], [ConsCodigo], [ConsDescripcion], [ConsDireccion], [ConsTelefono], [ConsExtencion], [ConsTelefono2], [ConsExtension2], [UsuaSecuenciaCreacion], [ConsFechaCreacion], [UsuaSecuenciaModificacion], [ConsFechaModificacion], [EstaDesabilitado]) VALUES (2, 2, 2, 1, N'ConsCodigo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [sdoc].[Consultorio] ([DoctSecuencia_fk], [ConsSecuencia], [ClinSecuencia_fk], [PaisSecuencia_fk], [ConsCodigo], [ConsDescripcion], [ConsDireccion], [ConsTelefono], [ConsExtencion], [ConsTelefono2], [ConsExtension2], [UsuaSecuenciaCreacion], [ConsFechaCreacion], [UsuaSecuenciaModificacion], [ConsFechaModificacion], [EstaDesabilitado]) VALUES (2, 3, 2, 1, N'258', NULL, NULL, NULL, NULL, NULL, NULL, 2, CAST(N'2017-04-03 11:06:51.707' AS DateTime), NULL, NULL, 0)
INSERT [sdoc].[Diagnostico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DiagSecuencia], [DiagCodigo], [DiagNombre], [DiagDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, NULL, N'primer diagnostico', NULL, 0)
INSERT [sdoc].[Diagnostico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DiagSecuencia], [DiagCodigo], [DiagNombre], [DiagDescripcion], [EstaDesabilitado]) VALUES (2, 1, 2, 2, 1, NULL, N'diagnostico', NULL, 0)
INSERT [sdoc].[Diagnostico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DiagSecuencia], [DiagCodigo], [DiagNombre], [DiagDescripcion], [EstaDesabilitado]) VALUES (2, 1, 2, 2, 2, NULL, N'form', NULL, 0)
INSERT [sdoc].[Diagnostico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DiagSecuencia], [DiagCodigo], [DiagNombre], [DiagDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 1, NULL, N'Gripe Aviar', N'Problemas de gallina', 0)
INSERT [sdoc].[Diagnostico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DiagSecuencia], [DiagCodigo], [DiagNombre], [DiagDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 2, NULL, N'gf', NULL, 0)
INSERT [sdoc].[Diagnostico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DiagSecuencia], [DiagCodigo], [DiagNombre], [DiagDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 3, NULL, N'g', NULL, 0)
INSERT [sdoc].[Doctor] ([DoctSecuencia], [UsuSecuencia], [DoctCUPRE], [DoctDocumento], [TDSecuencia], [DoctNombre], [DoctApellido], [DoctFechaNacimiento], [EspeSecuencia], [DoctDireccion], [DoctTelefono], [DoctCelular], [UsuaSecuenciaCreacion], [DoctFechaCreacion], [UsuaSecuenciaModificacion], [DoctFechaModificacion], [DoctGenero], [PaisSecuencia], [DoctFotoPath], [DoctFotoNombre], [EstaDesabilitado]) VALUES (1, 1, NULL, N'23242', 1, N'DoctAmin', N'sdfsdf', NULL, 1, N'123', N'(111) 111-1111', N'(111) 111-1111', NULL, NULL, 1, CAST(N'2017-04-07 13:55:05.700' AS DateTime), N'Femenino', 1, N'~/ImagenesUploads/Doctor1.png', N'Doctor1.png', 0)
INSERT [sdoc].[Doctor] ([DoctSecuencia], [UsuSecuencia], [DoctCUPRE], [DoctDocumento], [TDSecuencia], [DoctNombre], [DoctApellido], [DoctFechaNacimiento], [EspeSecuencia], [DoctDireccion], [DoctTelefono], [DoctCelular], [UsuaSecuenciaCreacion], [DoctFechaCreacion], [UsuaSecuenciaModificacion], [DoctFechaModificacion], [DoctGenero], [PaisSecuencia], [DoctFotoPath], [DoctFotoNombre], [EstaDesabilitado]) VALUES (2, 2, NULL, N'00000000001', 1, N'Melba', N'Apellido', CAST(N'1908-10-22 00:00:00.000' AS DateTime), 1, N'Direccion Localidad', N'(555) 555-5555', N'(888) 888-8888', NULL, NULL, 2, CAST(N'2017-04-03 10:49:11.607' AS DateTime), N'Femenino', 1, N'~/ImagenesUploads/Doctor2.gif', N'Doctor2.gif', 0)
INSERT [sdoc].[Enfermedad] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EnfeSecuencia], [EnfeNombre], [EnfeDescripcion]) VALUES (1, 1, 1, 1, 1, N'ENFERMEDAD', N'EDE')
INSERT [sdoc].[Enfermedad] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EnfeSecuencia], [EnfeNombre], [EnfeDescripcion]) VALUES (1, 1, 1, 1, 2, N'enf2', NULL)
INSERT [sdoc].[Enfermedad] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EnfeSecuencia], [EnfeNombre], [EnfeDescripcion]) VALUES (1, 1, 1, 1, 3, N'enfer3', NULL)
INSERT [sdoc].[Especialidades] ([EspeSecuencia], [EspeNombre], [EstaDesabilitado]) VALUES (1, N'Ginecología', 0)
INSERT [sdoc].[Especialidades] ([EspeSecuencia], [EspeNombre], [EstaDesabilitado]) VALUES (2, N'Cardiología', 0)
INSERT [sdoc].[Especialidades] ([EspeSecuencia], [EspeNombre], [EstaDesabilitado]) VALUES (3, N'Endocrinologia', 0)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, N'CORAZON', NULL, 0)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, N'TIROIDES', NULL, 0)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 3, N'PULMONES', NULL, 0)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 4, N'ABDOMEN', NULL, 0)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 5, N'GENITALES EXTERNOS', NULL, 0)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 6, N'TACTO VAGINAL', NULL, 0)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 7, N'EXTREMIDADES INFERIORES', NULL, 0)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 1, N'Evaluacion Fisica2', N'Evaluacion descripcion2', 0)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 2, N'sdfefe', N'dfefefe', 0)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 3, N'sdefefe', NULL, 0)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 4, N'f', NULL, 0)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 5, N'sfsf5', N'dffefe5', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (1, N'pag_Consulta', 1, N'Consulta', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (2, N'pag_Paciente', 1, N'Paciente', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (3, N'pag_Personal', 1, N'Personal', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (4, N'pag_Cita', 1, N'Cita', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (5, N'pag_Agenda', 1, N'Agenda', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (6, N'pag_FacturacionMenu', 1, N'FacturacionMenu', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (7, N'pag_Facturacion', 1, N'Facturacion', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (8, N'pag_Caja', 1, N'Caja', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (9, N'pag_MantenimientoMenu', 1, N'MantenimientoMenu', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (10, N'pag_Diagnosticos', 1, N'Diagnosticos', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (11, N'pag_TipoDiagnosticos', 2, N'TipoDiagnosticos', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (13, N'pag_Procedimientos', 1, N'Procedimientos', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (14, N'Mantenimiento_pag_Consultorio', 1, N'Mantenimiento_pag_Consultorio', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (15, N'pag_ConfiguracionMenu', 1, N'ConfiguracionMenu', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (16, N'Configuracion_pag_Consultorio', 1, N'Configuracion Consultorio', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (17, N'pag_Doctor', 1, N'Doctor', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (18, N'Ini_TipoFormulario', 1, N'TipoFormulario', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (19, N'PruebaAngular', 1, N'PruebaAngular', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (20, N'pag_HorarioTrabajo', 1, N'HorarioTrabajo', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (21, N'pag_InstitucionesAseguradoras', 1, N'InstitucionesAseguradoras', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (22, N'pag_SeguridadMenu', 2, N'SeguridadMenu', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (23, N'pag_Auditoria', 1, N'Auditoria', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (24, N'pag_UsuarioPersonal', 1, N'Usuario del  Personal', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (25, N'pag_Acciones', 1, N'Acciones', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (26, N'pag_Roles', 1, N'Pefil', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (27, N'pag_Receta', 1, N'Receta', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (28, N'pag_ContabilidadMenu', 2, N'ContabilidadMenu', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (29, N'pag_607', 1, N'Reporte_607', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (30, N'pag_BackupExcelConsulta', 1, N'BackupExcelConsulta', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (31, N'pag_CitaPacienteEnLinea', 1, N'CitaPacienteEnLinea', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (32, N'pag_DigitalizacionConsultas', 1, N'DigitalizacionConsultas', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (33, N'pag_CategoriaPersonal', 1, N'CategoriaPersonal', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (34, N'Rolelista', 1, N'Perfil Lista', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (35, N'TipoFormulariolista', 1, N'TipoFormulariolista', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (36, N'Pag_CategoriaPersonalLista', 1, N'CategoriaPersonalLista', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (38, N'pag_RolePages', 1, N'Asignar Pagina a Perfil', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (39, N'pag_MotivoConsulta', 1, N'Motivo de Consulta', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (40, N'pag_Tratamiento', 1, N'Tratamiento', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (41, N'pag_EvaluacionFisica', 1, N'Evaluación Física', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (42, N'pag_Clinica', 1, N'Clinica', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (43, N'pag_Consultorio', 1, N'Consultorio', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (44, N'pag_UsuarioDoctor', 1, N'Usuario del  Doctor', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (45, N'pag_Alergia', 1, N'Alergia', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (46, N'pag_Enfermedad', 1, N'Enfermedad', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (47, N'pag_Medicamentos', 1, N'Medicamentos', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (48, N'pag_AnalisisClinico', 1, N'Análisis Clínico', 0)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (49, N'pag_Imagenes', 1, N'Imagenes', 0)
INSERT [sdoc].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (1, N'A+', 0)
INSERT [sdoc].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (2, N'A-', 0)
INSERT [sdoc].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (3, N'B+', 0)
INSERT [sdoc].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (4, N'B-', 0)
INSERT [sdoc].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (5, N'AB+', 0)
INSERT [sdoc].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (6, N'AB-', 0)
INSERT [sdoc].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (7, N'O+', 0)
INSERT [sdoc].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (8, N'O-', 0)
INSERT [sdoc].[Imagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [ImagSecuencia], [ImagCodigo], [ImagNombre], [ImagDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, NULL, N'imagen2', N'imgaen4444', 0)
INSERT [sdoc].[Imagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [ImagSecuencia], [ImagCodigo], [ImagNombre], [ImagDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, NULL, N'imagend 55Modifica', N'dsfsdfe', 0)
INSERT [sdoc].[Medicamento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MediSecuencia], [MediCodigo], [MediNombre], [MediLaboratorio], [MediFamilia], [MediDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, NULL, N'med2', N'lab2', N'fami2', N'descrip2', 0)
INSERT [sdoc].[Medicamento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MediSecuencia], [MediCodigo], [MediNombre], [MediLaboratorio], [MediFamilia], [MediDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 3, NULL, N'modificado', N'lab3', N'fami3', N'descri3', 0)
INSERT [sdoc].[Moneda] ([MoneSecuencia], [MoneMoneda], [EstaDesabilitado]) VALUES (1, N'USD', 0)
INSERT [sdoc].[MotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MConsSecuencia], [MConsMotivoConsulta], [MConsDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, N'Dolor de Cabeza', NULL, 0)
INSERT [sdoc].[MotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MConsSecuencia], [MConsMotivoConsulta], [MConsDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, N'Dolor Cuello', NULL, 0)
INSERT [sdoc].[MotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MConsSecuencia], [MConsMotivoConsulta], [MConsDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 3, N'Dolor ojos', NULL, 0)
INSERT [sdoc].[MotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MConsSecuencia], [MConsMotivoConsulta], [MConsDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 1, N'tt', NULL, 0)
INSERT [sdoc].[MotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MConsSecuencia], [MConsMotivoConsulta], [MConsDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 2, N'sd', NULL, 0)
INSERT [sdoc].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, NULL, N'3343', 1, NULL, NULL, NULL, NULL, 0, N'pacient', N'apee', N'ape2', NULL, CAST(N'2017-04-12 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2017-04-12 15:38:20.920' AS DateTime), NULL, NULL, NULL, NULL, N'Masculino', 0)
INSERT [sdoc].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, NULL, N'2232', 1, NULL, NULL, NULL, NULL, 0, N'dfg', N'grgr', N'fgddfg', NULL, CAST(N'2017-04-26 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2017-04-13 10:29:33.370' AS DateTime), NULL, NULL, NULL, NULL, N'Masculino', 0)
INSERT [sdoc].[Pais] ([PaisSecuencia], [PaisNombre], [EstaDesabilitado]) VALUES (1, N'Rep.Dom.', 0)
INSERT [sdoc].[Pais] ([PaisSecuencia], [PaisNombre], [EstaDesabilitado]) VALUES (2, N'Puerto Republica', 0)
INSERT [sdoc].[Personal] ([DoctSecuencia_fk], [PersSecuencia], [PaisSecuencia_fk], [PersDocumento], [TDSecuencia_fk], [UsuaSecuencia], [PersNombre], [PersApellido], [PersFechaNacimiento], [PersDireccion], [CPersSecuencia_FK], [PersTelefono], [PersCelular], [EstaActivo], [PersGenero], [UsuaCreacion], [PersFechaCreacion], [UsuaModificacion], [PersFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, N'00000000000', 1, 3, N'Ana', N'Carolina', CAST(N'2017-04-04 00:00:00.000' AS DateTime), N'General Direccion', 1, N'(888) 888-8888', N'(888) 888-8888', 1, N'Femenino', 1, CAST(N'2017-04-03 08:11:29.810' AS DateTime), NULL, CAST(N'2017-04-03 08:11:29.810' AS DateTime), 0)
INSERT [sdoc].[Personal] ([DoctSecuencia_fk], [PersSecuencia], [PaisSecuencia_fk], [PersDocumento], [TDSecuencia_fk], [UsuaSecuencia], [PersNombre], [PersApellido], [PersFechaNacimiento], [PersDireccion], [CPersSecuencia_FK], [PersTelefono], [PersCelular], [EstaActivo], [PersGenero], [UsuaCreacion], [PersFechaCreacion], [UsuaModificacion], [PersFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, 1, N'00000000000', 1, 4, N'Nombre Secretaria', N'Apellido Secretaria', CAST(N'2017-04-20 00:00:00.000' AS DateTime), N'direccion personal', 1, N'(888) 888-8888', N'(444) 444-4444', 1, N'Masculino', 2, CAST(N'2017-04-03 11:19:38.847' AS DateTime), 2, CAST(N'2017-04-03 11:19:57.000' AS DateTime), 0)
INSERT [sdoc].[Personal] ([DoctSecuencia_fk], [PersSecuencia], [PaisSecuencia_fk], [PersDocumento], [TDSecuencia_fk], [UsuaSecuencia], [PersNombre], [PersApellido], [PersFechaNacimiento], [PersDireccion], [CPersSecuencia_FK], [PersTelefono], [PersCelular], [EstaActivo], [PersGenero], [UsuaCreacion], [PersFechaCreacion], [UsuaModificacion], [PersFechaModificacion], [EstaDesabilitado]) VALUES (3, 1, 1, N'2222222222222', 1, 5, N'PersonalNuevo', N'Personal NuevoApellido', CAST(N'2017-03-07 00:00:00.000' AS DateTime), N'Direccion', 1, N'(333) 333-3333', N'(222) 222-2222', 1, N'Masculino', 3, CAST(N'2017-03-06 13:45:43.603' AS DateTime), 3, CAST(N'2017-03-07 15:59:01.177' AS DateTime), 0)
INSERT [sdoc].[Personal] ([DoctSecuencia_fk], [PersSecuencia], [PaisSecuencia_fk], [PersDocumento], [TDSecuencia_fk], [UsuaSecuencia], [PersNombre], [PersApellido], [PersFechaNacimiento], [PersDireccion], [CPersSecuencia_FK], [PersTelefono], [PersCelular], [EstaActivo], [PersGenero], [UsuaCreacion], [PersFechaCreacion], [UsuaModificacion], [PersFechaModificacion], [EstaDesabilitado]) VALUES (3, 2, 1, N'2323232', 2, 6, N'perso5 modif2', N'perso2ape', CAST(N'2017-03-20 00:00:00.000' AS DateTime), N'direccion', 2, N'(444) 444-4444', N'(888) 888-8888', 1, N'Masculino', 3, CAST(N'2017-03-08 08:30:57.950' AS DateTime), 3, CAST(N'2017-03-15 17:05:54.117' AS DateTime), 0)
INSERT [sdoc].[Planes] ([PlanSecuencia], [PlanDescripcion], [Precio], [MoneSecuencia_fk], [EstaDesabilitado]) VALUES (1, N'ADMIN', CAST(500.00 AS Decimal(18, 2)), 1, 0)
INSERT [sdoc].[Planes] ([PlanSecuencia], [PlanDescripcion], [Precio], [MoneSecuencia_fk], [EstaDesabilitado]) VALUES (2, N'BASICO', CAST(22.95 AS Decimal(18, 2)), 1, 0)
INSERT [sdoc].[Planes] ([PlanSecuencia], [PlanDescripcion], [Precio], [MoneSecuencia_fk], [EstaDesabilitado]) VALUES (3, N'ESTANDAR', CAST(33.95 AS Decimal(18, 2)), 1, 0)
INSERT [sdoc].[Planes] ([PlanSecuencia], [PlanDescripcion], [Precio], [MoneSecuencia_fk], [EstaDesabilitado]) VALUES (4, N'PROFESIONAL', CAST(45.95 AS Decimal(18, 2)), 1, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (2, 1, 2, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 3, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (4, 1, 4, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (5, 1, 5, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (6, 1, 6, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (7, 1, 7, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (8, 1, 8, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (9, 1, 9, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (10, 1, 10, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (11, 1, 11, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (12, 1, 13, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (13, 1, 14, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (14, 1, 15, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (15, 1, 16, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (16, 1, 17, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (17, 1, 18, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (18, 1, 19, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (19, 1, 20, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (20, 1, 21, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (21, 1, 22, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (22, 1, 23, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (23, 1, 24, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (24, 1, 25, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (25, 1, 26, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (26, 1, 27, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (27, 1, 28, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (28, 1, 29, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (29, 1, 30, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (30, 1, 31, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (31, 1, 32, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (32, 1, 33, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (33, 1, 34, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (34, 1, 35, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (35, 1, 36, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (36, 1, 38, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (37, 1, 39, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (38, 1, 40, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (39, 1, 41, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (40, 1, 42, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (41, 1, 43, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (42, 1, 44, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (43, 1, 45, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (44, 1, 46, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (45, 1, 47, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (46, 1, 48, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (47, 1, 49, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (1, 2, 1, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (2, 2, 2, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (3, 2, 9, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (4, 2, 10, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (5, 2, 13, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (6, 2, 14, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (7, 2, 15, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (8, 2, 16, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (9, 2, 17, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (10, 2, 27, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (1, 3, 1, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (2, 3, 2, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (3, 3, 4, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (4, 3, 5, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (5, 3, 9, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (6, 3, 10, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (7, 3, 13, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (8, 3, 14, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (9, 3, 15, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (10, 3, 16, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (11, 3, 17, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (12, 3, 20, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (13, 3, 21, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (14, 3, 22, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (15, 3, 24, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (16, 3, 27, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (1, 4, 1, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (2, 4, 2, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (3, 4, 9, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (4, 4, 10, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (5, 4, 14, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (6, 4, 15, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (7, 4, 16, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (8, 4, 17, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (9, 4, 24, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (10, 4, 39, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (11, 4, 40, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (12, 4, 41, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (13, 4, 45, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (14, 4, 46, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (15, 4, 47, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (16, 4, 48, 0)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (17, 4, 49, 0)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (1, 1, 1, 0, 1, N'pag_Consulta', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (2, 1, 2, 0, 2, N'pag_Paciente', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (3, 1, 9, 0, 9, N'pag_MantenimientoMenu', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (4, 1, 10, 0, 10, N'pag_Diagnosticos', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (5, 1, 11, 0, 11, N'pag_TipoDiagnosticos', 2)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (6, 1, 13, 0, 13, N'pag_Procedimientos', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (7, 1, 14, 0, 14, N'Mantenimiento_pag_Consultorio', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (8, 1, 15, 0, 15, N'pag_ConfiguracionMenu', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (9, 1, 16, 0, 16, N'Configuracion_pag_Consultorio', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (10, 1, 17, 0, 17, N'pag_Doctor', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (11, 1, 27, 0, 27, N'pag_Receta', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (1, 2, 1, 0, 1, N'pag_Consulta', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (2, 2, 2, 0, 2, N'pag_Paciente', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (3, 2, 3, 0, 3, N'pag_Personal', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (4, 2, 4, 0, 4, N'pag_Cita', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (5, 2, 5, 0, 5, N'pag_Agenda', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (6, 2, 9, 0, 9, N'pag_MantenimientoMenu', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (7, 2, 10, 0, 10, N'pag_Diagnosticos', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (8, 2, 11, 0, 11, N'pag_TipoDiagnosticos', 2)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (9, 2, 13, 0, 13, N'pag_Procedimientos', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (10, 2, 14, 0, 14, N'Mantenimiento_pag_Consultorio', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (11, 2, 15, 0, 15, N'pag_ConfiguracionMenu', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (12, 2, 16, 0, 16, N'Configuracion_pag_Consultorio', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (13, 2, 17, 0, 17, N'pag_Doctor', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (14, 2, 20, 0, 20, N'pag_HorarioTrabajo', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (15, 2, 22, 0, 22, N'pag_SeguridadMenu', 2)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (16, 2, 24, 0, 24, N'pag_UsuarioPersonal', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (17, 2, 25, 0, 25, N'pag_Acciones', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (18, 2, 26, 0, 26, N'pag_Roles', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (19, 2, 27, 0, 27, N'pag_Receta', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (20, 2, 33, 0, 33, N'pag_CategoriaPersonal', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (1, 3, 1, 0, 1, N'pag_Consulta', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (2, 3, 2, 0, 2, N'pag_Paciente', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (3, 3, 3, 0, 3, N'pag_Personal', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (4, 3, 4, 0, 4, N'pag_Cita', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (5, 3, 5, 0, 5, N'pag_Agenda', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (6, 3, 6, 0, 6, N'pag_FacturacionMenu', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (7, 3, 7, 0, 7, N'pag_Facturacion', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (8, 3, 8, 0, 8, N'pag_Caja', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (9, 3, 9, 0, 9, N'pag_MantenimientoMenu', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (10, 3, 10, 0, 10, N'pag_Diagnosticos', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (11, 3, 13, 0, 13, N'pag_Procedimientos', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (12, 3, 14, 0, 14, N'Mantenimiento_pag_Consultorio', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (13, 3, 15, 0, 15, N'pag_ConfiguracionMenu', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (14, 3, 16, 0, 16, N'Configuracion_pag_Consultorio', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (15, 3, 17, 0, 17, N'pag_Doctor', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (16, 3, 20, 0, 20, N'pag_HorarioTrabajo', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (17, 3, 21, 0, 21, N'pag_InstitucionesAseguradoras', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (18, 3, 22, 0, 22, N'pag_SeguridadMenu', 2)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (19, 3, 24, 0, 24, N'pag_UsuarioPersonal', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (20, 3, 26, 0, 26, N'pag_Roles', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (21, 3, 27, 0, 27, N'pag_Receta', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (22, 3, 28, 0, 28, N'pag_ContabilidadMenu', 2)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (23, 3, 29, 0, 29, N'pag_607', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (24, 3, 31, 0, 31, N'pag_CitaPacienteEnLinea', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (25, 3, 34, 0, 34, N'Rolelista', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (26, 3, 36, 0, 36, N'Pag_CategoriaPersonalLista', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (27, 3, 38, 0, 38, N'pag_RolePages', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (28, 3, 39, 0, 39, N'pag_MotivoConsulta', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (29, 3, 40, 0, 40, N'pag_Tratamiento', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (30, 3, 41, 0, 41, N'pag_EvaluacionFisica', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (1, 4, 1, 0, 1, N'pag_Consulta', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (2, 4, 2, 0, 2, N'pag_Paciente', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (3, 4, 3, 0, 3, N'pag_Personal', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (4, 4, 4, 0, 4, N'pag_Cita', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (5, 4, 5, 0, 5, N'pag_Agenda', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (6, 4, 6, 0, 6, N'pag_FacturacionMenu', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (7, 4, 7, 0, 7, N'pag_Facturacion', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (8, 4, 8, 0, 8, N'pag_Caja', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (9, 4, 9, 0, 9, N'pag_MantenimientoMenu', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (10, 4, 10, 0, 10, N'pag_Diagnosticos', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (11, 4, 11, 0, 11, N'pag_TipoDiagnosticos', 2)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (12, 4, 13, 0, 13, N'pag_Procedimientos', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (13, 4, 14, 0, 14, N'Mantenimiento_pag_Consultorio', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (14, 4, 15, 0, 15, N'pag_ConfiguracionMenu', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (15, 4, 16, 0, 16, N'Configuracion_pag_Consultorio', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (16, 4, 17, 0, 17, N'pag_Doctor', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (17, 4, 18, 0, 18, N'Ini_TipoFormulario', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (18, 4, 19, 0, 19, N'PruebaAngular', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (19, 4, 20, 0, 20, N'pag_HorarioTrabajo', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (20, 4, 21, 0, 21, N'pag_InstitucionesAseguradoras', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (21, 4, 22, 0, 22, N'pag_SeguridadMenu', 2)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (22, 4, 23, 0, 23, N'pag_Auditoria', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (23, 4, 24, 0, 24, N'pag_UsuarioPersonal', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (24, 4, 25, 0, 25, N'pag_Acciones', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (25, 4, 26, 0, 26, N'pag_Roles', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (26, 4, 27, 0, 27, N'pag_Receta', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (27, 4, 28, 0, 28, N'pag_ContabilidadMenu', 2)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (28, 4, 29, 0, 29, N'pag_607', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (29, 4, 30, 0, 30, N'pag_BackupExcelConsulta', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (30, 4, 31, 0, 31, N'pag_CitaPacienteEnLinea', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (31, 4, 32, 0, 32, N'pag_DigitalizacionConsultas', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (32, 4, 33, 0, 33, N'pag_CategoriaPersonal', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (33, 4, 34, 0, 34, N'Rolelista', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (34, 4, 35, 0, 35, N'TipoFormulariolista', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (35, 4, 36, 0, 36, N'Pag_CategoriaPersonalLista', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (36, 4, 38, 0, 38, N'pag_RolePages', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (37, 4, 39, 0, 39, N'pag_MotivoConsulta', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (38, 4, 40, 0, 40, N'pag_Tratamiento', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (39, 4, 41, 0, 41, N'pag_EvaluacionFisica', 1)
GO
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (40, 4, 42, 0, 42, N'pag_Clinica', 1)
INSERT [sdoc].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (41, 4, 43, 0, 43, N'pag_Consultorio', 1)
INSERT [sdoc].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 0)
INSERT [sdoc].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, 1, 1, 0)
INSERT [sdoc].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, 1, 1, 0)
INSERT [sdoc].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 1, 1, 1, 0)
INSERT [sdoc].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 2, 1, 1, 0)
INSERT [sdoc].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 4, 1, 1, 0)
INSERT [sdoc].[RecetaImagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [ImagSecuencia_fk], [RImagSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, 2, 0, 0)
INSERT [sdoc].[RecetaImagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [ImagSecuencia_fk], [RImagSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, 1, 0, 0)
INSERT [sdoc].[RecetaImagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [ImagSecuencia_fk], [RImagSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, 2, 0, 0)
INSERT [sdoc].[RecetaImagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [ImagSecuencia_fk], [RImagSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 2, 1, 1, 0)
INSERT [sdoc].[RecetaImagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [ImagSecuencia_fk], [RImagSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 2, 2, 2, 0)
INSERT [sdoc].[RecetaImagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [ImagSecuencia_fk], [RImagSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 3, 1, 1, 0)
INSERT [sdoc].[RecetaImagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [ImagSecuencia_fk], [RImagSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 5, 1, 1, 0)
INSERT [sdoc].[RecetaImagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [ImagSecuencia_fk], [RImagSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 5, 2, 2, 0)
INSERT [sdoc].[RecetaMedicamentos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [MediSecuencia_fk], [RMediSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, 2, 1, 0)
INSERT [sdoc].[RecetaMedicamentos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [MediSecuencia_fk], [RMediSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, 3, 1, 0)
INSERT [sdoc].[RecetaMedicamentos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [MediSecuencia_fk], [RMediSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, 2, 1, 0)
INSERT [sdoc].[RecetaMedicamentos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [MediSecuencia_fk], [RMediSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, 3, 2, 0)
INSERT [sdoc].[RecetaMedicamentos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [MediSecuencia_fk], [RMediSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 4, 2, 1, 0)
INSERT [sdoc].[RecetaMedicamentos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [MediSecuencia_fk], [RMediSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 4, 3, 2, 0)
INSERT [sdoc].[RecetaMedicamentos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [MediSecuencia_fk], [RMediSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 1, 3, 1, 0)
INSERT [sdoc].[RecetaMedicamentos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [MediSecuencia_fk], [RMediSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 2, 3, 1, 0)
INSERT [sdoc].[RecetaMedicamentos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [MediSecuencia_fk], [RMediSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 3, 2, 1, 0)
INSERT [sdoc].[RecetaMedicamentos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [MediSecuencia_fk], [RMediSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 3, 3, 2, 0)
INSERT [sdoc].[RecetaMedicamentos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [MediSecuencia_fk], [RMediSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 5, 2, 1, 0)
INSERT [sdoc].[RecetaMedicamentos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [MediSecuencia_fk], [RMediSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 5, 3, 2, 0)
INSERT [sdoc].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, NULL, CAST(N'2017-04-12 15:42:37.923' AS DateTime), NULL, NULL, NULL, 1, CAST(N'2017-04-12 15:42:37.923' AS DateTime), NULL, NULL, 0)
INSERT [sdoc].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, NULL, CAST(N'2017-04-12 16:04:45.803' AS DateTime), NULL, NULL, N'sdfefef receta', 1, CAST(N'2017-04-12 16:04:45.803' AS DateTime), NULL, NULL, 0)
INSERT [sdoc].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, NULL, CAST(N'2017-04-13 08:02:57.557' AS DateTime), NULL, NULL, N'analisi modifdi:

med2:
Dosificación:
Duración:

modificado:
Dosificación:
Duración:', 1, CAST(N'2017-04-13 08:02:57.557' AS DateTime), NULL, NULL, 0)
INSERT [sdoc].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 4, NULL, CAST(N'2017-04-13 08:15:45.000' AS DateTime), NULL, NULL, N'analisi modifdi: homadl

med2:
Dosificación:
Duración:erte4dgfd

imagend 55Modifica:

med2:
Dosificación:
Duración:

modificado:
Dosificación:
Duración:

analisi modifdi:

imagen2:

imagend 55Modifica:

med2:
Dosificación:
Duración:

modificado:
Dosificación:
Duración:

analisi modifdi:

imagen2:

imagend 55Modifica:

analisi modifdi:

analisi modifdi:

med2:
Dosificación:
Duración:

modificado:
Dosificación:
Duración:

med2:
Dosificación:
Duración:

modificado:
Dosificación:
Duración:

analisi modifdi:

imagen2:

med2:
Dosificación:
Duración:

modificado:
Dosificación:
Duración:

analisi modifdi:

imagen2:

med2:
Dosificación:
Duración:

modificado:
Dosificación:
Duración:

imagen2:', 1, CAST(N'2017-04-13 08:15:45.817' AS DateTime), 1, CAST(N'2017-04-13 20:36:49.173' AS DateTime), 0)
INSERT [sdoc].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 1, NULL, CAST(N'2017-04-13 10:29:59.863' AS DateTime), NULL, NULL, N'sdfsefsdfsd

analisi modifdi:

modificado:
Dosificación:
Duración:', 1, CAST(N'2017-04-13 10:29:59.863' AS DateTime), NULL, NULL, 1)
INSERT [sdoc].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 2, NULL, CAST(N'2017-04-13 11:15:04.000' AS DateTime), NULL, NULL, N'analisi modifdi:Modificado 20

imagen2:
Todas las preubas salieron bien
imagend 55Modifica:

med2:
Dosificación:
Duración:

modificado:
Dosificación:
Duración:

med2:
Dosificación:
Duración:

modificado:
Dosificación:
Duración:

analisi modifdi:

imagen2:

imagend 55Modifica:

imagen2:

imagend 55Modifica:

med2:
Dosificación:
Duración:

med2:
Dosificación:
Duración:

imagen2:

imagend 55Modifica:

modificado:
Dosificación:
Duración:

med2:
Dosificación:
Duración:

modificado:
Dosificación:
Duración:

imagen2:

imagend 55Modifica:

modificado:
Dosificación:
Duración:

imagen2:

imagend 55Modifica:

analisi modifdi:

modificado:
Dosificación:
Duración:

analisi modifdi:

imagen2:

imagend 55Modifica:', 1, CAST(N'2017-04-13 11:15:04.217' AS DateTime), 1, CAST(N'2017-04-13 11:24:32.910' AS DateTime), 1)
INSERT [sdoc].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 3, NULL, CAST(N'2017-04-13 11:25:47.000' AS DateTime), NULL, NULL, N'analisi modifdi: modifica

modificado:
Dosificación:sdf
Duración:sdfefsdfwe

med2:
Dosificación:
Duración:

imagen2: dfsedf

med2:
Dosificación:
Duración:

modificado:
Dosificación:
Duración:

analisi modifdi:

imagen2:', 1, CAST(N'2017-04-13 11:25:47.727' AS DateTime), 1, CAST(N'2017-04-13 11:26:10.213' AS DateTime), 1)
INSERT [sdoc].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 4, NULL, CAST(N'2017-04-13 11:26:57.687' AS DateTime), NULL, NULL, N'analisi modifdi:asdasd
sdfefe', 1, CAST(N'2017-04-13 11:26:57.687' AS DateTime), NULL, NULL, 1)
INSERT [sdoc].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 5, NULL, CAST(N'2017-04-13 11:35:08.000' AS DateTime), NULL, NULL, N'analisi modifdi:sdfsefrsd Modificado 

med2:dfd
Dosificación:sdfsdf
Duración:sdfsd

med2:
Dosificación:
Duración:

analisi modifdi:

imagen2:

imagend 55Modifica:sdf

modificado:
Dosificación:sdf
Duración:', 1, CAST(N'2017-04-13 11:35:08.253' AS DateTime), 1, CAST(N'2017-04-13 11:35:39.233' AS DateTime), 1)
INSERT [sdoc].[Role] ([RoleSecuencia], [RoleDescripcion], [UsuaSecuencia], [RoleFechaCreacion], [UsuaSecuenciaModificacion], [RoleFechaModificacion], [EstaDesabilitado]) VALUES (1, N'Admin', 3, NULL, NULL, NULL, 0)
INSERT [sdoc].[Role] ([RoleSecuencia], [RoleDescripcion], [UsuaSecuencia], [RoleFechaCreacion], [UsuaSecuenciaModificacion], [RoleFechaModificacion], [EstaDesabilitado]) VALUES (2, N'Doctor', 3, CAST(N'2017-03-06 14:54:18.100' AS DateTime), NULL, CAST(N'2017-03-06 14:54:18.100' AS DateTime), 0)
INSERT [sdoc].[Role] ([RoleSecuencia], [RoleDescripcion], [UsuaSecuencia], [RoleFechaCreacion], [UsuaSecuenciaModificacion], [RoleFechaModificacion], [EstaDesabilitado]) VALUES (3, N'Secretaria', 3, CAST(N'2017-03-09 10:16:30.357' AS DateTime), NULL, CAST(N'2017-03-09 10:16:30.357' AS DateTime), 0)
INSERT [sdoc].[Role] ([RoleSecuencia], [RoleDescripcion], [UsuaSecuencia], [RoleFechaCreacion], [UsuaSecuenciaModificacion], [RoleFechaModificacion], [EstaDesabilitado]) VALUES (4, N'Doctor_Suplente', 3, CAST(N'2017-03-17 14:42:53.627' AS DateTime), NULL, CAST(N'2017-03-17 14:42:53.627' AS DateTime), 1)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, 1, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, 4, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 1, 2, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 2, 2, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 3, 1, 3, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 3, 2, 3, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 4, 1, 4, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 4, 2, 9, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 5, 1, 5, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 5, 2, 10, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 6, 1, 6, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 6, 2, 15, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 7, 1, 7, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 7, 2, 17, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 8, 1, 8, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 8, 2, 22, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 9, 1, 9, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 9, 2, 24, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 10, 1, 10, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 10, 2, 33, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 11, 1, 11, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 11, 2, 39, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 12, 1, 13, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 12, 2, 40, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 13, 1, 14, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 13, 2, 41, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 14, 1, 15, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 14, 2, 45, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 15, 1, 16, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 15, 2, 46, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 16, 1, 17, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 16, 2, 47, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 17, 1, 18, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 17, 2, 48, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 18, 1, 19, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 18, 2, 49, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 19, 1, 20, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 20, 1, 21, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 21, 1, 22, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 22, 1, 23, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 23, 1, 24, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 24, 1, 25, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 25, 1, 26, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 26, 1, 27, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 27, 1, 28, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 28, 1, 29, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 29, 1, 30, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 30, 1, 31, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 31, 1, 32, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 32, 1, 33, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 33, 1, 34, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 34, 1, 35, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 35, 1, 36, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 36, 1, 38, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 37, 1, 39, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 38, 1, 40, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 39, 1, 41, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 40, 1, 42, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 41, 1, 43, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 42, 1, 44, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 43, 1, 45, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 44, 1, 46, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 45, 1, 47, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 46, 1, 48, 1, 0)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 47, 1, 49, 1, 0)
INSERT [sdoc].[TipoDocumento] ([TDSecuencia], [TDDocumento]) VALUES (1, N'Cedula')
INSERT [sdoc].[TipoDocumento] ([TDSecuencia], [TDDocumento]) VALUES (2, N'Pasaporte')
INSERT [sdoc].[TipoFormulario] ([TFormSecuencia], [TFormDescripcion]) VALUES (1, N'Formulario')
INSERT [sdoc].[TipoFormulario] ([TFormSecuencia], [TFormDescripcion]) VALUES (2, N'Menu')
INSERT [sdoc].[Tratamiento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TratSecuencia], [TratCodigo], [TratNombre], [TratDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, NULL, N'Primer tratamiento', NULL, 0)
INSERT [sdoc].[Tratamiento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TratSecuencia], [TratCodigo], [TratNombre], [TratDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 1, NULL, N'sfsdef', N'sfeefe', 0)
INSERT [sdoc].[Tratamiento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TratSecuencia], [TratCodigo], [TratNombre], [TratDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 2, NULL, N'efefe', N'sdfefe', 0)
INSERT [sdoc].[Tratamiento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TratSecuencia], [TratCodigo], [TratNombre], [TratDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 3, NULL, N'fefefefe', N'efeeedfd', 0)
INSERT [sdoc].[Usuario] ([UsuaSecuencia], [UsuaEmail], [UsuaClave], [UsuaNombre], [UsuaApellido], [UsuaFechaNacimiento], [UsuaGenero], [RoleSecuencia_fk], [UsuaIntentos], [PaisSecuencia], [PlanSecuencia_fk], [EspeSecuencia_fk], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (1, N'admin@hotmail.com', N'Admin2@hotmail.com', N'Admin', N'Admin', CAST(N'2001-11-13 00:00:00.000' AS DateTime), N'Masculino', 1, 0, 1, 1, 1, 1, CAST(N'2017-01-30 17:29:07.107' AS DateTime), 1, NULL, 0)
INSERT [sdoc].[Usuario] ([UsuaSecuencia], [UsuaEmail], [UsuaClave], [UsuaNombre], [UsuaApellido], [UsuaFechaNacimiento], [UsuaGenero], [RoleSecuencia_fk], [UsuaIntentos], [PaisSecuencia], [PlanSecuencia_fk], [EspeSecuencia_fk], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (2, N'd2@hotmail.com', N'D2@hotmail.com', N'D2@hotmail.com', N'D2@hotmail.com', NULL, NULL, 2, 0, 1, 4, 1, 1, CAST(N'2017-04-02 18:36:43.923' AS DateTime), NULL, NULL, 0)
INSERT [sdoc].[Usuario] ([UsuaSecuencia], [UsuaEmail], [UsuaClave], [UsuaNombre], [UsuaApellido], [UsuaFechaNacimiento], [UsuaGenero], [RoleSecuencia_fk], [UsuaIntentos], [PaisSecuencia], [PlanSecuencia_fk], [EspeSecuencia_fk], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (3, N'secretaria2@hotmail.com', N'Secretaria2@hotmail.com', N'Ana', N'Carolina', CAST(N'2017-04-04 00:00:00.000' AS DateTime), N'Femenino', 3, 0, 1, 1, NULL, 1, CAST(N'2017-04-03 08:13:30.267' AS DateTime), 1, NULL, 0)
INSERT [sdoc].[Usuario] ([UsuaSecuencia], [UsuaEmail], [UsuaClave], [UsuaNombre], [UsuaApellido], [UsuaFechaNacimiento], [UsuaGenero], [RoleSecuencia_fk], [UsuaIntentos], [PaisSecuencia], [PlanSecuencia_fk], [EspeSecuencia_fk], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (4, N'secretaria1@hotmail.com', N'Secretaria1@hotmail.com', N'Nombre Secretaria', N'Apellido Secretaria', CAST(N'2017-04-20 00:00:00.000' AS DateTime), N'Masculino', 3, 0, 1, 4, NULL, 2, CAST(N'2017-04-03 11:26:40.590' AS DateTime), 2, CAST(N'2017-04-03 11:29:01.210' AS DateTime), 0)
INSERT [sdoc].[UsuarioConsultorio] ([UsuaSecuencia_fk], [ConsSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [UConsSecuencia], [clinRazonSocial], [ConsCodigo], [ConsDescripcion], [UsuaSecuenciaCreacion], [UConsFechaCreacion], [UsuaSecuenciaModificacion], [UConsFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, N'df', N'codi', N'Conul1', 3, NULL, NULL, NULL, 0)
INSERT [sdoc].[UsuarioConsultorio] ([UsuaSecuencia_fk], [ConsSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [UConsSecuencia], [clinRazonSocial], [ConsCodigo], [ConsDescripcion], [UsuaSecuenciaCreacion], [UConsFechaCreacion], [UsuaSecuenciaModificacion], [UConsFechaModificacion], [EstaDesabilitado]) VALUES (2, 2, 1, 2, 2, N'clinRazonSocial', N'ConsCodigo', NULL, 1, CAST(N'2017-04-02 18:36:44.077' AS DateTime), NULL, NULL, 0)
INSERT [sdoc].[UsuarioConsultorio] ([UsuaSecuencia_fk], [ConsSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [UConsSecuencia], [clinRazonSocial], [ConsCodigo], [ConsDescripcion], [UsuaSecuenciaCreacion], [UConsFechaCreacion], [UsuaSecuenciaModificacion], [UConsFechaModificacion], [EstaDesabilitado]) VALUES (2, 3, 1, 2, 3, N'clinRazonSocial', N'258', NULL, 2, CAST(N'2017-04-03 11:06:51.730' AS DateTime), NULL, NULL, 0)
INSERT [sdoc].[UsuarioConsultorio] ([UsuaSecuencia_fk], [ConsSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [UConsSecuencia], [clinRazonSocial], [ConsCodigo], [ConsDescripcion], [UsuaSecuenciaCreacion], [UConsFechaCreacion], [UsuaSecuenciaModificacion], [UConsFechaModificacion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 1, N'Abel Gonzales', N'codi', N'Conul1', 1, CAST(N'2017-04-03 08:13:30.293' AS DateTime), 1, NULL, 0)
INSERT [sdoc].[UsuarioConsultorio] ([UsuaSecuencia_fk], [ConsSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [UConsSecuencia], [clinRazonSocial], [ConsCodigo], [ConsDescripcion], [UsuaSecuenciaCreacion], [UConsFechaCreacion], [UsuaSecuenciaModificacion], [UConsFechaModificacion], [EstaDesabilitado]) VALUES (4, 2, 1, 2, 1, N'clinRazonSocial', N'ConsCodigo', NULL, NULL, NULL, 2, CAST(N'2017-04-03 11:29:01.217' AS DateTime), 0)
/****** Object:  Index [Unique_Cita]    Script Date: 04/20/2017 04:07:04 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_Cita] ON [sdoc].[Cita]
(
	[CitaSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Unique_ConsultaMedica]    Script Date: 04/20/2017 04:07:04 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_ConsultaMedica] ON [sdoc].[ConsultaMedica]
(
	[DoctSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Unique_HorariosDiaTrabajo]    Script Date: 04/20/2017 04:07:04 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_HorariosDiaTrabajo] ON [sdoc].[HorariosDiaTrabajo]
(
	[HDTrabSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Unique_TipoIndicacion]    Script Date: 04/20/2017 04:07:04 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_TipoIndicacion] ON [sdoc].[TipoIndicacion]
(
	[TIndiSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [sdoc].[ArchivosPaciente]  WITH CHECK ADD  CONSTRAINT [FK_ArchivosPaciente_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [sdoc].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [sdoc].[ArchivosPaciente] CHECK CONSTRAINT [FK_ArchivosPaciente_Doctor]
GO
ALTER TABLE [sdoc].[ArchivosPaciente]  WITH CHECK ADD  CONSTRAINT [FK_ArchivosPaciente_Paciente] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk])
REFERENCES [sdoc].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia])
GO
ALTER TABLE [sdoc].[ArchivosPaciente] CHECK CONSTRAINT [FK_ArchivosPaciente_Paciente]
GO
ALTER TABLE [sdoc].[ArchivosPaciente]  WITH CHECK ADD  CONSTRAINT [FK_ArchivosPaciente_TipoArchivoPaciente] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TAPaciSecuencia_fk])
REFERENCES [sdoc].[TipoArchivoPaciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TAPaciSecuencia])
GO
ALTER TABLE [sdoc].[ArchivosPaciente] CHECK CONSTRAINT [FK_ArchivosPaciente_TipoArchivoPaciente]
GO
ALTER TABLE [sdoc].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [sdoc].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [sdoc].[Cita] CHECK CONSTRAINT [FK_Cita_Doctor]
GO
ALTER TABLE [sdoc].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Factura] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [FactSecuencia_fk])
REFERENCES [sdoc].[Factura] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [FactSecuencia])
GO
ALTER TABLE [sdoc].[Cita] CHECK CONSTRAINT [FK_Cita_Factura]
GO
ALTER TABLE [sdoc].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Paciente] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk])
REFERENCES [sdoc].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia])
GO
ALTER TABLE [sdoc].[Cita] CHECK CONSTRAINT [FK_Cita_Paciente]
GO
ALTER TABLE [sdoc].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Personal] FOREIGN KEY([DoctSecuencia_fk], [PersSecuencia_fk])
REFERENCES [sdoc].[Personal] ([DoctSecuencia_fk], [PersSecuencia])
GO
ALTER TABLE [sdoc].[Cita] CHECK CONSTRAINT [FK_Cita_Personal]
GO
ALTER TABLE [sdoc].[Clinica]  WITH CHECK ADD  CONSTRAINT [FK_Clinica_Pais] FOREIGN KEY([PaisSecuencia_fk])
REFERENCES [sdoc].[Pais] ([PaisSecuencia])
GO
ALTER TABLE [sdoc].[Clinica] CHECK CONSTRAINT [FK_Clinica_Pais]
GO
ALTER TABLE [sdoc].[ConsultaMedica]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedica_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [sdoc].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedica] CHECK CONSTRAINT [FK_ConsultaMedica_Doctor]
GO
ALTER TABLE [sdoc].[ConsultaMedica]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedica_Paciente] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk])
REFERENCES [sdoc].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedica] CHECK CONSTRAINT [FK_ConsultaMedica_Paciente]
GO
ALTER TABLE [sdoc].[ConsultaMedicaCirugia]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaCirugia_Cirugia] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [CiruSecuencia_fk])
REFERENCES [sdoc].[Cirugia] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [CiruSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicaCirugia] CHECK CONSTRAINT [FK_ConsultaMedicaCirugia_Cirugia]
GO
ALTER TABLE [sdoc].[ConsultaMedicaCirugia]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaCirugia_ConsultaMedica] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMediSecuencia_fk])
REFERENCES [sdoc].[ConsultaMedica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMediSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicaCirugia] CHECK CONSTRAINT [FK_ConsultaMedicaCirugia_ConsultaMedica]
GO
ALTER TABLE [sdoc].[ConsultaMedicaEnfermeda]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaEnfermeda_ConsultaMedica] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMediSecuencia_fk])
REFERENCES [sdoc].[ConsultaMedica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMediSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicaEnfermeda] CHECK CONSTRAINT [FK_ConsultaMedicaEnfermeda_ConsultaMedica]
GO
ALTER TABLE [sdoc].[ConsultaMedicaEnfermeda]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaEnfermeda_Enfermedad] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EnfeSecuencia_fk])
REFERENCES [sdoc].[Enfermedad] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EnfeSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicaEnfermeda] CHECK CONSTRAINT [FK_ConsultaMedicaEnfermeda_Enfermedad]
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorial]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaHistorial_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [sdoc].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorial] CHECK CONSTRAINT [FK_ConsultaMedicaHistorial_Doctor]
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorial]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaHistorial_Paciente] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk])
REFERENCES [sdoc].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorial] CHECK CONSTRAINT [FK_ConsultaMedicaHistorial_Paciente]
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialDiagnostico]  WITH CHECK ADD  CONSTRAINT [FK_ConsultorioMedicoHistorialDiagnostico_ConsultaMedicaHistorial] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia])
REFERENCES [sdoc].[ConsultaMedicaHistorial] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialDiagnostico] CHECK CONSTRAINT [FK_ConsultorioMedicoHistorialDiagnostico_ConsultaMedicaHistorial]
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialDiagnostico]  WITH CHECK ADD  CONSTRAINT [FK_ConsultorioMedicoHistorialDiagnostico_Diagnostico] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DiagSecuencia])
REFERENCES [sdoc].[Diagnostico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DiagSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialDiagnostico] CHECK CONSTRAINT [FK_ConsultorioMedicoHistorialDiagnostico_Diagnostico]
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialEnfermeda]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaHistorialEnfermeda_Enfermedad] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EnfeSecuencia_fk])
REFERENCES [sdoc].[Enfermedad] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EnfeSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialEnfermeda] CHECK CONSTRAINT [FK_ConsultaMedicaHistorialEnfermeda_Enfermedad]
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialEvaluacionFisica]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaHistorialEvaluacionFisica_ConsultaMedicaHistorial] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk])
REFERENCES [sdoc].[ConsultaMedicaHistorial] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialEvaluacionFisica] CHECK CONSTRAINT [FK_ConsultaMedicaHistorialEvaluacionFisica_ConsultaMedicaHistorial]
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialEvaluacionFisica]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaHistorialEvaluacionFisica_EvaluacionFisica] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia_fk])
REFERENCES [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialEvaluacionFisica] CHECK CONSTRAINT [FK_ConsultaMedicaHistorialEvaluacionFisica_EvaluacionFisica]
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialMotivoConsulta]  WITH CHECK ADD  CONSTRAINT [FK_ConsultorioMedicoHistorialMotivoConsulta_ConsultaMedicaHistorial] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk])
REFERENCES [sdoc].[ConsultaMedicaHistorial] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialMotivoConsulta] CHECK CONSTRAINT [FK_ConsultorioMedicoHistorialMotivoConsulta_ConsultaMedicaHistorial]
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialMotivoConsulta]  WITH CHECK ADD  CONSTRAINT [FK_ConsultorioMedicoHistorialMotivoConsulta_MotivoConsulta] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MConsSecuencia_fk])
REFERENCES [sdoc].[MotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MConsSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialMotivoConsulta] CHECK CONSTRAINT [FK_ConsultorioMedicoHistorialMotivoConsulta_MotivoConsulta]
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialTratamiento]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaHistorialTratamiento_ConsultaMedicaHistorial] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk])
REFERENCES [sdoc].[ConsultaMedicaHistorial] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialTratamiento] CHECK CONSTRAINT [FK_ConsultaMedicaHistorialTratamiento_ConsultaMedicaHistorial]
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialTratamiento]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaHistorialTratamiento_Tratamiento] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TratSecuencia_fk])
REFERENCES [sdoc].[Tratamiento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TratSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialTratamiento] CHECK CONSTRAINT [FK_ConsultaMedicaHistorialTratamiento_Tratamiento]
GO
ALTER TABLE [sdoc].[ConsultaMedicalHistorialAlergias]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicalHistorialAlergias_Alergia] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [AlerSecuencia_fk])
REFERENCES [sdoc].[Alergia] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [AlerSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicalHistorialAlergias] CHECK CONSTRAINT [FK_ConsultaMedicalHistorialAlergias_Alergia]
GO
ALTER TABLE [sdoc].[Consultorio]  WITH CHECK ADD  CONSTRAINT [FK_Consultorio_Clinica2] FOREIGN KEY([ClinSecuencia_fk], [PaisSecuencia_fk])
REFERENCES [sdoc].[Clinica] ([clinSecuencia], [PaisSecuencia_fk])
GO
ALTER TABLE [sdoc].[Consultorio] CHECK CONSTRAINT [FK_Consultorio_Clinica2]
GO
ALTER TABLE [sdoc].[Consultorio]  WITH CHECK ADD  CONSTRAINT [FK_Consultorio_Pais] FOREIGN KEY([PaisSecuencia_fk])
REFERENCES [sdoc].[Pais] ([PaisSecuencia])
GO
ALTER TABLE [sdoc].[Consultorio] CHECK CONSTRAINT [FK_Consultorio_Pais]
GO
ALTER TABLE [sdoc].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Especialidades] FOREIGN KEY([EspeSecuencia])
REFERENCES [sdoc].[Especialidades] ([EspeSecuencia])
GO
ALTER TABLE [sdoc].[Doctor] CHECK CONSTRAINT [FK_Doctor_Especialidades]
GO
ALTER TABLE [sdoc].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Usuario] FOREIGN KEY([UsuSecuencia])
REFERENCES [sdoc].[Usuario] ([UsuaSecuencia])
GO
ALTER TABLE [sdoc].[Doctor] CHECK CONSTRAINT [FK_Doctor_Usuario]
GO
ALTER TABLE [sdoc].[EspecialidadFormularioCampos]  WITH CHECK ADD  CONSTRAINT [FK_EspecialidadFormularioCampos_Especialidades] FOREIGN KEY([EspeSecuencia_fk])
REFERENCES [sdoc].[Especialidades] ([EspeSecuencia])
GO
ALTER TABLE [sdoc].[EspecialidadFormularioCampos] CHECK CONSTRAINT [FK_EspecialidadFormularioCampos_Especialidades]
GO
ALTER TABLE [sdoc].[EspecialidadFormularioCampos]  WITH CHECK ADD  CONSTRAINT [FK_EspecialidadFormularioCampos_FormularioCampos] FOREIGN KEY([FCampSecuencia_fk])
REFERENCES [sdoc].[FormularioCampos] ([FCampSecuencia])
GO
ALTER TABLE [sdoc].[EspecialidadFormularioCampos] CHECK CONSTRAINT [FK_EspecialidadFormularioCampos_FormularioCampos]
GO
ALTER TABLE [sdoc].[EspecialidadFormularioCampos]  WITH CHECK ADD  CONSTRAINT [FK_EspecialidadFormularioCampos_Formularios] FOREIGN KEY([FormSecuencia_fk])
REFERENCES [sdoc].[Formularios] ([FormSecuencia])
GO
ALTER TABLE [sdoc].[EspecialidadFormularioCampos] CHECK CONSTRAINT [FK_EspecialidadFormularioCampos_Formularios]
GO
ALTER TABLE [sdoc].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_FacturaEstado] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [FEstaSecuencia_fk])
REFERENCES [sdoc].[FacturaEstado] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [FEstaSecuencia])
GO
ALTER TABLE [sdoc].[Factura] CHECK CONSTRAINT [FK_Factura_FacturaEstado]
GO
ALTER TABLE [sdoc].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Personal] FOREIGN KEY([DoctSecuencia_fk], [PersSecuencia_fk])
REFERENCES [sdoc].[Personal] ([DoctSecuencia_fk], [PersSecuencia])
GO
ALTER TABLE [sdoc].[Factura] CHECK CONSTRAINT [FK_Factura_Personal]
GO
ALTER TABLE [sdoc].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_TipoPago] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TPagoSecuencia_fk])
REFERENCES [sdoc].[TipoPago] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TPagoSecuencia])
GO
ALTER TABLE [sdoc].[Factura] CHECK CONSTRAINT [FK_Factura_TipoPago]
GO
ALTER TABLE [sdoc].[FacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalle_Factura] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [FactSecuencia])
REFERENCES [sdoc].[Factura] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [FactSecuencia])
GO
ALTER TABLE [sdoc].[FacturaDetalle] CHECK CONSTRAINT [FK_FacturaDetalle_Factura]
GO
ALTER TABLE [sdoc].[FacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalle_Procedimientos] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [ProcSecuencia_fk])
REFERENCES [sdoc].[Procedimientos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [ProcSecuencia])
GO
ALTER TABLE [sdoc].[FacturaDetalle] CHECK CONSTRAINT [FK_FacturaDetalle_Procedimientos]
GO
ALTER TABLE [sdoc].[Formularios]  WITH CHECK ADD  CONSTRAINT [FK_Formularios_TipoFormulario] FOREIGN KEY([TFormSecuencia_fk])
REFERENCES [sdoc].[TipoFormulario] ([TFormSecuencia])
GO
ALTER TABLE [sdoc].[Formularios] CHECK CONSTRAINT [FK_Formularios_TipoFormulario]
GO
ALTER TABLE [sdoc].[HorariosDiaTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_HorariosDiaTrabajo_Pais] FOREIGN KEY([PaisSecuencia_fk])
REFERENCES [sdoc].[Pais] ([PaisSecuencia])
GO
ALTER TABLE [sdoc].[HorariosDiaTrabajo] CHECK CONSTRAINT [FK_HorariosDiaTrabajo_Pais]
GO
ALTER TABLE [sdoc].[ImagenDoctor]  WITH CHECK ADD  CONSTRAINT [FK_ImagenDoctor_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [sdoc].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [sdoc].[ImagenDoctor] CHECK CONSTRAINT [FK_ImagenDoctor_Doctor]
GO
ALTER TABLE [sdoc].[InstitucionAseguradoraPlanes]  WITH CHECK ADD  CONSTRAINT [FK_InstitucionAseguradoraPlanes_InstitucionesAseguradoras] FOREIGN KEY([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia])
REFERENCES [sdoc].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia])
GO
ALTER TABLE [sdoc].[InstitucionAseguradoraPlanes] CHECK CONSTRAINT [FK_InstitucionAseguradoraPlanes_InstitucionesAseguradoras]
GO
ALTER TABLE [sdoc].[InstitucionesAseguradoras]  WITH CHECK ADD  CONSTRAINT [FK_InstitucionesAseguradoras_Doctor] FOREIGN KEY([DoctSecuencia])
REFERENCES [sdoc].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [sdoc].[InstitucionesAseguradoras] CHECK CONSTRAINT [FK_InstitucionesAseguradoras_Doctor]
GO
ALTER TABLE [sdoc].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [sdoc].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [sdoc].[Paciente] CHECK CONSTRAINT [FK_Paciente_Doctor]
GO
ALTER TABLE [sdoc].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_InstitucionAseguradoraPlanes] FOREIGN KEY([DoctSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [IAsegSecuencia], [IAPlanSecuencia])
REFERENCES [sdoc].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia])
GO
ALTER TABLE [sdoc].[Paciente] CHECK CONSTRAINT [FK_Paciente_InstitucionAseguradoraPlanes]
GO
ALTER TABLE [sdoc].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_InstitucionesAseguradoras1] FOREIGN KEY([DoctSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [IAsegSecuencia])
REFERENCES [sdoc].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia])
GO
ALTER TABLE [sdoc].[Paciente] CHECK CONSTRAINT [FK_Paciente_InstitucionesAseguradoras1]
GO
ALTER TABLE [sdoc].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Pais] FOREIGN KEY([PaisSecuencia_fk])
REFERENCES [sdoc].[Pais] ([PaisSecuencia])
GO
ALTER TABLE [sdoc].[Paciente] CHECK CONSTRAINT [FK_Paciente_Pais]
GO
ALTER TABLE [sdoc].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_TipoDocumento] FOREIGN KEY([TDSecuencia])
REFERENCES [sdoc].[TipoDocumento] ([TDSecuencia])
GO
ALTER TABLE [sdoc].[Paciente] CHECK CONSTRAINT [FK_Paciente_TipoDocumento]
GO
ALTER TABLE [sdoc].[PacienteFoto]  WITH CHECK ADD  CONSTRAINT [FK_PacienteFoto_Paciente] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia])
REFERENCES [sdoc].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia])
GO
ALTER TABLE [sdoc].[PacienteFoto] CHECK CONSTRAINT [FK_PacienteFoto_Paciente]
GO
ALTER TABLE [sdoc].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Pais] FOREIGN KEY([PaisSecuencia_fk])
REFERENCES [sdoc].[Pais] ([PaisSecuencia])
GO
ALTER TABLE [sdoc].[Personal] CHECK CONSTRAINT [FK_Personal_Pais]
GO
ALTER TABLE [sdoc].[Planes]  WITH CHECK ADD  CONSTRAINT [FK_Planes_Moneda] FOREIGN KEY([MoneSecuencia_fk])
REFERENCES [sdoc].[Moneda] ([MoneSecuencia])
GO
ALTER TABLE [sdoc].[Planes] CHECK CONSTRAINT [FK_Planes_Moneda]
GO
ALTER TABLE [sdoc].[PlanFactura]  WITH CHECK ADD  CONSTRAINT [FK_PlanFactura_Usuario] FOREIGN KEY([UsuSecuencia])
REFERENCES [sdoc].[Usuario] ([UsuaSecuencia])
GO
ALTER TABLE [sdoc].[PlanFactura] CHECK CONSTRAINT [FK_PlanFactura_Usuario]
GO
ALTER TABLE [sdoc].[PlanFacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PlanFacturaDetalle_Planes] FOREIGN KEY([PlanSecuencia_fk])
REFERENCES [sdoc].[Planes] ([PlanSecuencia])
GO
ALTER TABLE [sdoc].[PlanFacturaDetalle] CHECK CONSTRAINT [FK_PlanFacturaDetalle_Planes]
GO
ALTER TABLE [sdoc].[PlanFacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PlanFacturaDetalle_PlanFactura] FOREIGN KEY([UsuSecuencia], [PFactSecuencia])
REFERENCES [sdoc].[PlanFactura] ([UsuSecuencia], [PFactSecuencia])
GO
ALTER TABLE [sdoc].[PlanFacturaDetalle] CHECK CONSTRAINT [FK_PlanFacturaDetalle_PlanFactura]
GO
ALTER TABLE [sdoc].[Procedimientos]  WITH CHECK ADD  CONSTRAINT [FK_Procedimientos_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [sdoc].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [sdoc].[Procedimientos] CHECK CONSTRAINT [FK_Procedimientos_Doctor]
GO
ALTER TABLE [sdoc].[Procedimientos]  WITH CHECK ADD  CONSTRAINT [FK_Procedimientos_Moneda] FOREIGN KEY([MoneSecuencia_fk])
REFERENCES [sdoc].[Moneda] ([MoneSecuencia])
GO
ALTER TABLE [sdoc].[Procedimientos] CHECK CONSTRAINT [FK_Procedimientos_Moneda]
GO
ALTER TABLE [sdoc].[RecetaAnalisisClinico]  WITH CHECK ADD  CONSTRAINT [FK_RecetaAnalisisClinico_AnalisisClinico] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [AClinSecuencia_fk])
REFERENCES [sdoc].[AnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [AClinSecuencia])
GO
ALTER TABLE [sdoc].[RecetaAnalisisClinico] CHECK CONSTRAINT [FK_RecetaAnalisisClinico_AnalisisClinico]
GO
ALTER TABLE [sdoc].[RecetaAnalisisClinico]  WITH CHECK ADD  CONSTRAINT [FK_RecetaAnalisisClinico_Recetas] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk])
REFERENCES [sdoc].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia])
GO
ALTER TABLE [sdoc].[RecetaAnalisisClinico] CHECK CONSTRAINT [FK_RecetaAnalisisClinico_Recetas]
GO
ALTER TABLE [sdoc].[RecetaImagenes]  WITH CHECK ADD  CONSTRAINT [FK_RecetaImagenes_Imagenes] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [ImagSecuencia_fk])
REFERENCES [sdoc].[Imagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [ImagSecuencia])
GO
ALTER TABLE [sdoc].[RecetaImagenes] CHECK CONSTRAINT [FK_RecetaImagenes_Imagenes]
GO
ALTER TABLE [sdoc].[RecetaImagenes]  WITH CHECK ADD  CONSTRAINT [FK_RecetaImagenes_Recetas] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk])
REFERENCES [sdoc].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia])
GO
ALTER TABLE [sdoc].[RecetaImagenes] CHECK CONSTRAINT [FK_RecetaImagenes_Recetas]
GO
ALTER TABLE [sdoc].[RecetaMedicamentos]  WITH CHECK ADD  CONSTRAINT [FK_RecetaMedicamentos_Medicamento] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MediSecuencia_fk])
REFERENCES [sdoc].[Medicamento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MediSecuencia])
GO
ALTER TABLE [sdoc].[RecetaMedicamentos] CHECK CONSTRAINT [FK_RecetaMedicamentos_Medicamento]
GO
ALTER TABLE [sdoc].[RecetaMedicamentos]  WITH CHECK ADD  CONSTRAINT [FK_RecetaMedicamentos_Recetas] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk])
REFERENCES [sdoc].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia])
GO
ALTER TABLE [sdoc].[RecetaMedicamentos] CHECK CONSTRAINT [FK_RecetaMedicamentos_Recetas]
GO
ALTER TABLE [sdoc].[RecetaPacienteVacunas]  WITH CHECK ADD  CONSTRAINT [FK_RecetaPacienteVacunas_Recetas] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk])
REFERENCES [sdoc].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia])
GO
ALTER TABLE [sdoc].[RecetaPacienteVacunas] CHECK CONSTRAINT [FK_RecetaPacienteVacunas_Recetas]
GO
ALTER TABLE [sdoc].[RecetaPacienteVacunas]  WITH CHECK ADD  CONSTRAINT [FK_RecetaPacienteVacunas_Vacunas] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [VacuSecuencia_fk])
REFERENCES [sdoc].[Vacunas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [VacuSecuencia])
GO
ALTER TABLE [sdoc].[RecetaPacienteVacunas] CHECK CONSTRAINT [FK_RecetaPacienteVacunas_Vacunas]
GO
ALTER TABLE [sdoc].[Recetas]  WITH CHECK ADD  CONSTRAINT [FK_Recetas_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [sdoc].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [sdoc].[Recetas] CHECK CONSTRAINT [FK_Recetas_Doctor]
GO
ALTER TABLE [sdoc].[Recetas]  WITH CHECK ADD  CONSTRAINT [FK_Recetas_Paciente] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk])
REFERENCES [sdoc].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia])
GO
ALTER TABLE [sdoc].[Recetas] CHECK CONSTRAINT [FK_Recetas_Paciente]
GO
ALTER TABLE [sdoc].[RolFormularios]  WITH CHECK ADD  CONSTRAINT [FK_RolFormularios_Formularios] FOREIGN KEY([FormSecuencia_fk])
REFERENCES [sdoc].[Formularios] ([FormSecuencia])
GO
ALTER TABLE [sdoc].[RolFormularios] CHECK CONSTRAINT [FK_RolFormularios_Formularios]
GO
ALTER TABLE [sdoc].[TipoArchivoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TipoArchivoPaciente_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [sdoc].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [sdoc].[TipoArchivoPaciente] CHECK CONSTRAINT [FK_TipoArchivoPaciente_Doctor]
GO
ALTER TABLE [sdoc].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Especialidades] FOREIGN KEY([EspeSecuencia_fk])
REFERENCES [sdoc].[Especialidades] ([EspeSecuencia])
GO
ALTER TABLE [sdoc].[Usuario] CHECK CONSTRAINT [FK_Usuario_Especialidades]
GO
ALTER TABLE [sdoc].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Planes] FOREIGN KEY([PlanSecuencia_fk])
REFERENCES [sdoc].[Planes] ([PlanSecuencia])
GO
ALTER TABLE [sdoc].[Usuario] CHECK CONSTRAINT [FK_Usuario_Planes]
GO
ALTER TABLE [sdoc].[UsuarioConsultorio]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioConsultorio_Usuario] FOREIGN KEY([UsuaSecuencia_fk])
REFERENCES [sdoc].[Usuario] ([UsuaSecuencia])
GO
ALTER TABLE [sdoc].[UsuarioConsultorio] CHECK CONSTRAINT [FK_UsuarioConsultorio_Usuario]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insertar las acciones a realizar en los formularios  Leer,Insertar,Modificar,Borrar,Anular,Aplicar,Imprimir' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Acciones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'ArchivosPaciente', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Esto es para el tipo de archivo del historial del apaciente, osea si es  radigorafia,analisis, cualquiere imagen,' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'ArchivosPaciente', @level2type=N'COLUMN',@level2name=N'TAPaciSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'para almacenar las imagener, o  analisis realizados por pacientes, u otros .' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'ArchivosPaciente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'si es  secretaria, o ayudante' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'CategoriaPersonal', @level2type=N'COLUMN',@level2name=N'CPersNombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Cita', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'si es secretaria, uotro paersona' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Cita', @level2type=N'COLUMN',@level2name=N'PersSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'ConsultaMedica', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Menor <9   9-16   16 > mayor' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'ConsultaMedica', @level2type=N'COLUMN',@level2name=N'CMediMenarquia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(irregular < 21 -35>)  o (regular 21-35dias)' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'ConsultaMedica', @level2type=N'COLUMN',@level2name=N'CMediPatronMenstrual'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2 -7 dias Normal } <2 o 7> anormal' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'ConsultaMedica', @level2type=N'COLUMN',@level2name=N'CMediMensutracionDuracion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'en esta tabla se cargaran los datos recojidos en la primera consulta  o cuando se comienza un seguimiento por ejemplo cuando viene envabarazada,etc. consulta del paciente. cuando pase un mes sin ir el paciente se debe de validar estas informaciones, y tambien darle la opcion al doctor de crearla  o modificarla si decea


' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'ConsultaMedica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'ConsultaMedicaHistorial', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cada Vez que vaya a consulta, se guardara  un registro  donde se guardara los dactos en la evaluacion Fisica' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'ConsultaMedicaHistorial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'ConsultaMedicaHistorialDiagnostico', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'ConsultaMedicaHistorialMotivoConsulta', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'esta tabla hace la relacion en tre paciente y sus motivos de consulta, como embarazo, dolor en la pelvi, excete.' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'ConsultaMedicaHistorialMotivoConsulta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'ConsultaMedicaHistorialTratamiento', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Secuencia de registro' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Consultorio', @level2type=N'COLUMN',@level2name=N'ConsSecuencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Diagnostico', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Secuencia' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'DoctSecuencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código Único del Profesional Prestador de Servicios de Salud' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'DoctCUPRE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Documento Nacional de Identidad' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'DoctDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del doctor' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'DoctNombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'esta tabla tiene la relacion entre especialidad del doctor y  formulario con  los campos que son permitido mostrar, acorde a su especialidad.' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'EspecialidadFormularioCampos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'si esta activa, posponer, cancelar' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'EstadoAgenda', @level2type=N'COLUMN',@level2name=N'EAgenEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'estados , aguardando, atendido, en consulta, no compadecio' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'EstadoAgenda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Factura', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'si es secretaria, uotro paersona' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Factura', @level2type=N'COLUMN',@level2name=N'PersSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'FacturaDetalle', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'FacturaEstado', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Campos que se podran ver en un formulario' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'FormularioCampos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'HorariosDiaTrabajo', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'para que ponga la programacion del dia feriado  las horas en que trabajara, y en base a esto se haran las citas.' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'HorariosDiaTrabajo', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'aqui se configura la doctora el horario de trabajo, sino teene nada , a la hora de crear cita, podras introducirce cualquier horario. ' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'HorariosDiaTrabajo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Para guardar la foto del doctor' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'ImagenDoctor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'MotivoConsulta', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'estos son los seguimientos por motivo de consultas digase estar embarazada, ect.' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'MotivoConsulta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Paciente', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cedula o pasaporte  no se pude duplicar tiene unique' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Paciente', @level2type=N'COLUMN',@level2name=N'PaciDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'PacienteFoto', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Doctor dueno de este personal' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Personal', @level2type=N'COLUMN',@level2name=N'DoctSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Procedimientos', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'RecetaPacienteVacunas', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Recetas', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'RolFormularios', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'TipoArchivoPaciente', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Para definir los tipos de archivos que existiran.  ejemplo tambien los manos critos  anteriores del paciente, como recetas historiales ect.' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'TipoArchivoPaciente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'si es consulta, o cirugia, o resultado ver, retorno' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'TipoCompromiso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'si es cedula o pasaporte o otra cosa' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'TipoDocumento', @level2type=N'COLUMN',@level2name=N'TDDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'si es cedula, pasaportes u otro documento' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'TipoDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'formulario, o reporte' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'TipoFormulario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'seran las siguientes, Pruebas Diagnostica, procedimientoMedicos,Mediacmentos, Tecnicas quirurgica.' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'TipoIndicacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SI es medicina, o  analitilicas' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'TipoIndicacion', @level2type=N'INDEX',@level2name=N'Unique_TipoIndicacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'TipoPago', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Si es tarjega, credito, contado,etc.' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'TipoPago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Tratamiento', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cutaneo,externo,inalatorio,interno,intra-muscular,intra-venoso,nasal,ocular,renal,oral,sub-cutaneo' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'UsoMedicamentos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Vacunas', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'anios de nacido' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Vacunas', @level2type=N'COLUMN',@level2name=N'AEdadAnio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'meses  de nacido' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Vacunas', @level2type=N'COLUMN',@level2name=N'AEdadMeses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dias  de nacido' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Vacunas', @level2type=N'COLUMN',@level2name=N'AEdadDias'
GO
USE [master]
GO
ALTER DATABASE [DoctorMedicalWeb] SET  READ_WRITE 
GO
