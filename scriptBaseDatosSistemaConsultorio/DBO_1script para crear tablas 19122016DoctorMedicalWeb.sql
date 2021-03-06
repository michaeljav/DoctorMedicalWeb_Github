USE [master]
GO
/****** Object:  Database [DB_A1595D_DoctorMedicalWeb]    Script Date: 09/28/2017 8:12:20 PM ******/
CREATE DATABASE [DB_A1595D_DoctorMedicalWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_A1595D_DoctorMedicalWeb_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DB_A1595D_DoctorMedicalWeb_DATA.mdf' , SIZE = 4544KB , MAXSIZE = 512000KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'DB_A1595D_DoctorMedicalWeb_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DB_A1595D_DoctorMedicalWeb_Log.LDF' , SIZE = 3072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_A1595D_DoctorMedicalWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET  MULTI_USER 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_A1595D_DoctorMedicalWeb', N'ON'
GO
USE [DB_A1595D_DoctorMedicalWeb]
GO
/****** Object:  User [LAPTOP-P1FNUB6A\Michael Javier Mota]    Script Date: 09/28/2017 8:12:20 PM ******/
CREATE USER [LAPTOP-P1FNUB6A\Michael Javier Mota] FOR LOGIN [LAPTOP-P1FNUB6A\Michael Javier Mota] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [LAPTOP-P1FNUB6A\Michael Javier Mota]
GO
/****** Object:  Table [dbo].[Acciones]    Script Date: 09/28/2017 8:12:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Acciones](
	[AcciSecuencia] [int] NOT NULL,
	[AcciNombre] [varchar](50) NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AnalisisClinico]    Script Date: 09/28/2017 8:12:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnalisisClinico](
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
/****** Object:  Table [dbo].[ArchivosPaciente]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArchivosPaciente](
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
/****** Object:  Table [dbo].[Auditoria]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Auditoria](
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
/****** Object:  Table [dbo].[CategoriaPersonal]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoriaPersonal](
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
/****** Object:  Table [dbo].[Cirugia]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cirugia](
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
/****** Object:  Table [dbo].[Cita]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cita](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CitaSecuencia] [int] NOT NULL,
	[ProgramId] [int] NULL,
	[ProgramName] [nvarchar](max) NOT NULL,
	[ProgramStartTime] [datetime] NOT NULL,
	[ProgramStartOnlyTime] [time](7) NULL,
	[ProgramEndTime] [datetime] NOT NULL,
	[ProgramEndOlyTime] [time](7) NULL,
	[IsAllDay] [bit] NOT NULL,
	[IsRecurrence] [bit] NOT NULL,
	[RecurrenceRule] [nvarchar](max) NULL,
	[StartTimeZone] [nvarchar](max) NULL,
	[EndTimeZone] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
	[CitaCancelada] [bit] NOT NULL,
	[CitaCancelacionMotivo] [varchar](max) NULL,
	[UsuaSecuenciaCreacion] [int] NOT NULL,
	[CitaFechaCreacion] [datetime] NOT NULL,
	[CMHistHora] [time](7) NULL,
	[UsuaFechaModificacion] [datetime] NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[EstaDesabilitado] [bit] NOT NULL,
	[EstadoCita] [int] NULL,
 CONSTRAINT [PK_Cita] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[CitaSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clinica]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinica](
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
/****** Object:  Table [dbo].[ConsultaMedica]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultaMedica](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[clinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMediSecuencia] [int] NOT NULL,
	[CMediFecha] [datetime] NULL,
	[CMediHora] [time](7) NULL,
	[EnfeComentario] [nvarchar](max) NULL,
	[CMedEmbarazada] [bit] NOT NULL,
	[CMedEmbarazadaFecha] [datetime] NULL,
	[CMedEmbarazadaSemanas] [int] NULL,
	[CMedEmbarazadaDias] [int] NULL,
	[CMedEmbarazadaMeses] [int] NULL,
	[CMedEmbarazadaFechaProbableParto] [datetime] NULL,
	[CMediUnidadesMedidaTalla] [nvarchar](max) NULL,
	[CMediTalla] [decimal](18, 2) NULL,
	[CMediUnidadesMedidaPeso] [nvarchar](max) NULL,
	[CMediPeso] [decimal](18, 2) NULL,
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
/****** Object:  Table [dbo].[ConsultaMedicaCirugia]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultaMedicaCirugia](
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
/****** Object:  Table [dbo].[ConsultaMedicaEmbarazo]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultaMedicaEmbarazo](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMHistSecuencia_fk] [int] NOT NULL,
	[CMEmbEmbarazada] [bit] NOT NULL,
	[CMEmbEmbarazadaFecha] [datetime] NOT NULL,
	[CMEmbEmbarazadaSemanas] [int] NULL,
	[CMEmbEmbarazadaDias] [int] NULL,
	[CMEmbEmbarazadaMeses] [int] NULL,
	[CMEmbEmbarazadaFechaProbableParto] [datetime] NOT NULL,
 CONSTRAINT [PK_ConsultaMedicaEmbarazo] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[CMHistSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConsultaMedicaEnfermeda]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultaMedicaEnfermeda](
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
/****** Object:  Table [dbo].[ConsultaMedicaEnfermedaFamiliar]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultaMedicaEnfermedaFamiliar](
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
	[EdadMomentoDiagnosticado] [int] NULL,
 CONSTRAINT [PK_ConsultaMedicaEnfermedaFamiliar] PRIMARY KEY CLUSTERED 
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
/****** Object:  Table [dbo].[ConsultaMedicaHistorial]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultaMedicaHistorial](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMHistSecuencia] [int] NOT NULL,
	[TratComentario] [nvarchar](max) NULL,
	[MotiComentario] [nvarchar](max) NULL,
	[EFisiComentario] [nvarchar](max) NULL,
	[DiagComentario] [nvarchar](max) NULL,
	[CMHistFechaUltimaRegla] [datetime] NULL,
	[CMHistIndiceMasaCorporal] [decimal](18, 2) NULL,
	[CMHistUnidadesMedidaPeso] [nvarchar](max) NULL,
	[CMHistPeso] [decimal](18, 2) NULL,
	[CMHistUnidadesMedidaTalla] [nvarchar](max) NULL,
	[CMHistTalla] [decimal](18, 2) NULL,
	[CMHistCodigo] [nvarchar](max) NULL,
	[CMHistFecha] [datetime] NULL,
	[CMHistHora] [time](7) NULL,
	[CMHistComentario] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[ConsultaMedicaHistorialDiagnostico]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultaMedicaHistorialDiagnostico](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMHistSecuencia_fk] [int] NOT NULL,
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
	[CMHistSecuencia_fk] ASC,
	[DiagSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConsultaMedicaHistorialEnfermeda]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultaMedicaHistorialEnfermeda](
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
/****** Object:  Table [dbo].[ConsultaMedicaHistorialEvaluacionFisica]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultaMedicaHistorialEvaluacionFisica](
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
/****** Object:  Table [dbo].[ConsultaMedicaHistorialMotivoConsulta]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultaMedicaHistorialMotivoConsulta](
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
/****** Object:  Table [dbo].[ConsultaMedicaHistorialTratamiento]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultaMedicaHistorialTratamiento](
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
/****** Object:  Table [dbo].[Consultorio]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultorio](
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
/****** Object:  Table [dbo].[Diagnostico]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnostico](
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
/****** Object:  Table [dbo].[DiasSemana]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiasSemana](
	[DSemaSecuencia] [int] NOT NULL,
	[DSemaNombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DiasSemana] PRIMARY KEY CLUSTERED 
(
	[DSemaSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
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
	[NombreDoctoRecetaEncab] [nvarchar](max) NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Enfermedad]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enfermedad](
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
/****** Object:  Table [dbo].[Especialidades]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Especialidades](
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
/****** Object:  Table [dbo].[EspecialidadFormularioCampos]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EspecialidadFormularioCampos](
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
/****** Object:  Table [dbo].[EstadoAgenda]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoAgenda](
	[EAgenSecuencia] [int] NOT NULL,
	[EAgenEstado] [varchar](50) NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EvaluacionFisica]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluacionFisica](
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
/****** Object:  Table [dbo].[Factura]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Factura](
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
/****** Object:  Table [dbo].[FacturaDetalle]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturaDetalle](
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
/****** Object:  Table [dbo].[FacturaEstado]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FacturaEstado](
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
/****** Object:  Table [dbo].[FormularioCampos]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormularioCampos](
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
/****** Object:  Table [dbo].[Formularios]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Formularios](
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
/****** Object:  Table [dbo].[FormulariosAccion]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormulariosAccion](
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
/****** Object:  Table [dbo].[GrupoSanguineo]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GrupoSanguineo](
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
/****** Object:  Table [dbo].[HorarioTrabajo]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorarioTrabajo](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[HTrabSecuencia] [int] NOT NULL,
	[DSemaSecuencia_Fk] [int] NOT NULL,
	[HTrabRepetirSiempre] [bit] NOT NULL,
	[HTrabDiaHabilitado] [bit] NOT NULL,
	[HTrabFechaCreacion] [datetime] NOT NULL,
	[UsuaSecuenciaCreacion] [int] NOT NULL,
	[HTrabFechaModificacion] [datetime] NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[HTrabEstaDesabilitado] [bit] NOT NULL,
	[HTrabPartesHoraSchedule] [int] NULL,
 CONSTRAINT [PK_HorarioTrabajo] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[DSemaSecuencia_Fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HorarioTrabajoDestalle]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HorarioTrabajoDestalle](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[DSemaSecuencia_Fk] [int] NOT NULL,
	[hi] [time](7) NOT NULL,
	[hf] [time](7) NOT NULL,
	[ht] [varchar](max) NOT NULL,
 CONSTRAINT [PK_HorarioTrabajoDestalle] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[DSemaSecuencia_Fk] ASC,
	[hi] ASC,
	[hf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ImagenDoctor]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImagenDoctor](
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
/****** Object:  Table [dbo].[Imagenes]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagenes](
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
/****** Object:  Table [dbo].[InstitucionAseguradoraPlanes]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstitucionAseguradoraPlanes](
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
/****** Object:  Table [dbo].[InstitucionesAseguradoras]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstitucionesAseguradoras](
	[DoctSecuencia] [int] NOT NULL,
	[ClinSecuencia] [int] NOT NULL,
	[ConsSecuencia] [int] NOT NULL,
	[IAsegSecuencia] [int] NOT NULL,
	[IAsegCodigo] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[LoginProvider]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginProvider](
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
/****** Object:  Table [dbo].[Medicamento]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamento](
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
/****** Object:  Table [dbo].[Moneda]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Moneda](
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
/****** Object:  Table [dbo].[MotivoConsulta]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotivoConsulta](
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
/****** Object:  Table [dbo].[Paciente]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia] [int] NOT NULL,
	[PaciCodigo] [nvarchar](max) NULL,
	[PaciDocumento] [nvarchar](max) NULL,
	[TDSecuencia] [int] NOT NULL,
	[PaciNumeroSeguroSocial] [nvarchar](max) NULL,
	[IAsegSecuencia] [int] NULL,
	[IAPlanSecuencia] [int] NULL,
	[PaciNumeroPoliza] [nvarchar](max) NULL,
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
	[GSangSecuencia_fk] [int] NULL,
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
/****** Object:  Table [dbo].[PacienteFoto]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PacienteFoto](
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
/****** Object:  Table [dbo].[Pais]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pais](
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
/****** Object:  Table [dbo].[Parametros]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parametros](
	[ParaSecuencia] [int] NOT NULL,
	[ParaNombre] [nvarchar](max) NOT NULL,
	[ParaDescripcion] [nvarchar](max) NULL,
	[Seleccionado] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PediatraParto]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PediatraParto](
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
/****** Object:  Table [dbo].[PEDIATRIAeMBARAZO]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PEDIATRIAeMBARAZO](
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
/****** Object:  Table [dbo].[Personal]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personal](
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
/****** Object:  Table [dbo].[Planes]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Planes](
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
/****** Object:  Table [dbo].[PlanFactura]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PlanFactura](
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
/****** Object:  Table [dbo].[PlanFacturaDetalle]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanFacturaDetalle](
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
/****** Object:  Table [dbo].[PlanFormularios]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanFormularios](
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
/****** Object:  Table [dbo].[PlanFormularios_copia]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PlanFormularios_copia](
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
/****** Object:  Table [dbo].[Procedimientos]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Procedimientos](
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
/****** Object:  Table [dbo].[RecetaAnalisisClinico]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetaAnalisisClinico](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMHistSecuencia_fk] [int] NOT NULL,
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
	[CMHistSecuencia_fk] ASC,
	[ReceSecuencia_fk] ASC,
	[AClinSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecetaImagenes]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetaImagenes](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMHistSecuencia_fk] [int] NOT NULL,
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
	[CMHistSecuencia_fk] ASC,
	[ReceSecuencia_fk] ASC,
	[ImagSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecetaMedicamentos]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetaMedicamentos](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[CMHistSecuencia_fk] [int] NOT NULL,
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
	[CMHistSecuencia_fk] ASC,
	[ReceSecuencia_fk] ASC,
	[MediSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecetaPacienteVacunas]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetaPacienteVacunas](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[VacuSecuencia_fk] [int] NOT NULL,
	[ReceSecuencia_fk] [int] NOT NULL,
	[CMHistSecuencia_fk] [int] NOT NULL,
	[EstaDesabilitado] [bit] NOT NULL,
 CONSTRAINT [PK_RecetaPacienteVacunas] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[VacuSecuencia_fk] ASC,
	[ReceSecuencia_fk] ASC,
	[CMHistSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Recetas]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recetas](
	[DoctSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
	[ClinSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[PaciSecuencia_fk] [int] NOT NULL,
	[ReceSecuencia] [int] NOT NULL,
	[CMHistSecuencia_fk] [int] NOT NULL,
	[ReceFecha] [datetime] NOT NULL,
	[ReceInstruccionesFarmacia] [nvarchar](max) NULL,
	[ReceInstruccionesAlPaciente] [nvarchar](max) NULL,
	[ReceComentario] [nvarchar](max) NULL,
	[UsuaSecuenciaCreacion] [int] NULL,
	[UsuaFechaCreacion] [datetime] NULL,
	[UsuaSecuenciaModificacion] [int] NULL,
	[UsuaFechaModificacion] [datetime] NULL,
	[EstaDesabilitado] [bit] NOT NULL,
	[RecCodigo] [nvarchar](max) NULL,
	[RecNombre] [nvarchar](max) NULL,
	[RecSinConsultaNombre] [nvarchar](max) NULL,
 CONSTRAINT [PK_Recetas] PRIMARY KEY CLUSTERED 
(
	[DoctSecuencia_fk] ASC,
	[PaisSecuencia_fk] ASC,
	[ClinSecuencia_fk] ASC,
	[ConsSecuencia_fk] ASC,
	[PaciSecuencia_fk] ASC,
	[ReceSecuencia] ASC,
	[CMHistSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Representante]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Representante](
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
/****** Object:  Table [dbo].[Role]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
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
/****** Object:  Table [dbo].[RolFormularios]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolFormularios](
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
/****** Object:  Table [dbo].[TipoArchivoPaciente]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoArchivoPaciente](
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
/****** Object:  Table [dbo].[TipoCompromiso]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoCompromiso](
	[TCompSecuencia] [int] NOT NULL,
	[TCompCodigo] [varchar](50) NULL,
	[TCompNombre] [varchar](50) NOT NULL,
	[TCompDescripcion] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoDocumento](
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
/****** Object:  Table [dbo].[TipoFormulario]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoFormulario](
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
/****** Object:  Table [dbo].[TipoIndicacion]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoIndicacion](
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
/****** Object:  Table [dbo].[TipoPago]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPago](
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
/****** Object:  Table [dbo].[Tratamiento]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tratamiento](
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
/****** Object:  Table [dbo].[UsoMedicamentos]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsoMedicamentos](
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
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
/****** Object:  Table [dbo].[UsuarioConsultorio]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioConsultorio](
	[UsuaSecuencia_fk] [int] NOT NULL,
	[ConsSecuencia_fk] [int] NOT NULL,
	[clinSecuencia_fk] [int] NOT NULL,
	[PaisSecuencia_fk] [int] NOT NULL,
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
	[ConsSecuencia_fk] ASC,
	[clinSecuencia_fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vacunas]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vacunas](
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
/****** Object:  View [dbo].[vw_ConsultorioDoctor]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

create view [dbo].[vw_ConsultorioDoctor] as
select con.[DoctSecuencia_fk]
      ,con.[ClinSecuencia_fk]
      ,con.[ConsSecuencia]
      ,con.[PaisSecuencia_fk]
      ,con.[ConsCodigo]
      ,con.[ConsDescripcion]
     ,clin.[clinSecuencia]   
      ,clin.[clinRazonSocial]  
    
	  from [dbo].[Consultorio] con
	  inner join [dbo].[Clinica] clin
	  on con.ClinSecuencia_fk = clin.clinSecuencia













































GO
/****** Object:  View [dbo].[vw_ListDeFormuriosbyRolyUser]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE   view [dbo].[vw_ListDeFormuriosbyRolyUser] as
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
   [dbo].[Usuario] u
   inner join   [dbo].[RolFormularios] rf
on u.RoleSecuencia_fk =rf.RoleSecuencia_fk
    inner join [dbo].[Formularios] f
on f.FormSecuencia = rf.FormSecuencia_fk


































































GO
/****** Object:  View [dbo].[vw_planFormulario]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view  [dbo].[vw_planFormulario] as
SELECT  p.[PlanSecuencia]
      ,p.[PlanDescripcion]
      ,p.[Precio]
      ,p.[MoneSecuencia_fk]
	  ,pf.[PFSecuencia]
      ,pf.[PlanSecuencia_fk]
      ,pf.[FormSecuencia_fk]
	  ,f.FormDescripcion
	  ,f.formPantalla
  FROM [dbo].[Planes] p 
  inner join [dbo].[PlanFormularios] pf
  on p.plansecuencia = pf.plansecuencia_fk
  inner join [dbo].Formularios f
  on pf.FormSecuencia_fk = f.FormSecuencia














































GO
/****** Object:  View [dbo].[vw_receta]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  view [dbo].[vw_receta] as
/*
*Cread:Michael Javier
fecha:22-06-2017
Descripcion: Esta vista la utilizo para mostrar los datos de la receta en el reporte.
*/
select 
rec.DoctSecuencia_fk
,rec.ClinSecuencia_fk
,rec.ConsSecuencia_fk
,rec.PaciSecuencia_fk
,rec.ReceSecuencia
,rec.CMHistSecuencia_fk
,rec.ReceFecha
,rec.ReceComentario
,rec.UsuaFechaCreacion
----Doctor


,doc.DoctCUPRE

,doc.DoctNombre
,doc.DoctApellido
,doc.DoctFechaNacimiento
,doc.DoctTelefono
,doc.DoctCelular
--Clinica
,clin.clinRazonSocial
,clin.clinDireccion
,clin.clinTelefono
,clin.clinTelefono2
,clin.clinRNC
,clin.clinFax
,clin.clinPaginaWeb
,clin.clinEmail
,clin.clinFotoName
,clin.clinFotoPath
--Consultorio
,cons.ConsSecuencia
,cons.ConsCodigo
,cons.ConsDescripcion
,cons.ConsDireccion
,cons.ConsTelefono
,cons.ConsExtencion
,cons.ConsTelefono2
,cons.ConsExtension2
--Paciente
,pac.PaciDocumento
,pac.TDSecuencia
,pac.PaciNumeroSeguroSocial
,pac.IAsegSecuencia
,pac.IAPlanSecuencia
,pac.PaciNumeroPoliza
,pac.EsMenor
,pac.PaciNombre
,pac.PaciApellido1
,pac.PaciApellido2
,pac.PaciApodo
,pac.PaciFechaNacimiento
,pac.PaciLugarNacimiento
,pac.PaciEdad
,pac.PaciEmail
,pac.PaciFacebook
,pac.PaciDireccion
,pac.PaciTelefono
,pac.PaciCelular
,pac.PaciCodigoPostal
,pac.PaciEstadoCivil
,pac.PaciProfesion
,pac.PaciNombreEmergencia
,pac.PaciApellidoEmergencia
,pac.PaciDireccionEmergencia
,pac.PaciTelefonoEmergencia
,pac.PaciFotoPath
,pac.PaciFotoNombre
,pac.PaciGenero






from Recetas rec
inner join Doctor doc on rec.DoctSecuencia_fk = doc.DoctSecuencia
inner join Paciente pac on  rec.doctSecuencia_fk = pac.DoctSecuencia_fk
							and rec.PaciSecuencia_fk = pac.PaciSecuencia
inner join Clinica clin on  rec.ClinSecuencia_fk = clin.clinSecuencia
inner join Consultorio cons on rec.doctSecuencia_fk = cons.DoctSecuencia_fk
							and rec.ClinSecuencia_fk = cons.ClinSecuencia_fk 
							and rec.ConsSecuencia_fk = cons.ConsSecuencia

--

--where 
--rec.DoctSecuencia_fk = 1
--and
-- rec.PaciSecuencia_fk = 1
-- and
-- rec.CMHistSecuencia_fk = 0
-- and  
-- rec.ReceSecuencia =1
 






GO
/****** Object:  View [dbo].[vw_UsuarioConsultorios]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO














   CREATE view [dbo].[vw_UsuarioConsultorios] as
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



 from dbo.usuario usu
  inner join [dbo].[UsuarioConsultorio] dc
			 on usu.usuasecuencia  = dc.UsuaSecuencia_fk


  















































GO
/****** Object:  View [dbo].[vw_UsuarioDoctor]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

create view [dbo].[vw_UsuarioDoctor] as
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
      
  FROM [dbo].[Usuario] u
  inner join dbo.Doctor d
  on u.UsuaSecuencia = d.UsuSecuencia
  
  





















































GO
/****** Object:  View [dbo].[vw_UsuariosPersonalDelDoctor]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[vw_UsuariosPersonalDelDoctor] as
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
from [dbo].[Usuario] usu
inner join [dbo].[Personal] per
on usu.usuaSecuencia = per.UsuaSecuencia















































GO
INSERT [dbo].[AnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [AClinSecuencia], [AClinCodigo], [AClinNombre], [AClinDescripcion], [AClinTipoDeMuestra], [AClinTiempoDeProceso], [AClinCondicionesDelPaciente], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, NULL, N'Analisis clinica', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[AnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [AClinSecuencia], [AClinCodigo], [AClinNombre], [AClinDescripcion], [AClinTipoDeMuestra], [AClinTiempoDeProceso], [AClinCondicionesDelPaciente], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, NULL, N'analisi 2', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[AnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [AClinSecuencia], [AClinCodigo], [AClinNombre], [AClinDescripcion], [AClinTipoDeMuestra], [AClinTiempoDeProceso], [AClinCondicionesDelPaciente], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 3, NULL, N'PROSTATA', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[AnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [AClinSecuencia], [AClinCodigo], [AClinNombre], [AClinDescripcion], [AClinTipoDeMuestra], [AClinTiempoDeProceso], [AClinCondicionesDelPaciente], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 1, NULL, N'SONOGRAFIA TRASVAGINAL', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[AnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [AClinSecuencia], [AClinCodigo], [AClinNombre], [AClinDescripcion], [AClinTipoDeMuestra], [AClinTiempoDeProceso], [AClinCondicionesDelPaciente], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 2, NULL, N'HEMOGRAMA', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[AnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [AClinSecuencia], [AClinCodigo], [AClinNombre], [AClinDescripcion], [AClinTipoDeMuestra], [AClinTiempoDeProceso], [AClinCondicionesDelPaciente], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 3, NULL, N'GLICEMIA', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 0, NULL, CAST(N'2017-07-18 23:39:18.673' AS DateTime), CAST(N'2017-07-18 23:39:18.680' AS DateTime), NULL, NULL, 2, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (2, 1, 2, 1, 2, 1, NULL, CAST(N'2017-07-18 23:54:23.980' AS DateTime), CAST(N'2017-07-18 23:54:23.987' AS DateTime), NULL, NULL, 3, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (3, 1, 1, 1, 2, 0, NULL, CAST(N'2017-07-19 00:09:46.450' AS DateTime), CAST(N'2017-07-19 00:09:46.450' AS DateTime), NULL, NULL, 2, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (4, 1, 1, 1, 2, 0, NULL, CAST(N'2017-07-19 09:16:23.457' AS DateTime), CAST(N'2017-07-19 09:16:23.463' AS DateTime), NULL, NULL, 2, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (5, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 09:17:34.127' AS DateTime), CAST(N'2017-07-19 09:17:34.127' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (6, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 09:23:01.730' AS DateTime), CAST(N'2017-07-19 09:23:01.730' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Paciente', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (7, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 09:23:50.430' AS DateTime), CAST(N'2017-07-19 09:23:50.430' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (8, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 09:24:05.227' AS DateTime), CAST(N'2017-07-19 09:24:05.227' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (9, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 09:24:17.200' AS DateTime), CAST(N'2017-07-19 09:24:17.200' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (10, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 09:24:30.517' AS DateTime), CAST(N'2017-07-19 09:24:30.517' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (11, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 09:25:25.313' AS DateTime), CAST(N'2017-07-19 09:25:25.313' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (12, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 09:25:35.220' AS DateTime), CAST(N'2017-07-19 09:25:35.220' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (13, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 09:25:44.027' AS DateTime), CAST(N'2017-07-19 09:25:44.027' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (14, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 10:58:29.583' AS DateTime), CAST(N'2017-07-19 10:58:29.590' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (15, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 11:02:49.220' AS DateTime), CAST(N'2017-07-19 11:02:49.220' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (16, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 13:23:54.997' AS DateTime), CAST(N'2017-07-19 13:23:55.027' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (17, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 13:26:44.233' AS DateTime), CAST(N'2017-07-19 13:26:44.237' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (18, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 13:27:40.103' AS DateTime), CAST(N'2017-07-19 13:27:40.103' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (19, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 13:29:03.183' AS DateTime), CAST(N'2017-07-19 13:29:03.190' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (20, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 14:03:03.357' AS DateTime), CAST(N'2017-07-19 14:03:03.367' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (21, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 14:27:27.007' AS DateTime), CAST(N'2017-07-19 14:27:27.007' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (22, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 14:36:24.227' AS DateTime), CAST(N'2017-07-19 14:36:24.230' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (23, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 14:58:02.057' AS DateTime), CAST(N'2017-07-19 14:58:02.063' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (24, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:00:11.240' AS DateTime), CAST(N'2017-07-19 15:00:11.240' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (25, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:01:04.963' AS DateTime), CAST(N'2017-07-19 15:01:04.963' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (26, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:11:19.183' AS DateTime), CAST(N'2017-07-19 15:11:19.187' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (27, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:13:58.023' AS DateTime), CAST(N'2017-07-19 15:13:58.030' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (28, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:17:25.033' AS DateTime), CAST(N'2017-07-19 15:17:25.037' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (29, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:18:29.623' AS DateTime), CAST(N'2017-07-19 15:18:29.623' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (30, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:19:24.793' AS DateTime), CAST(N'2017-07-19 15:19:24.793' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (31, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:19:53.973' AS DateTime), CAST(N'2017-07-19 15:19:53.973' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (32, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:25:12.527' AS DateTime), CAST(N'2017-07-19 15:25:12.530' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (33, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:26:51.753' AS DateTime), CAST(N'2017-07-19 15:26:51.753' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (34, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:28:48.270' AS DateTime), CAST(N'2017-07-19 15:28:48.277' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (35, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:29:18.793' AS DateTime), CAST(N'2017-07-19 15:29:18.793' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (36, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:29:31.407' AS DateTime), CAST(N'2017-07-19 15:29:31.407' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (37, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:31:50.457' AS DateTime), CAST(N'2017-07-19 15:31:50.463' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (38, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:32:13.143' AS DateTime), CAST(N'2017-07-19 15:32:13.143' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Error', N'Value cannot be null.
Parameter name: source', 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (39, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:40:23.527' AS DateTime), CAST(N'2017-07-19 15:40:23.530' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (40, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:41:04.387' AS DateTime), CAST(N'2017-07-19 15:41:04.387' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (41, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:42:05.010' AS DateTime), CAST(N'2017-07-19 15:42:05.010' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (42, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:42:05.763' AS DateTime), CAST(N'2017-07-19 15:42:05.763' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Error', N'Violation of PRIMARY KEY constraint ''PK_InstitucionAseguradoraPlanes_1''. Cannot insert duplicate key in object ''dbo.InstitucionAseguradoraPlanes''. The duplicate key value is (1, 1, 1, 1, 1).
The statement has been terminated.', 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (43, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:51:04.907' AS DateTime), CAST(N'2017-07-19 15:51:04.907' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (44, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 15:52:43.607' AS DateTime), CAST(N'2017-07-19 15:52:43.607' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (45, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:14:56.507' AS DateTime), CAST(N'2017-07-19 16:14:56.507' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Paciente', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (46, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:15:28.553' AS DateTime), CAST(N'2017-07-19 16:15:28.553' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (47, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:15:46.290' AS DateTime), CAST(N'2017-07-19 16:15:46.290' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (48, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:17:02.467' AS DateTime), CAST(N'2017-07-19 16:17:02.467' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Paciente', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (49, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:18:01.453' AS DateTime), CAST(N'2017-07-19 16:18:01.453' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (50, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:18:27.147' AS DateTime), CAST(N'2017-07-19 16:18:27.147' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (51, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:18:52.630' AS DateTime), CAST(N'2017-07-19 16:18:52.630' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (52, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:19:53.127' AS DateTime), CAST(N'2017-07-19 16:19:53.127' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Paciente', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (53, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:21:47.067' AS DateTime), CAST(N'2017-07-19 16:21:47.067' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (54, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:22:09.580' AS DateTime), CAST(N'2017-07-19 16:22:09.580' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (55, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:24:50.173' AS DateTime), CAST(N'2017-07-19 16:24:50.173' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (56, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:25:55.503' AS DateTime), CAST(N'2017-07-19 16:25:55.503' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Paciente', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (57, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:26:19.040' AS DateTime), CAST(N'2017-07-19 16:26:19.040' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (58, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:50:46.977' AS DateTime), CAST(N'2017-07-19 16:50:46.977' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (59, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:51:00.840' AS DateTime), CAST(N'2017-07-19 16:51:00.840' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (60, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:51:30.030' AS DateTime), CAST(N'2017-07-19 16:51:30.030' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (61, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 16:52:02.587' AS DateTime), CAST(N'2017-07-19 16:52:02.587' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (62, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 21:59:10.127' AS DateTime), CAST(N'2017-07-19 21:59:10.130' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (63, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 22:18:16.837' AS DateTime), CAST(N'2017-07-19 22:18:16.837' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (64, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 22:20:07.197' AS DateTime), CAST(N'2017-07-19 22:20:07.200' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (65, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 22:22:57.917' AS DateTime), CAST(N'2017-07-19 22:22:57.917' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (66, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 22:23:11.670' AS DateTime), CAST(N'2017-07-19 22:23:11.670' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (67, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 22:23:29.517' AS DateTime), CAST(N'2017-07-19 22:23:29.517' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (68, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 22:42:00.573' AS DateTime), CAST(N'2017-07-19 22:42:00.577' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (69, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 22:44:01.207' AS DateTime), CAST(N'2017-07-19 22:44:01.207' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Error', N'Object of type ''System.String'' cannot be converted to type ''System.Nullable`1[System.Int32]''.', 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (70, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 22:45:08.687' AS DateTime), CAST(N'2017-07-19 22:45:08.687' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Error', N'Object of type ''System.String'' cannot be converted to type ''System.Nullable`1[System.Int32]''.', 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (71, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 22:45:16.563' AS DateTime), CAST(N'2017-07-19 22:45:16.563' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Error', N'Object of type ''System.String'' cannot be converted to type ''System.Nullable`1[System.Int32]''.', 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (72, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 22:46:48.167' AS DateTime), CAST(N'2017-07-19 22:46:48.167' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Error', N'Object of type ''System.String'' cannot be converted to type ''System.Nullable`1[System.Int32]''.', 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (73, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:00:27.577' AS DateTime), CAST(N'2017-07-19 23:00:27.577' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (74, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:00:32.663' AS DateTime), CAST(N'2017-07-19 23:00:32.663' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (75, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:01:03.897' AS DateTime), CAST(N'2017-07-19 23:01:03.897' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (76, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:01:29.797' AS DateTime), CAST(N'2017-07-19 23:01:29.797' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (77, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:03:21.097' AS DateTime), CAST(N'2017-07-19 23:03:21.097' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (78, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:04:17.867' AS DateTime), CAST(N'2017-07-19 23:04:17.867' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (79, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:04:48.997' AS DateTime), CAST(N'2017-07-19 23:04:48.997' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (80, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:05:08.947' AS DateTime), CAST(N'2017-07-19 23:05:08.947' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (81, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:06:39.563' AS DateTime), CAST(N'2017-07-19 23:06:39.563' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (82, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:06:55.250' AS DateTime), CAST(N'2017-07-19 23:06:55.250' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (83, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:07:10.720' AS DateTime), CAST(N'2017-07-19 23:07:10.720' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (84, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:40:58.853' AS DateTime), CAST(N'2017-07-19 23:40:58.853' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (85, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:41:44.100' AS DateTime), CAST(N'2017-07-19 23:41:44.100' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (86, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:42:26.347' AS DateTime), CAST(N'2017-07-19 23:42:26.347' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (87, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:43:32.653' AS DateTime), CAST(N'2017-07-19 23:43:32.653' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Paciente', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (88, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:44:01.117' AS DateTime), CAST(N'2017-07-19 23:44:01.117' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (89, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:44:18.477' AS DateTime), CAST(N'2017-07-19 23:44:18.477' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (90, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-19 23:44:36.133' AS DateTime), CAST(N'2017-07-19 23:44:36.133' AS DateTime), NULL, NULL, 1, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Error', N'The DELETE statement conflicted with the REFERENCE constraint "FK_Paciente_InstitucionAseguradoraPlanes". The conflict occurred in database "DB_A1595D_DoctorMedicalWeb", table "dbo.Paciente".
The statement has been terminated.', 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (91, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 08:48:13.583' AS DateTime), CAST(N'2017-07-20 08:48:13.587' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (92, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 08:49:31.307' AS DateTime), CAST(N'2017-07-20 08:49:31.307' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (93, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 08:50:48.757' AS DateTime), CAST(N'2017-07-20 08:50:48.757' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (94, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 09:35:04.747' AS DateTime), CAST(N'2017-07-20 09:35:04.750' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (95, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 09:38:09.020' AS DateTime), CAST(N'2017-07-20 09:38:09.023' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (96, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 09:40:21.143' AS DateTime), CAST(N'2017-07-20 09:40:21.143' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (97, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 09:42:36.247' AS DateTime), CAST(N'2017-07-20 09:42:36.247' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (98, 1, 1, 1, 2, 0, NULL, CAST(N'2017-07-20 10:03:00.543' AS DateTime), CAST(N'2017-07-20 10:03:00.543' AS DateTime), NULL, NULL, 2, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (99, 1, 1, 1, 2, 0, NULL, CAST(N'2017-07-20 10:04:47.547' AS DateTime), CAST(N'2017-07-20 10:04:47.547' AS DateTime), NULL, NULL, 2, N'::1', N'pag_InstitucionesAseguradoras', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (100, 1, 1, 1, 2, 0, NULL, CAST(N'2017-07-20 10:07:01.320' AS DateTime), CAST(N'2017-07-20 10:07:01.320' AS DateTime), NULL, NULL, 2, N'::1', N'pag_Paciente', NULL, N'Editar', NULL, 0)
GO
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (101, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 10:26:53.167' AS DateTime), CAST(N'2017-07-20 10:26:53.167' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (102, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 10:27:22.317' AS DateTime), CAST(N'2017-07-20 10:27:22.317' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (103, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 10:38:43.097' AS DateTime), CAST(N'2017-07-20 10:38:43.100' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (104, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 11:14:51.770' AS DateTime), CAST(N'2017-07-20 11:14:51.770' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (105, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 11:18:41.280' AS DateTime), CAST(N'2017-07-20 11:18:41.280' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (106, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 11:19:55.157' AS DateTime), CAST(N'2017-07-20 11:19:55.157' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (107, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 12:24:11.160' AS DateTime), CAST(N'2017-07-20 12:24:11.163' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (108, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 12:56:53.850' AS DateTime), CAST(N'2017-07-20 12:56:53.850' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (109, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 12:57:22.627' AS DateTime), CAST(N'2017-07-20 12:57:22.627' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (110, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 13:07:41.823' AS DateTime), CAST(N'2017-07-20 13:07:41.823' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (111, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 13:07:50.607' AS DateTime), CAST(N'2017-07-20 13:07:50.607' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (112, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 13:08:03.997' AS DateTime), CAST(N'2017-07-20 13:08:03.997' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (113, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 13:08:18.667' AS DateTime), CAST(N'2017-07-20 13:08:18.667' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (114, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 13:13:04.423' AS DateTime), CAST(N'2017-07-20 13:13:04.430' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (115, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 13:27:02.657' AS DateTime), CAST(N'2017-07-20 13:27:02.657' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (116, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 13:27:29.333' AS DateTime), CAST(N'2017-07-20 13:27:29.333' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (117, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 13:48:15.723' AS DateTime), CAST(N'2017-07-20 13:48:15.723' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Paciente', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (118, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 14:09:47.630' AS DateTime), CAST(N'2017-07-20 14:09:47.633' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (119, 1, 1, 1, 2, 0, NULL, CAST(N'2017-07-20 14:10:55.407' AS DateTime), CAST(N'2017-07-20 14:10:55.407' AS DateTime), NULL, NULL, 2, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (120, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 16:16:17.143' AS DateTime), CAST(N'2017-07-20 16:16:17.147' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (121, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-20 16:38:30.390' AS DateTime), CAST(N'2017-07-20 16:38:30.390' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (122, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-21 09:17:01.127' AS DateTime), CAST(N'2017-07-21 09:17:01.130' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (123, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-21 12:23:18.840' AS DateTime), CAST(N'2017-07-21 12:23:18.867' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (124, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-21 14:22:03.053' AS DateTime), CAST(N'2017-07-21 14:22:03.067' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (125, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-21 14:40:11.917' AS DateTime), CAST(N'2017-07-21 14:40:11.923' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (126, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-21 15:26:25.937' AS DateTime), CAST(N'2017-07-21 15:26:25.943' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (127, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-23 10:22:07.680' AS DateTime), CAST(N'2017-07-23 10:22:07.683' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (128, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-23 12:49:22.610' AS DateTime), CAST(N'2017-07-23 12:49:22.620' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (129, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-23 13:52:20.880' AS DateTime), CAST(N'2017-07-23 13:52:20.887' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (130, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-23 14:45:23.410' AS DateTime), CAST(N'2017-07-23 14:45:23.413' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (131, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-23 17:03:56.693' AS DateTime), CAST(N'2017-07-23 17:03:56.693' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (132, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-23 17:28:58.200' AS DateTime), CAST(N'2017-07-23 17:28:58.200' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (133, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-23 17:34:22.050' AS DateTime), CAST(N'2017-07-23 17:34:22.050' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (134, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-24 13:32:53.100' AS DateTime), CAST(N'2017-07-24 13:32:53.120' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (135, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-24 14:11:22.483' AS DateTime), CAST(N'2017-07-24 14:11:22.490' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (136, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-24 14:23:37.460' AS DateTime), CAST(N'2017-07-24 14:23:37.460' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (137, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-24 15:28:16.620' AS DateTime), CAST(N'2017-07-24 15:28:16.623' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (138, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-24 18:46:35.290' AS DateTime), CAST(N'2017-07-24 18:46:35.300' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (139, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-24 19:42:16.760' AS DateTime), CAST(N'2017-07-24 19:42:16.763' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (140, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-24 20:50:43.797' AS DateTime), CAST(N'2017-07-24 20:50:43.803' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (141, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-25 08:16:14.340' AS DateTime), CAST(N'2017-07-25 08:16:14.350' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (142, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-25 08:38:37.870' AS DateTime), CAST(N'2017-07-25 08:38:37.877' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (143, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-25 09:44:38.127' AS DateTime), CAST(N'2017-07-25 09:44:38.130' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (144, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-25 10:10:58.417' AS DateTime), CAST(N'2017-07-25 10:10:58.417' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (145, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-25 10:18:49.247' AS DateTime), CAST(N'2017-07-25 10:18:49.250' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (146, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-25 13:19:34.707' AS DateTime), CAST(N'2017-07-25 13:19:34.713' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (147, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-25 14:25:53.107' AS DateTime), CAST(N'2017-07-25 14:25:53.113' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (148, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-25 15:11:37.090' AS DateTime), CAST(N'2017-07-25 15:11:37.097' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (149, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-25 20:06:06.333' AS DateTime), CAST(N'2017-07-25 20:06:06.337' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (150, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-25 21:05:18.597' AS DateTime), CAST(N'2017-07-25 21:05:18.600' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (151, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-25 21:18:34.450' AS DateTime), CAST(N'2017-07-25 21:18:34.450' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (152, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-25 21:22:30.177' AS DateTime), CAST(N'2017-07-25 21:22:30.180' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (153, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-25 21:27:00.617' AS DateTime), CAST(N'2017-07-25 21:27:00.623' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (154, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-26 13:14:22.697' AS DateTime), CAST(N'2017-07-26 13:14:22.703' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (155, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-26 13:16:44.020' AS DateTime), CAST(N'2017-07-26 13:16:44.027' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (156, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-26 13:18:52.187' AS DateTime), CAST(N'2017-07-26 13:18:52.193' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (157, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-26 13:20:51.917' AS DateTime), CAST(N'2017-07-26 13:20:51.920' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (158, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-26 13:49:22.023' AS DateTime), CAST(N'2017-07-26 13:49:22.027' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (159, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-27 10:06:46.277' AS DateTime), CAST(N'2017-07-27 10:06:46.287' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (160, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-27 10:15:08.317' AS DateTime), CAST(N'2017-07-27 10:15:08.323' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (161, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-27 10:32:49.323' AS DateTime), CAST(N'2017-07-27 10:32:49.327' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (162, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-27 10:37:35.393' AS DateTime), CAST(N'2017-07-27 10:37:35.397' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (163, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-27 10:52:21.097' AS DateTime), CAST(N'2017-07-27 10:52:21.100' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (164, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-27 11:05:44.313' AS DateTime), CAST(N'2017-07-27 11:05:44.317' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (165, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-27 11:09:37.047' AS DateTime), CAST(N'2017-07-27 11:09:37.047' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (166, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-27 11:13:15.427' AS DateTime), CAST(N'2017-07-27 11:13:15.430' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (167, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-27 11:19:31.713' AS DateTime), CAST(N'2017-07-27 11:19:31.717' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (168, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-27 22:27:37.693' AS DateTime), CAST(N'2017-07-27 22:27:37.713' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (169, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-27 22:51:44.637' AS DateTime), CAST(N'2017-07-27 22:51:44.637' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (170, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-27 22:55:32.087' AS DateTime), CAST(N'2017-07-27 22:55:32.087' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (171, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-27 23:13:40.147' AS DateTime), CAST(N'2017-07-27 23:13:40.160' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (172, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-27 23:17:40.160' AS DateTime), CAST(N'2017-07-27 23:17:40.160' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (173, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-27 23:29:16.270' AS DateTime), CAST(N'2017-07-27 23:29:16.273' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (174, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 08:51:31.083' AS DateTime), CAST(N'2017-07-30 08:51:31.087' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (175, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 11:11:59.730' AS DateTime), CAST(N'2017-07-30 11:11:59.733' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (176, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 12:28:50.217' AS DateTime), CAST(N'2017-07-30 12:28:50.230' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (177, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 13:32:53.603' AS DateTime), CAST(N'2017-07-30 13:32:53.610' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (178, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 13:39:59.150' AS DateTime), CAST(N'2017-07-30 13:39:59.153' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (179, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 14:31:18.747' AS DateTime), CAST(N'2017-07-30 14:31:18.750' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (180, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 14:56:55.743' AS DateTime), CAST(N'2017-07-30 14:56:55.750' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (181, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 15:14:05.127' AS DateTime), CAST(N'2017-07-30 15:14:05.127' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (182, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 16:16:13.660' AS DateTime), CAST(N'2017-07-30 16:16:13.663' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (183, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 16:49:54.680' AS DateTime), CAST(N'2017-07-30 16:49:54.680' AS DateTime), NULL, NULL, 1, N'::1', N'pag_AnalisisClinico', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (184, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 18:12:27.673' AS DateTime), CAST(N'2017-07-30 18:12:27.677' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (185, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 18:42:04.653' AS DateTime), CAST(N'2017-07-30 18:42:04.660' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (186, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 18:48:44.483' AS DateTime), CAST(N'2017-07-30 18:48:44.483' AS DateTime), NULL, NULL, 1, N'::1', N'pag_AnalisisClinico', NULL, N'Error', N'The DELETE statement conflicted with the REFERENCE constraint "FK_RecetaAnalisisClinico_AnalisisClinico". The conflict occurred in database "DB_A1595D_DoctorMedicalWeb", table "dbo.RecetaAnalisisClinico".
The statement has been terminated.', 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (187, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 18:48:56.243' AS DateTime), CAST(N'2017-07-30 18:48:56.243' AS DateTime), NULL, NULL, 1, N'::1', N'pag_AnalisisClinico', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (188, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 18:51:43.160' AS DateTime), CAST(N'2017-07-30 18:51:43.160' AS DateTime), NULL, NULL, 1, N'::1', N'pag_AnalisisClinico', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (189, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 19:19:22.817' AS DateTime), CAST(N'2017-07-30 19:19:22.820' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (190, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 19:31:37.263' AS DateTime), CAST(N'2017-07-30 19:31:37.263' AS DateTime), NULL, NULL, 1, N'::1', N'pag_AnalisisClinico', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (191, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 19:35:33.493' AS DateTime), CAST(N'2017-07-30 19:35:33.493' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (192, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 19:40:55.760' AS DateTime), CAST(N'2017-07-30 19:40:55.763' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (193, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 19:43:22.373' AS DateTime), CAST(N'2017-07-30 19:43:22.373' AS DateTime), NULL, NULL, 1, N'::1', N'pag_AnalisisClinico', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (194, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 19:44:01.757' AS DateTime), CAST(N'2017-07-30 19:44:01.757' AS DateTime), NULL, NULL, 1, N'::1', N'pag_AnalisisClinico', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (195, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 19:49:22.457' AS DateTime), CAST(N'2017-07-30 19:49:22.457' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (196, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 20:37:43.550' AS DateTime), CAST(N'2017-07-30 20:37:43.550' AS DateTime), NULL, NULL, 1, N'::1', N'pag_AnalisisClinico', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (197, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 20:38:43.263' AS DateTime), CAST(N'2017-07-30 20:38:43.263' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Diagnosticos', NULL, N'Error', N'The DELETE statement conflicted with the REFERENCE constraint "FK_ConsultorioMedicoHistorialDiagnostico_Diagnostico". The conflict occurred in database "DB_A1595D_DoctorMedicalWeb", table "dbo.ConsultaMedicaHistorialDiagnostico".
The statement has been terminated.', 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (198, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 20:38:54.773' AS DateTime), CAST(N'2017-07-30 20:38:54.773' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Diagnosticos', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (199, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 20:39:06.910' AS DateTime), CAST(N'2017-07-30 20:39:06.910' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Enfermedad', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (200, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-30 20:39:15.843' AS DateTime), CAST(N'2017-07-30 20:39:15.843' AS DateTime), NULL, NULL, 1, N'::1', N'pag_EvaluacionFisica', NULL, N'Editar', NULL, 0)
GO
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (201, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-31 19:27:10.393' AS DateTime), CAST(N'2017-07-31 19:27:10.397' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (202, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-31 19:31:26.027' AS DateTime), CAST(N'2017-07-31 19:31:26.027' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (203, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-31 19:33:06.857' AS DateTime), CAST(N'2017-07-31 19:33:06.857' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (204, 1, 1, 1, 1, 0, NULL, CAST(N'2017-07-31 20:58:16.920' AS DateTime), CAST(N'2017-07-31 20:58:16.940' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (205, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-01 11:16:29.423' AS DateTime), CAST(N'2017-08-01 11:16:29.427' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (206, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-03 19:18:54.270' AS DateTime), CAST(N'2017-08-03 19:18:54.270' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (207, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-06 13:15:38.340' AS DateTime), CAST(N'2017-08-06 13:15:38.340' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (208, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-06 13:42:56.113' AS DateTime), CAST(N'2017-08-06 13:42:56.113' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Paciente', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (209, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-06 13:43:56.380' AS DateTime), CAST(N'2017-08-06 13:43:56.380' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Paciente', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (210, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-06 17:15:31.500' AS DateTime), CAST(N'2017-08-06 17:15:31.520' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (211, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-06 17:39:28.930' AS DateTime), CAST(N'2017-08-06 17:39:28.933' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (212, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-06 18:05:11.150' AS DateTime), CAST(N'2017-08-06 18:05:11.163' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (213, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-07 19:09:37.253' AS DateTime), CAST(N'2017-08-07 19:09:37.310' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (214, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-07 19:10:30.720' AS DateTime), CAST(N'2017-08-07 19:10:30.720' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Paciente', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (215, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-07 19:11:52.220' AS DateTime), CAST(N'2017-08-07 19:11:52.220' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (216, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-07 19:12:23.017' AS DateTime), CAST(N'2017-08-07 19:12:23.017' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (217, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-07 19:13:11.243' AS DateTime), CAST(N'2017-08-07 19:13:11.243' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (218, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-07 19:14:53.747' AS DateTime), CAST(N'2017-08-07 19:14:53.747' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Consulta', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (219, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-07 20:22:40.540' AS DateTime), CAST(N'2017-08-07 20:22:40.547' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (220, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-07 20:36:32.997' AS DateTime), CAST(N'2017-08-07 20:36:33.163' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (221, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-09 20:15:55.317' AS DateTime), CAST(N'2017-08-09 20:15:55.337' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (222, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-09 20:28:36.970' AS DateTime), CAST(N'2017-08-09 20:28:36.983' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (223, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-09 20:32:43.027' AS DateTime), CAST(N'2017-08-09 20:32:43.047' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (224, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-10 14:50:27.973' AS DateTime), CAST(N'2017-08-10 14:50:27.987' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (225, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-10 15:55:02.573' AS DateTime), CAST(N'2017-08-10 15:55:02.593' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (226, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-10 19:08:29.690' AS DateTime), CAST(N'2017-08-10 19:08:29.777' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (227, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-10 19:17:50.553' AS DateTime), CAST(N'2017-08-10 19:17:50.557' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (228, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-10 19:20:53.573' AS DateTime), CAST(N'2017-08-10 19:20:53.573' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (229, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-10 19:31:42.073' AS DateTime), CAST(N'2017-08-10 19:31:42.077' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (230, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-10 19:50:45.347' AS DateTime), CAST(N'2017-08-10 19:50:45.347' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (231, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-10 19:58:02.303' AS DateTime), CAST(N'2017-08-10 19:58:02.310' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (232, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-10 20:44:44.833' AS DateTime), CAST(N'2017-08-10 20:44:44.833' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (233, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-10 21:29:50.920' AS DateTime), CAST(N'2017-08-10 21:29:50.923' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (234, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-10 21:59:55.553' AS DateTime), CAST(N'2017-08-10 21:59:55.553' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (235, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-10 22:00:45.243' AS DateTime), CAST(N'2017-08-10 22:00:45.243' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (236, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-10 22:03:19.100' AS DateTime), CAST(N'2017-08-10 22:03:19.100' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (237, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-10 22:05:22.273' AS DateTime), CAST(N'2017-08-10 22:05:22.277' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (238, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-10 22:06:09.737' AS DateTime), CAST(N'2017-08-10 22:06:09.737' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (239, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-10 22:07:37.813' AS DateTime), CAST(N'2017-08-10 22:07:37.813' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (240, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-11 09:27:20.817' AS DateTime), CAST(N'2017-08-11 09:27:20.820' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (241, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-11 10:11:45.627' AS DateTime), CAST(N'2017-08-11 10:11:45.630' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (242, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-11 10:40:03.243' AS DateTime), CAST(N'2017-08-11 10:40:03.253' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (243, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-11 11:03:52.807' AS DateTime), CAST(N'2017-08-11 11:03:52.813' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (244, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-11 11:22:20.120' AS DateTime), CAST(N'2017-08-11 11:22:20.130' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (245, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-11 13:38:22.870' AS DateTime), CAST(N'2017-08-11 13:38:22.873' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (246, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-11 13:49:04.920' AS DateTime), CAST(N'2017-08-11 13:49:04.927' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (247, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-11 14:54:47.007' AS DateTime), CAST(N'2017-08-11 14:54:47.007' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (248, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-11 14:55:40.790' AS DateTime), CAST(N'2017-08-11 14:55:40.790' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (249, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-11 15:12:35.037' AS DateTime), CAST(N'2017-08-11 15:12:35.043' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (250, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-11 16:19:12.200' AS DateTime), CAST(N'2017-08-11 16:19:12.200' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (251, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-11 16:28:33.467' AS DateTime), CAST(N'2017-08-11 16:28:33.467' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (252, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-11 16:29:53.477' AS DateTime), CAST(N'2017-08-11 16:29:53.477' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (253, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-13 15:00:08.533' AS DateTime), CAST(N'2017-08-13 15:00:08.567' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (254, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-13 16:11:38.047' AS DateTime), CAST(N'2017-08-13 16:11:38.050' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (255, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-13 16:47:59.760' AS DateTime), CAST(N'2017-08-13 16:47:59.760' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Paciente', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (256, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-13 16:48:45.603' AS DateTime), CAST(N'2017-08-13 16:48:45.603' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (257, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-13 16:59:32.057' AS DateTime), CAST(N'2017-08-13 16:59:32.057' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (258, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-14 09:10:01.630' AS DateTime), CAST(N'2017-08-14 09:10:01.630' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (259, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-14 10:28:06.560' AS DateTime), CAST(N'2017-08-14 10:28:06.567' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (260, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-14 12:53:45.127' AS DateTime), CAST(N'2017-08-14 12:53:45.133' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (261, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-14 14:58:27.843' AS DateTime), CAST(N'2017-08-14 14:58:27.847' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (262, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-14 14:59:29.647' AS DateTime), CAST(N'2017-08-14 14:59:29.647' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (263, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-14 16:14:03.157' AS DateTime), CAST(N'2017-08-14 16:14:03.173' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (264, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-14 16:18:20.930' AS DateTime), CAST(N'2017-08-14 16:18:20.933' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (265, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-14 16:21:30.187' AS DateTime), CAST(N'2017-08-14 16:21:30.190' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (266, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-14 19:44:28.490' AS DateTime), CAST(N'2017-08-14 19:44:28.490' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (267, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-14 19:49:19.907' AS DateTime), CAST(N'2017-08-14 19:49:19.917' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (268, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-14 20:20:28.993' AS DateTime), CAST(N'2017-08-14 20:20:28.993' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (269, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-14 20:22:51.367' AS DateTime), CAST(N'2017-08-14 20:22:51.367' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (270, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-14 20:23:21.260' AS DateTime), CAST(N'2017-08-14 20:23:21.263' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (271, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-14 20:28:02.320' AS DateTime), CAST(N'2017-08-14 20:28:02.320' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (272, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 08:18:26.237' AS DateTime), CAST(N'2017-08-16 08:18:26.240' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (273, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 09:15:42.870' AS DateTime), CAST(N'2017-08-16 09:15:42.877' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (274, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 09:32:00.147' AS DateTime), CAST(N'2017-08-16 09:32:00.147' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (275, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 09:36:12.317' AS DateTime), CAST(N'2017-08-16 09:36:12.317' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (276, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 10:10:05.867' AS DateTime), CAST(N'2017-08-16 10:10:05.870' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (277, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 10:13:58.430' AS DateTime), CAST(N'2017-08-16 10:13:58.430' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (278, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 11:50:20.853' AS DateTime), CAST(N'2017-08-16 11:50:20.853' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (279, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 11:53:27.367' AS DateTime), CAST(N'2017-08-16 11:53:27.370' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (280, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 11:54:49.860' AS DateTime), CAST(N'2017-08-16 11:54:49.860' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (281, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 12:09:17.877' AS DateTime), CAST(N'2017-08-16 12:09:17.880' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (282, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 12:10:03.493' AS DateTime), CAST(N'2017-08-16 12:10:03.493' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (283, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 12:59:45.633' AS DateTime), CAST(N'2017-08-16 12:59:45.633' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (284, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 13:00:29.567' AS DateTime), CAST(N'2017-08-16 13:00:29.567' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (285, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 13:00:57.937' AS DateTime), CAST(N'2017-08-16 13:00:57.937' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (286, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 13:08:19.060' AS DateTime), CAST(N'2017-08-16 13:08:19.060' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (287, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 13:10:03.670' AS DateTime), CAST(N'2017-08-16 13:10:03.670' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (288, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 13:12:31.820' AS DateTime), CAST(N'2017-08-16 13:12:31.820' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (289, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 13:53:19.787' AS DateTime), CAST(N'2017-08-16 13:53:19.787' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (290, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 14:17:57.587' AS DateTime), CAST(N'2017-08-16 14:17:57.587' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (291, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 15:03:14.857' AS DateTime), CAST(N'2017-08-16 15:03:14.867' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (292, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 16:15:12.013' AS DateTime), CAST(N'2017-08-16 16:15:12.013' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (293, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 16:27:28.177' AS DateTime), CAST(N'2017-08-16 16:27:28.177' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (294, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 16:28:14.000' AS DateTime), CAST(N'2017-08-16 16:28:14.000' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (295, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 16:41:35.747' AS DateTime), CAST(N'2017-08-16 16:41:35.747' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (296, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 16:42:17.160' AS DateTime), CAST(N'2017-08-16 16:42:17.160' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (297, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 16:43:07.593' AS DateTime), CAST(N'2017-08-16 16:43:07.593' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (298, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 17:15:47.927' AS DateTime), CAST(N'2017-08-16 17:15:47.927' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (299, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 17:16:17.733' AS DateTime), CAST(N'2017-08-16 17:16:17.733' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (300, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 17:34:33.500' AS DateTime), CAST(N'2017-08-16 17:34:33.500' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
GO
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (301, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 17:38:43.127' AS DateTime), CAST(N'2017-08-16 17:38:43.127' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (302, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 17:39:11.423' AS DateTime), CAST(N'2017-08-16 17:39:11.423' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (303, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 17:39:34.413' AS DateTime), CAST(N'2017-08-16 17:39:34.413' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (304, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 17:49:52.873' AS DateTime), CAST(N'2017-08-16 17:49:52.873' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (305, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 17:50:07.410' AS DateTime), CAST(N'2017-08-16 17:50:07.410' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (306, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 17:50:21.430' AS DateTime), CAST(N'2017-08-16 17:50:21.430' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (307, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 17:50:37.887' AS DateTime), CAST(N'2017-08-16 17:50:37.887' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (308, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 17:56:40.180' AS DateTime), CAST(N'2017-08-16 17:56:40.180' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (309, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:02:40.857' AS DateTime), CAST(N'2017-08-16 18:02:40.863' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (310, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:09:24.717' AS DateTime), CAST(N'2017-08-16 18:09:24.717' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (311, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:11:00.677' AS DateTime), CAST(N'2017-08-16 18:11:00.680' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (312, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:11:31.073' AS DateTime), CAST(N'2017-08-16 18:11:31.073' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (313, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:22:52.363' AS DateTime), CAST(N'2017-08-16 18:22:52.363' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (314, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:28:11.137' AS DateTime), CAST(N'2017-08-16 18:28:11.137' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (315, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:30:19.950' AS DateTime), CAST(N'2017-08-16 18:30:19.950' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (316, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:30:48.000' AS DateTime), CAST(N'2017-08-16 18:30:48.000' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (317, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:31:17.080' AS DateTime), CAST(N'2017-08-16 18:31:17.080' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (318, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:31:37.253' AS DateTime), CAST(N'2017-08-16 18:31:37.253' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (319, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:32:17.160' AS DateTime), CAST(N'2017-08-16 18:32:17.160' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (320, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:33:03.023' AS DateTime), CAST(N'2017-08-16 18:33:03.023' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (321, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:33:18.023' AS DateTime), CAST(N'2017-08-16 18:33:18.023' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (322, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:33:24.407' AS DateTime), CAST(N'2017-08-16 18:33:24.407' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (323, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:33:39.187' AS DateTime), CAST(N'2017-08-16 18:33:39.187' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (324, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:35:08.513' AS DateTime), CAST(N'2017-08-16 18:35:08.513' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (325, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:35:36.877' AS DateTime), CAST(N'2017-08-16 18:35:36.877' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (326, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:36:09.127' AS DateTime), CAST(N'2017-08-16 18:36:09.127' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (327, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:37:06.790' AS DateTime), CAST(N'2017-08-16 18:37:06.790' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (328, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:37:35.973' AS DateTime), CAST(N'2017-08-16 18:37:35.973' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (329, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:39:34.143' AS DateTime), CAST(N'2017-08-16 18:39:34.143' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (330, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:39:51.340' AS DateTime), CAST(N'2017-08-16 18:39:51.340' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (331, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:42:00.497' AS DateTime), CAST(N'2017-08-16 18:42:00.497' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (332, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:42:20.580' AS DateTime), CAST(N'2017-08-16 18:42:20.580' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (333, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:42:43.127' AS DateTime), CAST(N'2017-08-16 18:42:43.127' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (334, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 18:59:10.277' AS DateTime), CAST(N'2017-08-16 18:59:10.277' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (335, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 19:12:23.243' AS DateTime), CAST(N'2017-08-16 19:12:23.243' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (336, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 19:32:24.770' AS DateTime), CAST(N'2017-08-16 19:32:24.773' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (337, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 19:49:36.563' AS DateTime), CAST(N'2017-08-16 19:49:36.563' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (338, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 20:15:24.520' AS DateTime), CAST(N'2017-08-16 20:15:24.523' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (339, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 21:22:21.173' AS DateTime), CAST(N'2017-08-16 21:22:21.177' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (340, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 21:26:20.800' AS DateTime), CAST(N'2017-08-16 21:26:20.800' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (341, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 21:54:09.733' AS DateTime), CAST(N'2017-08-16 21:54:09.737' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (342, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 21:59:16.463' AS DateTime), CAST(N'2017-08-16 21:59:16.463' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (343, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 22:01:43.880' AS DateTime), CAST(N'2017-08-16 22:01:43.880' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (344, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 22:01:59.837' AS DateTime), CAST(N'2017-08-16 22:01:59.837' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (345, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 22:02:20.967' AS DateTime), CAST(N'2017-08-16 22:02:20.967' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (346, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 22:07:52.587' AS DateTime), CAST(N'2017-08-16 22:07:52.590' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (347, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 23:16:23.533' AS DateTime), CAST(N'2017-08-16 23:16:23.533' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (348, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 23:18:44.307' AS DateTime), CAST(N'2017-08-16 23:18:44.307' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (349, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 23:38:08.127' AS DateTime), CAST(N'2017-08-16 23:38:08.130' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (350, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-16 23:50:30.333' AS DateTime), CAST(N'2017-08-16 23:50:30.333' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (351, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 09:09:55.107' AS DateTime), CAST(N'2017-08-17 09:09:55.110' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (352, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 09:19:06.927' AS DateTime), CAST(N'2017-08-17 09:19:06.927' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (353, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 09:19:34.280' AS DateTime), CAST(N'2017-08-17 09:19:34.280' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (354, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 09:56:36.687' AS DateTime), CAST(N'2017-08-17 09:56:36.690' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (355, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 09:57:41.763' AS DateTime), CAST(N'2017-08-17 09:57:41.763' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (356, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 09:58:01.633' AS DateTime), CAST(N'2017-08-17 09:58:01.633' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (357, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 09:58:20.727' AS DateTime), CAST(N'2017-08-17 09:58:20.727' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (358, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 12:53:30.917' AS DateTime), CAST(N'2017-08-17 12:53:30.917' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (359, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 12:55:29.513' AS DateTime), CAST(N'2017-08-17 12:55:29.513' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (360, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 14:38:45.090' AS DateTime), CAST(N'2017-08-17 14:38:45.090' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (361, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 14:45:44.667' AS DateTime), CAST(N'2017-08-17 14:45:44.667' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (362, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 15:20:12.253' AS DateTime), CAST(N'2017-08-17 15:20:12.257' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (363, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 15:21:22.130' AS DateTime), CAST(N'2017-08-17 15:21:22.130' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (364, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 15:22:03.243' AS DateTime), CAST(N'2017-08-17 15:22:03.243' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (365, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 15:29:12.457' AS DateTime), CAST(N'2017-08-17 15:29:12.457' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (366, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 15:29:36.890' AS DateTime), CAST(N'2017-08-17 15:29:36.890' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (367, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 15:39:32.840' AS DateTime), CAST(N'2017-08-17 15:39:32.843' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (368, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 15:47:17.557' AS DateTime), CAST(N'2017-08-17 15:47:17.557' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (369, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 16:07:10.227' AS DateTime), CAST(N'2017-08-17 16:07:10.227' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (370, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 16:08:47.463' AS DateTime), CAST(N'2017-08-17 16:08:47.463' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (371, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 16:32:21.367' AS DateTime), CAST(N'2017-08-17 16:32:21.377' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (372, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 16:33:25.243' AS DateTime), CAST(N'2017-08-17 16:33:25.243' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (373, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 16:34:58.233' AS DateTime), CAST(N'2017-08-17 16:34:58.233' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (374, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 16:35:30.547' AS DateTime), CAST(N'2017-08-17 16:35:30.547' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (375, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 17:02:22.267' AS DateTime), CAST(N'2017-08-17 17:02:22.267' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (376, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 19:38:04.817' AS DateTime), CAST(N'2017-08-17 19:38:04.823' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (377, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 20:13:54.103' AS DateTime), CAST(N'2017-08-17 20:13:54.103' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (378, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 20:14:28.230' AS DateTime), CAST(N'2017-08-17 20:14:28.230' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (379, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 21:39:27.047' AS DateTime), CAST(N'2017-08-17 21:39:27.047' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (380, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-17 21:40:17.863' AS DateTime), CAST(N'2017-08-17 21:40:17.863' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (381, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-20 08:16:12.277' AS DateTime), CAST(N'2017-08-20 08:16:12.320' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (382, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-20 08:17:22.860' AS DateTime), CAST(N'2017-08-20 08:17:22.860' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (383, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-20 08:17:59.270' AS DateTime), CAST(N'2017-08-20 08:17:59.270' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (384, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-20 08:18:44.463' AS DateTime), CAST(N'2017-08-20 08:18:44.463' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (385, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-20 14:19:39.647' AS DateTime), CAST(N'2017-08-20 14:19:39.667' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (386, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-20 14:27:09.127' AS DateTime), CAST(N'2017-08-20 14:27:09.130' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (387, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-20 14:34:06.717' AS DateTime), CAST(N'2017-08-20 14:34:06.717' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (388, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-20 15:39:23.780' AS DateTime), CAST(N'2017-08-20 15:39:23.787' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (389, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-20 16:03:45.067' AS DateTime), CAST(N'2017-08-20 16:03:45.067' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (390, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-21 16:17:34.737' AS DateTime), CAST(N'2017-08-21 16:17:34.750' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (391, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-21 19:09:06.347' AS DateTime), CAST(N'2017-08-21 19:09:06.350' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (392, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-21 19:44:46.543' AS DateTime), CAST(N'2017-08-21 19:44:46.547' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (393, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-21 20:07:16.377' AS DateTime), CAST(N'2017-08-21 20:07:16.390' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (394, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-21 20:56:54.613' AS DateTime), CAST(N'2017-08-21 20:56:54.617' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (395, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-21 21:34:21.297' AS DateTime), CAST(N'2017-08-21 21:34:21.303' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (396, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-22 18:46:34.283' AS DateTime), CAST(N'2017-08-22 18:46:34.287' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (397, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-22 21:06:45.877' AS DateTime), CAST(N'2017-08-22 21:06:45.890' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (398, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-22 22:00:47.237' AS DateTime), CAST(N'2017-08-22 22:00:47.240' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (399, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-22 22:57:13.567' AS DateTime), CAST(N'2017-08-22 22:57:13.577' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (400, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-24 19:01:31.507' AS DateTime), CAST(N'2017-08-24 19:01:31.543' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
GO
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (401, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-24 19:17:54.287' AS DateTime), CAST(N'2017-08-24 19:17:54.287' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (402, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-24 21:56:08.930' AS DateTime), CAST(N'2017-08-24 21:56:08.940' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (403, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-27 19:22:55.527' AS DateTime), CAST(N'2017-08-27 19:22:55.533' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (404, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-27 21:18:44.153' AS DateTime), CAST(N'2017-08-27 21:18:44.160' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (405, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-28 16:14:34.447' AS DateTime), CAST(N'2017-08-28 16:14:34.450' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (406, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-28 22:22:56.607' AS DateTime), CAST(N'2017-08-28 22:22:56.610' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (407, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-29 09:48:15.743' AS DateTime), CAST(N'2017-08-29 09:48:15.747' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (408, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-29 14:39:46.877' AS DateTime), CAST(N'2017-08-29 14:39:46.883' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (409, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-29 15:00:09.073' AS DateTime), CAST(N'2017-08-29 15:00:09.073' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (410, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-30 21:40:29.707' AS DateTime), CAST(N'2017-08-30 21:40:29.710' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (411, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-30 22:24:26.560' AS DateTime), CAST(N'2017-08-30 22:24:26.563' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (412, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-31 19:31:39.977' AS DateTime), CAST(N'2017-08-31 19:31:39.997' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (413, 1, 1, 1, 1, 0, NULL, CAST(N'2017-08-31 20:08:05.870' AS DateTime), CAST(N'2017-08-31 20:08:05.873' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (414, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-01 00:17:00.390' AS DateTime), CAST(N'2017-09-01 00:17:00.407' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (415, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-01 00:22:20.143' AS DateTime), CAST(N'2017-09-01 00:22:20.150' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (416, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-01 00:24:36.143' AS DateTime), CAST(N'2017-09-01 00:24:36.147' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (417, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-01 00:30:12.833' AS DateTime), CAST(N'2017-09-01 00:30:12.837' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (418, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-01 00:34:33.733' AS DateTime), CAST(N'2017-09-01 00:34:33.737' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (419, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-01 00:39:48.613' AS DateTime), CAST(N'2017-09-01 00:39:48.617' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (420, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-01 00:41:44.083' AS DateTime), CAST(N'2017-09-01 00:41:44.087' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (421, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-01 00:49:25.243' AS DateTime), CAST(N'2017-09-01 00:49:25.247' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (422, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 07:58:12.203' AS DateTime), CAST(N'2017-09-03 07:58:12.207' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (423, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 08:38:58.993' AS DateTime), CAST(N'2017-09-03 08:38:58.997' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (424, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 10:09:19.233' AS DateTime), CAST(N'2017-09-03 10:09:19.237' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (425, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 10:14:06.287' AS DateTime), CAST(N'2017-09-03 10:14:06.287' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (426, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 10:17:03.747' AS DateTime), CAST(N'2017-09-03 10:17:03.747' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (427, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 10:18:17.343' AS DateTime), CAST(N'2017-09-03 10:18:17.343' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (428, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 10:24:34.373' AS DateTime), CAST(N'2017-09-03 10:24:34.377' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (429, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 10:34:20.050' AS DateTime), CAST(N'2017-09-03 10:34:20.050' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (430, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 11:06:17.543' AS DateTime), CAST(N'2017-09-03 11:06:17.543' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (431, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 18:10:04.953' AS DateTime), CAST(N'2017-09-03 18:10:04.953' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (432, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 18:10:34.277' AS DateTime), CAST(N'2017-09-03 18:10:34.277' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (433, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 18:11:11.040' AS DateTime), CAST(N'2017-09-03 18:11:11.040' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (434, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 18:11:43.423' AS DateTime), CAST(N'2017-09-03 18:11:43.423' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (435, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 18:48:07.820' AS DateTime), CAST(N'2017-09-03 18:48:07.823' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (436, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 18:52:07.737' AS DateTime), CAST(N'2017-09-03 18:52:07.743' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (437, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 18:54:17.847' AS DateTime), CAST(N'2017-09-03 18:54:17.853' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (438, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 18:57:40.033' AS DateTime), CAST(N'2017-09-03 18:57:40.037' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (439, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 19:24:30.487' AS DateTime), CAST(N'2017-09-03 19:24:30.490' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (440, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-03 19:30:06.457' AS DateTime), CAST(N'2017-09-03 19:30:06.457' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (441, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 15:39:46.640' AS DateTime), CAST(N'2017-09-04 15:39:46.647' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (442, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 15:47:22.600' AS DateTime), CAST(N'2017-09-04 15:47:22.603' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (443, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 20:03:47.683' AS DateTime), CAST(N'2017-09-04 20:03:47.690' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (444, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 23:03:07.273' AS DateTime), CAST(N'2017-09-04 23:03:07.277' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (445, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 23:09:41.250' AS DateTime), CAST(N'2017-09-04 23:09:41.250' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (446, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 23:27:34.987' AS DateTime), CAST(N'2017-09-04 23:27:34.987' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (447, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 23:29:49.890' AS DateTime), CAST(N'2017-09-04 23:29:49.890' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (448, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 23:30:13.660' AS DateTime), CAST(N'2017-09-04 23:30:13.660' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (449, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 23:30:32.197' AS DateTime), CAST(N'2017-09-04 23:30:32.197' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (450, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 23:30:36.653' AS DateTime), CAST(N'2017-09-04 23:30:36.653' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (451, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 23:30:46.360' AS DateTime), CAST(N'2017-09-04 23:30:46.360' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (452, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 23:30:49.637' AS DateTime), CAST(N'2017-09-04 23:30:49.637' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (453, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 23:31:06.863' AS DateTime), CAST(N'2017-09-04 23:31:06.863' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (454, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 23:31:21.620' AS DateTime), CAST(N'2017-09-04 23:31:21.620' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (455, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 23:32:12.727' AS DateTime), CAST(N'2017-09-04 23:32:12.727' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (456, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 23:32:29.013' AS DateTime), CAST(N'2017-09-04 23:32:29.013' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (457, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 23:32:48.767' AS DateTime), CAST(N'2017-09-04 23:32:48.767' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (458, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 23:33:07.537' AS DateTime), CAST(N'2017-09-04 23:33:07.537' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (459, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-04 23:33:26.127' AS DateTime), CAST(N'2017-09-04 23:33:26.127' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (460, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 13:28:47.693' AS DateTime), CAST(N'2017-09-05 13:28:47.700' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (461, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 13:30:25.827' AS DateTime), CAST(N'2017-09-05 13:30:25.827' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (462, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:15:31.183' AS DateTime), CAST(N'2017-09-05 14:15:31.183' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (463, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:15:46.927' AS DateTime), CAST(N'2017-09-05 14:15:46.927' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (464, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:15:55.217' AS DateTime), CAST(N'2017-09-05 14:15:55.217' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (465, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:18:46.327' AS DateTime), CAST(N'2017-09-05 14:18:46.327' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (466, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:18:50.980' AS DateTime), CAST(N'2017-09-05 14:18:50.980' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (467, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:19:47.637' AS DateTime), CAST(N'2017-09-05 14:19:47.637' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (468, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:19:59.997' AS DateTime), CAST(N'2017-09-05 14:19:59.997' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (469, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:22:47.780' AS DateTime), CAST(N'2017-09-05 14:22:47.780' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (470, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:28:56.317' AS DateTime), CAST(N'2017-09-05 14:28:56.317' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (471, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:30:19.887' AS DateTime), CAST(N'2017-09-05 14:30:19.887' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (472, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:31:50.173' AS DateTime), CAST(N'2017-09-05 14:31:50.173' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (473, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:46:28.023' AS DateTime), CAST(N'2017-09-05 14:46:28.023' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (474, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:46:38.647' AS DateTime), CAST(N'2017-09-05 14:46:38.647' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (475, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:46:47.593' AS DateTime), CAST(N'2017-09-05 14:46:47.593' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (476, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:47:52.477' AS DateTime), CAST(N'2017-09-05 14:47:52.477' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (477, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:51:31.397' AS DateTime), CAST(N'2017-09-05 14:51:31.397' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (478, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:51:36.350' AS DateTime), CAST(N'2017-09-05 14:51:36.350' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (479, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:52:38.673' AS DateTime), CAST(N'2017-09-05 14:52:38.673' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (480, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:53:35.170' AS DateTime), CAST(N'2017-09-05 14:53:35.170' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (481, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:53:43.640' AS DateTime), CAST(N'2017-09-05 14:53:43.640' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (482, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:53:46.237' AS DateTime), CAST(N'2017-09-05 14:53:46.237' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (483, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:53:48.680' AS DateTime), CAST(N'2017-09-05 14:53:48.680' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (484, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:53:51.480' AS DateTime), CAST(N'2017-09-05 14:53:51.480' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (485, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:53:58.390' AS DateTime), CAST(N'2017-09-05 14:53:58.390' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (486, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 14:54:06.617' AS DateTime), CAST(N'2017-09-05 14:54:06.617' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (487, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 15:47:49.753' AS DateTime), CAST(N'2017-09-05 15:47:49.753' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (488, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 15:48:03.793' AS DateTime), CAST(N'2017-09-05 15:48:03.793' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (489, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 15:48:19.883' AS DateTime), CAST(N'2017-09-05 15:48:19.883' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (490, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 15:48:28.377' AS DateTime), CAST(N'2017-09-05 15:48:28.377' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (491, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 15:48:43.857' AS DateTime), CAST(N'2017-09-05 15:48:43.857' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (492, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 15:48:50.433' AS DateTime), CAST(N'2017-09-05 15:48:50.433' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (493, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 15:49:00.790' AS DateTime), CAST(N'2017-09-05 15:49:00.790' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (494, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 15:49:20.747' AS DateTime), CAST(N'2017-09-05 15:49:20.747' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (495, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 16:46:08.317' AS DateTime), CAST(N'2017-09-05 16:46:08.317' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (496, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 18:59:10.017' AS DateTime), CAST(N'2017-09-05 18:59:10.020' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (497, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 18:59:58.347' AS DateTime), CAST(N'2017-09-05 18:59:58.347' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (498, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 19:13:29.143' AS DateTime), CAST(N'2017-09-05 19:13:29.147' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (499, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 19:15:30.613' AS DateTime), CAST(N'2017-09-05 19:15:30.617' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (500, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 19:16:51.297' AS DateTime), CAST(N'2017-09-05 19:16:51.300' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
GO
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (501, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 22:12:49.417' AS DateTime), CAST(N'2017-09-05 22:12:49.427' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (502, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 22:17:58.153' AS DateTime), CAST(N'2017-09-05 22:17:58.153' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (503, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-05 22:19:39.640' AS DateTime), CAST(N'2017-09-05 22:19:39.640' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (504, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-06 13:36:55.713' AS DateTime), CAST(N'2017-09-06 13:36:55.713' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (505, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-06 13:38:43.230' AS DateTime), CAST(N'2017-09-06 13:38:43.230' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (506, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-06 13:40:35.633' AS DateTime), CAST(N'2017-09-06 13:40:35.633' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (507, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-06 13:46:30.417' AS DateTime), CAST(N'2017-09-06 13:46:30.417' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (508, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-06 14:09:22.503' AS DateTime), CAST(N'2017-09-06 14:09:22.503' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (509, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-06 14:10:07.810' AS DateTime), CAST(N'2017-09-06 14:10:07.810' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (510, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-06 14:23:02.683' AS DateTime), CAST(N'2017-09-06 14:23:02.683' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (511, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-06 18:58:07.177' AS DateTime), CAST(N'2017-09-06 18:58:07.177' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (512, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-06 19:02:53.677' AS DateTime), CAST(N'2017-09-06 19:02:53.677' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (513, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-06 19:03:24.977' AS DateTime), CAST(N'2017-09-06 19:03:24.977' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (514, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-06 19:03:42.553' AS DateTime), CAST(N'2017-09-06 19:03:42.553' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (515, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-06 19:30:26.220' AS DateTime), CAST(N'2017-09-06 19:30:26.223' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (516, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 10:57:54.683' AS DateTime), CAST(N'2017-09-07 10:57:54.687' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (517, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 11:17:15.080' AS DateTime), CAST(N'2017-09-07 11:17:15.080' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (518, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 11:17:37.690' AS DateTime), CAST(N'2017-09-07 11:17:37.690' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (519, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 11:20:04.683' AS DateTime), CAST(N'2017-09-07 11:20:04.683' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (520, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 11:20:27.933' AS DateTime), CAST(N'2017-09-07 11:20:27.933' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (521, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 11:20:44.880' AS DateTime), CAST(N'2017-09-07 11:20:44.880' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (522, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 11:21:26.717' AS DateTime), CAST(N'2017-09-07 11:21:26.717' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (523, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 13:21:04.497' AS DateTime), CAST(N'2017-09-07 13:21:04.497' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (524, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 13:21:12.293' AS DateTime), CAST(N'2017-09-07 13:21:12.293' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (525, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 13:26:04.093' AS DateTime), CAST(N'2017-09-07 13:26:04.093' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (526, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 13:36:16.787' AS DateTime), CAST(N'2017-09-07 13:36:16.787' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (527, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 13:42:23.527' AS DateTime), CAST(N'2017-09-07 13:42:23.527' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (528, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 15:48:49.943' AS DateTime), CAST(N'2017-09-07 15:48:49.943' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (529, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 16:05:52.297' AS DateTime), CAST(N'2017-09-07 16:05:52.297' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (530, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 16:48:04.733' AS DateTime), CAST(N'2017-09-07 16:48:04.737' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (531, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 16:57:31.320' AS DateTime), CAST(N'2017-09-07 16:57:31.323' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (532, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:11:38.590' AS DateTime), CAST(N'2017-09-07 17:11:38.593' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (533, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:11:52.240' AS DateTime), CAST(N'2017-09-07 17:11:52.240' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (534, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:12:03.700' AS DateTime), CAST(N'2017-09-07 17:12:03.700' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (535, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:16:52.777' AS DateTime), CAST(N'2017-09-07 17:16:52.780' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (536, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:17:31.710' AS DateTime), CAST(N'2017-09-07 17:17:31.710' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (537, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:17:47.120' AS DateTime), CAST(N'2017-09-07 17:17:47.120' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (538, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:22:35.273' AS DateTime), CAST(N'2017-09-07 17:22:35.273' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (539, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:22:50.533' AS DateTime), CAST(N'2017-09-07 17:22:50.533' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (540, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:23:03.533' AS DateTime), CAST(N'2017-09-07 17:23:03.533' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (541, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:27:28.443' AS DateTime), CAST(N'2017-09-07 17:27:28.450' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (542, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:27:59.653' AS DateTime), CAST(N'2017-09-07 17:27:59.653' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (543, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:28:37.313' AS DateTime), CAST(N'2017-09-07 17:28:37.313' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (544, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:28:50.017' AS DateTime), CAST(N'2017-09-07 17:28:50.017' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (545, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:29:17.227' AS DateTime), CAST(N'2017-09-07 17:29:17.227' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (546, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:30:21.147' AS DateTime), CAST(N'2017-09-07 17:30:21.147' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (547, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:30:29.937' AS DateTime), CAST(N'2017-09-07 17:30:29.937' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (548, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:30:43.307' AS DateTime), CAST(N'2017-09-07 17:30:43.307' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (549, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:31:43.493' AS DateTime), CAST(N'2017-09-07 17:31:43.493' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Borrar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (550, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:31:58.747' AS DateTime), CAST(N'2017-09-07 17:31:58.747' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (551, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:32:13.337' AS DateTime), CAST(N'2017-09-07 17:32:13.337' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (552, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:34:02.270' AS DateTime), CAST(N'2017-09-07 17:34:02.270' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (553, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:41:30.360' AS DateTime), CAST(N'2017-09-07 17:41:30.363' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (554, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:42:01.467' AS DateTime), CAST(N'2017-09-07 17:42:01.467' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (555, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:43:36.723' AS DateTime), CAST(N'2017-09-07 17:43:36.723' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (556, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:47:27.933' AS DateTime), CAST(N'2017-09-07 17:47:27.933' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (557, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:48:42.717' AS DateTime), CAST(N'2017-09-07 17:48:42.717' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (558, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:49:40.233' AS DateTime), CAST(N'2017-09-07 17:49:40.233' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (559, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:50:03.370' AS DateTime), CAST(N'2017-09-07 17:50:03.370' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (560, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:50:18.313' AS DateTime), CAST(N'2017-09-07 17:50:18.313' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (561, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:50:38.390' AS DateTime), CAST(N'2017-09-07 17:50:38.390' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (562, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-07 17:50:56.370' AS DateTime), CAST(N'2017-09-07 17:50:56.370' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (563, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-10 13:13:48.503' AS DateTime), CAST(N'2017-09-10 13:13:48.570' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (564, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-10 14:43:54.183' AS DateTime), CAST(N'2017-09-10 14:43:54.193' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (565, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-10 14:55:49.597' AS DateTime), CAST(N'2017-09-10 14:55:49.597' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (566, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-10 15:18:26.390' AS DateTime), CAST(N'2017-09-10 15:18:26.393' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (567, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-10 15:34:36.750' AS DateTime), CAST(N'2017-09-10 15:34:36.753' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (568, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-10 15:44:57.703' AS DateTime), CAST(N'2017-09-10 15:44:57.703' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (569, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-10 15:48:08.667' AS DateTime), CAST(N'2017-09-10 15:48:08.667' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (570, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-10 15:54:45.120' AS DateTime), CAST(N'2017-09-10 15:54:45.120' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (571, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-10 16:07:47.203' AS DateTime), CAST(N'2017-09-10 16:07:47.203' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (572, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-10 16:09:11.707' AS DateTime), CAST(N'2017-09-10 16:09:11.707' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (573, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-10 16:55:21.160' AS DateTime), CAST(N'2017-09-10 16:55:21.160' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (574, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-10 16:55:57.963' AS DateTime), CAST(N'2017-09-10 16:55:57.963' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (575, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-10 16:56:22.663' AS DateTime), CAST(N'2017-09-10 16:56:22.663' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (576, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-10 16:56:59.257' AS DateTime), CAST(N'2017-09-10 16:56:59.257' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (577, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-10 17:48:08.817' AS DateTime), CAST(N'2017-09-10 17:48:08.830' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (578, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-18 17:59:32.310' AS DateTime), CAST(N'2017-09-18 17:59:32.310' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (579, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-18 18:06:48.520' AS DateTime), CAST(N'2017-09-18 18:06:48.520' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (580, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-26 18:11:07.990' AS DateTime), CAST(N'2017-09-26 18:11:08.017' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (581, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-26 18:19:31.800' AS DateTime), CAST(N'2017-09-26 18:19:31.810' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (582, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-24 18:25:34.113' AS DateTime), CAST(N'2017-09-24 18:25:34.113' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (583, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-24 18:26:15.403' AS DateTime), CAST(N'2017-09-24 18:26:15.403' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (584, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-24 18:26:40.323' AS DateTime), CAST(N'2017-09-24 18:26:40.323' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (585, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-24 18:27:00.147' AS DateTime), CAST(N'2017-09-24 18:27:00.147' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (586, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-25 18:27:27.420' AS DateTime), CAST(N'2017-09-25 18:27:27.420' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (587, 1, 1, 1, 1, 0, NULL, CAST(N'2017-10-25 18:27:58.463' AS DateTime), CAST(N'2017-10-25 18:27:58.467' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (588, 1, 1, 1, 1, 0, NULL, CAST(N'2017-10-25 18:29:00.067' AS DateTime), CAST(N'2017-10-25 18:29:00.067' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (589, 1, 1, 1, 1, 0, NULL, CAST(N'2017-10-25 18:30:20.097' AS DateTime), CAST(N'2017-10-25 18:30:20.097' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (590, 1, 1, 1, 1, 0, NULL, CAST(N'2017-10-25 18:30:43.440' AS DateTime), CAST(N'2017-10-25 18:30:43.440' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (591, 1, 1, 1, 1, 0, NULL, CAST(N'2017-10-25 18:30:53.360' AS DateTime), CAST(N'2017-10-25 18:30:53.360' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (592, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 19:38:34.383' AS DateTime), CAST(N'2017-09-11 19:38:34.403' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (593, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 19:46:11.113' AS DateTime), CAST(N'2017-09-11 19:46:11.117' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (594, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 20:27:08.347' AS DateTime), CAST(N'2017-09-11 20:27:08.440' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (595, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 20:28:07.967' AS DateTime), CAST(N'2017-09-11 20:28:07.967' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (596, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 20:33:55.080' AS DateTime), CAST(N'2017-09-11 20:33:55.090' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (597, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 20:36:37.603' AS DateTime), CAST(N'2017-09-11 20:36:37.603' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (598, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 20:49:24.603' AS DateTime), CAST(N'2017-09-11 20:49:24.807' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (599, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 20:51:25.717' AS DateTime), CAST(N'2017-09-11 20:51:25.723' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (600, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 20:51:36.573' AS DateTime), CAST(N'2017-09-11 20:51:36.590' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
GO
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (601, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 20:56:10.903' AS DateTime), CAST(N'2017-09-11 20:56:10.920' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (602, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 20:56:22.787' AS DateTime), CAST(N'2017-09-11 20:56:22.787' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (603, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 20:57:27.937' AS DateTime), CAST(N'2017-09-11 20:57:27.940' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (604, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 21:03:49.517' AS DateTime), CAST(N'2017-09-11 21:03:49.523' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (605, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 21:11:56.240' AS DateTime), CAST(N'2017-09-11 21:11:56.257' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (606, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 21:13:39.053' AS DateTime), CAST(N'2017-09-11 21:13:39.060' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (607, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 21:19:58.690' AS DateTime), CAST(N'2017-09-11 21:19:58.703' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (608, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 21:25:28.013' AS DateTime), CAST(N'2017-09-11 21:25:28.020' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (609, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 21:33:42.203' AS DateTime), CAST(N'2017-09-11 21:33:42.217' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (610, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 21:40:52.720' AS DateTime), CAST(N'2017-09-11 21:40:52.737' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (611, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 21:49:08.003' AS DateTime), CAST(N'2017-09-11 21:49:08.010' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (612, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 21:54:31.313' AS DateTime), CAST(N'2017-09-11 21:54:31.317' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (613, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 21:57:28.270' AS DateTime), CAST(N'2017-09-11 21:57:28.270' AS DateTime), NULL, NULL, 1, N'::1', N'pag_HorarioTrabajo', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (614, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 21:59:11.577' AS DateTime), CAST(N'2017-09-11 21:59:11.577' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Cita', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (615, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 22:43:39.850' AS DateTime), CAST(N'2017-09-11 22:43:39.857' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (616, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 22:46:47.117' AS DateTime), CAST(N'2017-09-11 22:46:47.123' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (617, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:06:13.350' AS DateTime), CAST(N'2017-09-11 23:06:13.357' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (618, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:06:39.383' AS DateTime), CAST(N'2017-09-11 23:06:39.387' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (619, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:06:43.163' AS DateTime), CAST(N'2017-09-11 23:06:43.163' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (620, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:06:47.897' AS DateTime), CAST(N'2017-09-11 23:06:47.900' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (621, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:07:09.690' AS DateTime), CAST(N'2017-09-11 23:07:09.690' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (622, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:07:14.170' AS DateTime), CAST(N'2017-09-11 23:07:14.170' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (623, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:07:17.553' AS DateTime), CAST(N'2017-09-11 23:07:17.553' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (624, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:07:20.767' AS DateTime), CAST(N'2017-09-11 23:07:20.770' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (625, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:07:23.233' AS DateTime), CAST(N'2017-09-11 23:07:23.233' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (626, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:07:25.870' AS DateTime), CAST(N'2017-09-11 23:07:25.870' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (627, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:07:29.480' AS DateTime), CAST(N'2017-09-11 23:07:29.480' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (628, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:07:34.963' AS DateTime), CAST(N'2017-09-11 23:07:34.963' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (629, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:20:25.360' AS DateTime), CAST(N'2017-09-11 23:20:25.363' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (630, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:22:31.617' AS DateTime), CAST(N'2017-09-11 23:22:31.627' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (631, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:22:51.013' AS DateTime), CAST(N'2017-09-11 23:22:51.013' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (632, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:23:43.463' AS DateTime), CAST(N'2017-09-11 23:23:43.467' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (633, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:23:49.577' AS DateTime), CAST(N'2017-09-11 23:23:49.577' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (634, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:23:55.387' AS DateTime), CAST(N'2017-09-11 23:23:55.387' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (635, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:24:08.373' AS DateTime), CAST(N'2017-09-11 23:24:08.377' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (636, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:25:31.307' AS DateTime), CAST(N'2017-09-11 23:25:31.307' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (637, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:27:48.313' AS DateTime), CAST(N'2017-09-11 23:27:48.313' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (638, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:30:22.547' AS DateTime), CAST(N'2017-09-11 23:30:22.547' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (639, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:30:54.617' AS DateTime), CAST(N'2017-09-11 23:30:54.617' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (640, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-11 23:31:10.593' AS DateTime), CAST(N'2017-09-11 23:31:10.593' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (641, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-12 16:03:08.723' AS DateTime), CAST(N'2017-09-12 16:03:08.770' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (642, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-13 22:00:20.080' AS DateTime), CAST(N'2017-09-13 22:00:20.197' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (643, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-13 22:18:49.043' AS DateTime), CAST(N'2017-09-13 22:18:49.047' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (644, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-14 21:43:25.997' AS DateTime), CAST(N'2017-09-14 21:43:26.033' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (645, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-14 21:55:08.270' AS DateTime), CAST(N'2017-09-14 21:55:08.273' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (646, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-14 23:54:49.573' AS DateTime), CAST(N'2017-09-14 23:54:49.593' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (647, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-14 23:55:24.000' AS DateTime), CAST(N'2017-09-14 23:55:24.000' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (648, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-14 23:55:29.083' AS DateTime), CAST(N'2017-09-14 23:55:29.083' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (649, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-14 23:56:06.557' AS DateTime), CAST(N'2017-09-14 23:56:06.557' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (650, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-14 23:59:42.610' AS DateTime), CAST(N'2017-09-14 23:59:42.617' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (651, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:00:39.270' AS DateTime), CAST(N'2017-09-15 00:00:39.270' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (652, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:06:45.493' AS DateTime), CAST(N'2017-09-15 00:06:45.507' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (653, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:07:12.030' AS DateTime), CAST(N'2017-09-15 00:07:12.033' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (654, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:07:33.337' AS DateTime), CAST(N'2017-09-15 00:07:33.337' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (655, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:07:38.740' AS DateTime), CAST(N'2017-09-15 00:07:38.740' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (656, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:07:53.133' AS DateTime), CAST(N'2017-09-15 00:07:53.133' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (657, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:08:18.220' AS DateTime), CAST(N'2017-09-15 00:08:18.220' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (658, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:08:25.233' AS DateTime), CAST(N'2017-09-15 00:08:25.233' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (659, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:08:42.183' AS DateTime), CAST(N'2017-09-15 00:08:42.183' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (660, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:08:55.530' AS DateTime), CAST(N'2017-09-15 00:08:55.530' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (661, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:09:15.633' AS DateTime), CAST(N'2017-09-15 00:09:15.633' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (662, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:09:38.083' AS DateTime), CAST(N'2017-09-15 00:09:38.083' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (663, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:09:48.037' AS DateTime), CAST(N'2017-09-15 00:09:48.037' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (664, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:09:54.273' AS DateTime), CAST(N'2017-09-15 00:09:54.273' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (665, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:10:17.583' AS DateTime), CAST(N'2017-09-15 00:10:17.583' AS DateTime), NULL, NULL, 1, N'192.168.1.18', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (666, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:12:14.673' AS DateTime), CAST(N'2017-09-15 00:12:14.677' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (667, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:14:20.520' AS DateTime), CAST(N'2017-09-15 00:14:20.527' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (668, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:17:07.687' AS DateTime), CAST(N'2017-09-15 00:17:07.690' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (669, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 00:20:16.790' AS DateTime), CAST(N'2017-09-15 00:20:16.797' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (670, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 08:23:02.837' AS DateTime), CAST(N'2017-09-15 08:23:02.840' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (671, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 08:33:31.933' AS DateTime), CAST(N'2017-09-15 08:33:31.983' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (672, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 08:36:06.847' AS DateTime), CAST(N'2017-09-15 08:36:06.847' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (673, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-15 08:37:38.037' AS DateTime), CAST(N'2017-09-15 08:37:38.037' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (674, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-17 15:07:48.293' AS DateTime), CAST(N'2017-09-17 15:07:48.300' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (675, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-17 15:14:58.027' AS DateTime), CAST(N'2017-09-17 15:14:58.050' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (676, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-17 16:27:54.340' AS DateTime), CAST(N'2017-09-17 16:27:54.343' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (677, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-17 16:56:31.903' AS DateTime), CAST(N'2017-09-17 16:56:31.920' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (678, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-17 16:57:59.680' AS DateTime), CAST(N'2017-09-17 16:57:59.683' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (679, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-17 17:00:37.803' AS DateTime), CAST(N'2017-09-17 17:00:37.813' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (680, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-17 20:54:42.583' AS DateTime), CAST(N'2017-09-17 20:54:42.590' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (681, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-17 21:06:06.353' AS DateTime), CAST(N'2017-09-17 21:06:06.377' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (682, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-17 21:08:31.490' AS DateTime), CAST(N'2017-09-17 21:08:31.493' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (683, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-17 21:14:14.133' AS DateTime), CAST(N'2017-09-17 21:14:14.143' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (684, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-17 21:40:03.547' AS DateTime), CAST(N'2017-09-17 21:40:03.547' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (685, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-17 21:42:55.463' AS DateTime), CAST(N'2017-09-17 21:42:55.467' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (686, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-18 18:08:07.700' AS DateTime), CAST(N'2017-09-18 18:08:07.750' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (687, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-19 18:56:16.420' AS DateTime), CAST(N'2017-09-19 18:56:16.463' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (688, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-19 19:24:10.923' AS DateTime), CAST(N'2017-09-19 19:24:10.923' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (689, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-19 20:23:57.230' AS DateTime), CAST(N'2017-09-19 20:23:57.243' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (690, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-19 21:03:55.960' AS DateTime), CAST(N'2017-09-19 21:03:55.967' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (691, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-19 21:20:56.287' AS DateTime), CAST(N'2017-09-19 21:20:56.290' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (692, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-19 22:11:02.303' AS DateTime), CAST(N'2017-09-19 22:11:02.447' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (693, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-19 22:18:24.750' AS DateTime), CAST(N'2017-09-19 22:18:24.757' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (694, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-19 23:06:42.970' AS DateTime), CAST(N'2017-09-19 23:06:42.980' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (695, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-20 08:37:55.397' AS DateTime), CAST(N'2017-09-20 08:37:55.447' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (696, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-20 08:55:18.000' AS DateTime), CAST(N'2017-09-20 08:55:18.030' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (697, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-20 09:00:10.897' AS DateTime), CAST(N'2017-09-20 09:00:10.900' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (698, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-20 09:08:43.273' AS DateTime), CAST(N'2017-09-20 09:08:43.280' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (699, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-20 09:46:34.280' AS DateTime), CAST(N'2017-09-20 09:46:34.283' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (700, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-20 10:03:07.293' AS DateTime), CAST(N'2017-09-20 10:03:07.297' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
GO
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (701, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-22 09:32:40.793' AS DateTime), CAST(N'2017-09-22 09:32:40.793' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (702, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-22 10:00:38.413' AS DateTime), CAST(N'2017-09-22 10:00:38.417' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (703, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-22 10:24:35.710' AS DateTime), CAST(N'2017-09-22 10:24:35.740' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (704, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-22 10:42:06.640' AS DateTime), CAST(N'2017-09-22 10:42:06.643' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (705, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-24 13:53:18.573' AS DateTime), CAST(N'2017-09-24 13:53:18.573' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (706, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-24 17:31:32.263' AS DateTime), CAST(N'2017-09-24 17:31:32.287' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (707, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-24 18:45:20.763' AS DateTime), CAST(N'2017-09-24 18:45:20.767' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (708, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-25 09:22:06.897' AS DateTime), CAST(N'2017-09-25 09:22:06.933' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (709, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-26 14:36:17.097' AS DateTime), CAST(N'2017-09-26 14:36:17.100' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (710, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-26 14:53:27.507' AS DateTime), CAST(N'2017-09-26 14:53:27.513' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (711, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-26 16:02:00.700' AS DateTime), CAST(N'2017-09-26 16:02:00.703' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (712, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-26 16:07:33.953' AS DateTime), CAST(N'2017-09-26 16:07:33.960' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (713, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-26 19:41:37.353' AS DateTime), CAST(N'2017-09-26 19:41:37.397' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (714, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-26 19:50:51.047' AS DateTime), CAST(N'2017-09-26 19:50:51.053' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (715, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-26 20:12:08.417' AS DateTime), CAST(N'2017-09-26 20:12:08.417' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (716, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-26 21:20:35.077' AS DateTime), CAST(N'2017-09-26 21:20:35.080' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (717, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-26 21:21:02.073' AS DateTime), CAST(N'2017-09-26 21:21:02.073' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (718, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-26 21:21:14.430' AS DateTime), CAST(N'2017-09-26 21:21:14.430' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (719, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-26 21:26:17.780' AS DateTime), CAST(N'2017-09-26 21:26:17.787' AS DateTime), NULL, NULL, 1, N'::1', N'Login', NULL, N'Iniciar_Sesion', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (720, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-26 21:27:11.327' AS DateTime), CAST(N'2017-09-26 21:27:11.327' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Editar', NULL, 0)
INSERT [dbo].[Auditoria] ([AudiSecuencia], [PaisSecuencia], [ClinSecuencia], [ConsSecuencia], [DoctSecuencia], [PersSecuencia], [TPersSecuencia], [AudiFechaMaquina], [AudiFechaServidor], [AudiValorOriginal], [AudiValorNuevo], [UsuaCodigo], [AudiIpMaquina], [PagiSecuencia], [TablSecuencia], [Accion], [DescripcionError], [EstaDesabilitado]) VALUES (721, 1, 1, 1, 1, 0, NULL, CAST(N'2017-09-26 21:28:03.893' AS DateTime), CAST(N'2017-09-26 21:28:03.893' AS DateTime), NULL, NULL, 1, N'::1', N'pag_Receta', NULL, N'Nuevo', NULL, 0)
INSERT [dbo].[CategoriaPersonal] ([DoctSecuencia_fk], [CPersSecuencia], [CPersNombre], [UsuaSecuencia], [CPersFechaCreacion], [UsuaSecuenciaModificacion], [CPersFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, N'Secretaria', 1, CAST(N'2017-04-03 08:10:14.173' AS DateTime), 1, CAST(N'2017-06-15 14:26:03.507' AS DateTime), 0)
INSERT [dbo].[CategoriaPersonal] ([DoctSecuencia_fk], [CPersSecuencia], [CPersNombre], [UsuaSecuencia], [CPersFechaCreacion], [UsuaSecuenciaModificacion], [CPersFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, N'Secretaria', 2, CAST(N'2017-04-03 11:18:26.397' AS DateTime), NULL, CAST(N'2017-04-03 11:18:26.397' AS DateTime), 0)
INSERT [dbo].[CategoriaPersonal] ([DoctSecuencia_fk], [CPersSecuencia], [CPersNombre], [UsuaSecuencia], [CPersFechaCreacion], [UsuaSecuenciaModificacion], [CPersFechaModificacion], [EstaDesabilitado]) VALUES (3, 1, N'Secretaria', 3, CAST(N'2017-02-12 12:01:41.787' AS DateTime), 3, CAST(N'2017-02-12 13:49:44.427' AS DateTime), 0)
INSERT [dbo].[CategoriaPersonal] ([DoctSecuencia_fk], [CPersSecuencia], [CPersNombre], [UsuaSecuencia], [CPersFechaCreacion], [UsuaSecuenciaModificacion], [CPersFechaModificacion], [EstaDesabilitado]) VALUES (3, 2, N'Doctor Suplente', 3, CAST(N'2017-02-12 12:01:50.747' AS DateTime), 3, CAST(N'2017-02-12 13:31:41.637' AS DateTime), 0)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 1, 1, N'steds', CAST(N'2017-08-18 10:00:00.000' AS DateTime), NULL, CAST(N'2017-08-18 10:30:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-08-17 09:57:41.703' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 3, 2, N'sssss', CAST(N'2017-08-18 11:00:00.000' AS DateTime), NULL, CAST(N'2017-08-18 13:10:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-08-17 09:58:20.720' AS DateTime), NULL, CAST(N'2017-08-17 20:14:28.230' AS DateTime), 1, 1, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 56, 8, N'sdfsdf', CAST(N'2017-09-03 11:10:00.000' AS DateTime), NULL, CAST(N'2017-09-03 15:10:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-08-29 15:00:09.013' AS DateTime), NULL, CAST(N'2017-09-03 10:14:06.280' AS DateTime), 1, 1, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 57, 9, N'CIRUJIA', CAST(N'2017-09-03 19:30:00.000' AS DateTime), NULL, CAST(N'2017-09-03 19:45:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-09-03 10:17:03.743' AS DateTime), NULL, CAST(N'2017-09-03 10:18:17.343' AS DateTime), 1, 1, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 58, 6, N'consulat', CAST(N'2017-09-03 20:00:00.000' AS DateTime), NULL, CAST(N'2017-09-03 20:15:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', N'comentario', 0, NULL, 1, CAST(N'2017-09-03 11:06:17.540' AS DateTime), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 59, 10, N'sdfsdf MODIFI', CAST(N'2017-09-03 20:30:00.000' AS DateTime), NULL, CAST(N'2017-09-03 23:20:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-09-03 18:10:04.947' AS DateTime), NULL, CAST(N'2017-09-03 18:11:43.420' AS DateTime), 1, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 60, 11, N'dfgdfg', CAST(N'2017-09-06 15:30:00.000' AS DateTime), NULL, CAST(N'2017-09-13 16:00:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-09-06 13:40:35.627' AS DateTime), NULL, CAST(N'2017-09-06 13:46:30.417' AS DateTime), 1, 1, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 61, 11, N'grest', CAST(N'2017-09-06 15:00:00.000' AS DateTime), NULL, CAST(N'2017-09-06 15:30:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-09-06 14:10:07.810' AS DateTime), NULL, CAST(N'2017-09-06 14:23:02.610' AS DateTime), 1, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 62, 12, N'sdfsdf modif23', CAST(N'2017-09-07 14:00:00.000' AS DateTime), NULL, CAST(N'2017-09-07 18:30:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-09-06 18:58:07.170' AS DateTime), NULL, CAST(N'2017-09-07 13:26:04.093' AS DateTime), 1, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 63, 13, N'adfsdfs modif2', CAST(N'2017-09-07 14:30:00.000' AS DateTime), NULL, CAST(N'2017-09-07 20:00:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', N'modifica', 0, NULL, 1, CAST(N'2017-09-07 11:17:15.067' AS DateTime), NULL, CAST(N'2017-09-07 11:20:27.933' AS DateTime), 1, 1, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 64, 13, N'sdfasdf', CAST(N'2017-09-07 13:50:00.000' AS DateTime), NULL, CAST(N'2017-09-07 17:40:59.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-09-07 13:21:04.493' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 65, 13, N'sdfadf', CAST(N'2017-09-08 15:30:00.000' AS DateTime), NULL, CAST(N'2017-09-08 15:45:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-09-07 15:48:49.933' AS DateTime), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 66, 14, N'TRADAD', CAST(N'2017-09-08 16:00:00.000' AS DateTime), NULL, CAST(N'2017-09-08 16:15:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-09-07 16:05:52.293' AS DateTime), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 67, 15, N'sdfadsfsd', CAST(N'2017-09-08 07:00:00.000' AS DateTime), NULL, CAST(N'2017-09-08 07:15:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-09-07 17:28:37.310' AS DateTime), NULL, CAST(N'2017-09-07 17:50:56.370' AS DateTime), 1, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 68, 16, N'sdfas', CAST(N'2017-09-08 07:24:00.000' AS DateTime), NULL, CAST(N'2017-09-08 07:30:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-09-07 17:30:21.143' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 70, 17, N'trada', CAST(N'2017-09-08 07:30:00.000' AS DateTime), NULL, CAST(N'2017-09-08 07:45:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-09-07 17:48:42.717' AS DateTime), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 73, 20, N'trda', CAST(N'2017-09-25 07:15:00.000' AS DateTime), NULL, CAST(N'2017-09-25 07:30:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-09-24 18:25:34.107' AS DateTime), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 1, 74, 21, N'trdad', CAST(N'2017-10-26 07:30:00.000' AS DateTime), NULL, CAST(N'2017-10-26 07:45:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-10-25 18:30:53.360' AS DateTime), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 2, 2, 3, N'fdsefd', CAST(N'2017-08-18 11:00:00.000' AS DateTime), NULL, CAST(N'2017-08-18 11:30:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-08-17 09:58:01.633' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 2, 10, 5, N'dfgdfgn', CAST(N'2017-08-18 13:30:00.000' AS DateTime), NULL, CAST(N'2017-08-18 14:20:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-08-17 12:55:29.513' AS DateTime), NULL, CAST(N'2017-08-17 20:13:54.100' AS DateTime), 1, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 2, 23, 6, N'nuevao Modificado', CAST(N'2017-08-18 14:30:00.000' AS DateTime), NULL, CAST(N'2017-08-18 22:20:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', N'modificado', 0, NULL, 1, CAST(N'2017-08-17 14:45:44.660' AS DateTime), NULL, CAST(N'2017-08-17 15:29:12.457' AS DateTime), 1, 1, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 2, 50, 4, N'neuvo', CAST(N'2017-08-18 12:30:00.000' AS DateTime), NULL, CAST(N'2017-08-18 13:00:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-08-17 12:53:30.890' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 2, 51, 6, N'Modificacion285', CAST(N'2017-08-20 20:30:00.000' AS DateTime), NULL, CAST(N'2017-08-20 22:30:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', N'modif', 0, NULL, 1, CAST(N'2017-08-17 15:47:17.523' AS DateTime), NULL, CAST(N'2017-08-17 21:39:27.043' AS DateTime), 1, 1, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 2, 52, 7, N'prued', CAST(N'2017-08-17 16:10:00.000' AS DateTime), NULL, CAST(N'2017-08-17 20:20:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-08-17 16:07:10.170' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 2, 53, 6, N'cita Michael', CAST(N'2017-08-20 09:30:00.000' AS DateTime), NULL, CAST(N'2017-08-20 10:00:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-08-20 08:17:59.267' AS DateTime), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 2, 54, 3, N'modifCreado', CAST(N'2017-08-20 11:00:00.000' AS DateTime), NULL, CAST(N'2017-08-20 12:40:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-08-20 08:18:44.460' AS DateTime), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 2, 55, 7, N'dfsdf', CAST(N'2017-08-20 15:00:00.000' AS DateTime), NULL, CAST(N'2017-08-20 15:30:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-08-20 14:34:06.707' AS DateTime), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 2, 69, 16, N'grad', CAST(N'2017-09-08 07:15:00.000' AS DateTime), NULL, CAST(N'2017-09-08 07:30:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-09-07 17:47:27.933' AS DateTime), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 2, 71, 18, N'maria', CAST(N'2017-09-08 07:45:00.000' AS DateTime), NULL, CAST(N'2017-09-08 08:00:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-09-07 17:49:40.233' AS DateTime), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 2, 72, 19, N'tread mod', CAST(N'2017-09-11 11:30:00.000' AS DateTime), NULL, CAST(N'2017-09-11 13:00:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-09-10 16:56:22.660' AS DateTime), NULL, CAST(N'2017-09-10 16:56:59.253' AS DateTime), 1, 0, NULL)
INSERT [dbo].[Cita] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CitaSecuencia], [ProgramId], [ProgramName], [ProgramStartTime], [ProgramStartOnlyTime], [ProgramEndTime], [ProgramEndOlyTime], [IsAllDay], [IsRecurrence], [RecurrenceRule], [StartTimeZone], [EndTimeZone], [Comments], [CitaCancelada], [CitaCancelacionMotivo], [UsuaSecuenciaCreacion], [CitaFechaCreacion], [CMHistHora], [UsuaFechaModificacion], [UsuaSecuenciaModificacion], [EstaDesabilitado], [EstadoCita]) VALUES (1, 1, 1, 1, 2, 75, 22, N'sdfasd', CAST(N'2017-09-12 00:00:00.000' AS DateTime), NULL, CAST(N'2017-09-12 00:15:00.000' AS DateTime), NULL, 0, 0, NULL, N'UTC -04:00', N'UTC -04:00', NULL, 0, NULL, 1, CAST(N'2017-09-11 21:59:11.573' AS DateTime), NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Clinica] ([clinSecuencia], [PaisSecuencia_fk], [clinRazonSocial], [clinEstablecimiento], [clinOrganismoSuperior], [clinDireccion], [clinTelefono], [clinTelefono2], [clinRNC], [clinFax], [clinPaginaWeb], [clinEmail], [clinFotoName], [clinFotoPath], [clinCuerpoCartaCabecera], [clinCuerpoCartaPie], [clinLatitud], [clinLongitud], [clinEstaBorrado], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [clinFechaCreacion], [clinFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, N'Abel Gonzales', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[ConsultaMedica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMediSecuencia], [CMediFecha], [CMediHora], [EnfeComentario], [CMedEmbarazada], [CMedEmbarazadaFecha], [CMedEmbarazadaSemanas], [CMedEmbarazadaDias], [CMedEmbarazadaMeses], [CMedEmbarazadaFechaProbableParto], [CMediUnidadesMedidaTalla], [CMediTalla], [CMediUnidadesMedidaPeso], [CMediPeso], [CMediAntecedentePadre], [CMediAntecedenteMadre], [CMediAntecedenteHermanos], [CMediAntecedenteOtros], [CMediMenarquia], [CMediPatronMenstrual], [CMediMensutracionDuracion], [CMediDismenorrea], [CMediPrimerCoito], [CMediDispareunia], [CMediVidaSexualActiva], [CMediNumeroParejasSexual], [CMediFechaUltimoParto], [CMediFechaUltimoAborto], [CMediFechaUltimaMenstruacion], [CMediMenopausia], [CMediGestacionVeces], [CMediPartosVeces], [CMediAbortosVeces], [CMediCesariasVeces], [CMediEctopico], [CMediTensionArterial], [CMediFrecuenciaCardiaca], [CMediTiroides], [CMediPulmones], [CMediCorazon], [CMediMamas], [CMediAbdomen], [CMediGenitalesExternos], [CMediTactoVaginal], [CMediExtremidadesInferiores], [CMediFechaUltimoPapanicolau], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, CAST(N'2017-07-19 23:42:26.263' AS DateTime), CAST(N'23:42:26.2629437' AS Time), N'enfermedad:', 1, CAST(N'2017-06-28 00:00:00.000' AS DateTime), 3, 22, 0, CAST(N'2018-04-04 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Menor de 9', N'Regular', NULL, 0, 45, 0, 1, 2, CAST(N'2017-06-08 00:00:00.000' AS DateTime), CAST(N'2017-06-28 00:00:00.000' AS DateTime), CAST(N'2017-06-27 00:00:00.000' AS DateTime), 8, 3, 3, 3, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-06-26 00:00:00.000' AS DateTime), 1, CAST(N'2017-07-20 13:27:29.183' AS DateTime), 1, CAST(N'2017-08-07 19:14:53.357' AS DateTime), 0)
INSERT [dbo].[ConsultaMedicaEmbarazo] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [CMEmbEmbarazada], [CMEmbEmbarazadaFecha], [CMEmbEmbarazadaSemanas], [CMEmbEmbarazadaDias], [CMEmbEmbarazadaMeses], [CMEmbEmbarazadaFechaProbableParto]) VALUES (1, 1, 1, 1, 1, 1, 1, CAST(N'2017-06-28 00:00:00.000' AS DateTime), 3, 21, 0, CAST(N'2018-04-04 00:00:00.000' AS DateTime))
INSERT [dbo].[ConsultaMedicaEmbarazo] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [CMEmbEmbarazada], [CMEmbEmbarazadaFecha], [CMEmbEmbarazadaSemanas], [CMEmbEmbarazadaDias], [CMEmbEmbarazadaMeses], [CMEmbEmbarazadaFechaProbableParto]) VALUES (1, 1, 1, 1, 1, 2, 1, CAST(N'2017-06-28 00:00:00.000' AS DateTime), 3, 22, 0, CAST(N'2018-04-04 00:00:00.000' AS DateTime))
INSERT [dbo].[ConsultaMedicaEmbarazo] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [CMEmbEmbarazada], [CMEmbEmbarazadaFecha], [CMEmbEmbarazadaSemanas], [CMEmbEmbarazadaDias], [CMEmbEmbarazadaMeses], [CMEmbEmbarazadaFechaProbableParto]) VALUES (1, 1, 1, 1, 1, 3, 1, CAST(N'2017-06-28 00:00:00.000' AS DateTime), 3, 22, 0, CAST(N'2018-04-04 00:00:00.000' AS DateTime))
INSERT [dbo].[ConsultaMedicaEnfermeda] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMediSecuencia_fk], [EnfeSecuencia_fk], [EnfeComentario], [EnfermedadActiva], [FechaDeDiagnostico], [EnfermedadInfecciosa], [EdadMomentoDiagnosticado]) VALUES (1, 1, 1, 1, 1, 1, 1, NULL, 0, NULL, 0, NULL)
INSERT [dbo].[ConsultaMedicaEnfermedaFamiliar] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMediSecuencia_fk], [EnfeSecuencia_fk], [Familiar], [EnfeComentario], [EnfermedadActiva], [FechaDeDiagnostico], [EnfermedadInfecciosa], [EdadMomentoDiagnosticado]) VALUES (1, 1, 1, 1, 1, 1, 1, NULL, N'Madre enfermedad:

Padre enfermedad:

Madre enfermedad:DFDFSFDISDF SDFSIEJSF', 0, NULL, 0, NULL)
INSERT [dbo].[ConsultaMedicaHistorial] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia], [TratComentario], [MotiComentario], [EFisiComentario], [DiagComentario], [CMHistFechaUltimaRegla], [CMHistIndiceMasaCorporal], [CMHistUnidadesMedidaPeso], [CMHistPeso], [CMHistUnidadesMedidaTalla], [CMHistTalla], [CMHistCodigo], [CMHistFecha], [CMHistHora], [CMHistComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, N'Tratamiento:', N'motivo consulta:', N'Evaluacion fisica:', N'Diagnostico:', NULL, NULL, N'Lbs', NULL, N'pie(s)', NULL, N'C-001000001', CAST(N'2017-07-19 23:42:26.113' AS DateTime), CAST(N'23:42:26.1115883' AS Time), NULL, 1, CAST(N'2017-07-19 23:42:26.110' AS DateTime), 1, CAST(N'2017-07-20 09:42:35.817' AS DateTime), 0)
INSERT [dbo].[ConsultaMedicaHistorial] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia], [TratComentario], [MotiComentario], [EFisiComentario], [DiagComentario], [CMHistFechaUltimaRegla], [CMHistIndiceMasaCorporal], [CMHistUnidadesMedidaPeso], [CMHistPeso], [CMHistUnidadesMedidaTalla], [CMHistTalla], [CMHistCodigo], [CMHistFecha], [CMHistHora], [CMHistComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, N'Tratamiento:', N'motivo consulta:', N'Evaluacion fisica:', N'Diagnostico:', NULL, NULL, N'Lbs', NULL, N'pie(s)', NULL, N'C-001000002', CAST(N'2017-07-20 12:56:53.550' AS DateTime), CAST(N'12:56:53.5493198' AS Time), NULL, 1, CAST(N'2017-07-20 12:56:53.550' AS DateTime), 1, CAST(N'2017-07-20 12:57:22.150' AS DateTime), 0)
INSERT [dbo].[ConsultaMedicaHistorial] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia], [TratComentario], [MotiComentario], [EFisiComentario], [DiagComentario], [CMHistFechaUltimaRegla], [CMHistIndiceMasaCorporal], [CMHistUnidadesMedidaPeso], [CMHistPeso], [CMHistUnidadesMedidaTalla], [CMHistTalla], [CMHistCodigo], [CMHistFecha], [CMHistHora], [CMHistComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, N'Tratamiento:', N'motivo consulta:

Motivo consulta 2:

GRIPE:DFEFDSFDSEFS', N'Evaluacion fisica:

GRANO GRANDE:DFIEFDSDFS', N'Diagnostico:', NULL, NULL, N'Lbs', NULL, N'pie(s)', NULL, N'C-001000003', CAST(N'2017-07-20 13:27:29.003' AS DateTime), CAST(N'13:27:29.0026751' AS Time), NULL, 1, CAST(N'2017-07-20 13:27:29.003' AS DateTime), 1, CAST(N'2017-08-07 19:14:53.187' AS DateTime), 0)
INSERT [dbo].[ConsultaMedicaHistorialDiagnostico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [DiagSecuencia], [DiagComentario], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, 1, NULL, 0)
INSERT [dbo].[ConsultaMedicaHistorialDiagnostico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [DiagSecuencia], [DiagComentario], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, 1, NULL, 0)
INSERT [dbo].[ConsultaMedicaHistorialDiagnostico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [DiagSecuencia], [DiagComentario], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, 1, NULL, 0)
INSERT [dbo].[ConsultaMedicaHistorialEvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [EFisiComentario], [EFisiSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, NULL, 1, 0)
INSERT [dbo].[ConsultaMedicaHistorialEvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [EFisiComentario], [EFisiSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, NULL, 1, 0)
INSERT [dbo].[ConsultaMedicaHistorialEvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [EFisiComentario], [EFisiSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, NULL, 1, 0)
INSERT [dbo].[ConsultaMedicaHistorialEvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [EFisiComentario], [EFisiSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, NULL, 2, 0)
INSERT [dbo].[ConsultaMedicaHistorialMotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [MotiComentario], [MConsSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, NULL, 1, 0)
INSERT [dbo].[ConsultaMedicaHistorialMotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [MotiComentario], [MConsSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, NULL, 1, 0)
INSERT [dbo].[ConsultaMedicaHistorialMotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [MotiComentario], [MConsSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, NULL, 1, 0)
INSERT [dbo].[ConsultaMedicaHistorialMotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [MotiComentario], [MConsSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, NULL, 2, 0)
INSERT [dbo].[ConsultaMedicaHistorialMotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [MotiComentario], [MConsSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, NULL, 3, 0)
INSERT [dbo].[ConsultaMedicaHistorialTratamiento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [TratComentario], [TratSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, NULL, 1, 0)
INSERT [dbo].[ConsultaMedicaHistorialTratamiento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [TratComentario], [TratSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, NULL, 1, 0)
INSERT [dbo].[ConsultaMedicaHistorialTratamiento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [TratComentario], [TratSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, NULL, 1, 0)
INSERT [dbo].[Consultorio] ([DoctSecuencia_fk], [ConsSecuencia], [ClinSecuencia_fk], [PaisSecuencia_fk], [ConsCodigo], [ConsDescripcion], [ConsDireccion], [ConsTelefono], [ConsExtencion], [ConsTelefono2], [ConsExtension2], [UsuaSecuenciaCreacion], [ConsFechaCreacion], [UsuaSecuenciaModificacion], [ConsFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, N'Segundo Nivel', N'Abel Gonzales Edificio Prof.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Consultorio] ([DoctSecuencia_fk], [ConsSecuencia], [ClinSecuencia_fk], [PaisSecuencia_fk], [ConsCodigo], [ConsDescripcion], [ConsDireccion], [ConsTelefono], [ConsExtencion], [ConsTelefono2], [ConsExtension2], [UsuaSecuenciaCreacion], [ConsFechaCreacion], [UsuaSecuenciaModificacion], [ConsFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, N'Primer Nivel', N'Abel Gonzales Edificio Prof.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Diagnostico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DiagSecuencia], [DiagCodigo], [DiagNombre], [DiagDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, NULL, N'Diagnostico', NULL, 0)
INSERT [dbo].[Diagnostico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DiagSecuencia], [DiagCodigo], [DiagNombre], [DiagDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 1, NULL, N'PROCESO PELVICO INFLAMATORIO', NULL, 0)
INSERT [dbo].[DiasSemana] ([DSemaSecuencia], [DSemaNombre]) VALUES (1, N'Domingo')
INSERT [dbo].[DiasSemana] ([DSemaSecuencia], [DSemaNombre]) VALUES (2, N'Lunes')
INSERT [dbo].[DiasSemana] ([DSemaSecuencia], [DSemaNombre]) VALUES (3, N'Martes')
INSERT [dbo].[DiasSemana] ([DSemaSecuencia], [DSemaNombre]) VALUES (4, N'Miercoles')
INSERT [dbo].[DiasSemana] ([DSemaSecuencia], [DSemaNombre]) VALUES (5, N'Jueves')
INSERT [dbo].[DiasSemana] ([DSemaSecuencia], [DSemaNombre]) VALUES (6, N'Viernes')
INSERT [dbo].[DiasSemana] ([DSemaSecuencia], [DSemaNombre]) VALUES (7, N'Sábado')
INSERT [dbo].[Doctor] ([DoctSecuencia], [UsuSecuencia], [DoctCUPRE], [DoctDocumento], [TDSecuencia], [DoctNombre], [DoctApellido], [DoctFechaNacimiento], [EspeSecuencia], [DoctDireccion], [DoctTelefono], [DoctCelular], [UsuaSecuenciaCreacion], [DoctFechaCreacion], [UsuaSecuenciaModificacion], [DoctFechaModificacion], [DoctGenero], [PaisSecuencia], [DoctFotoPath], [DoctFotoNombre], [EstaDesabilitado], [NombreDoctoRecetaEncab]) VALUES (1, 1, NULL, NULL, NULL, N'Admin', N'Admin', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 0, NULL)
INSERT [dbo].[Doctor] ([DoctSecuencia], [UsuSecuencia], [DoctCUPRE], [DoctDocumento], [TDSecuencia], [DoctNombre], [DoctApellido], [DoctFechaNacimiento], [EspeSecuencia], [DoctDireccion], [DoctTelefono], [DoctCelular], [UsuaSecuenciaCreacion], [DoctFechaCreacion], [UsuaSecuenciaModificacion], [DoctFechaModificacion], [DoctGenero], [PaisSecuencia], [DoctFotoPath], [DoctFotoNombre], [EstaDesabilitado], [NombreDoctoRecetaEncab]) VALUES (2, 2, NULL, N'00111792842', 1, N'Melba', N'Infante Brito', CAST(N'1969-06-02 00:00:00.000' AS DateTime), 1, N'clinica dr abel gonzalez', N'(809) 687-6232', N'(809) 350-2757', NULL, NULL, 2, CAST(N'2017-07-18 22:27:06.153' AS DateTime), N'Femenino', 1, NULL, NULL, 0, NULL)
INSERT [dbo].[Enfermedad] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EnfeSecuencia], [EnfeNombre], [EnfeDescripcion]) VALUES (1, 1, 1, 1, 1, N'enfermedad', NULL)
INSERT [dbo].[Enfermedad] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EnfeSecuencia], [EnfeNombre], [EnfeDescripcion]) VALUES (2, 1, 1, 1, 1, N'HTA', NULL)
INSERT [dbo].[Enfermedad] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EnfeSecuencia], [EnfeNombre], [EnfeDescripcion]) VALUES (2, 1, 1, 1, 2, N'NINGUNA', NULL)
INSERT [dbo].[Especialidades] ([EspeSecuencia], [EspeNombre], [EstaDesabilitado]) VALUES (1, N'Ginecología', 0)
INSERT [dbo].[Especialidades] ([EspeSecuencia], [EspeNombre], [EstaDesabilitado]) VALUES (2, N'Cardiología', 0)
INSERT [dbo].[Especialidades] ([EspeSecuencia], [EspeNombre], [EstaDesabilitado]) VALUES (3, N'Endocrinologia', 0)
INSERT [dbo].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, N'Evaluacion fisica', NULL, 0)
INSERT [dbo].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, N'GRANO GRANDE', NULL, 0)
INSERT [dbo].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia], [EFisiCodigoNombre], [EFisiDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 1, N'DOLOR AL TACTO VAGINAL', NULL, 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (1, N'pag_Consulta', 1, N'Consulta', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (2, N'pag_Paciente', 1, N'Paciente', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (3, N'pag_Personal', 1, N'Personal', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (4, N'pag_Cita', 1, N'Cita', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (5, N'pag_Agenda', 1, N'Agenda', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (6, N'pag_FacturacionMenu', 1, N'FacturacionMenu', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (7, N'pag_Facturacion', 1, N'Facturacion', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (8, N'pag_Caja', 1, N'Caja', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (9, N'pag_MantenimientoMenu', 1, N'MantenimientoMenu', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (10, N'pag_Diagnosticos', 1, N'Diagnosticos', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (11, N'pag_TipoDiagnosticos', 2, N'TipoDiagnosticos', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (13, N'pag_Procedimientos', 1, N'Procedimientos', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (14, N'Mantenimiento_pag_Consultorio', 1, N'Mantenimiento_pag_Consultorio', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (15, N'pag_ConfiguracionMenu', 1, N'ConfiguracionMenu', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (16, N'Configuracion_pag_Consultorio', 1, N'Configuracion Consultorio', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (17, N'pag_Doctor', 1, N'Doctor', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (18, N'Ini_TipoFormulario', 1, N'TipoFormulario', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (19, N'PruebaAngular', 1, N'PruebaAngular', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (20, N'pag_HorarioTrabajo', 1, N'HorarioTrabajo', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (21, N'pag_InstitucionesAseguradoras', 1, N'InstitucionesAseguradoras', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (22, N'pag_SeguridadMenu', 2, N'SeguridadMenu', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (23, N'pag_Auditoria', 1, N'Auditoria', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (24, N'pag_UsuarioPersonal', 1, N'Usuario del  Personal', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (25, N'pag_Acciones', 1, N'Acciones', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (26, N'pag_Roles', 1, N'Pefil', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (27, N'pag_Receta', 1, N'Receta', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (28, N'pag_ContabilidadMenu', 2, N'ContabilidadMenu', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (29, N'pag_607', 1, N'Reporte_607', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (30, N'pag_BackupExcelConsulta', 1, N'BackupExcelConsulta', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (31, N'pag_CitaPacienteEnLinea', 1, N'CitaPacienteEnLinea', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (32, N'pag_DigitalizacionConsultas', 1, N'DigitalizacionConsultas', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (33, N'pag_CategoriaPersonal', 1, N'CategoriaPersonal', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (34, N'Rolelista', 1, N'Perfil Lista', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (35, N'TipoFormulariolista', 1, N'TipoFormulariolista', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (36, N'Pag_CategoriaPersonalLista', 1, N'CategoriaPersonalLista', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (38, N'pag_RolePages', 1, N'Asignar Pagina a Perfil', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (39, N'pag_MotivoConsulta', 1, N'Motivo de Consulta', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (40, N'pag_Tratamiento', 1, N'Tratamiento', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (41, N'pag_EvaluacionFisica', 1, N'Evaluación Física', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (42, N'pag_Clinica', 1, N'Clinica', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (43, N'pag_Consultorio', 1, N'Consultorio', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (44, N'pag_UsuarioDoctor', 1, N'Usuario del  Doctor', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (46, N'pag_Enfermedad', 1, N'Enfermedad', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (47, N'pag_Medicamentos', 1, N'Medicamentos', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (48, N'pag_AnalisisClinico', 1, N'Análisis Clínico', 0)
INSERT [dbo].[Formularios] ([FormSecuencia], [FormDescripcion], [TFormSecuencia_fk], [FormPantalla], [EstaDesabilitado]) VALUES (49, N'pag_Imagenes', 1, N'Imagenes', 0)
INSERT [dbo].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (1, N'A+', 0)
INSERT [dbo].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (2, N'A-', 0)
INSERT [dbo].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (3, N'B+', 0)
INSERT [dbo].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (4, N'B-', 0)
INSERT [dbo].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (5, N'AB+', 0)
INSERT [dbo].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (6, N'AB-', 0)
INSERT [dbo].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (7, N'O+', 0)
INSERT [dbo].[GrupoSanguineo] ([GSangSecuencia], [GSangNombre], [EstaDesabilitado]) VALUES (8, N'O-', 0)
INSERT [dbo].[HorarioTrabajo] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [HTrabSecuencia], [DSemaSecuencia_Fk], [HTrabRepetirSiempre], [HTrabDiaHabilitado], [HTrabFechaCreacion], [UsuaSecuenciaCreacion], [HTrabFechaModificacion], [UsuaSecuenciaModificacion], [HTrabEstaDesabilitado], [HTrabPartesHoraSchedule]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, CAST(N'2017-09-04 22:33:45.437' AS DateTime), 1, CAST(N'2017-09-11 21:57:28.187' AS DateTime), 1, 0, 4)
INSERT [dbo].[HorarioTrabajo] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [HTrabSecuencia], [DSemaSecuencia_Fk], [HTrabRepetirSiempre], [HTrabDiaHabilitado], [HTrabFechaCreacion], [UsuaSecuenciaCreacion], [HTrabFechaModificacion], [UsuaSecuenciaModificacion], [HTrabEstaDesabilitado], [HTrabPartesHoraSchedule]) VALUES (1, 1, 1, 1, 2, 2, 1, 1, CAST(N'2017-09-04 22:33:45.440' AS DateTime), 1, CAST(N'2017-09-11 21:57:28.187' AS DateTime), 1, 0, 4)
INSERT [dbo].[HorarioTrabajo] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [HTrabSecuencia], [DSemaSecuencia_Fk], [HTrabRepetirSiempre], [HTrabDiaHabilitado], [HTrabFechaCreacion], [UsuaSecuenciaCreacion], [HTrabFechaModificacion], [UsuaSecuenciaModificacion], [HTrabEstaDesabilitado], [HTrabPartesHoraSchedule]) VALUES (1, 1, 1, 1, 3, 3, 1, 1, CAST(N'2017-09-04 22:33:45.443' AS DateTime), 1, CAST(N'2017-09-11 21:57:28.187' AS DateTime), 1, 0, 4)
INSERT [dbo].[HorarioTrabajo] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [HTrabSecuencia], [DSemaSecuencia_Fk], [HTrabRepetirSiempre], [HTrabDiaHabilitado], [HTrabFechaCreacion], [UsuaSecuenciaCreacion], [HTrabFechaModificacion], [UsuaSecuenciaModificacion], [HTrabEstaDesabilitado], [HTrabPartesHoraSchedule]) VALUES (1, 1, 1, 1, 4, 4, 1, 1, CAST(N'2017-09-04 22:33:45.443' AS DateTime), 1, CAST(N'2017-09-11 21:57:28.187' AS DateTime), 1, 0, 4)
INSERT [dbo].[HorarioTrabajo] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [HTrabSecuencia], [DSemaSecuencia_Fk], [HTrabRepetirSiempre], [HTrabDiaHabilitado], [HTrabFechaCreacion], [UsuaSecuenciaCreacion], [HTrabFechaModificacion], [UsuaSecuenciaModificacion], [HTrabEstaDesabilitado], [HTrabPartesHoraSchedule]) VALUES (1, 1, 1, 1, 5, 5, 1, 1, CAST(N'2017-09-04 22:33:45.443' AS DateTime), 1, CAST(N'2017-09-11 21:57:28.187' AS DateTime), 1, 0, 4)
INSERT [dbo].[HorarioTrabajo] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [HTrabSecuencia], [DSemaSecuencia_Fk], [HTrabRepetirSiempre], [HTrabDiaHabilitado], [HTrabFechaCreacion], [UsuaSecuenciaCreacion], [HTrabFechaModificacion], [UsuaSecuenciaModificacion], [HTrabEstaDesabilitado], [HTrabPartesHoraSchedule]) VALUES (1, 1, 1, 1, 6, 6, 1, 1, CAST(N'2017-09-04 22:33:45.443' AS DateTime), 1, CAST(N'2017-09-11 21:57:28.187' AS DateTime), 1, 0, 4)
INSERT [dbo].[HorarioTrabajo] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [HTrabSecuencia], [DSemaSecuencia_Fk], [HTrabRepetirSiempre], [HTrabDiaHabilitado], [HTrabFechaCreacion], [UsuaSecuenciaCreacion], [HTrabFechaModificacion], [UsuaSecuenciaModificacion], [HTrabEstaDesabilitado], [HTrabPartesHoraSchedule]) VALUES (1, 1, 1, 1, 7, 7, 1, 1, CAST(N'2017-09-04 22:33:45.443' AS DateTime), 1, CAST(N'2017-09-11 21:57:28.187' AS DateTime), 1, 0, 4)
INSERT [dbo].[HorarioTrabajoDestalle] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DSemaSecuencia_Fk], [hi], [hf], [ht]) VALUES (1, 1, 1, 1, 1, CAST(N'07:00:00' AS Time), CAST(N'13:00:00' AS Time), N'07:00 AM  /  01:00 PM')
INSERT [dbo].[HorarioTrabajoDestalle] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DSemaSecuencia_Fk], [hi], [hf], [ht]) VALUES (1, 1, 1, 1, 1, CAST(N'15:00:00' AS Time), CAST(N'19:00:00' AS Time), N'03:00 PM  /  07:00 PM')
INSERT [dbo].[HorarioTrabajoDestalle] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DSemaSecuencia_Fk], [hi], [hf], [ht]) VALUES (1, 1, 1, 1, 2, CAST(N'07:00:00' AS Time), CAST(N'13:00:00' AS Time), N'07:00 AM  /  01:00 PM')
INSERT [dbo].[HorarioTrabajoDestalle] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DSemaSecuencia_Fk], [hi], [hf], [ht]) VALUES (1, 1, 1, 1, 3, CAST(N'00:00:00' AS Time), CAST(N'23:00:00' AS Time), N'12:00 AM  /  11:00 PM')
INSERT [dbo].[HorarioTrabajoDestalle] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DSemaSecuencia_Fk], [hi], [hf], [ht]) VALUES (1, 1, 1, 1, 4, CAST(N'01:00:00' AS Time), CAST(N'23:00:00' AS Time), N'01:00 AM  /  11:00 PM')
INSERT [dbo].[HorarioTrabajoDestalle] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DSemaSecuencia_Fk], [hi], [hf], [ht]) VALUES (1, 1, 1, 1, 5, CAST(N'01:00:00' AS Time), CAST(N'22:00:00' AS Time), N'01:00 AM  /  10:00 PM')
INSERT [dbo].[HorarioTrabajoDestalle] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DSemaSecuencia_Fk], [hi], [hf], [ht]) VALUES (1, 1, 1, 1, 6, CAST(N'00:00:00' AS Time), CAST(N'23:00:00' AS Time), N'12:00 AM  /  11:00 PM')
INSERT [dbo].[HorarioTrabajoDestalle] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DSemaSecuencia_Fk], [hi], [hf], [ht]) VALUES (1, 1, 1, 1, 7, CAST(N'00:00:00' AS Time), CAST(N'23:00:00' AS Time), N'12:00 AM  /  11:00 PM')
INSERT [dbo].[Imagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [ImagSecuencia], [ImagCodigo], [ImagNombre], [ImagDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, NULL, N'Imagenes', NULL, 0)
INSERT [dbo].[Imagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [ImagSecuencia], [ImagCodigo], [ImagNombre], [ImagDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 1, NULL, N'SONOGRAFIA TRASVAGINAL', NULL, 0)
INSERT [dbo].[Imagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [ImagSecuencia], [ImagCodigo], [ImagNombre], [ImagDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 2, NULL, N'SONOGRAFIA DE TIROIDES', N'SE TOCA AUMENTADO DE TAMAÑO', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, N'p1', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, N'wdw', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 3, N're', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 2, 1, N'sdfsdfs', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 2, 2, N' modidfi', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 1, N'cual quiera', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 2, N'Salud-max', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 2, 1, N'contributuvo', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 3, 1, N'basico', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 4, 1, N'basico', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 5, 1, N'basico', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 6, 1, N'Complementario', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 6, 2, N'Basico', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 7, 1, N'Voluntario-Modalidad familiar', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 7, 2, N'Complementario (Selecto, Elite, Infinity)', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 7, 3, N'Basico', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 8, 1, N'Planes Voluntarios (flex alfa, beta, delta, gamma)', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 8, 2, N'Contributivo', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 8, 3, N'Subsidiado (Gobierno)', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 9, 1, N'Complementario', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 9, 2, N'Basico', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 10, 1, N'Complementario', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 10, 2, N'Basico', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 11, 1, N'Complementario', 0)
INSERT [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia], [IAPlanDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 11, 2, N'Basico', 0)
INSERT [dbo].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAsegCodigo], [IAsegNombre], [IAsegRNC], [IAsegTelefono], [IAsegCorreo], [IAsegWeb], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [IAsegFechaCreacion], [IAsegFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, NULL, N'sdfsdf', 11111, N'(111) 111-1111', NULL, NULL, 1, 1, CAST(N'2017-07-19 11:02:49.000' AS DateTime), CAST(N'2017-07-19 23:44:18.440' AS DateTime), 0)
INSERT [dbo].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAsegCodigo], [IAsegNombre], [IAsegRNC], [IAsegTelefono], [IAsegCorreo], [IAsegWeb], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [IAsegFechaCreacion], [IAsegFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 2, N'343234', N'otrad', 3423423, N'(222) 222-2222', NULL, NULL, 1, 1, CAST(N'2017-07-19 23:06:39.000' AS DateTime), CAST(N'2017-07-19 23:07:10.687' AS DateTime), 0)
INSERT [dbo].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAsegCodigo], [IAsegNombre], [IAsegRNC], [IAsegTelefono], [IAsegCorreo], [IAsegWeb], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [IAsegFechaCreacion], [IAsegFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, NULL, N'Humano', 1018644, N'(809) 476-3570', NULL, N'https://www.humano.com.do', 2, 2, CAST(N'2017-07-17 16:08:29.000' AS DateTime), CAST(N'2017-07-20 10:04:47.473' AS DateTime), 0)
INSERT [dbo].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAsegCodigo], [IAsegNombre], [IAsegRNC], [IAsegTelefono], [IAsegCorreo], [IAsegWeb], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [IAsegFechaCreacion], [IAsegFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, 1, 2, NULL, N'SeNaSa', 4015164, N'(809) 701-3821', NULL, N'https://www.arssenasa.gob.do/', 2, 2, CAST(N'2017-07-17 17:21:14.000' AS DateTime), CAST(N'2017-07-17 18:08:13.897' AS DateTime), 0)
INSERT [dbo].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAsegCodigo], [IAsegNombre], [IAsegRNC], [IAsegTelefono], [IAsegCorreo], [IAsegWeb], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [IAsegFechaCreacion], [IAsegFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, 1, 3, NULL, N'primera humano', 1018644, N'(809) 476-3570', NULL, N'https://www.humano.com.do', 2, NULL, CAST(N'2017-07-17 18:18:08.940' AS DateTime), NULL, 0)
INSERT [dbo].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAsegCodigo], [IAsegNombre], [IAsegRNC], [IAsegTelefono], [IAsegCorreo], [IAsegWeb], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [IAsegFechaCreacion], [IAsegFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, 1, 4, NULL, N'ARS SIMAG', 1010641, N'(809) 685-7940', NULL, N'https://www.arssimag.com.do/', 2, NULL, CAST(N'2017-07-17 18:26:03.940' AS DateTime), NULL, 0)
INSERT [dbo].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAsegCodigo], [IAsegNombre], [IAsegRNC], [IAsegTelefono], [IAsegCorreo], [IAsegWeb], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [IAsegFechaCreacion], [IAsegFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, 1, 5, NULL, N'ARS PARLIC', 1230028, N'(809) 472-1515', NULL, N'https://www.arspalic.com.do/', 2, NULL, CAST(N'2017-07-17 18:48:42.223' AS DateTime), NULL, 0)
INSERT [dbo].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAsegCodigo], [IAsegNombre], [IAsegRNC], [IAsegTelefono], [IAsegCorreo], [IAsegWeb], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [IAsegFechaCreacion], [IAsegFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, 1, 6, NULL, N'ARS UNIVERSAL', 101784326, N'(809) 544-7750', NULL, N'https://www.universal.com.do', 2, NULL, CAST(N'2017-07-18 15:27:20.050' AS DateTime), NULL, 0)
INSERT [dbo].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAsegCodigo], [IAsegNombre], [IAsegRNC], [IAsegTelefono], [IAsegCorreo], [IAsegWeb], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [IAsegFechaCreacion], [IAsegFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, 1, 7, NULL, N'ARS YUNEN', 123002807, N'(809) 540-0901', NULL, N'http://www.arsyunen.com/', 2, NULL, CAST(N'2017-07-18 15:35:10.380' AS DateTime), NULL, 0)
INSERT [dbo].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAsegCodigo], [IAsegNombre], [IAsegRNC], [IAsegTelefono], [IAsegCorreo], [IAsegWeb], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [IAsegFechaCreacion], [IAsegFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, 1, 8, NULL, N'ARS SENASA', 401516454, N'(809) 333-3821', NULL, N'https://www.arssenasa.gob.do/', 2, NULL, CAST(N'2017-07-18 15:43:28.010' AS DateTime), NULL, 0)
INSERT [dbo].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAsegCodigo], [IAsegNombre], [IAsegRNC], [IAsegTelefono], [IAsegCorreo], [IAsegWeb], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [IAsegFechaCreacion], [IAsegFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, 1, 9, NULL, N'ARS. SIMAG', 101064129, N'(809) 685-7940', NULL, N'https://www.arssimag.com.do/', 2, NULL, CAST(N'2017-07-18 15:47:59.403' AS DateTime), NULL, 0)
INSERT [dbo].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAsegCodigo], [IAsegNombre], [IAsegRNC], [IAsegTelefono], [IAsegCorreo], [IAsegWeb], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [IAsegFechaCreacion], [IAsegFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, 1, 10, NULL, N'ARS RESERVAS', 1310214, N'(809) 960-2190', NULL, N'http://www.arsreservas.com/Paginas/Inicio.aspx', 2, NULL, CAST(N'2017-07-18 16:01:20.100' AS DateTime), NULL, 0)
INSERT [dbo].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAsegCodigo], [IAsegNombre], [IAsegRNC], [IAsegTelefono], [IAsegCorreo], [IAsegWeb], [usuaSecuenciaCreacion], [usuaSecuenciaModificacion], [IAsegFechaCreacion], [IAsegFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, 1, 11, NULL, N'BANCO CENTRAL', 123002807, N'(809) 682-0730', NULL, N'http://www.arsplansalud.org.do/', 2, NULL, CAST(N'2017-07-18 16:15:02.697' AS DateTime), NULL, 0)
INSERT [dbo].[Medicamento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MediSecuencia], [MediCodigo], [MediNombre], [MediLaboratorio], [MediFamilia], [MediDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, NULL, N'Medicamento', NULL, NULL, NULL, 0)
INSERT [dbo].[Medicamento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MediSecuencia], [MediCodigo], [MediNombre], [MediLaboratorio], [MediFamilia], [MediDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 1, NULL, N'ARTRICON', NULL, NULL, NULL, 0)
INSERT [dbo].[Medicamento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MediSecuencia], [MediCodigo], [MediNombre], [MediLaboratorio], [MediFamilia], [MediDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 2, NULL, N'SUMOX DUO', NULL, NULL, NULL, 0)
INSERT [dbo].[Medicamento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MediSecuencia], [MediCodigo], [MediNombre], [MediLaboratorio], [MediFamilia], [MediDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 3, NULL, N'Doxidran', N'induquimicas', NULL, NULL, 0)
INSERT [dbo].[Medicamento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MediSecuencia], [MediCodigo], [MediNombre], [MediLaboratorio], [MediFamilia], [MediDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 4, NULL, N'proyetil fol', N'AGLF', NULL, NULL, 0)
INSERT [dbo].[Moneda] ([MoneSecuencia], [MoneMoneda], [EstaDesabilitado]) VALUES (1, N'USD', 0)
INSERT [dbo].[MotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MConsSecuencia], [MConsMotivoConsulta], [MConsDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, N'motivo consulta', NULL, 0)
INSERT [dbo].[MotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MConsSecuencia], [MConsMotivoConsulta], [MConsDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, N'Motivo consulta 2', NULL, 0)
INSERT [dbo].[MotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MConsSecuencia], [MConsMotivoConsulta], [MConsDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 3, N'GRIPE', NULL, 0)
INSERT [dbo].[MotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MConsSecuencia], [MConsMotivoConsulta], [MConsDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 1, N'Dolor Pelvico', NULL, 0)
INSERT [dbo].[MotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MConsSecuencia], [MConsMotivoConsulta], [MConsDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 2, N'Cefalea', NULL, 0)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (1, 1, 1, 1, 1, N'P-001000001', N'1111222222', 1, NULL, 1, 2, NULL, 0, N'Primera Paciente MODI', N'apellido', NULL, NULL, CAST(N'2017-06-28 00:00:00.000' AS DateTime), NULL, NULL, N'micha_141@hotmail.com', NULL, NULL, N'(999) 999-9999', N'(829) 865-7498', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2017-07-19 09:23:01.000' AS DateTime), 1, CAST(N'2017-08-07 19:10:30.717' AS DateTime), NULL, NULL, N'Femenino', 0, 2)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (1, 1, 1, 1, 2, N'P-001000002', N'12141', 1, NULL, NULL, NULL, NULL, 0, N'Maria', N'petra', NULL, NULL, CAST(N'2017-08-10 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2017-08-13 16:47:59.593' AS DateTime), NULL, NULL, NULL, NULL, N'Masculino', 0, 2)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 1, N'P-002000001', N'001-1179284-2', 1, NULL, NULL, NULL, NULL, 0, N'melba', N'infante', N'brito', NULL, CAST(N'1969-06-02 00:00:00.000' AS DateTime), N'STO DGO', NULL, NULL, NULL, N'c/leonardo da vinci # 85 torre vista real II', NULL, N'(809) 350-2757', NULL, N'Solter@', NULL, NULL, NULL, NULL, NULL, 2, CAST(N'2017-07-16 11:20:28.000' AS DateTime), 2, CAST(N'2017-07-18 07:55:50.183' AS DateTime), NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 2, N'P-002000002', N'12345678910', 2, NULL, NULL, NULL, NULL, 1, N'melina', N'almanzar', N'infante', NULL, CAST(N'2003-10-30 00:00:00.000' AS DateTime), NULL, 13, N'melbainfante@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, N'estudiante', N'melba', N'infante', N'calle Leonardo Da'' Vinci, #85 torre vista real II, apt. 2a', N'(809) 350-2757', 2, CAST(N'2017-07-17 13:51:19.140' AS DateTime), NULL, NULL, NULL, NULL, N'Femenino', 0, 1)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 3, N'P-002000003', N'028-0085451-1', 1, NULL, 1, 1, NULL, 0, N'Marlene', N'Cedano', N'Deschamps', NULL, CAST(N'1985-10-11 00:00:00.000' AS DateTime), N'STO DGO', 31, N'marlene_cedano@hotmail.com', NULL, N'c/venigno filomeno romas #358 zona universitaria', NULL, N'(829) 808-0773', NULL, N'Solter@', NULL, N'Dimerci', N'Avila', NULL, N'(809) 975-6004', 2, CAST(N'2017-07-17 16:31:12.000' AS DateTime), 2, CAST(N'2017-07-18 07:54:58.317' AS DateTime), NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 4, N'P-002000004', N'026-0100747-5', 1, NULL, 11, 2, NULL, 0, N'Nadia', N'Dietsch', N'Reyes', NULL, CAST(N'1981-05-10 00:00:00.000' AS DateTime), N'STO DGO', 35, N'nadiadietsch10@gmail.com', NULL, N'Republica de colombia res.Ciudad Real II , Edif. 41 4 aptp.402', N'(809) 922-9711', N'(849) 817-6900', NULL, N'Casad@', N'administracion de empresas', N'Alberto', N'Estevez', N'Republica de colombia res.Ciudad Real II , Edif. 41 4 aptp.402', N'(829) 903-3638', 2, CAST(N'2017-07-17 16:51:52.000' AS DateTime), 2, CAST(N'2017-07-18 17:28:28.493' AS DateTime), NULL, NULL, N'Femenino', 0, 3)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 5, N'P-002000005', N'001-1400384-1', 1, NULL, 11, 2, NULL, 0, N'Luz Altagracia', N'Trinidad ', N'Hernandez', NULL, CAST(N'1978-09-14 00:00:00.000' AS DateTime), N'La vega, RD', 38, N'luztrinidad@hotmail.com', NULL, N'Padre  Billini casa 417 sector zona colonial', N'(809) 689-2614', N'(809) 804-2247', NULL, N'Solter@', N'Esteticista', N'Virgen Maria ', N'Trinidad ', N'Padre  Billini casa 417 sector zona colonial', N'(809) 865-0436', 2, CAST(N'2017-07-17 17:09:06.000' AS DateTime), 2, CAST(N'2017-07-18 17:23:20.330' AS DateTime), NULL, NULL, N'Femenino', 0, 8)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 6, N'P-002000006', N'001-1564307-4', 1, NULL, 10, 2, NULL, 0, N'Ana Amarilis', N'Perez', N'Estrella', NULL, CAST(N'1976-09-01 00:00:00.000' AS DateTime), N'STO DGO', 40, N'perezana0304@hotmail.com', NULL, N'Paseo de la garza casa 13 sector arroyo hondo ', NULL, N'(829) 770-4393', NULL, N'Casad@', N'Contadora', N'Felix ', N'Tapia ', N'Paseo de la garza casa 13 sector arroyo hondo ', N'(809) 683-2794', 2, CAST(N'2017-07-17 17:14:39.000' AS DateTime), 2, CAST(N'2017-07-18 16:48:42.967' AS DateTime), NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 7, N'P-002000007', N'402-2188668-8', 1, NULL, 6, 1, NULL, 0, N'Geraly Michelle ', N'Antigua', N'Alcantara', NULL, CAST(N'1994-02-22 00:00:00.000' AS DateTime), N'STO DGO', 23, N'geralyantigua@gmail.com', NULL, N'Av. Los martines casa 214 sector cristo rey ', NULL, N'(809) 364-0915', NULL, N'Casad@', N'Ingeniero', N'Alexander ', N'Morales', N'Av. Los martines casa 214 sector cristo rey', N'(829) 342-5480', 2, CAST(N'2017-07-17 17:32:13.000' AS DateTime), 2, CAST(N'2017-07-18 16:38:16.217' AS DateTime), NULL, NULL, N'Femenino', 0, 3)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 8, N'P-002000008', N'001-114011-7', 1, NULL, NULL, NULL, NULL, 0, N'Delia Denisse', N'Garcia', N'Ruiz', NULL, CAST(N'1977-01-13 00:00:00.000' AS DateTime), N'STO DGO', 40, N'deliagarcia_r@hotmail.com', NULL, N'Palacio Escolar casa 1 sector ciudad de los millones (SAVICA) ', N'(809) 530-5848', N'(809) 707-5710', NULL, N'Solter@', N'Empresaria', NULL, NULL, NULL, NULL, 2, CAST(N'2017-07-17 17:40:55.000' AS DateTime), 2, CAST(N'2017-07-18 07:53:49.943' AS DateTime), NULL, NULL, N'Femenino', 0, 3)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 9, N'P-002000009', N'001-1421935-5', 1, NULL, 11, 2, NULL, 0, N'Maria Elena ', N'Castro ', N'Alvarado', NULL, CAST(N'1978-09-01 00:00:00.000' AS DateTime), N'STO DGO', 39, N'mariaecastro001@gmail.com', NULL, N'1era casa 35 sector primaveral ', NULL, N'(829) 304-9670', NULL, N'Casad@', N'Tecnico', N'Kelvin ', N'Perdomo', N'1era casa 35 sector primaveral ', N'(809) 989-0896', 2, CAST(N'2017-07-17 17:46:39.000' AS DateTime), 2, CAST(N'2017-07-18 17:26:07.607' AS DateTime), NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 10, N'P-002000010', N'00109155113-5', 1, NULL, NULL, NULL, NULL, 0, N'Ysabel', N'Sosa', N'Vasquez', NULL, CAST(N'1968-11-05 00:00:00.000' AS DateTime), N'Los Llanos', 48, N'sosa012010@hotmail.com', NULL, N'Simon Bolivar, villa esfuerzo casa 24 sector villa carmen II', N'(809) 231-9599', N'(809) 918-4191', NULL, N'Solter@', N'empleado', NULL, NULL, NULL, NULL, 2, CAST(N'2017-07-17 18:15:29.413' AS DateTime), NULL, NULL, NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 11, N'P-002000011', N'402-2414868-0', 1, NULL, 11, 2, NULL, 0, N'Karolis Yannerys', N'Cabrera ', N'Castro', NULL, CAST(N'1994-07-19 00:00:00.000' AS DateTime), N'STO DGO', 23, N'karoliscc@hotmail.com', NULL, N'Av. monumental casa 08 sector los girasoles', N'(809) 472-4757', N'(809) 882-8921', NULL, N'Solter@', N'estudiante', N'Alexis', N'Solano', NULL, N'(849) 884-2827', 2, CAST(N'2017-07-17 18:34:02.000' AS DateTime), 2, CAST(N'2017-07-18 17:13:01.770' AS DateTime), NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 12, N'P-002000012', N'001-1653451-2', 1, NULL, 11, 2, NULL, 0, N'Virgilia', N'Manzuta', N'Ferrer', NULL, CAST(N'1981-01-24 00:00:00.000' AS DateTime), N'Monte Plata, yamasa', 36, N'virgilia_manzuta@bhdleon.com.do', NULL, N'c/las minas #14 sector vista hermoso', N'(809) 435-3039', N'(809) 910-7519', NULL, N'Solter@', N'contadora', N'Natividad', N'Mansueta', N'c/las minas #14 sector vista hermoso', N'(809) 861-0561', 2, CAST(N'2017-07-17 18:53:38.000' AS DateTime), 2, CAST(N'2017-07-18 17:30:23.390' AS DateTime), NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 13, N'P-002000013', N'001-1627633-8', 1, NULL, 11, 2, NULL, 0, N'Nelsida Altagracia', N'Cruz', N'Abreu', NULL, CAST(N'1982-11-15 00:00:00.000' AS DateTime), N'STO DGO', 35, N'nelsida05@hotmail.com', NULL, N'Bloque 11 casa 3-D sector obras publicas', N'(829) 254-1187', N'(809) 980-8547', NULL, N'Casad@', NULL, N'Orlando Luis', N'De Jesus', N'Bloque 11 casa 3-D sector obras publicas', N'(829) 916-9155', 2, CAST(N'2017-07-18 07:31:22.000' AS DateTime), 2, CAST(N'2017-07-18 17:29:28.700' AS DateTime), NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 14, N'P-002000014', N'402-2441081-7', 1, NULL, NULL, NULL, NULL, 0, N'Ana Mercedes', N'Mirambeaux', N'Gurdi', NULL, CAST(N'1994-11-17 00:00:00.000' AS DateTime), N'Cotui, RD', 22, N'anamirambeaux@hotmail.com', NULL, N'PRINC AV. universitaria casa 11 sector centro de la ciudad', NULL, N'(809) 607-9527', NULL, N'Solter@', N'abogada', NULL, NULL, NULL, N'(___) ___-____', 2, CAST(N'2017-07-18 07:38:15.937' AS DateTime), NULL, NULL, NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 15, N'P-002000015', N'001-1614451-0', 1, NULL, 11, 2, NULL, 0, N'Josefina', N'Cabrera', N'Corporan', NULL, CAST(N'1979-10-12 00:00:00.000' AS DateTime), N'STO DGO', 37, N'josefina1221@hotmail.com', NULL, N'Arzobispo portes casa 605 sector ciudad nueva', N'(809) 682-6429', N'(809) 682-6421', NULL, N'Casad@', N'Abogada', N'Carlos Jesus', N'Hidalgo', N'Arzobispo portes casa 605 sector ciudad nueva', N'(809) 767-7994', 2, CAST(N'2017-07-18 07:41:20.000' AS DateTime), 2, CAST(N'2017-07-18 17:08:48.783' AS DateTime), NULL, NULL, N'Femenino', 0, 3)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 16, N'P-002000016', N'001-0267975-0', 1, NULL, 11, 2, NULL, 0, N'Margarita Altagracia', N'Mendoza', NULL, NULL, CAST(N'1963-03-01 00:00:00.000' AS DateTime), N'STO DGO', 57, N'margaretm05@hotmail.com', NULL, N'Av. quintocentenario, edfit. 36 piso 04 apto. 4D sector villa juana', N'(809) 538-9567', N'(829) 851-4915', NULL, N'Casad@', N'Estilista', NULL, NULL, NULL, N'(829) 851-4915', 2, CAST(N'2017-07-18 08:25:30.000' AS DateTime), 2, CAST(N'2017-07-18 17:24:45.350' AS DateTime), NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 17, N'P-002000017', N'001-1754099-7', 1, NULL, 11, 2, NULL, 0, N'Linett Graciela', N'Rivera', N'Saldivar', NULL, CAST(N'1985-10-02 00:00:00.000' AS DateTime), N'STO DGO', 41, N'linettgr@gmail.com', NULL, N'Reso. 19, edif. Miguel Angel I piso 4 Apto. 4-bB sector quisqueya', N'(809) 908-0222', N'(829) 983-8964', NULL, N'Solter@', N'publicista', N'Isac', N'Trivera', N'Reso. 19, edif. Miguel Angel I piso 4 Apto. 4-bB sector quisqueya', N'(809) 303-1950', 2, CAST(N'2017-07-18 08:31:57.000' AS DateTime), 2, CAST(N'2017-07-18 17:18:49.873' AS DateTime), NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 18, N'P-002000018', N'025-0002056-1', 1, NULL, NULL, NULL, NULL, 0, N'Gloria Maria ', N'Reyes', N'Severino de Garcia', NULL, CAST(N'1962-10-17 00:00:00.000' AS DateTime), N'El Seybo, RD', 54, N'gloriareyes99@hotmail.com', NULL, N'Sanchez casa 47 sector los hoyitos', N'(809) 552-3320', N'(809) 299-1557', NULL, N'Casad@', N'comerciante', N'Rosio', N'Rodrigues ', NULL, N'(809) 552-3452', 2, CAST(N'2017-07-18 08:50:39.467' AS DateTime), NULL, NULL, NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 19, N'P-002000019', N'028-0092726-7', 1, NULL, 10, 2, NULL, 0, N'Annerys Vanessa ', N'Arias', N'Cedeno', NULL, CAST(N'1987-04-19 00:00:00.000' AS DateTime), N'STO SGO', 30, N'dra.annerysareas@hotmail.com', NULL, N'Gregorio Luperon casa 126 sector los platanitos ', NULL, N'(849) 220-8448', NULL, N'Solter@', N'Doctora', N'Christian ', N'Areas', NULL, N'(829) 922-5345', 2, CAST(N'2017-07-18 08:57:19.000' AS DateTime), 2, CAST(N'2017-07-18 16:57:21.657' AS DateTime), NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 20, N'P-002000020', N'025-0045206-1', 1, NULL, 11, 2, NULL, 0, N'Mabel Miguelina', N'Ureña', N'Tapia', NULL, CAST(N'1989-04-27 00:00:00.000' AS DateTime), N'El Seibo, RD', 28, N'mabelmiguelina02@gmail.com', NULL, N'Resp. Benito Moncion, Barrio El Rincon casa 17 sector centro de la ciudad', N'(829) 594-9334', N'(829) 580-2980', NULL, N'Solter@', N'Estudiante', N'Richard ', N'Leon', NULL, N'(829) 601-8818', 2, CAST(N'2017-07-18 09:04:53.000' AS DateTime), 2, CAST(N'2017-07-18 17:23:56.347' AS DateTime), NULL, NULL, N'Femenino', 0, 8)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 21, N'P-002000021', N'001-159578-4', 1, NULL, 3, 1, NULL, 0, N'Angela Altagracia', N'Florentino', N'De Aza', NULL, CAST(N'1982-03-30 00:00:00.000' AS DateTime), N'STO DGO', 30, N'anflor_30@hotmail.com', NULL, N'c/selene #40 edf. marta nicole aprt. 5-1 sector bella vista ', NULL, N'(809) 875-0421', NULL, N'Solter@', N'psicologa', N'Luis', N'Gonzales', NULL, N'(829) 308-9377', 2, CAST(N'2017-07-18 10:06:15.480' AS DateTime), NULL, NULL, NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 22, N'P-002000022', N'010-0115237-8', 1, NULL, 2, 1, NULL, 0, N'Ana Silvia', N'Beltre', N'Mendez', NULL, CAST(N'1992-06-11 00:00:00.000' AS DateTime), N'Azua, RD', 25, N'la_estherlina@hotmail.com', NULL, N'Duarte casa 02 sector barreras', NULL, N'(809) 743-2420', NULL, N'Solter@', N'estudiante', NULL, NULL, NULL, NULL, 2, CAST(N'2017-07-18 10:12:23.753' AS DateTime), NULL, NULL, NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 23, N'P-002000023', N'010-0053039-2', 1, NULL, 11, 2, NULL, 0, N'Ana', N'Senia', N'Mendez', NULL, CAST(N'1972-03-16 00:00:00.000' AS DateTime), N'Azua', 45, NULL, NULL, N'Calle principal los negros de azua casa #11', NULL, N'(809) 350-9706', NULL, N'Casad@', NULL, N'Angel ', N'Dario Beltre ', N'Calle principal los negros de azua casa #11', N'(809) 481-3115', 2, CAST(N'2017-07-18 10:20:51.000' AS DateTime), 2, CAST(N'2017-07-18 17:00:39.797' AS DateTime), NULL, NULL, N'Femenino', 0, 3)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 24, N'P-002000024', N'402-2484024-5', 1, NULL, 11, 2, NULL, 0, N'Argenllery', N'Gonzalez', N'Acosta', NULL, CAST(N'1996-10-31 00:00:00.000' AS DateTime), N'STO DGO', 20, N'arge31@hotmail.es', NULL, N'Luis amiamatio casa 5 sector La Fe', N'(809) 412-1652', N'(809) 401-4071', NULL, N'Solter@', N'estudiante', N'Servio', N'Tulio', NULL, N'(809) 541-2177', 2, CAST(N'2017-07-18 10:22:07.000' AS DateTime), 2, CAST(N'2017-07-18 16:51:02.693' AS DateTime), NULL, NULL, N'Femenino', 0, NULL)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 25, N'P-002000025', N'001-0940739-5', 1, NULL, 11, 2, NULL, 0, N'Gianna Wagibe', N'Hazoury ', N'Ruiz ', NULL, CAST(N'1970-11-30 00:00:00.000' AS DateTime), N'STO DGO ', 46, N'ghazoury@hotmail.com', NULL, N'Cerro casa 29 sector Arroyo hondo', N'(809) 683-2191', N'(829) 986-2300', NULL, N'Casad@', N'Administracion de empresas ', N'Ivan ', N'Gonzalez', N'Cerro casa 29 sector Arroyo hondo', N'(809) 299-8918', 2, CAST(N'2017-07-18 10:56:23.000' AS DateTime), 2, CAST(N'2017-07-18 16:43:12.177' AS DateTime), NULL, NULL, N'Femenino', 0, 1)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 26, N'P-002000026', N'834759485', 2, NULL, 11, 2, NULL, 1, N'Gianna Maria', N'Gonzalez', N'Hazoury', NULL, CAST(N'2003-07-01 00:00:00.000' AS DateTime), N'STO DGO', 14, N'ghazoury@hotmail.com', NULL, N'Cerro casa 29 sector arroyo hondo', NULL, N'(829) 201-2191', NULL, NULL, N'Estudiante', N'Gianna', N'Hazoury', N'Cerro casa 29 sector arroyo hondo', N'(829) 986-2300', 2, CAST(N'2017-07-18 11:01:12.000' AS DateTime), 2, CAST(N'2017-07-18 17:02:43.697' AS DateTime), NULL, NULL, N'Femenino', 0, 8)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 27, N'P-002000027', N'223''0037157''6', 1, NULL, 11, 2, NULL, 0, N'Johanna Altagracia', N'Rijo', N'Galan', NULL, CAST(N'1986-04-08 00:00:00.000' AS DateTime), N'STO DGO', NULL, N'johannarijo27@gmail.com', NULL, N'Bonaire casa 357', NULL, N'(829) 641-1642', NULL, N'Casad@', N'Estudiante', N'Altagracia', N'Galan', NULL, N'(809) 209-9091', 2, CAST(N'2017-07-18 11:42:49.000' AS DateTime), 2, CAST(N'2017-07-18 17:05:40.257' AS DateTime), NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 28, N'P-002000028', N'223-0139523-6', 1, N'1903451001', 1, 2, N'1903451001', 0, N'Alibeth', N'Rosario', N'Morillo', NULL, CAST(N'1992-12-31 00:00:00.000' AS DateTime), N'STO DGO', 25, N'alibeth31@hotmail.com', NULL, N'3ra, Edif. 55 piso 2 Apto. 202 sector Isabelita', N'(809) 766-0625', N'(829) 330-4491', NULL, N'Solter@', N'estudiante ', NULL, NULL, NULL, NULL, 2, CAST(N'2017-07-18 12:10:08.000' AS DateTime), 2, CAST(N'2017-07-20 10:07:01.317' AS DateTime), NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 29, N'P-002000029', N'001-0260477-4', 1, NULL, 11, 2, NULL, 0, N'Kenia  Virginia', N'Peguero', N'Rivas', NULL, CAST(N'1969-07-20 00:00:00.000' AS DateTime), N'STO DGO', 47, N'keniapeguero@hotmail.com', NULL, N'Maximo Grullon casa 48 sector  villa consuelo', N'(809) 681-7311', N'(829) 257-4086', NULL, N'Casad@', N'Empleada privada', N'Rafael ', N'Peguero', N'Maximo Grullon casa 48 sector  villa consuelo', N'(809) 304-3966', 2, CAST(N'2017-07-18 15:51:28.000' AS DateTime), 2, CAST(N'2017-07-18 17:14:44.903' AS DateTime), NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 30, N'P-002000030', N'402-2275803-5', 1, N'1547608', 11, 2, N'030625423712', 0, N'Juaniver ', N'De la rosa ', N'Segura', NULL, CAST(N'1993-03-25 00:00:00.000' AS DateTime), N'Padre las casas R.D', 24, NULL, NULL, N'2da colinas frescas casa 102 sector centro de la ciudad ', NULL, N'(849) 763-0906', NULL, N'Solter@', N'Estudiante', N'Manuel emilio', N'De la rosa', N'2da colinas frescas casa 102 sector centro de la ciudad ', N'(829) 912-6253', 2, CAST(N'2017-07-18 16:31:27.000' AS DateTime), 2, CAST(N'2017-07-18 17:11:12.237' AS DateTime), NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 31, N'P-002000031', N'001-1569856-5', 1, N'669604', 7, 1, N'030653713', 0, N'Karina Mercedes', N'Cabrera', N'Ortiz', NULL, CAST(N'1981-02-15 00:00:00.000' AS DateTime), N'STO DGO', 36, N'karinac85@hotmail.com', NULL, N'Tierra Llana, bloque D, Edif. D-4 piso 3 APT. 3B sector Alameda', N'(809) 372-3476', N'(809) 654-2332', NULL, N'Casad@', N'Empleada privada', N'Joel', N'Perez', N'Tierra Llana, bloque D, Edif. D-4 piso 3 APT. 3B sector Alameda', N'(829) 925-5600', 2, CAST(N'2017-07-18 16:50:01.220' AS DateTime), NULL, NULL, NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 32, N'P-002000032', N'402-2063557-3', 1, N'78692716', NULL, 1, N'0000098327', 0, N'Jahira Lisveeth', N'Guerrero ', N'Ciriaco', NULL, CAST(N'1991-06-13 00:00:00.000' AS DateTime), N'Bajos de haina R.D', 26, N'jahiraguerreroc@hotmail.com', NULL, N'Luz consuelo casa 03, Edif. Res. Brisas de piso 02 apto. 204 sector atlantida', N'(809) 539-6694', N'(849) 817-4203', NULL, N'Solter@', N'Mercadeo', N'Angela', N'ciriaco', N'Luz consuelo casa 03, Edif. Res. Brisas de piso 02 apto. 204 sector atlantida', N'(809) 258-6148', 2, CAST(N'2017-07-18 17:54:27.057' AS DateTime), NULL, NULL, NULL, NULL, N'Femenino', 0, 1)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 33, N'P-002000033', N'064-0023731-6', 1, N'5349507', 10, 2, N'0000274369', 0, N'Esther', N'Mendoza', N'De Jesus', NULL, CAST(N'1980-12-18 00:00:00.000' AS DateTime), N'Los Palmaritos , Tenares, RD', 36, N'esther_mendozajs@hotmail.com', NULL, N'sector cafe herrera c/ 3 numero 10', N'(809) 328-5174', N'(809) 254-5468', NULL, N'Casad@', N'Licenciada', N'lenny', N'Roa', N'sector cafe herrera c/ 3 numero 10', N'(809) 860-8289', 2, CAST(N'2017-07-18 17:59:27.093' AS DateTime), NULL, NULL, NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia], [PaciCodigo], [PaciDocumento], [TDSecuencia], [PaciNumeroSeguroSocial], [IAsegSecuencia], [IAPlanSecuencia], [PaciNumeroPoliza], [EsMenor], [PaciNombre], [PaciApellido1], [PaciApellido2], [PaciApodo], [PaciFechaNacimiento], [PaciLugarNacimiento], [PaciEdad], [PaciEmail], [PaciFacebook], [PaciDireccion], [PaciTelefono], [PaciCelular], [PaciCodigoPostal], [PaciEstadoCivil], [PaciProfesion], [PaciNombreEmergencia], [PaciApellidoEmergencia], [PaciDireccionEmergencia], [PaciTelefonoEmergencia], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [PaciFotoPath], [PaciFotoNombre], [PaciGenero], [EstaDesabilitado], [GSangSecuencia_fk]) VALUES (2, 1, 1, 1, 34, N'P-002000034', N'001-0522168', 1, N'858560339870000', 1, 1, N'9695119462', 0, N'Nilka semiraris ', N'castro', N'cabrera', NULL, CAST(N'1968-10-14 00:00:00.000' AS DateTime), N'Hostos , R.D (prov.duarte)', 48, N'nilca.astro@gmail.com', NULL, N'Jose cabrera#83, Edif. Rosangela piso 04 apto. 403', N'(809) 595-4657', N'(829) 548-6511', NULL, N'Solter@', N'psicologo', N'Dulce ', N'Cabrera', N'  Jose cabrera#83, Edif. Rosangela piso 04 apto. 403', N'(829) 641-1165', 2, CAST(N'2017-07-18 18:15:09.300' AS DateTime), NULL, NULL, NULL, NULL, N'Femenino', 0, 7)
INSERT [dbo].[Pais] ([PaisSecuencia], [PaisNombre], [EstaDesabilitado]) VALUES (1, N'Rep.Dom.', 0)
INSERT [dbo].[Pais] ([PaisSecuencia], [PaisNombre], [EstaDesabilitado]) VALUES (2, N'Puerto Republica', 0)
INSERT [dbo].[Personal] ([DoctSecuencia_fk], [PersSecuencia], [PaisSecuencia_fk], [PersDocumento], [TDSecuencia_fk], [UsuaSecuencia], [PersNombre], [PersApellido], [PersFechaNacimiento], [PersDireccion], [CPersSecuencia_FK], [PersTelefono], [PersCelular], [EstaActivo], [PersGenero], [UsuaCreacion], [PersFechaCreacion], [UsuaModificacion], [PersFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, 1, N'00111792841', 1, 3, N'YOCELIN ', N'CID', CAST(N'2017-07-16 00:00:00.000' AS DateTime), NULL, 1, N'(809) 530-7718', N'(809) 530-7718', 1, N'Femenino', 2, CAST(N'2017-07-16 12:36:23.727' AS DateTime), NULL, CAST(N'2017-07-16 12:36:23.727' AS DateTime), 0)
INSERT [dbo].[Planes] ([PlanSecuencia], [PlanDescripcion], [Precio], [MoneSecuencia_fk], [EstaDesabilitado]) VALUES (1, N'ADMIN', CAST(500.00 AS Decimal(18, 2)), 1, 0)
INSERT [dbo].[Planes] ([PlanSecuencia], [PlanDescripcion], [Precio], [MoneSecuencia_fk], [EstaDesabilitado]) VALUES (2, N'BASICO', CAST(22.95 AS Decimal(18, 2)), 1, 0)
INSERT [dbo].[Planes] ([PlanSecuencia], [PlanDescripcion], [Precio], [MoneSecuencia_fk], [EstaDesabilitado]) VALUES (3, N'ESTANDAR', CAST(33.95 AS Decimal(18, 2)), 1, 0)
INSERT [dbo].[Planes] ([PlanSecuencia], [PlanDescripcion], [Precio], [MoneSecuencia_fk], [EstaDesabilitado]) VALUES (4, N'PROFESIONAL', CAST(45.95 AS Decimal(18, 2)), 1, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (2, 1, 2, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (3, 1, 3, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (4, 1, 4, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (5, 1, 5, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (6, 1, 6, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (7, 1, 7, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (8, 1, 8, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (9, 1, 9, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (10, 1, 10, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (11, 1, 11, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (12, 1, 13, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (13, 1, 14, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (14, 1, 15, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (15, 1, 16, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (16, 1, 17, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (17, 1, 18, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (18, 1, 19, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (19, 1, 20, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (20, 1, 21, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (21, 1, 22, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (22, 1, 23, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (23, 1, 24, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (24, 1, 25, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (25, 1, 26, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (26, 1, 27, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (27, 1, 28, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (28, 1, 29, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (29, 1, 30, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (30, 1, 31, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (31, 1, 32, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (32, 1, 33, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (33, 1, 34, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (34, 1, 35, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (35, 1, 36, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (36, 1, 38, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (37, 1, 39, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (38, 1, 40, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (39, 1, 41, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (40, 1, 42, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (41, 1, 43, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (42, 1, 44, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (43, 1, 45, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (44, 1, 46, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (45, 1, 47, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (46, 1, 48, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (47, 1, 49, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (1, 2, 1, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (2, 2, 2, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (3, 2, 9, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (4, 2, 10, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (5, 2, 13, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (6, 2, 14, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (7, 2, 15, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (8, 2, 16, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (9, 2, 17, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (10, 2, 27, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (1, 3, 1, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (2, 3, 2, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (3, 3, 4, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (4, 3, 5, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (5, 3, 9, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (6, 3, 10, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (7, 3, 13, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (8, 3, 14, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (9, 3, 15, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (10, 3, 16, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (11, 3, 17, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (12, 3, 20, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (13, 3, 21, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (14, 3, 22, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (15, 3, 24, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (16, 3, 27, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (1, 4, 1, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (2, 4, 2, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (3, 4, 9, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (4, 4, 10, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (5, 4, 14, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (6, 4, 15, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (7, 4, 16, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (8, 4, 17, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (9, 4, 24, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (10, 4, 39, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (11, 4, 40, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (12, 4, 41, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (13, 4, 45, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (14, 4, 46, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (15, 4, 47, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (16, 4, 48, 0)
INSERT [dbo].[PlanFormularios] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado]) VALUES (17, 4, 49, 0)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (1, 1, 1, 0, 1, N'pag_Consulta', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (2, 1, 2, 0, 2, N'pag_Paciente', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (3, 1, 9, 0, 9, N'pag_MantenimientoMenu', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (4, 1, 10, 0, 10, N'pag_Diagnosticos', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (5, 1, 11, 0, 11, N'pag_TipoDiagnosticos', 2)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (6, 1, 13, 0, 13, N'pag_Procedimientos', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (7, 1, 14, 0, 14, N'Mantenimiento_pag_Consultorio', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (8, 1, 15, 0, 15, N'pag_ConfiguracionMenu', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (9, 1, 16, 0, 16, N'Configuracion_pag_Consultorio', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (10, 1, 17, 0, 17, N'pag_Doctor', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (11, 1, 27, 0, 27, N'pag_Receta', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (1, 2, 1, 0, 1, N'pag_Consulta', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (2, 2, 2, 0, 2, N'pag_Paciente', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (3, 2, 3, 0, 3, N'pag_Personal', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (4, 2, 4, 0, 4, N'pag_Cita', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (5, 2, 5, 0, 5, N'pag_Agenda', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (6, 2, 9, 0, 9, N'pag_MantenimientoMenu', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (7, 2, 10, 0, 10, N'pag_Diagnosticos', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (8, 2, 11, 0, 11, N'pag_TipoDiagnosticos', 2)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (9, 2, 13, 0, 13, N'pag_Procedimientos', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (10, 2, 14, 0, 14, N'Mantenimiento_pag_Consultorio', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (11, 2, 15, 0, 15, N'pag_ConfiguracionMenu', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (12, 2, 16, 0, 16, N'Configuracion_pag_Consultorio', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (13, 2, 17, 0, 17, N'pag_Doctor', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (14, 2, 20, 0, 20, N'pag_HorarioTrabajo', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (15, 2, 22, 0, 22, N'pag_SeguridadMenu', 2)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (16, 2, 24, 0, 24, N'pag_UsuarioPersonal', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (17, 2, 25, 0, 25, N'pag_Acciones', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (18, 2, 26, 0, 26, N'pag_Roles', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (19, 2, 27, 0, 27, N'pag_Receta', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (20, 2, 33, 0, 33, N'pag_CategoriaPersonal', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (1, 3, 1, 0, 1, N'pag_Consulta', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (2, 3, 2, 0, 2, N'pag_Paciente', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (3, 3, 3, 0, 3, N'pag_Personal', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (4, 3, 4, 0, 4, N'pag_Cita', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (5, 3, 5, 0, 5, N'pag_Agenda', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (6, 3, 6, 0, 6, N'pag_FacturacionMenu', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (7, 3, 7, 0, 7, N'pag_Facturacion', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (8, 3, 8, 0, 8, N'pag_Caja', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (9, 3, 9, 0, 9, N'pag_MantenimientoMenu', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (10, 3, 10, 0, 10, N'pag_Diagnosticos', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (11, 3, 13, 0, 13, N'pag_Procedimientos', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (12, 3, 14, 0, 14, N'Mantenimiento_pag_Consultorio', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (13, 3, 15, 0, 15, N'pag_ConfiguracionMenu', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (14, 3, 16, 0, 16, N'Configuracion_pag_Consultorio', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (15, 3, 17, 0, 17, N'pag_Doctor', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (16, 3, 20, 0, 20, N'pag_HorarioTrabajo', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (17, 3, 21, 0, 21, N'pag_InstitucionesAseguradoras', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (18, 3, 22, 0, 22, N'pag_SeguridadMenu', 2)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (19, 3, 24, 0, 24, N'pag_UsuarioPersonal', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (20, 3, 26, 0, 26, N'pag_Roles', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (21, 3, 27, 0, 27, N'pag_Receta', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (22, 3, 28, 0, 28, N'pag_ContabilidadMenu', 2)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (23, 3, 29, 0, 29, N'pag_607', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (24, 3, 31, 0, 31, N'pag_CitaPacienteEnLinea', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (25, 3, 34, 0, 34, N'Rolelista', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (26, 3, 36, 0, 36, N'Pag_CategoriaPersonalLista', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (27, 3, 38, 0, 38, N'pag_RolePages', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (28, 3, 39, 0, 39, N'pag_MotivoConsulta', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (29, 3, 40, 0, 40, N'pag_Tratamiento', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (30, 3, 41, 0, 41, N'pag_EvaluacionFisica', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (1, 4, 1, 0, 1, N'pag_Consulta', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (2, 4, 2, 0, 2, N'pag_Paciente', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (3, 4, 3, 0, 3, N'pag_Personal', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (4, 4, 4, 0, 4, N'pag_Cita', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (5, 4, 5, 0, 5, N'pag_Agenda', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (6, 4, 6, 0, 6, N'pag_FacturacionMenu', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (7, 4, 7, 0, 7, N'pag_Facturacion', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (8, 4, 8, 0, 8, N'pag_Caja', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (9, 4, 9, 0, 9, N'pag_MantenimientoMenu', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (10, 4, 10, 0, 10, N'pag_Diagnosticos', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (11, 4, 11, 0, 11, N'pag_TipoDiagnosticos', 2)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (12, 4, 13, 0, 13, N'pag_Procedimientos', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (13, 4, 14, 0, 14, N'Mantenimiento_pag_Consultorio', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (14, 4, 15, 0, 15, N'pag_ConfiguracionMenu', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (15, 4, 16, 0, 16, N'Configuracion_pag_Consultorio', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (16, 4, 17, 0, 17, N'pag_Doctor', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (17, 4, 18, 0, 18, N'Ini_TipoFormulario', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (18, 4, 19, 0, 19, N'PruebaAngular', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (19, 4, 20, 0, 20, N'pag_HorarioTrabajo', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (20, 4, 21, 0, 21, N'pag_InstitucionesAseguradoras', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (21, 4, 22, 0, 22, N'pag_SeguridadMenu', 2)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (22, 4, 23, 0, 23, N'pag_Auditoria', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (23, 4, 24, 0, 24, N'pag_UsuarioPersonal', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (24, 4, 25, 0, 25, N'pag_Acciones', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (25, 4, 26, 0, 26, N'pag_Roles', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (26, 4, 27, 0, 27, N'pag_Receta', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (27, 4, 28, 0, 28, N'pag_ContabilidadMenu', 2)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (28, 4, 29, 0, 29, N'pag_607', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (29, 4, 30, 0, 30, N'pag_BackupExcelConsulta', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (30, 4, 31, 0, 31, N'pag_CitaPacienteEnLinea', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (31, 4, 32, 0, 32, N'pag_DigitalizacionConsultas', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (32, 4, 33, 0, 33, N'pag_CategoriaPersonal', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (33, 4, 34, 0, 34, N'Rolelista', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (34, 4, 35, 0, 35, N'TipoFormulariolista', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (35, 4, 36, 0, 36, N'Pag_CategoriaPersonalLista', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (36, 4, 38, 0, 38, N'pag_RolePages', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (37, 4, 39, 0, 39, N'pag_MotivoConsulta', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (38, 4, 40, 0, 40, N'pag_Tratamiento', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (39, 4, 41, 0, 41, N'pag_EvaluacionFisica', 1)
GO
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (40, 4, 42, 0, 42, N'pag_Clinica', 1)
INSERT [dbo].[PlanFormularios_copia] ([PFSecuencia], [PlanSecuencia_fk], [FormSecuencia_fk], [EstaDesabilitado], [FormSecuencia], [FormDescripcion], [TFormSecuencia_fk]) VALUES (41, 4, 43, 0, 43, N'pag_Consultorio', 1)
INSERT [dbo].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 0, 1, 1, 1, 0)
INSERT [dbo].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 0, 3, 1, 1, 0)
INSERT [dbo].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 0, 4, 1, 1, 0)
INSERT [dbo].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, 3, 1, 1, 0)
INSERT [dbo].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, 4, 1, 1, 0)
INSERT [dbo].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, 1, 1, 1, 0)
INSERT [dbo].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, 4, 1, 1, 0)
INSERT [dbo].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, 1, 1, 1, 0)
INSERT [dbo].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, 2, 1, 1, 0)
INSERT [dbo].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, 2, 2, 2, 0)
INSERT [dbo].[RecetaAnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [AClinSecuencia_fk], [RAClinSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, 3, 3, 1, 0)
INSERT [dbo].[RecetaImagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [ImagSecuencia_fk], [RImagSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 0, 2, 1, 1, 0)
INSERT [dbo].[RecetaImagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [ImagSecuencia_fk], [RImagSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[RecetaImagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [ImagSecuencia_fk], [RImagSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, 4, 1, 1, 0)
INSERT [dbo].[RecetaImagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [ImagSecuencia_fk], [RImagSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, 1, 1, 1, 0)
INSERT [dbo].[RecetaImagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [ImagSecuencia_fk], [RImagSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, 2, 1, 1, 0)
INSERT [dbo].[RecetaImagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [ImagSecuencia_fk], [RImagSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 0, 1, 1, 1, 0)
INSERT [dbo].[RecetaMedicamentos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [MediSecuencia_fk], [RMediSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, 2, 1, 1, 0)
INSERT [dbo].[RecetaMedicamentos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [MediSecuencia_fk], [RMediSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, 4, 1, 1, 0)
INSERT [dbo].[RecetaMedicamentos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [MediSecuencia_fk], [RMediSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, 3, 1, 1, 0)
INSERT [dbo].[RecetaMedicamentos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk], [ReceSecuencia_fk], [MediSecuencia_fk], [RMediSecuencia], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 0, 2, 1, 1, 0)
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 1, 1, 0, CAST(N'2017-07-20 11:19:54.973' AS DateTime), NULL, NULL, N'Analisis clinica: Preuba', 1, CAST(N'2017-07-20 11:19:54.973' AS DateTime), NULL, NULL, 0, N'R-001000005', N'Receta Analisis Clínico', N'Primera Paciente apellido  Receta Analisis Clínico')
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 1, 1, 1, CAST(N'2017-07-19 23:42:26.323' AS DateTime), NULL, NULL, N'Imagenes:', 1, CAST(N'2017-07-19 23:42:26.327' AS DateTime), 1, CAST(N'2017-07-20 11:18:41.133' AS DateTime), 0, N'CR-001000001', N'Receta Imagenes', N'Primera Paciente apellido  Receta Imagenes')
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 1, 1, 2, CAST(N'2017-07-20 12:56:53.817' AS DateTime), N'', N'', N'Analisis clinica:

Imagenes:', 1, CAST(N'2017-07-20 12:56:53.817' AS DateTime), 1, CAST(N'2017-07-20 12:57:22.583' AS DateTime), 0, N'CR-001000006', N'Receta Mezclada', NULL)
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 1, 1, 3, CAST(N'2017-07-20 16:38:30.377' AS DateTime), N'', N'', N'Analisis clinica:', 1, CAST(N'2017-07-20 16:38:30.377' AS DateTime), 1, CAST(N'2017-08-07 19:14:53.670' AS DateTime), 0, N'CR-001000011', N'Receta Analisis Clínico', NULL)
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 1, 2, 0, CAST(N'2017-07-20 13:07:50.523' AS DateTime), NULL, NULL, N'Analisis clinica:

analisi 2:

Imagenes:', 1, CAST(N'2017-07-20 13:07:50.523' AS DateTime), 1, CAST(N'2017-07-20 13:08:18.523' AS DateTime), 0, N'R-001000010', N'Receta Imagenes', N'Primera Paciente apellido  Receta Imagenes')
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 1, 2, 1, CAST(N'2017-07-19 23:42:26.337' AS DateTime), N'', N'', N'Medicamento: Medicamento
Dosificación:
Duración:', 1, CAST(N'2017-07-19 23:42:26.337' AS DateTime), 1, CAST(N'2017-07-20 09:42:36.153' AS DateTime), 0, N'CR-001000002', N'Receta de Medicamentos', NULL)
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 1, 2, 2, CAST(N'2017-07-20 12:56:53.837' AS DateTime), N'', N'', N'Imagenes:', 1, CAST(N'2017-07-20 12:56:53.837' AS DateTime), 1, CAST(N'2017-07-20 12:57:22.530' AS DateTime), 0, N'CR-001000007', N'Receta Imagenes', NULL)
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 1, 2, 3, CAST(N'2017-07-25 21:18:34.323' AS DateTime), NULL, NULL, N'analisi 2:                                                                                                                                                                        



\tAnalisis clinica:', 1, CAST(N'2017-07-25 21:18:34.323' AS DateTime), 1, CAST(N'2017-09-25 09:26:56.267' AS DateTime), 0, N'CR-001000012', N'Receta Analisis Clínico', N'Primera Paciente MODI apellido  Receta Analisis Clínico')
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 1, 3, 0, CAST(N'2017-07-31 19:31:25.820' AS DateTime), NULL, NULL, N'Analisis clinica:', 1, CAST(N'2017-07-31 19:31:25.820' AS DateTime), 1, CAST(N'2017-07-31 19:31:46.867' AS DateTime), 1, N'R-001000013', N'Receta Analisis Clínico', N'Primera Paciente apellido  Receta Analisis Clínico')
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 1, 3, 1, CAST(N'2017-07-19 23:42:26.340' AS DateTime), NULL, NULL, N'Analisis clinica:', 1, CAST(N'2017-07-19 23:42:26.340' AS DateTime), 1, CAST(N'2017-07-20 10:27:35.487' AS DateTime), 0, N'CR-001000003', N'Receta Analisis Clínico', N'Primera Paciente apellido  Receta Analisis Clínico')
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 1, 3, 2, CAST(N'2017-07-20 12:56:53.837' AS DateTime), N'', N'', N'Medicamento: Medicamento
Dosificación:
Duración:', 1, CAST(N'2017-07-20 12:56:53.837' AS DateTime), 1, CAST(N'2017-07-20 12:57:22.473' AS DateTime), 0, N'CR-001000008', N'Receta Medicamentos', NULL)
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 1, 3, 3, CAST(N'2017-08-07 19:14:53.500' AS DateTime), NULL, NULL, N'PROSTATA:', 1, CAST(N'2017-08-07 19:14:53.500' AS DateTime), 1, CAST(N'2017-09-11 23:30:08.507' AS DateTime), 0, N'CR-001000014', N'Receta Analisis Clínico', N'Primera Paciente MODI apellido  Receta Analisis Clínico')
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 1, 4, 0, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, NULL, N'Analisis clinica: Preuraba 
otrasd

pretdad', 1, CAST(N'2017-09-26 20:12:08.293' AS DateTime), 1, CAST(N'2017-09-26 21:27:30.950' AS DateTime), 0, N'R-001000015', N'Receta Analisis Clínico', N'Primera Paciente MODI apellido  Receta Analisis Clínico')
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 1, 4, 1, CAST(N'2017-07-20 08:49:31.040' AS DateTime), NULL, NULL, N'Analisis clinica:

Medicamento: Medicamento
Dosificación:
Duración:

Imagenes:

Analisis clinica:', 1, CAST(N'2017-07-20 08:49:31.040' AS DateTime), 1, CAST(N'2017-07-20 10:27:22.243' AS DateTime), 0, N'CR-001000004', N'Receta Mezclada', N'Primera Paciente apellido  Receta Mezclada')
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 1, 4, 2, CAST(N'2017-07-20 12:56:53.843' AS DateTime), N'', N'', N'Analisis clinica:', 1, CAST(N'2017-07-20 12:56:53.843' AS DateTime), 1, CAST(N'2017-07-20 12:57:22.357' AS DateTime), 0, N'CR-001000009', N'Receta Analisis Clínico', NULL)
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 2, 1, 0, CAST(N'2017-09-25 00:00:00.000' AS DateTime), NULL, NULL, N'Imagenes:trad', 1, CAST(N'2017-09-26 21:21:01.840' AS DateTime), 1, CAST(N'2017-09-26 21:27:11.180' AS DateTime), 0, N'R-001000016', N'Receta Imagenes', N'Maria petra  Receta Imagenes')
INSERT [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk], [ReceFecha], [ReceInstruccionesFarmacia], [ReceInstruccionesAlPaciente], [ReceComentario], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado], [RecCodigo], [RecNombre], [RecSinConsultaNombre]) VALUES (1, 1, 1, 1, 2, 2, 0, CAST(N'2017-09-01 00:00:00.000' AS DateTime), NULL, NULL, N'Medicamento: Medicamento
Dosificación:
Duración:', 1, CAST(N'2017-09-26 21:28:03.827' AS DateTime), NULL, NULL, 0, N'R-001000017', N'Receta Medicamentos', N'Maria petra  Receta Medicamentos')
INSERT [dbo].[Role] ([RoleSecuencia], [RoleDescripcion], [UsuaSecuencia], [RoleFechaCreacion], [UsuaSecuenciaModificacion], [RoleFechaModificacion], [EstaDesabilitado]) VALUES (1, N'Admin', 3, NULL, NULL, NULL, 0)
INSERT [dbo].[Role] ([RoleSecuencia], [RoleDescripcion], [UsuaSecuencia], [RoleFechaCreacion], [UsuaSecuenciaModificacion], [RoleFechaModificacion], [EstaDesabilitado]) VALUES (2, N'Doctor', 3, CAST(N'2017-03-06 14:54:18.100' AS DateTime), NULL, CAST(N'2017-03-06 14:54:18.100' AS DateTime), 0)
INSERT [dbo].[Role] ([RoleSecuencia], [RoleDescripcion], [UsuaSecuencia], [RoleFechaCreacion], [UsuaSecuenciaModificacion], [RoleFechaModificacion], [EstaDesabilitado]) VALUES (3, N'Secretaria', 3, CAST(N'2017-03-09 10:16:30.357' AS DateTime), NULL, CAST(N'2017-03-09 10:16:30.357' AS DateTime), 0)
INSERT [dbo].[Role] ([RoleSecuencia], [RoleDescripcion], [UsuaSecuencia], [RoleFechaCreacion], [UsuaSecuenciaModificacion], [RoleFechaModificacion], [EstaDesabilitado]) VALUES (4, N'Doctor_Suplente', 3, CAST(N'2017-03-17 14:42:53.627' AS DateTime), NULL, CAST(N'2017-03-17 14:42:53.627' AS DateTime), 1)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 2, 1, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, 3, 2, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 1, 2, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 2, 2, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 2, 3, 21, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 3, 1, 3, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 3, 2, 3, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 3, 3, 9, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 4, 1, 4, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 4, 2, 9, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 5, 1, 5, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 5, 2, 10, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 6, 1, 6, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 6, 2, 15, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 7, 1, 7, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 7, 2, 17, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 8, 1, 8, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 8, 2, 22, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 9, 1, 9, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 9, 2, 24, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 10, 1, 10, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 10, 2, 27, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 11, 1, 11, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 11, 2, 39, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 12, 1, 13, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 12, 2, 40, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 13, 1, 14, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 13, 2, 41, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 14, 1, 15, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 14, 2, 46, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 15, 1, 16, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 15, 2, 47, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 16, 1, 17, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 16, 2, 48, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 17, 1, 18, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 17, 2, 49, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 18, 1, 19, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 18, 2, 21, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 19, 1, 20, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 20, 1, 21, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 21, 1, 22, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 22, 1, 23, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 23, 1, 24, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 24, 1, 25, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 25, 1, 26, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 26, 1, 27, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 27, 1, 28, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 28, 1, 29, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 29, 1, 30, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 30, 1, 31, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 31, 1, 32, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 32, 1, 33, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 33, 1, 34, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 34, 1, 35, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 35, 1, 36, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 36, 1, 38, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 37, 1, 39, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 38, 1, 40, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 39, 1, 41, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 40, 1, 42, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 41, 1, 43, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 42, 1, 44, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 44, 1, 46, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 45, 1, 47, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 46, 1, 48, 1, 0)
INSERT [dbo].[RolFormularios] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [RFSecuencia], [RoleSecuencia_fk], [FormSecuencia_fk], [PlanSecuencia_fk], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 47, 1, 49, 1, 0)
INSERT [dbo].[TipoDocumento] ([TDSecuencia], [TDDocumento]) VALUES (1, N'Cedula')
INSERT [dbo].[TipoDocumento] ([TDSecuencia], [TDDocumento]) VALUES (2, N'Pasaporte')
INSERT [dbo].[TipoFormulario] ([TFormSecuencia], [TFormDescripcion]) VALUES (1, N'Formulario')
INSERT [dbo].[TipoFormulario] ([TFormSecuencia], [TFormDescripcion]) VALUES (2, N'Menu')
INSERT [dbo].[Tratamiento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TratSecuencia], [TratCodigo], [TratNombre], [TratDescripcion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, NULL, N'Tratamiento', NULL, 0)
INSERT [dbo].[Tratamiento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TratSecuencia], [TratCodigo], [TratNombre], [TratDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 1, NULL, N'MELOXIL', NULL, 0)
INSERT [dbo].[Tratamiento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TratSecuencia], [TratCodigo], [TratNombre], [TratDescripcion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 2, NULL, N'AZICURE', NULL, 0)
INSERT [dbo].[Usuario] ([UsuaSecuencia], [UsuaEmail], [UsuaClave], [UsuaNombre], [UsuaApellido], [UsuaFechaNacimiento], [UsuaGenero], [RoleSecuencia_fk], [UsuaIntentos], [PaisSecuencia], [PlanSecuencia_fk], [EspeSecuencia_fk], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (1, N'admin@gmail.com', N'Admin7@gmail.com', N'Admin', N'Apellido Admin', NULL, NULL, 1, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Usuario] ([UsuaSecuencia], [UsuaEmail], [UsuaClave], [UsuaNombre], [UsuaApellido], [UsuaFechaNacimiento], [UsuaGenero], [RoleSecuencia_fk], [UsuaIntentos], [PaisSecuencia], [PlanSecuencia_fk], [EspeSecuencia_fk], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (2, N'melbainfante@hotmail.com', N'Melba2206', N'Melba', N'Infante Brito', NULL, NULL, 2, 0, 1, 4, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Usuario] ([UsuaSecuencia], [UsuaEmail], [UsuaClave], [UsuaNombre], [UsuaApellido], [UsuaFechaNacimiento], [UsuaGenero], [RoleSecuencia_fk], [UsuaIntentos], [PaisSecuencia], [PlanSecuencia_fk], [EspeSecuencia_fk], [UsuaSecuenciaCreacion], [UsuaFechaCreacion], [UsuaSecuenciaModificacion], [UsuaFechaModificacion], [EstaDesabilitado]) VALUES (3, N'yocelin@hotmail.com', N'Yocelin0001', N'YOCELIN ', N'CID', CAST(N'2017-07-16 00:00:00.000' AS DateTime), N'Femenino', 3, 0, 1, 4, NULL, 2, CAST(N'2017-07-16 12:46:00.783' AS DateTime), 2, NULL, 0)
INSERT [dbo].[UsuarioConsultorio] ([UsuaSecuencia_fk], [ConsSecuencia_fk], [clinSecuencia_fk], [PaisSecuencia_fk], [UConsSecuencia], [clinRazonSocial], [ConsCodigo], [ConsDescripcion], [UsuaSecuenciaCreacion], [UConsFechaCreacion], [UsuaSecuenciaModificacion], [UConsFechaModificacion], [EstaDesabilitado]) VALUES (1, 1, 1, 1, 1, N'Abel Gonzales  Edificio Prof. ', N'Segundo Nivel', N'', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[UsuarioConsultorio] ([UsuaSecuencia_fk], [ConsSecuencia_fk], [clinSecuencia_fk], [PaisSecuencia_fk], [UConsSecuencia], [clinRazonSocial], [ConsCodigo], [ConsDescripcion], [UsuaSecuenciaCreacion], [UConsFechaCreacion], [UsuaSecuenciaModificacion], [UConsFechaModificacion], [EstaDesabilitado]) VALUES (2, 1, 1, 1, 2, N'Abel Gonzales Edificio Prof. ', N'Primer Nivel', N'', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[UsuarioConsultorio] ([UsuaSecuencia_fk], [ConsSecuencia_fk], [clinSecuencia_fk], [PaisSecuencia_fk], [UConsSecuencia], [clinRazonSocial], [ConsCodigo], [ConsDescripcion], [UsuaSecuenciaCreacion], [UConsFechaCreacion], [UsuaSecuenciaModificacion], [UConsFechaModificacion], [EstaDesabilitado]) VALUES (3, 1, 2, 1, 1, N'Abreu', N'Primer Nivel', N'', 2, CAST(N'2017-07-16 12:46:00.830' AS DateTime), 2, NULL, 0)
INSERT [dbo].[Vacunas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [VacuSecuencia], [VacuNombre], [AEdadAnio], [AEdadMeses], [AEdadDias]) VALUES (1, 1, 1, 1, 1, N'nomb', NULL, NULL, NULL)
/****** Object:  Index [Unique_HorariosDiaTrabajo]    Script Date: 09/28/2017 8:12:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_HorariosDiaTrabajo] ON [dbo].[HorarioTrabajo]
(
	[HTrabSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Unique_TipoIndicacion]    Script Date: 09/28/2017 8:12:21 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_TipoIndicacion] ON [dbo].[TipoIndicacion]
(
	[TIndiSecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArchivosPaciente]  WITH CHECK ADD  CONSTRAINT [FK_ArchivosPaciente_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [dbo].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [dbo].[ArchivosPaciente] CHECK CONSTRAINT [FK_ArchivosPaciente_Doctor]
GO
ALTER TABLE [dbo].[ArchivosPaciente]  WITH CHECK ADD  CONSTRAINT [FK_ArchivosPaciente_Paciente] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk])
REFERENCES [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia])
GO
ALTER TABLE [dbo].[ArchivosPaciente] CHECK CONSTRAINT [FK_ArchivosPaciente_Paciente]
GO
ALTER TABLE [dbo].[ArchivosPaciente]  WITH CHECK ADD  CONSTRAINT [FK_ArchivosPaciente_TipoArchivoPaciente] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TAPaciSecuencia_fk])
REFERENCES [dbo].[TipoArchivoPaciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TAPaciSecuencia])
GO
ALTER TABLE [dbo].[ArchivosPaciente] CHECK CONSTRAINT [FK_ArchivosPaciente_TipoArchivoPaciente]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [dbo].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Doctor]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Paciente] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk])
REFERENCES [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Paciente]
GO
ALTER TABLE [dbo].[Clinica]  WITH CHECK ADD  CONSTRAINT [FK_Clinica_Pais] FOREIGN KEY([PaisSecuencia_fk])
REFERENCES [dbo].[Pais] ([PaisSecuencia])
GO
ALTER TABLE [dbo].[Clinica] CHECK CONSTRAINT [FK_Clinica_Pais]
GO
ALTER TABLE [dbo].[ConsultaMedica]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedica_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [dbo].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedica] CHECK CONSTRAINT [FK_ConsultaMedica_Doctor]
GO
ALTER TABLE [dbo].[ConsultaMedica]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedica_Paciente] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk])
REFERENCES [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedica] CHECK CONSTRAINT [FK_ConsultaMedica_Paciente]
GO
ALTER TABLE [dbo].[ConsultaMedicaCirugia]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaCirugia_Cirugia] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [CiruSecuencia_fk])
REFERENCES [dbo].[Cirugia] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [CiruSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedicaCirugia] CHECK CONSTRAINT [FK_ConsultaMedicaCirugia_Cirugia]
GO
ALTER TABLE [dbo].[ConsultaMedicaCirugia]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaCirugia_ConsultaMedica] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMediSecuencia_fk])
REFERENCES [dbo].[ConsultaMedica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMediSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedicaCirugia] CHECK CONSTRAINT [FK_ConsultaMedicaCirugia_ConsultaMedica]
GO
ALTER TABLE [dbo].[ConsultaMedicaEnfermeda]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaEnfermeda_ConsultaMedica] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMediSecuencia_fk])
REFERENCES [dbo].[ConsultaMedica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [clinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMediSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedicaEnfermeda] CHECK CONSTRAINT [FK_ConsultaMedicaEnfermeda_ConsultaMedica]
GO
ALTER TABLE [dbo].[ConsultaMedicaEnfermeda]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaEnfermeda_Enfermedad] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EnfeSecuencia_fk])
REFERENCES [dbo].[Enfermedad] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EnfeSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedicaEnfermeda] CHECK CONSTRAINT [FK_ConsultaMedicaEnfermeda_Enfermedad]
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorial]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaHistorial_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [dbo].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorial] CHECK CONSTRAINT [FK_ConsultaMedicaHistorial_Doctor]
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorial]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaHistorial_Paciente] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk])
REFERENCES [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorial] CHECK CONSTRAINT [FK_ConsultaMedicaHistorial_Paciente]
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialDiagnostico]  WITH CHECK ADD  CONSTRAINT [FK_ConsultorioMedicoHistorialDiagnostico_ConsultaMedicaHistorial] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk])
REFERENCES [dbo].[ConsultaMedicaHistorial] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialDiagnostico] CHECK CONSTRAINT [FK_ConsultorioMedicoHistorialDiagnostico_ConsultaMedicaHistorial]
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialDiagnostico]  WITH CHECK ADD  CONSTRAINT [FK_ConsultorioMedicoHistorialDiagnostico_Diagnostico] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DiagSecuencia])
REFERENCES [dbo].[Diagnostico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DiagSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialDiagnostico] CHECK CONSTRAINT [FK_ConsultorioMedicoHistorialDiagnostico_Diagnostico]
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialEnfermeda]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaHistorialEnfermeda_Enfermedad] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EnfeSecuencia_fk])
REFERENCES [dbo].[Enfermedad] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EnfeSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialEnfermeda] CHECK CONSTRAINT [FK_ConsultaMedicaHistorialEnfermeda_Enfermedad]
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialEvaluacionFisica]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaHistorialEvaluacionFisica_ConsultaMedicaHistorial] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk])
REFERENCES [dbo].[ConsultaMedicaHistorial] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialEvaluacionFisica] CHECK CONSTRAINT [FK_ConsultaMedicaHistorialEvaluacionFisica_ConsultaMedicaHistorial]
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialEvaluacionFisica]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaHistorialEvaluacionFisica_EvaluacionFisica] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia_fk])
REFERENCES [dbo].[EvaluacionFisica] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [EFisiSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialEvaluacionFisica] CHECK CONSTRAINT [FK_ConsultaMedicaHistorialEvaluacionFisica_EvaluacionFisica]
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialMotivoConsulta]  WITH CHECK ADD  CONSTRAINT [FK_ConsultorioMedicoHistorialMotivoConsulta_ConsultaMedicaHistorial] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk])
REFERENCES [dbo].[ConsultaMedicaHistorial] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialMotivoConsulta] CHECK CONSTRAINT [FK_ConsultorioMedicoHistorialMotivoConsulta_ConsultaMedicaHistorial]
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialMotivoConsulta]  WITH CHECK ADD  CONSTRAINT [FK_ConsultorioMedicoHistorialMotivoConsulta_MotivoConsulta] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MConsSecuencia_fk])
REFERENCES [dbo].[MotivoConsulta] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MConsSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialMotivoConsulta] CHECK CONSTRAINT [FK_ConsultorioMedicoHistorialMotivoConsulta_MotivoConsulta]
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialTratamiento]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaHistorialTratamiento_ConsultaMedicaHistorial] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia_fk])
REFERENCES [dbo].[ConsultaMedicaHistorial] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [CMHistSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialTratamiento] CHECK CONSTRAINT [FK_ConsultaMedicaHistorialTratamiento_ConsultaMedicaHistorial]
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialTratamiento]  WITH CHECK ADD  CONSTRAINT [FK_ConsultaMedicaHistorialTratamiento_Tratamiento] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TratSecuencia_fk])
REFERENCES [dbo].[Tratamiento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TratSecuencia])
GO
ALTER TABLE [dbo].[ConsultaMedicaHistorialTratamiento] CHECK CONSTRAINT [FK_ConsultaMedicaHistorialTratamiento_Tratamiento]
GO
ALTER TABLE [dbo].[Consultorio]  WITH CHECK ADD  CONSTRAINT [FK_Consultorio_Clinica2] FOREIGN KEY([ClinSecuencia_fk], [PaisSecuencia_fk])
REFERENCES [dbo].[Clinica] ([clinSecuencia], [PaisSecuencia_fk])
GO
ALTER TABLE [dbo].[Consultorio] CHECK CONSTRAINT [FK_Consultorio_Clinica2]
GO
ALTER TABLE [dbo].[Consultorio]  WITH CHECK ADD  CONSTRAINT [FK_Consultorio_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [dbo].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [dbo].[Consultorio] CHECK CONSTRAINT [FK_Consultorio_Doctor]
GO
ALTER TABLE [dbo].[Consultorio]  WITH CHECK ADD  CONSTRAINT [FK_Consultorio_Pais] FOREIGN KEY([PaisSecuencia_fk])
REFERENCES [dbo].[Pais] ([PaisSecuencia])
GO
ALTER TABLE [dbo].[Consultorio] CHECK CONSTRAINT [FK_Consultorio_Pais]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Especialidades] FOREIGN KEY([EspeSecuencia])
REFERENCES [dbo].[Especialidades] ([EspeSecuencia])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Especialidades]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Usuario] FOREIGN KEY([UsuSecuencia])
REFERENCES [dbo].[Usuario] ([UsuaSecuencia])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Usuario]
GO
ALTER TABLE [dbo].[EspecialidadFormularioCampos]  WITH CHECK ADD  CONSTRAINT [FK_EspecialidadFormularioCampos_Especialidades] FOREIGN KEY([EspeSecuencia_fk])
REFERENCES [dbo].[Especialidades] ([EspeSecuencia])
GO
ALTER TABLE [dbo].[EspecialidadFormularioCampos] CHECK CONSTRAINT [FK_EspecialidadFormularioCampos_Especialidades]
GO
ALTER TABLE [dbo].[EspecialidadFormularioCampos]  WITH CHECK ADD  CONSTRAINT [FK_EspecialidadFormularioCampos_FormularioCampos] FOREIGN KEY([FCampSecuencia_fk])
REFERENCES [dbo].[FormularioCampos] ([FCampSecuencia])
GO
ALTER TABLE [dbo].[EspecialidadFormularioCampos] CHECK CONSTRAINT [FK_EspecialidadFormularioCampos_FormularioCampos]
GO
ALTER TABLE [dbo].[EspecialidadFormularioCampos]  WITH CHECK ADD  CONSTRAINT [FK_EspecialidadFormularioCampos_Formularios] FOREIGN KEY([FormSecuencia_fk])
REFERENCES [dbo].[Formularios] ([FormSecuencia])
GO
ALTER TABLE [dbo].[EspecialidadFormularioCampos] CHECK CONSTRAINT [FK_EspecialidadFormularioCampos_Formularios]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_FacturaEstado] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [FEstaSecuencia_fk])
REFERENCES [dbo].[FacturaEstado] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [FEstaSecuencia])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_FacturaEstado]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Personal] FOREIGN KEY([DoctSecuencia_fk], [PersSecuencia_fk])
REFERENCES [dbo].[Personal] ([DoctSecuencia_fk], [PersSecuencia])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Personal]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_TipoPago] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TPagoSecuencia_fk])
REFERENCES [dbo].[TipoPago] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [TPagoSecuencia])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_TipoPago]
GO
ALTER TABLE [dbo].[FacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalle_Factura] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [FactSecuencia])
REFERENCES [dbo].[Factura] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [FactSecuencia])
GO
ALTER TABLE [dbo].[FacturaDetalle] CHECK CONSTRAINT [FK_FacturaDetalle_Factura]
GO
ALTER TABLE [dbo].[FacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturaDetalle_Procedimientos] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [ProcSecuencia_fk])
REFERENCES [dbo].[Procedimientos] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [ProcSecuencia])
GO
ALTER TABLE [dbo].[FacturaDetalle] CHECK CONSTRAINT [FK_FacturaDetalle_Procedimientos]
GO
ALTER TABLE [dbo].[Formularios]  WITH CHECK ADD  CONSTRAINT [FK_Formularios_TipoFormulario] FOREIGN KEY([TFormSecuencia_fk])
REFERENCES [dbo].[TipoFormulario] ([TFormSecuencia])
GO
ALTER TABLE [dbo].[Formularios] CHECK CONSTRAINT [FK_Formularios_TipoFormulario]
GO
ALTER TABLE [dbo].[HorarioTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_HorarioTrabajo_Clinica] FOREIGN KEY([ClinSecuencia_fk], [PaisSecuencia_fk])
REFERENCES [dbo].[Clinica] ([clinSecuencia], [PaisSecuencia_fk])
GO
ALTER TABLE [dbo].[HorarioTrabajo] CHECK CONSTRAINT [FK_HorarioTrabajo_Clinica]
GO
ALTER TABLE [dbo].[HorarioTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_HorarioTrabajo_Consultorio] FOREIGN KEY([DoctSecuencia_fk], [ConsSecuencia_fk])
REFERENCES [dbo].[Consultorio] ([DoctSecuencia_fk], [ConsSecuencia])
GO
ALTER TABLE [dbo].[HorarioTrabajo] CHECK CONSTRAINT [FK_HorarioTrabajo_Consultorio]
GO
ALTER TABLE [dbo].[HorarioTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_HorarioTrabajo_DiasSemana] FOREIGN KEY([DSemaSecuencia_Fk])
REFERENCES [dbo].[DiasSemana] ([DSemaSecuencia])
GO
ALTER TABLE [dbo].[HorarioTrabajo] CHECK CONSTRAINT [FK_HorarioTrabajo_DiasSemana]
GO
ALTER TABLE [dbo].[HorarioTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_HorarioTrabajo_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [dbo].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [dbo].[HorarioTrabajo] CHECK CONSTRAINT [FK_HorarioTrabajo_Doctor]
GO
ALTER TABLE [dbo].[HorarioTrabajoDestalle]  WITH CHECK ADD  CONSTRAINT [FK_HorarioTrabajoDestalle_HorarioTrabajo] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DSemaSecuencia_Fk])
REFERENCES [dbo].[HorarioTrabajo] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [DSemaSecuencia_Fk])
GO
ALTER TABLE [dbo].[HorarioTrabajoDestalle] CHECK CONSTRAINT [FK_HorarioTrabajoDestalle_HorarioTrabajo]
GO
ALTER TABLE [dbo].[ImagenDoctor]  WITH CHECK ADD  CONSTRAINT [FK_ImagenDoctor_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [dbo].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [dbo].[ImagenDoctor] CHECK CONSTRAINT [FK_ImagenDoctor_Doctor]
GO
ALTER TABLE [dbo].[InstitucionAseguradoraPlanes]  WITH CHECK ADD  CONSTRAINT [FK_InstitucionAseguradoraPlanes_InstitucionesAseguradoras] FOREIGN KEY([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia])
REFERENCES [dbo].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia])
GO
ALTER TABLE [dbo].[InstitucionAseguradoraPlanes] CHECK CONSTRAINT [FK_InstitucionAseguradoraPlanes_InstitucionesAseguradoras]
GO
ALTER TABLE [dbo].[InstitucionesAseguradoras]  WITH CHECK ADD  CONSTRAINT [FK_InstitucionesAseguradoras_Doctor] FOREIGN KEY([DoctSecuencia])
REFERENCES [dbo].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [dbo].[InstitucionesAseguradoras] CHECK CONSTRAINT [FK_InstitucionesAseguradoras_Doctor]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [dbo].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Doctor]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_InstitucionAseguradoraPlanes] FOREIGN KEY([DoctSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [IAsegSecuencia], [IAPlanSecuencia])
REFERENCES [dbo].[InstitucionAseguradoraPlanes] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia], [IAPlanSecuencia])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_InstitucionAseguradoraPlanes]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_InstitucionesAseguradoras1] FOREIGN KEY([DoctSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [IAsegSecuencia])
REFERENCES [dbo].[InstitucionesAseguradoras] ([DoctSecuencia], [ClinSecuencia], [ConsSecuencia], [IAsegSecuencia])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_InstitucionesAseguradoras1]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Pais] FOREIGN KEY([PaisSecuencia_fk])
REFERENCES [dbo].[Pais] ([PaisSecuencia])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Pais]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_TipoDocumento] FOREIGN KEY([TDSecuencia])
REFERENCES [dbo].[TipoDocumento] ([TDSecuencia])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_TipoDocumento]
GO
ALTER TABLE [dbo].[PacienteFoto]  WITH CHECK ADD  CONSTRAINT [FK_PacienteFoto_Paciente] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia])
REFERENCES [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia])
GO
ALTER TABLE [dbo].[PacienteFoto] CHECK CONSTRAINT [FK_PacienteFoto_Paciente]
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Pais] FOREIGN KEY([PaisSecuencia_fk])
REFERENCES [dbo].[Pais] ([PaisSecuencia])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_Pais]
GO
ALTER TABLE [dbo].[Planes]  WITH CHECK ADD  CONSTRAINT [FK_Planes_Moneda] FOREIGN KEY([MoneSecuencia_fk])
REFERENCES [dbo].[Moneda] ([MoneSecuencia])
GO
ALTER TABLE [dbo].[Planes] CHECK CONSTRAINT [FK_Planes_Moneda]
GO
ALTER TABLE [dbo].[PlanFactura]  WITH CHECK ADD  CONSTRAINT [FK_PlanFactura_Usuario] FOREIGN KEY([UsuSecuencia])
REFERENCES [dbo].[Usuario] ([UsuaSecuencia])
GO
ALTER TABLE [dbo].[PlanFactura] CHECK CONSTRAINT [FK_PlanFactura_Usuario]
GO
ALTER TABLE [dbo].[PlanFacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PlanFacturaDetalle_Planes] FOREIGN KEY([PlanSecuencia_fk])
REFERENCES [dbo].[Planes] ([PlanSecuencia])
GO
ALTER TABLE [dbo].[PlanFacturaDetalle] CHECK CONSTRAINT [FK_PlanFacturaDetalle_Planes]
GO
ALTER TABLE [dbo].[PlanFacturaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_PlanFacturaDetalle_PlanFactura] FOREIGN KEY([UsuSecuencia], [PFactSecuencia])
REFERENCES [dbo].[PlanFactura] ([UsuSecuencia], [PFactSecuencia])
GO
ALTER TABLE [dbo].[PlanFacturaDetalle] CHECK CONSTRAINT [FK_PlanFacturaDetalle_PlanFactura]
GO
ALTER TABLE [dbo].[Procedimientos]  WITH CHECK ADD  CONSTRAINT [FK_Procedimientos_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [dbo].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [dbo].[Procedimientos] CHECK CONSTRAINT [FK_Procedimientos_Doctor]
GO
ALTER TABLE [dbo].[Procedimientos]  WITH CHECK ADD  CONSTRAINT [FK_Procedimientos_Moneda] FOREIGN KEY([MoneSecuencia_fk])
REFERENCES [dbo].[Moneda] ([MoneSecuencia])
GO
ALTER TABLE [dbo].[Procedimientos] CHECK CONSTRAINT [FK_Procedimientos_Moneda]
GO
ALTER TABLE [dbo].[RecetaAnalisisClinico]  WITH CHECK ADD  CONSTRAINT [FK_RecetaAnalisisClinico_AnalisisClinico] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [AClinSecuencia_fk])
REFERENCES [dbo].[AnalisisClinico] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [AClinSecuencia])
GO
ALTER TABLE [dbo].[RecetaAnalisisClinico] CHECK CONSTRAINT [FK_RecetaAnalisisClinico_AnalisisClinico]
GO
ALTER TABLE [dbo].[RecetaAnalisisClinico]  WITH CHECK ADD  CONSTRAINT [FK_RecetaAnalisisClinico_Recetas] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [CMHistSecuencia_fk])
REFERENCES [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk])
GO
ALTER TABLE [dbo].[RecetaAnalisisClinico] CHECK CONSTRAINT [FK_RecetaAnalisisClinico_Recetas]
GO
ALTER TABLE [dbo].[RecetaImagenes]  WITH CHECK ADD  CONSTRAINT [FK_RecetaImagenes_Imagenes] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [ImagSecuencia_fk])
REFERENCES [dbo].[Imagenes] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [ImagSecuencia])
GO
ALTER TABLE [dbo].[RecetaImagenes] CHECK CONSTRAINT [FK_RecetaImagenes_Imagenes]
GO
ALTER TABLE [dbo].[RecetaImagenes]  WITH CHECK ADD  CONSTRAINT [FK_RecetaImagenes_Recetas] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [CMHistSecuencia_fk])
REFERENCES [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk])
GO
ALTER TABLE [dbo].[RecetaImagenes] CHECK CONSTRAINT [FK_RecetaImagenes_Recetas]
GO
ALTER TABLE [dbo].[RecetaMedicamentos]  WITH CHECK ADD  CONSTRAINT [FK_RecetaMedicamentos_Medicamento] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MediSecuencia_fk])
REFERENCES [dbo].[Medicamento] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [MediSecuencia])
GO
ALTER TABLE [dbo].[RecetaMedicamentos] CHECK CONSTRAINT [FK_RecetaMedicamentos_Medicamento]
GO
ALTER TABLE [dbo].[RecetaMedicamentos]  WITH CHECK ADD  CONSTRAINT [FK_RecetaMedicamentos_Recetas] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [CMHistSecuencia_fk])
REFERENCES [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk])
GO
ALTER TABLE [dbo].[RecetaMedicamentos] CHECK CONSTRAINT [FK_RecetaMedicamentos_Recetas]
GO
ALTER TABLE [dbo].[RecetaPacienteVacunas]  WITH CHECK ADD  CONSTRAINT [FK_RecetaPacienteVacunas_Recetas] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia_fk], [CMHistSecuencia_fk])
REFERENCES [dbo].[Recetas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk], [ReceSecuencia], [CMHistSecuencia_fk])
GO
ALTER TABLE [dbo].[RecetaPacienteVacunas] CHECK CONSTRAINT [FK_RecetaPacienteVacunas_Recetas]
GO
ALTER TABLE [dbo].[RecetaPacienteVacunas]  WITH CHECK ADD  CONSTRAINT [FK_RecetaPacienteVacunas_Vacunas] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [VacuSecuencia_fk])
REFERENCES [dbo].[Vacunas] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [VacuSecuencia])
GO
ALTER TABLE [dbo].[RecetaPacienteVacunas] CHECK CONSTRAINT [FK_RecetaPacienteVacunas_Vacunas]
GO
ALTER TABLE [dbo].[Recetas]  WITH CHECK ADD  CONSTRAINT [FK_Recetas_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [dbo].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [dbo].[Recetas] CHECK CONSTRAINT [FK_Recetas_Doctor]
GO
ALTER TABLE [dbo].[Recetas]  WITH CHECK ADD  CONSTRAINT [FK_Recetas_Paciente] FOREIGN KEY([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia_fk])
REFERENCES [dbo].[Paciente] ([DoctSecuencia_fk], [PaisSecuencia_fk], [ClinSecuencia_fk], [ConsSecuencia_fk], [PaciSecuencia])
GO
ALTER TABLE [dbo].[Recetas] CHECK CONSTRAINT [FK_Recetas_Paciente]
GO
ALTER TABLE [dbo].[RolFormularios]  WITH CHECK ADD  CONSTRAINT [FK_RolFormularios_Formularios] FOREIGN KEY([FormSecuencia_fk])
REFERENCES [dbo].[Formularios] ([FormSecuencia])
GO
ALTER TABLE [dbo].[RolFormularios] CHECK CONSTRAINT [FK_RolFormularios_Formularios]
GO
ALTER TABLE [dbo].[TipoArchivoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TipoArchivoPaciente_Doctor] FOREIGN KEY([DoctSecuencia_fk])
REFERENCES [dbo].[Doctor] ([DoctSecuencia])
GO
ALTER TABLE [dbo].[TipoArchivoPaciente] CHECK CONSTRAINT [FK_TipoArchivoPaciente_Doctor]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Especialidades] FOREIGN KEY([EspeSecuencia_fk])
REFERENCES [dbo].[Especialidades] ([EspeSecuencia])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Especialidades]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Planes] FOREIGN KEY([PlanSecuencia_fk])
REFERENCES [dbo].[Planes] ([PlanSecuencia])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Planes]
GO
ALTER TABLE [dbo].[UsuarioConsultorio]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioConsultorio_Usuario] FOREIGN KEY([UsuaSecuencia_fk])
REFERENCES [dbo].[Usuario] ([UsuaSecuencia])
GO
ALTER TABLE [dbo].[UsuarioConsultorio] CHECK CONSTRAINT [FK_UsuarioConsultorio_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[sp_Auditoria]    Script Date: 09/28/2017 8:12:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  procedure [dbo].[sp_Auditoria]
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
  DECLARE @CountMax INT = (SELECT isnull(MAX(AudiSecuencia),0) FROM dbo.Auditoria WITH (TABLOCKX))+1;

    
  INSERT INTO dbo.Auditoria(AudiSecuencia,PaisSecuencia,clinSecuencia,ConsSecuencia,DoctSecuencia,PersSecuencia,TPersSecuencia,AudiFechaMaquina,AudiFechaServidor,AudiValorOriginal,AudiValorNuevo,UsuaCodigo,AudiIpMaquina,PagiSecuencia,TablSecuencia,Accion) 
                     Values (@CountMax,@PaisSecuencia,@clinSecuencia,@ConsSecuencia,@DoctSecuencia,@PersSecuencia,@TPersSecuencia,@AudiFechaMaquina,@AudiFechaServidor,@AudiValorOriginal,@AudiValorNuevo,@UsuaCodigo,@AudiIpMaquina,@PagiSecuencia,@TablSecuencia,@Accisecuencia)
  --SET @Count = SCOPE_IDENTITY();
  select * from dbo.Auditoria where AudiSecuencia=@CountMax;
  COMMIT TRANSACTION;

END TRY
BEGIN CATCH
  IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
  THROW;
END CATCH
END


































































GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insertar las acciones a realizar en los formularios  Leer,Insertar,Modificar,Borrar,Anular,Aplicar,Imprimir' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Acciones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArchivosPaciente', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Esto es para el tipo de archivo del historial del apaciente, osea si es  radigorafia,analisis, cualquiere imagen,' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArchivosPaciente', @level2type=N'COLUMN',@level2name=N'TAPaciSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'para almacenar las imagener, o  analisis realizados por pacientes, u otros .' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ArchivosPaciente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'si es  secretaria, o ayudante' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CategoriaPersonal', @level2type=N'COLUMN',@level2name=N'CPersNombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cita', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Esto es para indicar si esta confirmada la cita.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cita', @level2type=N'COLUMN',@level2name=N'EstadoCita'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsultaMedica', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Menor <9   9-16   16 > mayor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsultaMedica', @level2type=N'COLUMN',@level2name=N'CMediMenarquia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(irregular < 21 -35>)  o (regular 21-35dias)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsultaMedica', @level2type=N'COLUMN',@level2name=N'CMediPatronMenstrual'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2 -7 dias Normal } <2 o 7> anormal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsultaMedica', @level2type=N'COLUMN',@level2name=N'CMediMensutracionDuracion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'en esta tabla se cargaran los datos recojidos en la primera consulta  o cuando se comienza un seguimiento por ejemplo cuando viene envabarazada,etc. consulta del paciente. cuando pase un mes sin ir el paciente se debe de validar estas informaciones, y tambien darle la opcion al doctor de crearla  o modificarla si decea


' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsultaMedica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsultaMedicaEmbarazo', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsultaMedicaHistorial', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cada Vez que vaya a consulta, se guardara  un registro  donde se guardara los dactos en la evaluacion Fisica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsultaMedicaHistorial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsultaMedicaHistorialDiagnostico', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsultaMedicaHistorialMotivoConsulta', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'esta tabla hace la relacion en tre paciente y sus motivos de consulta, como embarazo, dolor en la pelvi, excete.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsultaMedicaHistorialMotivoConsulta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConsultaMedicaHistorialTratamiento', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Secuencia de registro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Consultorio', @level2type=N'COLUMN',@level2name=N'ConsSecuencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Diagnostico', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Secuencia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'DoctSecuencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código Único del Profesional Prestador de Servicios de Salud' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'DoctCUPRE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Documento Nacional de Identidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'DoctDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del doctor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Doctor', @level2type=N'COLUMN',@level2name=N'DoctNombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'esta tabla tiene la relacion entre especialidad del doctor y  formulario con  los campos que son permitido mostrar, acorde a su especialidad.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EspecialidadFormularioCampos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'si esta activa, posponer, cancelar' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EstadoAgenda', @level2type=N'COLUMN',@level2name=N'EAgenEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'estados , aguardando, atendido, en consulta, no compadecio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EstadoAgenda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Factura', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'si es secretaria, uotro paersona' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Factura', @level2type=N'COLUMN',@level2name=N'PersSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacturaDetalle', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacturaEstado', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Campos que se podran ver en un formulario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FormularioCampos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HorarioTrabajo', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'aqui se configura la doctora el horario de trabajo, sino teene nada , a la hora de crear cita, podras introducirce cualquier horario. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HorarioTrabajo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HorarioTrabajoDestalle', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Para guardar la foto del doctor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ImagenDoctor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MotivoConsulta', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'estos son los seguimientos por motivo de consultas digase estar embarazada, ect.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MotivoConsulta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paciente', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cedula o pasaporte  no se pude duplicar tiene unique' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Paciente', @level2type=N'COLUMN',@level2name=N'PaciDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PacienteFoto', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Doctor dueno de este personal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Personal', @level2type=N'COLUMN',@level2name=N'DoctSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Procedimientos', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecetaPacienteVacunas', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Recetas', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RolFormularios', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoArchivoPaciente', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Para definir los tipos de archivos que existiran.  ejemplo tambien los manos critos  anteriores del paciente, como recetas historiales ect.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoArchivoPaciente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'si es consulta, o cirugia, o resultado ver, retorno' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoCompromiso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'si es cedula o pasaporte o otra cosa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoDocumento', @level2type=N'COLUMN',@level2name=N'TDDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'si es cedula, pasaportes u otro documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'formulario, o reporte' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoFormulario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'seran las siguientes, Pruebas Diagnostica, procedimientoMedicos,Mediacmentos, Tecnicas quirurgica.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoIndicacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SI es medicina, o  analitilicas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoIndicacion', @level2type=N'INDEX',@level2name=N'Unique_TipoIndicacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoPago', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Si es tarjega, credito, contado,etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TipoPago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tratamiento', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cutaneo,externo,inalatorio,interno,intra-muscular,intra-venoso,nasal,ocular,renal,oral,sub-cutaneo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UsoMedicamentos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Es un codigo secuencial de la tabla' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UsuarioConsultorio', @level2type=N'COLUMN',@level2name=N'UConsSecuencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pais donde se registro  un paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vacunas', @level2type=N'COLUMN',@level2name=N'PaisSecuencia_fk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'anios de nacido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vacunas', @level2type=N'COLUMN',@level2name=N'AEdadAnio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'meses  de nacido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vacunas', @level2type=N'COLUMN',@level2name=N'AEdadMeses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dias  de nacido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vacunas', @level2type=N'COLUMN',@level2name=N'AEdadDias'
GO
USE [master]
GO
ALTER DATABASE [DB_A1595D_DoctorMedicalWeb] SET  READ_WRITE 
GO
