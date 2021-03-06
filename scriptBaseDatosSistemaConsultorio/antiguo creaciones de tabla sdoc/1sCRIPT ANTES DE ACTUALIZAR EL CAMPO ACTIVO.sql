USE [master]
GO
/****** Object:  Database [DoctorMedicalWeb]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
/****** Object:  User [udoc]    Script Date: 03/31/2017 01:06:04 p.m. ******/
CREATE USER [udoc] FOR LOGIN [ldoc] WITH DEFAULT_SCHEMA=[sdoc]
GO
ALTER ROLE [db_owner] ADD MEMBER [udoc]
GO
/****** Object:  Schema [sdoc]    Script Date: 03/31/2017 01:06:04 p.m. ******/
CREATE SCHEMA [sdoc]
GO
/****** Object:  StoredProcedure [sdoc].[sp_Auditoria]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
/****** Object:  Table [sdoc].[Acciones]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Acciones](
	[AcciSecuencia] [int] NOT NULL,
	[AcciNombre] [varchar](50) NOT NULL,
	[EstaDesabilitado] [nvarchar](max) NULL,
 CONSTRAINT [PK_Acciones] PRIMARY KEY CLUSTERED 
(
	[AcciSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[ArchivosPaciente]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nvarchar](max) NULL,
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
/****** Object:  Table [sdoc].[Auditoria]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_Auditoria] PRIMARY KEY CLUSTERED 
(
	[AudiSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[CategoriaPersonal]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_CategoriaPersonal] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[CPersSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Cita]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[Clinica]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_Clinica] PRIMARY KEY CLUSTERED 
(
	[clinSecuencia] ASC,
	[PaisSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[ConsultaMedica]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[ConsultaMedica](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[clinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMediSecuencia] [int] NOT NULL,
	[CMediFecha] [datetime] NOT NULL,
	[GSangSecuencia_fk] [int] NOT NULL,
	[CMediEmbarazada] [bit] NULL,
	[CMediAntecedentePadre] [varchar](max) NULL,
	[CMediAntecedenteMadre] [varchar](max) NULL,
	[CMediAntecedenteHermanos] [varchar](max) NULL,
	[CMediAntecedenteOtros] [varchar](max) NULL,
	[CMediMenarquia] [varchar](max) NULL,
	[CMediPatronMenstrual] [varchar](max) NULL,
	[CMediMensutracionDuracion] [varchar](max) NULL,
	[CMediDismenorrea] [bit] NULL,
	[CMediPrimerCoito] [varchar](max) NULL,
	[CMediNumeroParejas] [int] NULL,
	[CMediDispareunia] [bit] NULL,
	[CMediVidaSexual] [bit] NULL,
	[CMediFechaUltimoParto] [datetime] NULL,
	[CMediFechaUltimoAborto] [datetime] NULL,
	[CMediFechaUltimaMenstruacion] [datetime] NULL,
	[CMediMenopausia] [varchar](max) NULL,
	[CMediGestacionVeces] [int] NULL,
	[CMediPartosVeces] [int] NULL,
	[CMediAbortosVeces] [int] NULL,
	[CMediCesariasVeces] [int] NULL,
	[CMediEctopico] [int] NULL,
	[CMediTensionArterial] [varchar](max) NULL,
	[CMediFrecuenciaCardiaca] [varchar](max) NULL,
	[CMediTiroides] [varchar](max) NULL,
	[CMediPulmones] [varchar](max) NULL,
	[CMediCorazon] [varchar](max) NULL,
	[CMediMamas] [varchar](max) NULL,
	[CMediAbdomen] [varchar](max) NULL,
	[CMediGenitalesExternos] [varchar](max) NULL,
	[CMediTactoVaginal] [varchar](max) NULL,
	[CMediExtremidadesInferiores] [varchar](max) NULL,
	[CMediFechaProbableParto] [datetime] NULL,
	[CMediFechaUltimoPapanicolau] [datetime] NULL,
	[UsuaSecuenciaCreacion] [int] NULL,
	[UsuaFechaCreacion] [datetime] NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[UsuaFechaModificacion] [datetime] NULL,
	[EstaDesabilitado] [nchar](10) NULL,
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[ConsultaMedicaHistorial]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[CMHistPeso] [decimal](18, 2) NULL,
	[CMHistTalla] [decimal](18, 2) NULL,
	[CMHistCodigo] [nvarchar](max) NULL,
	[CMHistFecha] [datetime] NULL,
	[CMHistSintomas] [nvarchar](max) NULL,
	[CitaSecuencia_fk] [int] NULL,
	[CMHistEstatura] [nvarchar](max) NULL,
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
	[UsuaFechaCreacion] [datetime] NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[UsuaFechaModificacion] [datetime] NULL,
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[ConsultaMedicaHistorialDiagnostico]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[ConsultaMedicaHistorialEvaluacionFisica]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[ConsultaMedicaHistorialMotivoConsulta]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[ConsultaMedicaHistorialTratamiento]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[Consultorio]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_Consultorio] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[ConsSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Diagnostico]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[Doctor]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaBorrado] [bit] NULL,
	[UsuaSecuenciaCreacion] [int] NULL,
	[DoctFechaCreacion] [datetime] NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[DoctFechaModificacion] [datetime] NULL,
	[DoctPermitirCompartirDatos] [bit] NULL,
	[DoctGenero] [nvarchar](max) NULL,
	[PaisSecuencia] [int] NOT NULL,
	[DoctFotoPath] [nvarchar](max) NULL,
	[DoctFotoNombre] [nvarchar](max) NULL,
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Especialidades]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Especialidades](
	[EspeSecuencia] [int] NOT NULL,
	[EspeNombre] [varchar](50) NOT NULL,
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_Especialidades] PRIMARY KEY CLUSTERED 
(
	[EspeSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[EspecialidadFormularioCampos]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[EspecialidadFormularioCampos](
	[EspeSecuencia_fk] [int] NOT NULL,
	[FormSecuencia_fk] [int] NOT NULL,
	[FCampSecuencia_fk] [int] NOT NULL,
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_EspecialidadFormularioCampos] PRIMARY KEY CLUSTERED 
(
	[EspeSecuencia_fk] ASC,
	[FormSecuencia_fk] ASC,
	[FCampSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[EstadoAgenda]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[EstadoAgenda](
	[EAgenSecuencia] [int] NOT NULL,
	[EAgenEstado] [varchar](50) NOT NULL,
	[EstaDesabilitado] [nchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[EvaluacionFisica]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[EvaluacionFisica](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[EFisiSecuencia] [int] NOT NULL,
	[EFisiCodigoNombre] [nvarchar](max) NOT NULL,
	[EFisiDescripcion] [nvarchar](max) NULL,
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_EvaluacionFisica] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[EFisiSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Factura]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[FacturaDetalle]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[FacturaEstado]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[FormularioCampos]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[FormularioCampos](
	[FCampSecuencia] [int] NOT NULL,
	[FCampIdNombre] [varchar](50) NOT NULL,
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_FormularioCampos] PRIMARY KEY CLUSTERED 
(
	[FCampSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Formularios]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_Formularios] PRIMARY KEY CLUSTERED 
(
	[FormSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[FormulariosAccion]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[FormulariosAccion](
	[FAcciSecuencia] [int] NOT NULL,
	[FormSecuencia_fk] [int] NOT NULL,
	[AcciSecuencia_fk] [int] NOT NULL,
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_FormulariosAccion] PRIMARY KEY CLUSTERED 
(
	[FAcciSecuencia] ASC,
	[FormSecuencia_fk] ASC,
	[AcciSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[GrupoSanguineo]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[GrupoSanguineo](
	[GSangSecuencia] [int] NOT NULL,
	[GSangNombre] [varchar](50) NOT NULL,
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_GrupoSanguineo] PRIMARY KEY CLUSTERED 
(
	[GSangSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[HorariosDiaTrabajo]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[ImagenDoctor]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_ImagenDoctor] PRIMARY KEY CLUSTERED 
(
	[ImagSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Indicaciones]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Indicaciones](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[TIndiSecuencia_fk] [int] NOT NULL,
	[UMediSecuencia_fk] [int] NOT NULL,
	[IndiSecuencia] [int] NOT NULL,
	[IndiCodigo] [varchar](max) NULL,
	[IndiNombre] [varchar](50) NOT NULL,
	[IndiDescripcion] [varchar](50) NOT NULL,
	[IndiPrecentacion] [varchar](50) NOT NULL,
	[IndiMarca] [varchar](50) NULL,
	[IndiComentario] [varchar](50) NULL,
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_Indicaciones] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[TIndiSecuencia_fk] ASC,
	[UMediSecuencia_fk] ASC,
	[IndiSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[InstitucionAseguradoraPlanes]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[InstitucionesAseguradoras]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_InstitucionesAseguradoras] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia] ASC,
	[ClinSecuencia] ASC,
	[ConsSecuencia] ASC,
	[IAsegSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[LoginProvider]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[LoginProvider](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UsuaSecuencia] [nvarchar](128) NOT NULL,
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_LoginProvider] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UsuaSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Moneda]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Moneda](
	[MoneSecuencia] [int] NOT NULL,
	[MoneMoneda] [varchar](50) NOT NULL,
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_Moneda] PRIMARY KEY CLUSTERED 
(
	[MoneSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[MotivoConsulta]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[Paciente]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[PacienteFoto]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[Pais]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Pais](
	[PaisSecuencia] [int] NOT NULL,
	[PaisNombre] [varchar](100) NOT NULL,
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[PaisSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[PediatraParto]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[PEDIATRIAeMBARAZO]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Personal]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PersSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Planes]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_Planes] PRIMARY KEY CLUSTERED 
(
	[PlanSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[PlanFactura]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_PlanFactura] PRIMARY KEY CLUSTERED 
(
	[UsuSecuencia] ASC,
	[PFactSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[PlanFacturaDetalle]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[PlanFacturaDetalle](
	[PFDetaSecuencia] [int] NOT NULL,
	[UsuSecuencia] [int] NOT NULL,
	[PFactSecuencia] [int] NOT NULL,
	[PlanSecuencia_fk] [int] NOT NULL,
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_PlanFacturaDetalle] PRIMARY KEY CLUSTERED 
(
	[PFDetaSecuencia] ASC,
	[UsuSecuencia] ASC,
	[PFactSecuencia] ASC,
	[PlanSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[PlanFormularios]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sdoc].[PlanFormularios](
	[PFSecuencia] [int] NOT NULL,
	[PlanSecuencia_fk] [int] NOT NULL,
	[FormSecuencia_fk] [int] NOT NULL,
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_PlanFormularios_1] PRIMARY KEY CLUSTERED 
(
	[PlanSecuencia_fk] ASC,
	[FormSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Procedimientos]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[RecetaIndicaciones]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[RecetaIndicaciones](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[ReceSecuencia_fk] [int] NOT NULL,
	[IndiSecuencia_fk] [int] NOT NULL,
	[TIndiSecuencia_fk] [int] NOT NULL,
	[UMediSecuencia_fk] [int] NOT NULL,
	[RIndiSecuencia] [int] NOT NULL,
	[MediPresentacionMedicamento] [varchar](50) NULL,
	[RIndiCantidad] [int] NULL,
	[RIndiPrescripcion] [varchar](max) NULL,
	[RIndiDuracion] [varchar](50) NULL,
	[RIndiComentario] [nchar](10) NULL,
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_RecetaMedicamentos] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[ReceSecuencia_fk] ASC,
	[TIndiSecuencia_fk] ASC,
	[UMediSecuencia_fk] ASC,
	[IndiSecuencia_fk] ASC,
	[RIndiSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[RecetaPacienteVacunas]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[Recetas]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[ReceInstruccionesFarmacia] [varchar](max) NULL,
	[ReceDescripcion] [varchar](max) NULL,
	[ReceComentario] [varchar](max) NULL,
	[UsuaSecuenciaCreacion] [int] NOT NULL,
	[UsuaFechaCreacion] [datetime] NOT NULL,
	[UsuaSecuenciaModificacion] [int] NOT NULL,
	[UsuaFechaModificacion] [datetime] NOT NULL,
	[EstaDesabilitado] [nchar](10) NULL,
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Representante]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_Representante] PRIMARY KEY CLUSTERED 
(
	[ReprDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[Role]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Role](
	[DoctSecuencia_fk] [int] NOT NULL,
	[RoleSecuencia] [int] NOT NULL,
	[RoleDescripcion] [varchar](max) NOT NULL,
	[UsuaSecuencia] [int] NULL,
	[RoleFechaCreacion] [datetime] NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[RoleFechaModificacion] [datetime] NULL,
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_Role_1] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[RoleSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[RolFormularios]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[TipoArchivoPaciente]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
/****** Object:  Table [sdoc].[TipoCompromiso]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
/****** Object:  Table [sdoc].[TipoDocumento]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
/****** Object:  Table [sdoc].[TipoFormulario]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
/****** Object:  Table [sdoc].[TipoIndicacion]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
/****** Object:  Table [sdoc].[TipoPago]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
/****** Object:  Table [sdoc].[Tratamiento]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
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
/****** Object:  Table [sdoc].[UsoMedicamentos]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
/****** Object:  Table [sdoc].[Usuario]    Script Date: 03/31/2017 01:06:04 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sdoc].[Usuario](
	[UsuaSecuencia] [int] NOT NULL,
	[UsuaEmail] [varchar](max) NOT NULL,
	[UsuaClave] [varchar](max) NOT NULL,
	[UsuaNombre] [varchar](max) NOT NULL,
	[UsuaApellido] [varchar](max) NOT NULL,
	[UsuaFechaNacimiento] [datetime] NOT NULL,
	[UsuaGenero] [varchar](max) NOT NULL,
	[RoleSecuencia_fk] [int] NULL,
	[UsuaIntentos] [int] NOT NULL,
	[PaisSecuencia] [int] NOT NULL,
	[PlanSecuencia_fk] [int] NULL,
	[EspeSecuencia_fk] [int] NULL,
	[UsuaActivo] [bit] NULL,
	[UsuaEstaBorrado] [bit] NULL,
	[UsuaSecuenciaCreacion] [int] NOT NULL,
	[UsuaFechaCreacion] [datetime] NOT NULL,
	[UsuaSecuenciaModificacion] [int] NOT NULL,
	[UsuaFechaModificacion] [datetime] NULL,
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[UsuaSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sdoc].[UsuarioConsultorio]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
	[EstaDesabilitado] [nchar](10) NULL,
 CONSTRAINT [PK_UsuarioConsultorio_1] PRIMARY KEY CLUSTERED 
(
	[UsuaSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sdoc].[Vacunas]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
/****** Object:  View [sdoc].[vw_ConsultorioDoctor]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
/****** Object:  View [sdoc].[vw_ListDeFormuriosbyRolyUser]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
/****** Object:  View [sdoc].[vw_planFormulario]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
/****** Object:  View [sdoc].[vw_UsuarioConsultorios]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
,usu.UsuaFechaNacimiento
,usu.UsuaGenero
,usu.RoleSecuencia_fk
,usu.UsuaIntentos
,usu.PaisSecuencia
,usu.PlanSecuencia_fk
,usu.EspeSecuencia_fk
,usu.UsuaActivo
,usu.UsuaEstaBorrado
,usu.UsuaSecuenciaCreacion
,usu.UsuaFechaCreacion
,usu.UsuaSecuenciaModificacion
,usu.UsuaFechaModificacion



 from sdoc.usuario usu
  inner join [sdoc].[UsuarioConsultorio] dc
			 on usu.usuasecuencia  = dc.UsuaSecuencia_fk


  















GO
/****** Object:  View [sdoc].[vw_UsuarioDoctor]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
      ,u.[UsuaActivo]
      ,u.[UsuaEstaBorrado]
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
      ,d.[EstaBorrado]
      
      ,d.[DoctFechaCreacion]
      
      ,d.[DoctFechaModificacion]
      ,d.[DoctPermitirCompartirDatos]
      ,d.[DoctGenero]
      
  FROM [sdoc].[Usuario] u
  inner join sdoc.Doctor d
  on u.UsuaSecuencia = d.UsuSecuencia
  
  























GO
/****** Object:  View [sdoc].[vw_UsuariosPersonalDelDoctor]    Script Date: 03/31/2017 01:06:04 p.m. ******/
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
,usu.UsuaActivo
,usu.UsuaEstaBorrado
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
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-28 18:38:47.050' AS DateTime), CAST(N'2017-03-28 18:38:47.063' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-28 18:41:13.543' AS DateTime), CAST(N'2017-03-28 18:41:13.543' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Borrar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-28 19:41:00.927' AS DateTime), CAST(N'2017-03-28 19:41:00.937' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (4, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-28 19:53:52.807' AS DateTime), CAST(N'2017-03-28 19:53:52.820' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (5, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-28 19:58:58.787' AS DateTime), CAST(N'2017-03-28 19:58:58.797' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (6, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-28 20:01:04.670' AS DateTime), CAST(N'2017-03-28 20:01:04.680' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (7, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-28 20:01:40.853' AS DateTime), CAST(N'2017-03-28 20:01:40.853' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (8, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-28 20:04:19.333' AS DateTime), CAST(N'2017-03-28 20:04:19.340' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (9, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-28 20:05:02.400' AS DateTime), CAST(N'2017-03-28 20:05:02.400' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (10, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-28 20:05:02.653' AS DateTime), CAST(N'2017-03-28 20:05:02.653' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Roles', NULL, N'Error', N'The property ''DoctSecuencia_fk'' is part of the object''s key information and cannot be modified. ', NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (11, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-28 20:08:24.553' AS DateTime), CAST(N'2017-03-28 20:08:24.563' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (12, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-28 20:08:58.750' AS DateTime), CAST(N'2017-03-28 20:08:58.750' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (13, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 09:27:15.637' AS DateTime), CAST(N'2017-03-29 09:27:15.637' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (14, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 09:37:06.037' AS DateTime), CAST(N'2017-03-29 09:37:06.037' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (15, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 09:37:42.223' AS DateTime), CAST(N'2017-03-29 09:37:42.223' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (16, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 09:37:54.177' AS DateTime), CAST(N'2017-03-29 09:37:54.177' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (17, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 09:38:13.980' AS DateTime), CAST(N'2017-03-29 09:38:13.980' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Borrar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (18, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 09:47:12.730' AS DateTime), CAST(N'2017-03-29 09:47:12.940' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (19, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 09:47:41.633' AS DateTime), CAST(N'2017-03-29 09:47:41.633' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (20, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 09:47:54.747' AS DateTime), CAST(N'2017-03-29 09:47:54.747' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (21, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 09:48:03.487' AS DateTime), CAST(N'2017-03-29 09:48:03.487' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (22, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 09:48:11.810' AS DateTime), CAST(N'2017-03-29 09:48:11.810' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (23, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 09:48:39.327' AS DateTime), CAST(N'2017-03-29 09:48:39.327' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (24, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 09:48:50.950' AS DateTime), CAST(N'2017-03-29 09:48:50.950' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (25, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 09:49:24.627' AS DateTime), CAST(N'2017-03-29 09:49:24.627' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Borrar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (26, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 09:49:33.720' AS DateTime), CAST(N'2017-03-29 09:49:33.720' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Borrar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (27, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 09:49:40.077' AS DateTime), CAST(N'2017-03-29 09:49:40.077' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Borrar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (28, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 09:49:56.030' AS DateTime), CAST(N'2017-03-29 09:49:56.030' AS DateTime), NULL, NULL, 3, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (29, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:30:45.543' AS DateTime), CAST(N'2017-03-29 11:30:45.547' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (30, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:31:21.277' AS DateTime), CAST(N'2017-03-29 11:31:21.277' AS DateTime), NULL, NULL, 3, N'::1', N'pag_RolePages', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (31, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:31:26.227' AS DateTime), CAST(N'2017-03-29 11:31:26.227' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (32, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:37:29.833' AS DateTime), CAST(N'2017-03-29 11:37:29.837' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (33, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:38:04.780' AS DateTime), CAST(N'2017-03-29 11:38:04.780' AS DateTime), NULL, NULL, 3, N'::1', N'pag_MotivoConsulta', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (34, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:38:04.927' AS DateTime), CAST(N'2017-03-29 11:38:04.927' AS DateTime), NULL, NULL, 3, N'::1', N'pag_MotivoConsulta', NULL, N'Error', N'Validation failed for one or more entities. See ''EntityValidationErrors'' property for more details.', NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (35, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:40:17.783' AS DateTime), CAST(N'2017-03-29 11:40:17.790' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (36, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:40:39.283' AS DateTime), CAST(N'2017-03-29 11:40:39.283' AS DateTime), NULL, NULL, 3, N'::1', N'pag_MotivoConsulta', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (37, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:40:50.023' AS DateTime), CAST(N'2017-03-29 11:40:50.023' AS DateTime), NULL, NULL, 3, N'::1', N'pag_MotivoConsulta', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (38, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:41:07.847' AS DateTime), CAST(N'2017-03-29 11:41:07.847' AS DateTime), NULL, NULL, 3, N'::1', N'pag_MotivoConsulta', NULL, N'Borrar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (39, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:41:15.283' AS DateTime), CAST(N'2017-03-29 11:41:15.283' AS DateTime), NULL, NULL, 3, N'::1', N'pag_MotivoConsulta', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (40, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:42:50.913' AS DateTime), CAST(N'2017-03-29 11:42:50.920' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (41, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:43:04.987' AS DateTime), CAST(N'2017-03-29 11:43:04.987' AS DateTime), NULL, NULL, 3, N'::1', N'pag_MotivoConsulta', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (42, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:43:10.087' AS DateTime), CAST(N'2017-03-29 11:43:10.087' AS DateTime), NULL, NULL, 3, N'::1', N'pag_MotivoConsulta', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (43, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:44:00.063' AS DateTime), CAST(N'2017-03-29 11:44:00.063' AS DateTime), NULL, NULL, 3, N'::1', N'pag_MotivoConsulta', NULL, N'Borrar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (44, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:44:09.270' AS DateTime), CAST(N'2017-03-29 11:44:09.270' AS DateTime), NULL, NULL, 3, N'::1', N'pag_MotivoConsulta', NULL, N'Borrar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (45, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 11:44:14.533' AS DateTime), CAST(N'2017-03-29 11:44:14.533' AS DateTime), NULL, NULL, 3, N'::1', N'pag_MotivoConsulta', NULL, N'Borrar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (46, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:07:38.817' AS DateTime), CAST(N'2017-03-29 14:07:38.827' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (47, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:08:07.970' AS DateTime), CAST(N'2017-03-29 14:08:07.970' AS DateTime), NULL, NULL, 3, N'::1', N'pag_RolePages', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (48, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:08:16.223' AS DateTime), CAST(N'2017-03-29 14:08:16.223' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (49, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:09:17.500' AS DateTime), CAST(N'2017-03-29 14:09:17.500' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Tratamiento', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (50, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:09:47.497' AS DateTime), CAST(N'2017-03-29 14:09:47.497' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Tratamiento', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (51, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:10:07.537' AS DateTime), CAST(N'2017-03-29 14:10:07.537' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Tratamiento', NULL, N'Borrar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (52, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:11:40.920' AS DateTime), CAST(N'2017-03-29 14:11:40.923' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (53, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:11:54.060' AS DateTime), CAST(N'2017-03-29 14:11:54.060' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Tratamiento', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (54, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:11:58.080' AS DateTime), CAST(N'2017-03-29 14:11:58.080' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Tratamiento', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (55, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:12:07.007' AS DateTime), CAST(N'2017-03-29 14:12:07.007' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Tratamiento', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (56, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:35:37.587' AS DateTime), CAST(N'2017-03-29 14:35:37.590' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (57, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:41:07.143' AS DateTime), CAST(N'2017-03-29 14:41:07.143' AS DateTime), NULL, NULL, 3, N'::1', N'pag_RolePages', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (58, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:41:12.633' AS DateTime), CAST(N'2017-03-29 14:41:12.633' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (59, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:41:49.763' AS DateTime), CAST(N'2017-03-29 14:41:49.763' AS DateTime), NULL, NULL, 3, N'::1', N'pag_EvaluacionFisica', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (60, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:41:59.693' AS DateTime), CAST(N'2017-03-29 14:41:59.693' AS DateTime), NULL, NULL, 3, N'::1', N'pag_EvaluacionFisica', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (61, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:42:14.110' AS DateTime), CAST(N'2017-03-29 14:42:14.110' AS DateTime), NULL, NULL, 3, N'::1', N'pag_EvaluacionFisica', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (62, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:42:27.457' AS DateTime), CAST(N'2017-03-29 14:42:27.457' AS DateTime), NULL, NULL, 3, N'::1', N'pag_EvaluacionFisica', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (63, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:42:33.947' AS DateTime), CAST(N'2017-03-29 14:42:33.947' AS DateTime), NULL, NULL, 3, N'::1', N'pag_EvaluacionFisica', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (64, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:55:36.967' AS DateTime), CAST(N'2017-03-29 14:55:36.973' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (65, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:55:55.703' AS DateTime), CAST(N'2017-03-29 14:55:55.703' AS DateTime), NULL, NULL, 3, N'::1', N'pag_EvaluacionFisica', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (66, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:56:04.100' AS DateTime), CAST(N'2017-03-29 14:56:04.100' AS DateTime), NULL, NULL, 3, N'::1', N'pag_EvaluacionFisica', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (67, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:56:47.693' AS DateTime), CAST(N'2017-03-29 14:56:47.693' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Diagnosticos', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (68, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:56:50.030' AS DateTime), CAST(N'2017-03-29 14:56:50.030' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Diagnosticos', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (69, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:57:53.533' AS DateTime), CAST(N'2017-03-29 14:57:53.533' AS DateTime), NULL, NULL, 3, N'::1', N'pag_MotivoConsulta', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (70, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 14:57:55.803' AS DateTime), CAST(N'2017-03-29 14:57:55.803' AS DateTime), NULL, NULL, 3, N'::1', N'pag_MotivoConsulta', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (71, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 15:22:53.477' AS DateTime), CAST(N'2017-03-29 15:22:53.503' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (72, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-29 15:30:14.157' AS DateTime), CAST(N'2017-03-29 15:30:14.157' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (73, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 09:42:59.027' AS DateTime), CAST(N'2017-03-30 09:42:59.030' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (74, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 09:43:33.990' AS DateTime), CAST(N'2017-03-30 09:43:33.990' AS DateTime), NULL, NULL, 3, N'::1', N'pag_RolePages', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (75, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 09:43:39.107' AS DateTime), CAST(N'2017-03-30 09:43:39.107' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (76, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 09:57:36.573' AS DateTime), CAST(N'2017-03-30 09:57:36.577' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (77, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 10:02:47.903' AS DateTime), CAST(N'2017-03-30 10:02:47.903' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Clinica', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (78, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 10:02:48.587' AS DateTime), CAST(N'2017-03-30 10:02:48.587' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Clinica', NULL, N'Error', N'The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.', NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (79, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 10:04:30.947' AS DateTime), CAST(N'2017-03-30 10:04:30.947' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Clinica', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (80, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 10:17:59.280' AS DateTime), CAST(N'2017-03-30 10:17:59.290' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (81, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 10:25:05.360' AS DateTime), CAST(N'2017-03-30 10:25:05.363' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (82, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 10:28:51.490' AS DateTime), CAST(N'2017-03-30 10:28:51.490' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Clinica', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (83, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 10:30:40.243' AS DateTime), CAST(N'2017-03-30 10:30:40.247' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (84, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 10:42:01.360' AS DateTime), CAST(N'2017-03-30 10:42:01.367' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (85, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 10:45:01.033' AS DateTime), CAST(N'2017-03-30 10:45:01.037' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (86, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 10:50:01.160' AS DateTime), CAST(N'2017-03-30 10:50:01.163' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (87, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 10:50:36.887' AS DateTime), CAST(N'2017-03-30 10:50:36.887' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Clinica', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (88, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 10:51:56.883' AS DateTime), CAST(N'2017-03-30 10:51:56.883' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Clinica', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (89, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 10:52:11.313' AS DateTime), CAST(N'2017-03-30 10:52:11.313' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Clinica', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (90, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 10:53:31.217' AS DateTime), CAST(N'2017-03-30 10:53:31.217' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Clinica', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (91, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 11:11:27.517' AS DateTime), CAST(N'2017-03-30 11:11:27.553' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (92, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 11:21:44.140' AS DateTime), CAST(N'2017-03-30 11:21:44.140' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Clinica', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (93, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 11:25:43.967' AS DateTime), CAST(N'2017-03-30 11:25:43.970' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (94, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 11:26:24.900' AS DateTime), CAST(N'2017-03-30 11:26:24.900' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Clinica', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (95, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 11:28:46.233' AS DateTime), CAST(N'2017-03-30 11:28:46.233' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Paciente', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (96, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 12:20:04.687' AS DateTime), CAST(N'2017-03-30 12:20:04.697' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (97, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 12:30:33.180' AS DateTime), CAST(N'2017-03-30 12:30:33.187' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (98, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 12:32:02.747' AS DateTime), CAST(N'2017-03-30 12:32:02.747' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Clinica', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (99, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 12:36:33.413' AS DateTime), CAST(N'2017-03-30 12:36:33.417' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (100, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 12:42:02.567' AS DateTime), CAST(N'2017-03-30 12:42:02.570' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
GO
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (101, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 12:44:12.497' AS DateTime), CAST(N'2017-03-30 12:44:12.500' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (102, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 12:46:54.003' AS DateTime), CAST(N'2017-03-30 12:46:54.017' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (103, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 12:49:05.587' AS DateTime), CAST(N'2017-03-30 12:49:05.590' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (104, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 12:57:31.760' AS DateTime), CAST(N'2017-03-30 12:57:31.767' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (105, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 13:14:50.920' AS DateTime), CAST(N'2017-03-30 13:14:50.923' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (106, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 13:17:40.660' AS DateTime), CAST(N'2017-03-30 13:17:40.660' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Paciente', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (107, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 13:23:29.330' AS DateTime), CAST(N'2017-03-30 13:23:29.333' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (108, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 13:32:38.340' AS DateTime), CAST(N'2017-03-30 13:32:38.343' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (109, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 13:35:01.727' AS DateTime), CAST(N'2017-03-30 13:35:01.733' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (110, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 15:18:03.353' AS DateTime), CAST(N'2017-03-30 15:18:03.363' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (111, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 15:21:55.017' AS DateTime), CAST(N'2017-03-30 15:21:55.020' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (112, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 15:24:24.743' AS DateTime), CAST(N'2017-03-30 15:24:24.743' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (113, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 15:24:50.980' AS DateTime), CAST(N'2017-03-30 15:24:50.980' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Error', N'The property ''ClinSecuencia_fk'' is part of the object''s key information and cannot be modified. ', NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (114, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 15:26:48.153' AS DateTime), CAST(N'2017-03-30 15:26:48.153' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (115, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 15:27:30.850' AS DateTime), CAST(N'2017-03-30 15:27:30.850' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Error', N'The property ''ClinSecuencia_fk'' is part of the object''s key information and cannot be modified. ', NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (116, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 15:27:48.037' AS DateTime), CAST(N'2017-03-30 15:27:48.037' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (117, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 15:29:10.413' AS DateTime), CAST(N'2017-03-30 15:29:10.413' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (118, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 15:29:10.450' AS DateTime), CAST(N'2017-03-30 15:29:10.450' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Error', N'The property ''ClinSecuencia_fk'' is part of the object''s key information and cannot be modified. ', NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (119, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 15:29:45.930' AS DateTime), CAST(N'2017-03-30 15:29:45.930' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (120, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 15:29:54.107' AS DateTime), CAST(N'2017-03-30 15:29:54.107' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Error', N'The property ''ClinSecuencia_fk'' is part of the object''s key information and cannot be modified. ', NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (121, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 15:40:45.557' AS DateTime), CAST(N'2017-03-30 15:40:45.557' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (122, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 15:44:20.673' AS DateTime), CAST(N'2017-03-30 15:44:20.677' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (123, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 16:00:15.887' AS DateTime), CAST(N'2017-03-30 16:00:15.887' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (124, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 16:01:18.497' AS DateTime), CAST(N'2017-03-30 16:01:18.500' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (125, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 18:29:54.757' AS DateTime), CAST(N'2017-03-30 18:29:54.797' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (126, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 18:33:25.450' AS DateTime), CAST(N'2017-03-30 18:33:25.450' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (127, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 18:34:22.987' AS DateTime), CAST(N'2017-03-30 18:34:22.990' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (128, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 18:35:23.503' AS DateTime), CAST(N'2017-03-30 18:35:23.503' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (129, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 18:37:27.393' AS DateTime), CAST(N'2017-03-30 18:37:27.393' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (130, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 18:39:21.727' AS DateTime), CAST(N'2017-03-30 18:39:21.730' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (131, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 18:44:07.270' AS DateTime), CAST(N'2017-03-30 18:44:07.270' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Error', N'Object reference not set to an instance of an object.', NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (132, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 18:46:07.797' AS DateTime), CAST(N'2017-03-30 18:46:07.797' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Error', N'Object reference not set to an instance of an object.', NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (133, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 18:54:04.817' AS DateTime), CAST(N'2017-03-30 18:54:04.820' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (134, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 18:57:20.870' AS DateTime), CAST(N'2017-03-30 18:57:20.997' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (135, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 18:58:38.550' AS DateTime), CAST(N'2017-03-30 18:58:38.550' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (136, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 18:59:01.770' AS DateTime), CAST(N'2017-03-30 18:59:01.770' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (137, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 19:03:25.617' AS DateTime), CAST(N'2017-03-30 19:03:25.623' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (138, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 19:05:03.060' AS DateTime), CAST(N'2017-03-30 19:05:03.060' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (139, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 19:05:03.167' AS DateTime), CAST(N'2017-03-30 19:05:03.167' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Error', N'The property ''ClinSecuencia_fk'' is part of the object''s key information and cannot be modified. ', NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (140, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 19:05:18.703' AS DateTime), CAST(N'2017-03-30 19:05:18.703' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (141, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-30 19:05:48.297' AS DateTime), CAST(N'2017-03-30 19:05:48.297' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Error', N'The property ''ClinSecuencia_fk'' is part of the object''s key information and cannot be modified. ', NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (142, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 08:34:47.633' AS DateTime), CAST(N'2017-03-31 08:34:47.637' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (143, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 08:36:01.197' AS DateTime), CAST(N'2017-03-31 08:36:01.197' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Clinica', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (144, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 08:36:20.753' AS DateTime), CAST(N'2017-03-31 08:36:20.753' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (145, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 08:37:39.587' AS DateTime), CAST(N'2017-03-31 08:37:39.587' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (146, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 08:37:59.287' AS DateTime), CAST(N'2017-03-31 08:37:59.287' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Error', N'The property ''ClinSecuencia_fk'' is part of the object''s key information and cannot be modified. ', NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (147, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 09:05:28.547' AS DateTime), CAST(N'2017-03-31 09:05:28.553' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (148, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 09:08:43.690' AS DateTime), CAST(N'2017-03-31 09:08:43.690' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (149, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 09:14:18.760' AS DateTime), CAST(N'2017-03-31 09:14:18.763' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (150, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 09:17:03.263' AS DateTime), CAST(N'2017-03-31 09:17:03.263' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (151, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 09:18:58.607' AS DateTime), CAST(N'2017-03-31 09:18:58.610' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (152, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 09:21:39.403' AS DateTime), CAST(N'2017-03-31 09:21:39.403' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (153, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 09:23:09.737' AS DateTime), CAST(N'2017-03-31 09:23:09.737' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Error', N'The property ''ClinSecuencia_fk'' is part of the object''s key information and cannot be modified. ', NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (154, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 09:47:53.030' AS DateTime), CAST(N'2017-03-31 09:47:53.033' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (155, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 09:59:49.710' AS DateTime), CAST(N'2017-03-31 09:59:49.717' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (156, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 10:01:42.750' AS DateTime), CAST(N'2017-03-31 10:01:42.753' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (157, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 10:02:56.770' AS DateTime), CAST(N'2017-03-31 10:02:56.770' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Nuevo', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (158, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 10:03:55.873' AS DateTime), CAST(N'2017-03-31 10:03:55.873' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (159, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 10:04:24.843' AS DateTime), CAST(N'2017-03-31 10:04:24.843' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (160, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 10:54:09.283' AS DateTime), CAST(N'2017-03-31 10:54:09.287' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (161, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 10:58:23.100' AS DateTime), CAST(N'2017-03-31 10:58:23.103' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (162, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 11:01:35.647' AS DateTime), CAST(N'2017-03-31 11:01:35.647' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (163, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 11:03:34.537' AS DateTime), CAST(N'2017-03-31 11:03:34.540' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (164, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 11:04:24.797' AS DateTime), CAST(N'2017-03-31 11:04:24.797' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Error', N'Sequence contains more than one element', NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (165, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 11:04:36.717' AS DateTime), CAST(N'2017-03-31 11:04:36.717' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (166, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 11:05:23.237' AS DateTime), CAST(N'2017-03-31 11:05:23.237' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (167, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 11:05:42.873' AS DateTime), CAST(N'2017-03-31 11:05:42.873' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (168, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 11:10:05.120' AS DateTime), CAST(N'2017-03-31 11:10:05.123' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (169, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 11:17:23.060' AS DateTime), CAST(N'2017-03-31 11:17:23.070' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (170, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 11:50:21.787' AS DateTime), CAST(N'2017-03-31 11:50:21.787' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (171, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 11:51:08.107' AS DateTime), CAST(N'2017-03-31 11:51:08.107' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (172, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 11:51:21.097' AS DateTime), CAST(N'2017-03-31 11:51:21.097' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (173, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 11:51:46.647' AS DateTime), CAST(N'2017-03-31 11:51:46.647' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (174, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 11:51:55.780' AS DateTime), CAST(N'2017-03-31 11:51:55.780' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (175, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 11:55:28.797' AS DateTime), CAST(N'2017-03-31 11:55:28.800' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (176, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 12:06:10.167' AS DateTime), CAST(N'2017-03-31 12:06:10.170' AS DateTime), NULL, NULL, 3, N'::1', N'SeleccioneConsultorio', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (177, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 12:06:40.143' AS DateTime), CAST(N'2017-03-31 12:06:40.143' AS DateTime), NULL, NULL, 3, N'::1', N'pag_Consultorio', NULL, N'Editar', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (178, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 12:08:38.367' AS DateTime), CAST(N'2017-03-31 12:08:38.373' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (179, 1, 1, 1, 3, 0, NULL, CAST(N'2017-03-31 12:45:17.417' AS DateTime), CAST(N'2017-03-31 12:45:17.417' AS DateTime), NULL, NULL, 3, N'::1', N'Ini_UsuarioPersonal', NULL, N'Iniciar_Sesion', NULL, NULL)
INSERT [sdoc].[CategoriaPersonal] ([DoctSecuencia_fk], [CPersSecuencia], [CPersNombre], [UsuaSecuencia], [CPersFechaCreacion], [UsuaSecuenciaModificacion], [CPersFechaModificacion], [EstaDesabilitado]) VALUES (3, 1, N'Secretaria', 3, CAST(N'2017-02-12 12:01:41.787' AS DateTime), 3, CAST(N'2017-02-12 13:49:44.427' AS DateTime), NULL)
INSERT [sdoc].[CategoriaPersonal] ([DoctSecuencia_fk], [CPersSecuencia], [CPersNombre], [UsuaSecuencia], [CPersFechaCreacion], [UsuaSecuenciaModificacion], [CPersFechaModificacion], [EstaDesabilitado]) VALUES (3, 2, N'Doctor Suplente', 3, CAST(N'2017-02-12 12:01:50.747' AS DateTime), 3, CAST(N'2017-02-12 13:31:41.637' AS DateTime), NULL)
INSERT [sdoc].[Clinica] ([clinSecuencia], [PaisSecuencia_fk], [clinRazonSocial], [clinEstablecimiento], [clinOrganismoSuperior], [clinDireccion], [clinTelefono], [clinTelefono2], [clinRNC], [clinFax], [clinPaginaWeb], [clinEmail], [clinFotoName], [clinFotoPath], [clinCuerpoCartaCabecera], [clinCuerpoCartaPie], [clinLatitud], [clinLongitud], [clinEstaBorrado], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [clinFechaCreacion], [clinFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, N'Abel Gonzales', N'sdfsd', NULL, N'Independencia #101', N'(809) 682-6001', NULL, 6541, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, CAST(N'2017-03-30 10:13:07.000' AS DateTime), CAST(N'2017-03-30 10:52:11.313' AS DateTime), NULL)
INSERT [sdoc].[Clinica] ([clinSecuencia], [PaisSecuencia_fk], [clinRazonSocial], [clinEstablecimiento], [clinOrganismoSuperior], [clinDireccion], [clinTelefono], [clinTelefono2], [clinRNC], [clinFax], [clinPaginaWeb], [clinEmail], [clinFotoName], [clinFotoPath], [clinCuerpoCartaCabecera], [clinCuerpoCartaPie], [clinLatitud], [clinLongitud], [clinEstaBorrado], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [clinFechaCreacion], [clinFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, N'SEGUNDA CLINICA', NULL, NULL, N'DIRECCION', N'(111) 111-1111', N'(222) 222-2222', 6554, NULL, N'http://www.goog.com', N'michael@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 3, CAST(N'2017-03-30 10:53:31.217' AS DateTime), CAST(N'2017-03-30 12:32:02.733' AS DateTime), NULL)
INSERT [sdoc].[Clinica] ([clinSecuencia], [PaisSecuencia_fk], [clinRazonSocial], [clinEstablecimiento], [clinOrganismoSuperior], [clinDireccion], [clinTelefono], [clinTelefono2], [clinRNC], [clinFax], [clinPaginaWeb], [clinEmail], [clinFotoName], [clinFotoPath], [clinCuerpoCartaCabecera], [clinCuerpoCartaPie], [clinLatitud], [clinLongitud], [clinEstaBorrado], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [clinFechaCreacion], [clinFechaModificacion], [EstaDesabilitado]) VALUES (3, 1, N'sdfefe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, CAST(N'2017-03-30 11:21:44.127' AS DateTime), NULL, NULL)
INSERT [sdoc].[Clinica] ([clinSecuencia], [PaisSecuencia_fk], [clinRazonSocial], [clinEstablecimiento], [clinOrganismoSuperior], [clinDireccion], [clinTelefono], [clinTelefono2], [clinRNC], [clinFax], [clinPaginaWeb], [clinEmail], [clinFotoName], [clinFotoPath], [clinCuerpoCartaCabecera], [clinCuerpoCartaPie], [clinLatitud], [clinLongitud], [clinEstaBorrado], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [clinFechaCreacion], [clinFechaModificacion], [EstaDesabilitado]) VALUES (4, 1, N'nuevo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, CAST(N'2017-03-30 11:26:24.877' AS DateTime), NULL, NULL)
INSERT [sdoc].[Clinica] ([clinSecuencia], [PaisSecuencia_fk], [clinRazonSocial], [clinEstablecimiento], [clinOrganismoSuperior], [clinDireccion], [clinTelefono], [clinTelefono2], [clinRNC], [clinFax], [clinPaginaWeb], [clinEmail], [clinFotoName], [clinFotoPath], [clinCuerpoCartaCabecera], [clinCuerpoCartaPie], [clinLatitud], [clinLongitud], [clinEstaBorrado], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [clinFechaCreacion], [clinFechaModificacion], [EstaDesabilitado]) VALUES (5, 1, N'PARABORRAR', NULL, NULL, NULL, NULL, NULL, 1234, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, CAST(N'2017-03-31 08:36:01.170' AS DateTime), NULL, NULL)
INSERT [sdoc].[Consultorio] ([DoctSecuencia_fk], [ConsSecuencia], [ClinSecuencia_fk], [PaisSecuencia_fk], [ConsCodigo], [ConsDescripcion], [ConsDireccion], [ConsTelefono], [ConsExtencion], [ConsTelefono2], [ConsExtension2], [UsuaSecuenciaCreacion], [ConsFechaCreacion], [UsuaSecuenciaModificacion], [ConsFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, N'codi', N'Conul1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [sdoc].[Consultorio] ([DoctSecuencia_fk], [ConsSecuencia], [ClinSecuencia_fk], [PaisSecuencia_fk], [ConsCodigo], [ConsDescripcion], [ConsDireccion], [ConsTelefono], [ConsExtencion], [ConsTelefono2], [ConsExtension2], [UsuaSecuenciaCreacion], [ConsFechaCreacion], [UsuaSecuenciaModificacion], [ConsFechaModificacion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, N'203', N'Mi consultorio viejo', N'Segundo Piso', N'(111) 111-1111', N'200', N'(222) 222-2222', N'300', NULL, NULL, 3, CAST(N'2017-03-30 15:27:48.037' AS DateTime), NULL)
INSERT [sdoc].[Consultorio] ([DoctSecuencia_fk], [ConsSecuencia], [ClinSecuencia_fk], [PaisSecuencia_fk], [ConsCodigo], [ConsDescripcion], [ConsDireccion], [ConsTelefono], [ConsExtencion], [ConsTelefono2], [ConsExtension2], [UsuaSecuenciaCreacion], [ConsFechaCreacion], [UsuaSecuenciaModificacion], [ConsFechaModificacion], [EstaDesabilitado]) VALUES (3, 2, 1, 1, N'41', N'Conul2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [sdoc].[Consultorio] ([DoctSecuencia_fk], [ConsSecuencia], [ClinSecuencia_fk], [PaisSecuencia_fk], [ConsCodigo], [ConsDescripcion], [ConsDireccion], [ConsTelefono], [ConsExtencion], [ConsTelefono2], [ConsExtension2], [UsuaSecuenciaCreacion], [ConsFechaCreacion], [UsuaSecuenciaModificacion], [ConsFechaModificacion], [EstaDesabilitado]) VALUES (3, 3, 2, 1, N'232', N'nuevo', N'dnu', N'(444) 444-4444', N'444', N'(555) 555-5555', N'444', 3, CAST(N'2017-03-30 16:00:15.877' AS DateTime), NULL, NULL, NULL)
INSERT [sdoc].[Consultorio] ([DoctSecuencia_fk], [ConsSecuencia], [ClinSecuencia_fk], [PaisSecuencia_fk], [ConsCodigo], [ConsDescripcion], [ConsDireccion], [ConsTelefono], [ConsExtencion], [ConsTelefono2], [ConsExtension2], [UsuaSecuenciaCreacion], [ConsFechaCreacion], [UsuaSecuenciaModificacion], [ConsFechaModificacion], [EstaDesabilitado]) VALUES (3, 4, 4, 1, N'12342', N'Prueba', N'preuba', N'(222) 222-2222', N'222', N'(111) 111-1111', N'333', 3, CAST(N'2017-03-30 18:35:13.000' AS DateTime), 3, CAST(N'2017-03-31 12:06:40.110' AS DateTime), NULL)
INSERT [sdoc].[Consultorio] ([DoctSecuencia_fk], [ConsSecuencia], [ClinSecuencia_fk], [PaisSecuencia_fk], [ConsCodigo], [ConsDescripcion], [ConsDireccion], [ConsTelefono], [ConsExtencion], [ConsTelefono2], [ConsExtension2], [UsuaSecuenciaCreacion], [ConsFechaCreacion], [UsuaSecuenciaModificacion], [ConsFechaModificacion], [EstaDesabilitado]) VALUES (3, 5, 5, 1, N'123555', NULL, NULL, NULL, NULL, NULL, NULL, 3, CAST(N'2017-03-31 08:36:20.000' AS DateTime), 3, CAST(N'2017-03-31 11:51:46.640' AS DateTime), NULL)
INSERT [sdoc].[Consultorio] ([DoctSecuencia_fk], [ConsSecuencia], [ClinSecuencia_fk], [PaisSecuencia_fk], [ConsCodigo], [ConsDescripcion], [ConsDireccion], [ConsTelefono], [ConsExtencion], [ConsTelefono2], [ConsExtension2], [UsuaSecuenciaCreacion], [ConsFechaCreacion], [UsuaSecuenciaModificacion], [ConsFechaModificacion], [EstaDesabilitado]) VALUES (3, 6, 3, 1, N'1235558', NULL, NULL, NULL, NULL, NULL, NULL, 3, CAST(N'2017-03-31 10:02:56.000' AS DateTime), 3, CAST(N'2017-03-31 11:51:01.837' AS DateTime), NULL)
INSERT [sdoc].[Diagnostico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DiagSecuencia], [DiagCodigo], [DiagNombre], [DiagDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 1, NULL, N'Gripe Aviar', N'Problemas de gallina', NULL)
INSERT [sdoc].[Diagnostico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DiagSecuencia], [DiagCodigo], [DiagNombre], [DiagDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 2, NULL, N'gf', NULL, NULL)
INSERT [sdoc].[Diagnostico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DiagSecuencia], [DiagCodigo], [DiagNombre], [DiagDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 3, NULL, N'g', NULL, NULL)
INSERT [sdoc].[Doctor] ([DoctSecuencia], [UsuSecuencia], [DoctCUPRE], [DoctDocumento], [TDSecuencia], [DoctNombre], [DoctApellido], [DoctFechaNacimiento], [EspeSecuencia], [DoctDireccion], [DoctTelefono], [DoctCelular], [EstaBorrado], [UsuaSecuenciaCreacion], [DoctFechaCreacion], [UsuaSecuenciaModificacion], [DoctFechaModificacion], [DoctPermitirCompartirDatos], [DoctGenero], [PaisSecuencia], [DoctFotoPath], [DoctFotoNombre], [EstaDesabilitado]) VALUES (1, 1, NULL, N'23242', 1, N'Doctor1', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [sdoc].[Doctor] ([DoctSecuencia], [UsuSecuencia], [DoctCUPRE], [DoctDocumento], [TDSecuencia], [DoctNombre], [DoctApellido], [DoctFechaNacimiento], [EspeSecuencia], [DoctDireccion], [DoctTelefono], [DoctCelular], [EstaBorrado], [UsuaSecuenciaCreacion], [DoctFechaCreacion], [UsuaSecuenciaModificacion], [DoctFechaModificacion], [DoctPermitirCompartirDatos], [DoctGenero], [PaisSecuencia], [DoctFotoPath], [DoctFotoNombre], [EstaDesabilitado]) VALUES (2, 2, NULL, N'43434343', 2, N'Doctor2', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [sdoc].[Doctor] ([DoctSecuencia], [UsuSecuencia], [DoctCUPRE], [DoctDocumento], [TDSecuencia], [DoctNombre], [DoctApellido], [DoctFechaNacimiento], [EspeSecuencia], [DoctDireccion], [DoctTelefono], [DoctCelular], [EstaBorrado], [UsuaSecuenciaCreacion], [DoctFechaCreacion], [UsuaSecuenciaModificacion], [DoctFechaModificacion], [DoctPermitirCompartirDatos], [DoctGenero], [PaisSecuencia], [DoctFotoPath], [DoctFotoNombre], [EstaDesabilitado]) VALUES (3, 3, N'cod45', N'223232323', 1, N'Doctora Nueva2', N'Apellido Doctor', CAST(N'2017-02-02 00:00:00.000' AS DateTime), 1, N'sdfsd', N'(222) 222-2222', N'(222) 222-2222', NULL, NULL, NULL, 3, CAST(N'2017-03-24 13:55:12.247' AS DateTime), NULL, N'Masculino', 1, N'~/ImagenesUploads/Doctor3.jpg', N'Doctor3.jpg', NULL)
INSERT [sdoc].[Especialidades] ([EspeSecuencia], [EspeNombre], [EstaDesabilitado]) VALUES (1, N'Endocrinologia', NULL)
INSERT [sdoc].[Especialidades] ([EspeSecuencia], [EspeNombre], [EstaDesabilitado]) VALUES (2, N'Cardiología', NULL)
INSERT [sdoc].[Especialidades] ([EspeSecuencia], [EspeNombre], [EstaDesabilitado]) VALUES (3, N'Ginecología', NULL)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 0, 1, N'Evaluacion Fisica2', N'Evaluacion descripcion2', NULL)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 0, 2, N'sdfefe', N'dfefefe', NULL)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 0, 3, N'sdefefe', NULL, NULL)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 0, 4, N'f', NULL, NULL)
INSERT [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 0, 5, N'sfsf5', N'dffefe5', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (1, N'pag_Consulta', 1, N'Consulta', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (2, N'pag_Paciente', 1, N'Paciente', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (3, N'pag_Personal', 1, N'Personal', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (4, N'pag_Cita', 1, N'Cita', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (5, N'pag_Agenda', 1, N'Agenda', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (6, N'pag_FacturacionMenu', 1, N'FacturacionMenu', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (7, N'pag_Facturacion', 1, N'Facturacion', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (8, N'pag_Caja', 1, N'Caja', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (9, N'pag_MantenimientoMenu', 1, N'MantenimientoMenu', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (10, N'pag_Diagnosticos', 1, N'Diagnosticos', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (11, N'pag_TipoDiagnosticos', 2, N'TipoDiagnosticos', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (13, N'pag_Procedimientos', 1, N'Procedimientos', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (14, N'Mantenimiento_pag_Consultorio', 1, N'Mantenimiento_pag_Consultorio', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (15, N'pag_ConfiguracionMenu', 1, N'ConfiguracionMenu', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (16, N'Configuracion_pag_Consultorio', 1, N'Configuracion Consultorio', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (17, N'pag_Doctor', 1, N'Doctor', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (18, N'Ini_TipoFormulario', 1, N'TipoFormulario', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (19, N'PruebaAngular', 1, N'PruebaAngular', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (20, N'pag_HorarioTrabajo', 1, N'HorarioTrabajo', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (21, N'pag_InstitucionesAseguradoras', 1, N'InstitucionesAseguradoras', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (22, N'pag_SeguridadMenu', 2, N'SeguridadMenu', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (23, N'pag_Auditoria', 1, N'Auditoria', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (24, N'pag_UsuarioPersonal', 1, N'Usuario Personal', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (25, N'pag_Acciones', 1, N'Acciones', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (26, N'pag_Roles', 1, N'Pefil', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (27, N'pag_Receta', 1, N'Receta', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (28, N'pag_ContabilidadMenu', 2, N'ContabilidadMenu', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (29, N'pag_607', 1, N'Reporte_607', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (30, N'pag_BackupExcelConsulta', 1, N'BackupExcelConsulta', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (31, N'pag_CitaPacienteEnLinea', 1, N'CitaPacienteEnLinea', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (32, N'pag_DigitalizacionConsultas', 1, N'DigitalizacionConsultas', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (33, N'pag_CategoriaPersonal', 1, N'CategoriaPersonal', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (34, N'Rolelista', 1, N'Perfil Lista', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (35, N'TipoFormulariolista', 1, N'TipoFormulariolista', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (36, N'Pag_CategoriaPersonalLista', 1, N'CategoriaPersonalLista', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (38, N'pag_RolePages', 1, N'Asignar Pagina a Perfil', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (39, N'pag_MotivoConsulta', 1, N'Motivo de Consulta', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (40, N'pag_Tratamiento', 1, N'Tratamiento', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (41, N'pag_EvaluacionFisica', 1, N'Evaluación Física', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (42, N'pag_Clinica', 1, N'Clinica', NULL)
INSERT [sdoc].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (43, N'pag_Consultorio', 1, N'Consultorio', NULL)
INSERT [sdoc].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (1, N'A+', NULL)
INSERT [sdoc].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (2, N'A-', NULL)
INSERT [sdoc].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (3, N'B+', NULL)
INSERT [sdoc].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (4, N'B-', NULL)
INSERT [sdoc].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (5, N'AB+', NULL)
INSERT [sdoc].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (6, N'AB-', NULL)
INSERT [sdoc].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (7, N'O+', NULL)
INSERT [sdoc].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (8, N'O-', NULL)
INSERT [sdoc].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 1, N'Premium', NULL)
INSERT [sdoc].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 2, N'Complementario', NULL)
INSERT [sdoc].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 3, N'Basico', NULL)
INSERT [sdoc].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 4, N'Avanzado', NULL)
INSERT [sdoc].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAsegCodigo], [IAsegNombre], [IAsegRNC], [IAsegTelefono], [IAsegCorreo], [IAsegWeb], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [IAsegFechaCreacion], [IAsegFechaModificacion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, NULL, N'Humano', 58154272, N'(555) 555-5555', NULL, NULL, 3, 3, CAST(N'2017-03-20 15:53:46.000' AS DateTime), CAST(N'2017-03-24 13:40:27.253' AS DateTime), NULL)
INSERT [sdoc].[Moneda] ([MoneSecuencia], [MoneMoneda], [EstaDesabilitado]) VALUES (1, N'USD', NULL)
INSERT [sdoc].[MotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MConsSecuencia], [MConsMotivoConsulta], [MConsDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 1, N'tt', NULL, NULL)
INSERT [sdoc].[MotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MConsSecuencia], [MConsMotivoConsulta], [MConsDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 2, N'sd', NULL, NULL)
INSERT [sdoc].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 1, NULL, N'34343', 1, NULL, 1, 1, NULL, 0, N'dfdf', N'sdfsdf', N'sdfsdf', NULL, CAST(N'2017-03-24 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, CAST(N'2017-03-24 17:23:58.343' AS DateTime), NULL, NULL, NULL, NULL, N'Masculino', NULL)
INSERT [sdoc].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 2, NULL, N'0290016107', 1, NULL, NULL, NULL, NULL, 0, N'Michael', N'Javier', N' MOta', NULL, CAST(N'2017-03-24 00:00:00.000' AS DateTime), NULL, 34, NULL, NULL, N'Respado 18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, CAST(N'2017-03-24 17:45:07.000' AS DateTime), 3, CAST(N'2017-03-26 15:00:01.703' AS DateTime), N'~/ImagenesUploads/Paciente2.PNG', N'Paciente2.PNG', N'Masculino', NULL)
INSERT [sdoc].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 3, NULL, N'2323232424', 1, NULL, 1, 2, NULL, 0, N'Joelina', N'Amador', N'sanchez', NULL, CAST(N'2017-03-22 00:00:00.000' AS DateTime), NULL, 34, NULL, NULL, N'drieccion', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, CAST(N'2017-03-26 15:01:08.000' AS DateTime), 3, CAST(N'2017-03-30 13:17:40.653' AS DateTime), N'~/ImagenesUploads/Paciente3.gif', N'Paciente3.gif', N'Femenino', NULL)
INSERT [sdoc].[Pais] ([PaisSecuencia], [PaisNombre], [EstaDesabilitado]) VALUES (1, N'Rep.Dom.', NULL)
INSERT [sdoc].[Pais] ([PaisSecuencia], [PaisNombre], [EstaDesabilitado]) VALUES (2, N'Puerto Republica', NULL)
INSERT [sdoc].[Personal] ([DoctSecuencia_fk], [PersSecuencia], [PaisSecuencia_fk], [PersDocumento], [TDSecuencia_fk], [UsuaSecuencia], [PersNombre], [PersApellido], [PersFechaNacimiento], [PersDireccion], [CPersSecuencia_FK], [PersTelefono], [PersCelular], [EstaActivo], [PersGenero], [UsuaCreacion], [PersFechaCreacion], [UsuaModificacion], [PersFechaModificacion], [EstaDesabilitado]) VALUES (3, 1, 1, N'2222222222222', 1, 5, N'PersonalNuevo', N'Personal NuevoApellido', CAST(N'2017-03-07 00:00:00.000' AS DateTime), N'Direccion', 1, N'(333) 333-3333', N'(222) 222-2222', 1, N'Masculino', 3, CAST(N'2017-03-06 13:45:43.603' AS DateTime), 3, CAST(N'2017-03-07 15:59:01.177' AS DateTime), NULL)
INSERT [sdoc].[Personal] ([DoctSecuencia_fk], [PersSecuencia], [PaisSecuencia_fk], [PersDocumento], [TDSecuencia_fk], [UsuaSecuencia], [PersNombre], [PersApellido], [PersFechaNacimiento], [PersDireccion], [CPersSecuencia_FK], [PersTelefono], [PersCelular], [EstaActivo], [PersGenero], [UsuaCreacion], [PersFechaCreacion], [UsuaModificacion], [PersFechaModificacion], [EstaDesabilitado]) VALUES (3, 2, 1, N'2323232', 2, 6, N'perso5 modif2', N'perso2ape', CAST(N'2017-03-20 00:00:00.000' AS DateTime), N'direccion', 2, N'(444) 444-4444', N'(888) 888-8888', 1, N'Masculino', 3, CAST(N'2017-03-08 08:30:57.950' AS DateTime), 3, CAST(N'2017-03-15 17:05:54.117' AS DateTime), NULL)
INSERT [sdoc].[Planes] ([PlanSecuencia], [PlanDescripcion], [Precio], [MoneSecuencia_fk], [EstaDesabilitado]) VALUES (1, N'BASICO', CAST(22.95 AS Decimal(18, 2)), 1, NULL)
INSERT [sdoc].[Planes] ([PlanSecuencia], [PlanDescripcion], [Precio], [MoneSecuencia_fk], [EstaDesabilitado]) VALUES (2, N'ESTANDAR', CAST(33.95 AS Decimal(18, 2)), 1, NULL)
INSERT [sdoc].[Planes] ([PlanSecuencia], [PlanDescripcion], [Precio], [MoneSecuencia_fk], [EstaDesabilitado]) VALUES (3, N'PROFESIONAL', CAST(45.95 AS Decimal(18, 2)), 1, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (2, 1, 2, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 9, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (4, 1, 10, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (5, 1, 11, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (6, 1, 13, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (7, 1, 14, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (8, 1, 15, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (9, 1, 16, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (10, 1, 17, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (11, 1, 27, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (1, 2, 1, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (2, 2, 2, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (3, 2, 3, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (4, 2, 4, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (5, 2, 5, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (6, 2, 9, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (7, 2, 10, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (8, 2, 11, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (9, 2, 13, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (10, 2, 14, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (11, 2, 15, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (12, 2, 16, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (13, 2, 17, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (14, 2, 20, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (15, 2, 22, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (16, 2, 24, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (17, 2, 25, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (18, 2, 26, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (19, 2, 27, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (20, 2, 33, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (1, 3, 1, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (2, 3, 2, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (3, 3, 3, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (4, 3, 4, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (5, 3, 5, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (6, 3, 6, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (7, 3, 7, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (8, 3, 8, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (9, 3, 9, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (10, 3, 10, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (11, 3, 11, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (12, 3, 13, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (13, 3, 14, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (14, 3, 15, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (15, 3, 16, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (16, 3, 17, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (17, 3, 18, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (18, 3, 19, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (19, 3, 20, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (20, 3, 21, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (21, 3, 22, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (22, 3, 23, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (23, 3, 24, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (24, 3, 25, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (25, 3, 26, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (26, 3, 27, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (27, 3, 28, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (28, 3, 29, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (29, 3, 30, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (30, 3, 31, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (31, 3, 32, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (32, 3, 33, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (33, 3, 34, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (34, 3, 35, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (35, 3, 36, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (36, 3, 38, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (37, 3, 39, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (38, 3, 40, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (39, 3, 41, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (40, 3, 42, NULL)
INSERT [sdoc].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (41, 3, 43, NULL)
INSERT [sdoc].[Role] ([DoctSecuencia_fk], [RoleSecuencia], [RoleDescripcion], [UsuaSecuencia], [RoleFechaCreacion], [UsuaSecuenciaModificacion], [RoleFechaModificacion], [EstaDesabilitado]) VALUES (3, 1, N'Doctor', 3, NULL, NULL, NULL, NULL)
INSERT [sdoc].[Role] ([DoctSecuencia_fk], [RoleSecuencia], [RoleDescripcion], [UsuaSecuencia], [RoleFechaCreacion], [UsuaSecuenciaModificacion], [RoleFechaModificacion], [EstaDesabilitado]) VALUES (3, 2, N'Secretaria', 3, CAST(N'2017-03-06 14:54:18.100' AS DateTime), NULL, CAST(N'2017-03-06 14:54:18.100' AS DateTime), NULL)
INSERT [sdoc].[Role] ([DoctSecuencia_fk], [RoleSecuencia], [RoleDescripcion], [UsuaSecuencia], [RoleFechaCreacion], [UsuaSecuenciaModificacion], [RoleFechaModificacion], [EstaDesabilitado]) VALUES (3, 3, N'Doctor_Suplente', 3, CAST(N'2017-03-09 10:16:30.357' AS DateTime), NULL, CAST(N'2017-03-09 10:16:30.357' AS DateTime), NULL)
INSERT [sdoc].[Role] ([DoctSecuencia_fk], [RoleSecuencia], [RoleDescripcion], [UsuaSecuencia], [RoleFechaCreacion], [UsuaSecuenciaModificacion], [RoleFechaModificacion], [EstaDesabilitado]) VALUES (3, 4, N'vefescsef', 3, CAST(N'2017-03-17 14:42:53.627' AS DateTime), NULL, CAST(N'2017-03-17 14:42:53.627' AS DateTime), NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 1, 1, 1, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 1, 2, 3, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 2, 1, 2, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 2, 2, 4, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 3, 1, 3, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 3, 2, 5, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 4, 1, 4, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 4, 2, 6, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 5, 1, 5, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 5, 2, 7, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 6, 1, 6, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 6, 2, 8, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 7, 1, 7, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 7, 2, 9, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 8, 1, 8, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 8, 2, 10, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 9, 1, 9, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 9, 2, 11, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 10, 1, 10, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 10, 2, 13, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 11, 1, 11, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 11, 2, 14, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 12, 1, 13, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 12, 2, 15, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 13, 1, 14, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 13, 2, 16, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 14, 1, 15, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 14, 2, 17, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 15, 1, 16, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 15, 2, 18, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 16, 1, 17, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 16, 2, 19, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 17, 1, 18, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 17, 2, 20, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 18, 1, 19, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 18, 2, 21, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 19, 1, 20, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 19, 2, 22, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 20, 1, 21, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 20, 2, 23, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 21, 1, 22, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 21, 2, 24, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 22, 1, 23, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 22, 2, 25, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 23, 1, 24, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 23, 2, 26, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 24, 1, 25, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 24, 2, 27, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 25, 1, 26, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 25, 2, 28, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 26, 1, 27, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 26, 2, 29, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 27, 1, 28, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 27, 2, 30, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 28, 1, 29, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 28, 2, 31, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 29, 1, 30, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 29, 2, 32, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 30, 1, 31, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 30, 2, 33, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 31, 1, 32, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 31, 2, 34, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 32, 1, 33, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 32, 2, 35, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 33, 1, 34, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 33, 2, 36, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 34, 1, 35, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 34, 2, 38, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 35, 1, 36, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 36, 1, 38, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 37, 1, 39, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 38, 1, 40, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 39, 1, 41, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 40, 1, 42, 3, NULL)
INSERT [sdoc].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 41, 1, 43, 3, NULL)
INSERT [sdoc].[TipoDocumento] ([TDSecuencia], [TDDocumento]) VALUES (1, N'Cedula')
INSERT [sdoc].[TipoDocumento] ([TDSecuencia], [TDDocumento]) VALUES (2, N'Pasaporte')
INSERT [sdoc].[TipoFormulario] ([TFormSecuencia], [TFormDescripcion]) VALUES (1, N'Formulario')
INSERT [sdoc].[TipoFormulario] ([TFormSecuencia], [TFormDescripcion]) VALUES (2, N'Menu')
INSERT [sdoc].[Tratamiento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TratSecuencia], [TratCodigo], [TratNombre], [TratDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 1, NULL, N'sfsdef', N'sfeefe', NULL)
INSERT [sdoc].[Tratamiento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TratSecuencia], [TratCodigo], [TratNombre], [TratDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 2, NULL, N'efefe', N'sdfefe', NULL)
INSERT [sdoc].[Tratamiento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TratSecuencia], [TratCodigo], [TratNombre], [TratDescripcion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 3, NULL, N'fefefefe', N'efeeedfd', NULL)
INSERT [sdoc].[Usuario] ([UsuaSecuencia], [UsuaEmail], [UsuaClave], [UsuaNombre], [UsuaApellido], [UsuaFechaNacimiento], [UsuaGenero], [RoleSecuencia_fk], [UsuaIntentos], [PaisSecuencia], [PlanSecuencia_fk], [EspeSecuencia_fk], [UsuaActivo], [UsuaEstaBorrado], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (1, N'michael1@hotmail.com', N'michael1@hotmail.com', N'michael1@hotmail.com', N'michael1@hotmail.com', CAST(N'2001-11-13 00:00:00.000' AS DateTime), N'Masculino', 1, 0, 1, 1, 1, 1, NULL, 1, CAST(N'2017-01-30 17:29:07.107' AS DateTime), 1, NULL, NULL)
INSERT [sdoc].[Usuario] ([UsuaSecuencia], [UsuaEmail], [UsuaClave], [UsuaNombre], [UsuaApellido], [UsuaFechaNacimiento], [UsuaGenero], [RoleSecuencia_fk], [UsuaIntentos], [PaisSecuencia], [PlanSecuencia_fk], [EspeSecuencia_fk], [UsuaActivo], [UsuaEstaBorrado], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (2, N'michael2@hotmail.com', N'michael2@hotmail.com', N'michael2@hotmail.com', N'michael2@hotmail.com', CAST(N'2001-10-17 00:00:00.000' AS DateTime), N'Masculino', 1, 0, 1, 2, 2, 1, NULL, 2, CAST(N'2017-01-30 17:29:59.213' AS DateTime), 2, NULL, NULL)
INSERT [sdoc].[Usuario] ([UsuaSecuencia], [UsuaEmail], [UsuaClave], [UsuaNombre], [UsuaApellido], [UsuaFechaNacimiento], [UsuaGenero], [RoleSecuencia_fk], [UsuaIntentos], [PaisSecuencia], [PlanSecuencia_fk], [EspeSecuencia_fk], [UsuaActivo], [UsuaEstaBorrado], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (3, N'michael3@hotmail.com', N'michael3@hotmail.com', N'michael3@hotmail.com', N'michael3@hotmail.com', CAST(N'2003-09-17 00:00:00.000' AS DateTime), N'Masculino', 1, 0, 1, 3, 3, 1, NULL, 3, CAST(N'2017-01-30 17:31:49.740' AS DateTime), 3, NULL, NULL)
INSERT [sdoc].[Usuario] ([UsuaSecuencia], [UsuaEmail], [UsuaClave], [UsuaNombre], [UsuaApellido], [UsuaFechaNacimiento], [UsuaGenero], [RoleSecuencia_fk], [UsuaIntentos], [PaisSecuencia], [PlanSecuencia_fk], [EspeSecuencia_fk], [UsuaActivo], [UsuaEstaBorrado], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (4, N'mich@hotmail.com', N'mich@hotmail.com', N'personal', N'personal apellido', CAST(N'2017-03-09 00:00:00.000' AS DateTime), N'Masculino', 2, 0, 1, 3, NULL, 1, NULL, 3, CAST(N'2017-03-05 15:17:15.847' AS DateTime), 3, NULL, NULL)
INSERT [sdoc].[Usuario] ([UsuaSecuencia], [UsuaEmail], [UsuaClave], [UsuaNombre], [UsuaApellido], [UsuaFechaNacimiento], [UsuaGenero], [RoleSecuencia_fk], [UsuaIntentos], [PaisSecuencia], [PlanSecuencia_fk], [EspeSecuencia_fk], [UsuaActivo], [UsuaEstaBorrado], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (5, N'm@hotmai.com', N'm@hotmai.com', N'PersonalNuevo', N'Personal NuevoApellido', CAST(N'2017-03-07 00:00:00.000' AS DateTime), N'Masculino', 2, 0, 1, 3, NULL, 1, NULL, 3, CAST(N'2017-03-06 15:38:42.557' AS DateTime), 3, CAST(N'2017-03-07 17:02:24.583' AS DateTime), NULL)
INSERT [sdoc].[Usuario] ([UsuaSecuencia], [UsuaEmail], [UsuaClave], [UsuaNombre], [UsuaApellido], [UsuaFechaNacimiento], [UsuaGenero], [RoleSecuencia_fk], [UsuaIntentos], [PaisSecuencia], [PlanSecuencia_fk], [EspeSecuencia_fk], [UsuaActivo], [UsuaEstaBorrado], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (6, N'pr@hotmail.com', N'pr@hotmail.com', N'perso2', N'perso2ape', CAST(N'2017-03-17 00:00:00.000' AS DateTime), N'Masculino', 2, 0, 1, 3, NULL, 1, NULL, 3, CAST(N'2017-03-08 10:35:04.517' AS DateTime), 3, CAST(N'2017-03-21 11:52:25.057' AS DateTime), NULL)
INSERT [sdoc].[UsuarioConsultorio] ([UsuaSecuencia_fk], [ConsSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [UConsSecuencia], [clinRazonSocial], [ConsCodigo], [ConsDescripcion], [UsuaSecuenciaCreacion], [UConsFechaCreacion], [UsuaSecuenciaModificacion], [UConsFechaModificacion], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 1, N'df', N'codi', N'Conul1', 3, NULL, NULL, NULL, NULL)
INSERT [sdoc].[UsuarioConsultorio] ([UsuaSecuencia_fk], [ConsSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [UConsSecuencia], [clinRazonSocial], [ConsCodigo], [ConsDescripcion], [UsuaSecuenciaCreacion], [UConsFechaCreacion], [UsuaSecuenciaModificacion], [UConsFechaModificacion], [EstaDesabilitado]) VALUES (3, 4, 1, 4, 2, N'nuevo', N'12342', N'Prueba', 3, CAST(N'2017-03-30 18:35:21.860' AS DateTime), 3, CAST(N'2017-03-31 12:06:40.137' AS DateTime), NULL)
INSERT [sdoc].[UsuarioConsultorio] ([UsuaSecuencia_fk], [ConsSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [UConsSecuencia], [clinRazonSocial], [ConsCodigo], [ConsDescripcion], [UsuaSecuenciaCreacion], [UConsFechaCreacion], [UsuaSecuenciaModificacion], [UConsFechaModificacion], [EstaDesabilitado]) VALUES (3, 5, 1, 5, 3, N'PARABORRAR', N'123555', NULL, 3, CAST(N'2017-03-31 08:36:20.750' AS DateTime), 3, CAST(N'2017-03-31 11:51:46.643' AS DateTime), NULL)
INSERT [sdoc].[UsuarioConsultorio] ([UsuaSecuencia_fk], [ConsSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [UConsSecuencia], [clinRazonSocial], [ConsCodigo], [ConsDescripcion], [UsuaSecuenciaCreacion], [UConsFechaCreacion], [UsuaSecuenciaModificacion], [UConsFechaModificacion], [EstaDesabilitado]) VALUES (3, 6, 1, 3, 4, N'sdfefe', N'1235558', NULL, 3, CAST(N'2017-03-31 10:02:56.763' AS DateTime), 3, CAST(N'2017-03-31 11:51:08.100' AS DateTime), NULL)
INSERT [sdoc].[UsuarioConsultorio] ([UsuaSecuencia_fk], [ConsSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [UConsSecuencia], [clinRazonSocial], [ConsCodigo], [ConsDescripcion], [UsuaSecuenciaCreacion], [UConsFechaCreacion], [UsuaSecuenciaModificacion], [UConsFechaModificacion], [EstaDesabilitado]) VALUES (4, 1, 1, 1, 1, N'df', N'codi', N'Conul1', 3, CAST(N'2017-03-05 15:17:24.550' AS DateTime), 3, NULL, NULL)
INSERT [sdoc].[UsuarioConsultorio] ([UsuaSecuencia_fk], [ConsSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [UConsSecuencia], [clinRazonSocial], [ConsCodigo], [ConsDescripcion], [UsuaSecuenciaCreacion], [UConsFechaCreacion], [UsuaSecuenciaModificacion], [UConsFechaModificacion], [EstaDesabilitado]) VALUES (5, 1, 1, 1, 1, N'df', N'codi', N'Conul1', NULL, NULL, 3, CAST(N'2017-03-07 17:02:24.627' AS DateTime), NULL)
INSERT [sdoc].[UsuarioConsultorio] ([UsuaSecuencia_fk], [ConsSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [UConsSecuencia], [clinRazonSocial], [ConsCodigo], [ConsDescripcion], [UsuaSecuenciaCreacion], [UConsFechaCreacion], [UsuaSecuenciaModificacion], [UConsFechaModificacion], [EstaDesabilitado]) VALUES (5, 2, 1, 1, 2, N'df', N'41', N'Conul2', NULL, NULL, 3, CAST(N'2017-03-07 17:02:24.627' AS DateTime), NULL)
INSERT [sdoc].[UsuarioConsultorio] ([UsuaSecuencia_fk], [ConsSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [UConsSecuencia], [clinRazonSocial], [ConsCodigo], [ConsDescripcion], [UsuaSecuenciaCreacion], [UConsFechaCreacion], [UsuaSecuenciaModificacion], [UConsFechaModificacion], [EstaDesabilitado]) VALUES (6, 1, 1, 1, 1, N'df', N'codi', N'Conul1', NULL, NULL, 3, CAST(N'2017-03-21 11:52:25.127' AS DateTime), NULL)
/****** Object:  Index [Unique_Cita]    Script Date: 03/31/2017 01:06:05 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_Cita] ON [sdoc].[Cita]
(
	[CitaSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Unique_ConsultaMedica]    Script Date: 03/31/2017 01:06:05 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_ConsultaMedica] ON [sdoc].[ConsultaMedica]
(
	[DoctSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Unique_HorariosDiaTrabajo]    Script Date: 03/31/2017 01:06:05 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_HorariosDiaTrabajo] ON [sdoc].[HorariosDiaTrabajo]
(
	[HDTrabSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Unique_TipoIndicacion]    Script Date: 03/31/2017 01:06:05 p.m. ******/
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
ALTER TABLE [sdoc].[ConsultaMedicaHistorialEvaluacionFisica]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaHistorialEvaluacionFisica_ConsultaMedicaHistorial] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk])
REFERENCES [sdoc].[ConsultaMedicaHistorial] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia])
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialEvaluacionFisica] CHECK CONSTRAINT [FK_ConsultaMedicaHistorialEvaluacionFisica_ConsultaMedicaHistorial]
GO
ALTER TABLE [sdoc].[ConsultaMedicaHistorialEvaluacionFisica]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaHistorialEvaluacionFisica_EvaluacionFisica] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [EFisiSecuencia_fk])
REFERENCES [sdoc].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [EFisiSecuencia])
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
ALTER TABLE [sdoc].[FormulariosAccion]  WITH CHECK ADD  CONSTRAINT [FK_FormulariosAccion_Acciones] FOREIGN KEY([AcciSecuencia_fk])
REFERENCES [sdoc].[Acciones] ([AcciSecuencia])
GO
ALTER TABLE [sdoc].[FormulariosAccion] CHECK CONSTRAINT [FK_FormulariosAccion_Acciones]
GO
ALTER TABLE [sdoc].[FormulariosAccion]  WITH CHECK ADD  CONSTRAINT [FK_FormulariosAccion_Formularios] FOREIGN KEY([FormSecuencia_fk])
REFERENCES [sdoc].[Formularios] ([FormSecuencia])
GO
ALTER TABLE [sdoc].[FormulariosAccion] CHECK CONSTRAINT [FK_FormulariosAccion_Formularios]
GO
ALTER TABLE [sdoc].[HorariosDiaTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_HorariosDiaTrabajo_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [sdoc].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [sdoc].[HorariosDiaTrabajo] CHECK CONSTRAINT [FK_HorariosDiaTrabajo_Doctor]
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
ALTER TABLE [sdoc].[Indicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Indicaciones_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [sdoc].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [sdoc].[Indicaciones] CHECK CONSTRAINT [FK_Indicaciones_Doctor]
GO
ALTER TABLE [sdoc].[Indicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Indicaciones_Pais] FOREIGN KEY([PaisSecuencia_fk])
REFERENCES [sdoc].[Pais] ([PaisSecuencia])
GO
ALTER TABLE [sdoc].[Indicaciones] CHECK CONSTRAINT [FK_Indicaciones_Pais]
GO
ALTER TABLE [sdoc].[Indicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Indicaciones_TipoIndicacion] FOREIGN KEY([TIndiSecuencia_fk])
REFERENCES [sdoc].[TipoIndicacion] ([TIndiSecuencia])
GO
ALTER TABLE [sdoc].[Indicaciones] CHECK CONSTRAINT [FK_Indicaciones_TipoIndicacion]
GO
ALTER TABLE [sdoc].[Indicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Indicaciones_UsoMedicamentos] FOREIGN KEY([UMediSecuencia_fk])
REFERENCES [sdoc].[UsoMedicamentos] ([UMediSecuencia])
GO
ALTER TABLE [sdoc].[Indicaciones] CHECK CONSTRAINT [FK_Indicaciones_UsoMedicamentos]
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
ALTER TABLE [sdoc].[RecetaIndicaciones]  WITH CHECK ADD  CONSTRAINT [FK_RecetaIndicaciones_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [sdoc].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [sdoc].[RecetaIndicaciones] CHECK CONSTRAINT [FK_RecetaIndicaciones_Doctor]
GO
ALTER TABLE [sdoc].[RecetaIndicaciones]  WITH CHECK ADD  CONSTRAINT [FK_RecetaIndicaciones_Indicaciones] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TIndiSecuencia_fk], [UMediSecuencia_fk], [IndiSecuencia_fk])
REFERENCES [sdoc].[Indicaciones] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TIndiSecuencia_fk], [UMediSecuencia_fk], [IndiSecuencia])
GO
ALTER TABLE [sdoc].[RecetaIndicaciones] CHECK CONSTRAINT [FK_RecetaIndicaciones_Indicaciones]
GO
ALTER TABLE [sdoc].[RecetaIndicaciones]  WITH CHECK ADD  CONSTRAINT [FK_RecetaIndicaciones_Paciente] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk])
REFERENCES [sdoc].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia])
GO
ALTER TABLE [sdoc].[RecetaIndicaciones] CHECK CONSTRAINT [FK_RecetaIndicaciones_Paciente]
GO
ALTER TABLE [sdoc].[RecetaIndicaciones]  WITH CHECK ADD  CONSTRAINT [FK_RecetaIndicaciones_Pais] FOREIGN KEY([PaisSecuencia_fk])
REFERENCES [sdoc].[Pais] ([PaisSecuencia])
GO
ALTER TABLE [sdoc].[RecetaIndicaciones] CHECK CONSTRAINT [FK_RecetaIndicaciones_Pais]
GO
ALTER TABLE [sdoc].[RecetaIndicaciones]  WITH CHECK ADD  CONSTRAINT [FK_RecetaIndicaciones_Recetas] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk])
REFERENCES [sdoc].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia])
GO
ALTER TABLE [sdoc].[RecetaIndicaciones] CHECK CONSTRAINT [FK_RecetaIndicaciones_Recetas]
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
ALTER TABLE [sdoc].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [sdoc].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [sdoc].[Role] CHECK CONSTRAINT [FK_Role_Doctor]
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Indicaciones', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CApsula  o ect.' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Indicaciones', @level2type=N'COLUMN',@level2name=N'IndiPrecentacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'aqui es que se introducira los medicamentos, las pruebas analiticas, en fin todas las cosas que recetas el doctor ' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'Indicaciones'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'RecetaIndicaciones', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'si son comprimidos o capsulas' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'RecetaIndicaciones', @level2type=N'COLUMN',@level2name=N'MediPresentacionMedicamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'tengo la relacion entre la receta y las indicaciones, por que una receta puede tener muchas indicaciones que contiene medicacmentos o pruebas etc.' , @level0type=N'SCHEMA',@level0name=N'sdoc', @level1type=N'TABLE',@level1name=N'RecetaIndicaciones'
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
