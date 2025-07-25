USE [BDClinica]
GO
/****** Object:  Table [dbo].[ESPECIALIDADES]    Script Date: 21/7/2025 14:10:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESPECIALIDADES](
	[codEspecialidad_E] [int] IDENTITY(1,1) NOT NULL,
	[nombre_E] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codEspecialidad_E] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HORARIOS]    Script Date: 21/7/2025 14:10:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HORARIOS](
	[legajo_H] [int] NOT NULL,
	[codigo_H] [int] NOT NULL,
	[dia_H] [int] NULL,
	[hora_H] [int] NULL,
	[disponible_H] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[legajo_H] ASC,
	[codigo_H] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOCALIDADES]    Script Date: 21/7/2025 14:10:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOCALIDADES](
	[idLocalidad_L] [int] IDENTITY(1,1) NOT NULL,
	[idProvincia_L] [int] NOT NULL,
	[nombre_L] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LOCALIDADES] PRIMARY KEY CLUSTERED 
(
	[idLocalidad_L] ASC,
	[idProvincia_L] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MEDICOS]    Script Date: 21/7/2025 14:10:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEDICOS](
	[dni_M] [nchar](8) NOT NULL,
	[legajo_M] [int] NULL,
	[codEspecialidad_M] [int] NOT NULL,
	[horario_M] [varchar](100) NULL,
	[estado_M] [bit] NOT NULL,
	[imagen_M] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[dni_M] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PACIENTES]    Script Date: 21/7/2025 14:10:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PACIENTES](
	[dni_PA] [nchar](8) NOT NULL,
	[estado_PA] [bit] NOT NULL,
 CONSTRAINT [PK__PACIENTE__B793055118C28579] PRIMARY KEY CLUSTERED 
(
	[dni_PA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONAS]    Script Date: 21/7/2025 14:10:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONAS](
	[dni_P] [nchar](8) NOT NULL,
	[nombre_P] [varchar](50) NOT NULL,
	[apellido_P] [varchar](50) NOT NULL,
	[sexo_P] [nchar](1) NOT NULL,
	[nacionalidad_P] [varchar](50) NOT NULL,
	[fechaNac_P] [date] NOT NULL,
	[direccion_P] [varchar](50) NOT NULL,
	[idLocalidad_P] [int] NOT NULL,
	[idProvincia_P] [int] NOT NULL,
	[email_P] [varchar](50) NOT NULL,
	[telefono_P] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dni_P] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVINCIAS]    Script Date: 21/7/2025 14:10:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVINCIAS](
	[idProvincia_PROV] [int] IDENTITY(1,1) NOT NULL,
	[nombre_PROV] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idProvincia_PROV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TURNOS]    Script Date: 21/7/2025 14:10:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TURNOS](
	[fecha_T] [datetime] NOT NULL,
	[legajo_T] [int] NOT NULL,
	[asistencia_T] [bit] NOT NULL,
	[dni_T] [nchar](8) NULL,
	[observacion_T] [varchar](100) NULL,
	[cancelado_T] [bit] NULL,
 CONSTRAINT [PK_TURNOS_1] PRIMARY KEY CLUSTERED 
(
	[fecha_T] ASC,
	[legajo_T] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 21/7/2025 14:10:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[username_U] [varchar](20) NOT NULL,
	[password_U] [varchar](20) NOT NULL,
	[email_U] [varchar](50) NULL,
	[tipo_U] [nchar](2) NOT NULL,
	[estado_U] [bit] NULL,
	[imagen_U] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[username_U] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ESPECIALIDADES] ON 

INSERT [dbo].[ESPECIALIDADES] ([codEspecialidad_E], [nombre_E]) VALUES (1, N'Traumatología')
INSERT [dbo].[ESPECIALIDADES] ([codEspecialidad_E], [nombre_E]) VALUES (2, N'Clínico')
INSERT [dbo].[ESPECIALIDADES] ([codEspecialidad_E], [nombre_E]) VALUES (3, N'Cardiología')
INSERT [dbo].[ESPECIALIDADES] ([codEspecialidad_E], [nombre_E]) VALUES (4, N'Neurología')
INSERT [dbo].[ESPECIALIDADES] ([codEspecialidad_E], [nombre_E]) VALUES (5, N'Obstetricia')
INSERT [dbo].[ESPECIALIDADES] ([codEspecialidad_E], [nombre_E]) VALUES (6, N'Dermatología')
INSERT [dbo].[ESPECIALIDADES] ([codEspecialidad_E], [nombre_E]) VALUES (7, N'Endocrinología')
INSERT [dbo].[ESPECIALIDADES] ([codEspecialidad_E], [nombre_E]) VALUES (8, N'Gastroenterología')
INSERT [dbo].[ESPECIALIDADES] ([codEspecialidad_E], [nombre_E]) VALUES (9, N'Oncología')
INSERT [dbo].[ESPECIALIDADES] ([codEspecialidad_E], [nombre_E]) VALUES (10, N'Reumatología')
INSERT [dbo].[ESPECIALIDADES] ([codEspecialidad_E], [nombre_E]) VALUES (11, N'Pediatría')
SET IDENTITY_INSERT [dbo].[ESPECIALIDADES] OFF
GO
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 110, 1, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 111, 1, 11, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 112, 1, 12, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 113, 1, 13, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 114, 1, 14, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 115, 1, 15, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 116, 1, 16, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 117, 1, 17, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 210, 2, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 211, 2, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 212, 2, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 213, 2, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 214, 2, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 215, 2, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 216, 2, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 217, 2, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 310, 3, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 311, 3, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 312, 3, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 313, 3, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 314, 3, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 315, 3, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 316, 3, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 317, 3, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 410, 4, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 411, 4, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 412, 4, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 413, 4, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 414, 4, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 415, 4, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 416, 4, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 417, 4, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 510, 5, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 511, 5, 11, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 512, 5, 12, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 513, 5, 13, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 514, 5, 14, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 515, 5, 15, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 516, 5, 16, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (1, 517, 5, 17, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 110, 1, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 111, 1, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 112, 1, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 113, 1, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 114, 1, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 115, 1, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 116, 1, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 117, 1, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 210, 2, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 211, 2, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 212, 2, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 213, 2, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 214, 2, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 215, 2, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 216, 2, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 217, 2, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 310, 3, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 311, 3, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 312, 3, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 313, 3, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 314, 3, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 315, 3, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 316, 3, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 317, 3, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 410, 4, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 411, 4, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 412, 4, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 413, 4, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 414, 4, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 415, 4, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 416, 4, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 417, 4, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 510, 5, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 511, 5, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 512, 5, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 513, 5, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 514, 5, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 515, 5, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 516, 5, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (2, 517, 5, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 110, 1, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 111, 1, 11, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 112, 1, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 113, 1, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 114, 1, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 115, 1, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 116, 1, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 117, 1, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 210, 2, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 211, 2, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 212, 2, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 213, 2, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 214, 2, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 215, 2, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 216, 2, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 217, 2, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 310, 3, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 311, 3, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 312, 3, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 313, 3, 13, 0)
GO
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 314, 3, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 315, 3, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 316, 3, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 317, 3, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 410, 4, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 411, 4, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 412, 4, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 413, 4, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 414, 4, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 415, 4, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 416, 4, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 417, 4, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 510, 5, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 511, 5, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 512, 5, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 513, 5, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 514, 5, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 515, 5, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 516, 5, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (3, 517, 5, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 110, 1, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 111, 1, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 112, 1, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 113, 1, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 114, 1, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 115, 1, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 116, 1, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 117, 1, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 210, 2, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 211, 2, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 212, 2, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 213, 2, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 214, 2, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 215, 2, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 216, 2, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 217, 2, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 310, 3, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 311, 3, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 312, 3, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 313, 3, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 314, 3, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 315, 3, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 316, 3, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 317, 3, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 410, 4, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 411, 4, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 412, 4, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 413, 4, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 414, 4, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 415, 4, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 416, 4, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 417, 4, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 510, 5, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 511, 5, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 512, 5, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 513, 5, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 514, 5, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 515, 5, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 516, 5, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (4, 517, 5, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 110, 1, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 111, 1, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 112, 1, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 113, 1, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 114, 1, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 115, 1, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 116, 1, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 117, 1, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 210, 2, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 211, 2, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 212, 2, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 213, 2, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 214, 2, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 215, 2, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 216, 2, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 217, 2, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 310, 3, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 311, 3, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 312, 3, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 313, 3, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 314, 3, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 315, 3, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 316, 3, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 317, 3, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 410, 4, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 411, 4, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 412, 4, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 413, 4, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 414, 4, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 415, 4, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 416, 4, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 417, 4, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 510, 5, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 511, 5, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 512, 5, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 513, 5, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 514, 5, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 515, 5, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 516, 5, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (5, 517, 5, 17, 0)
GO
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 110, 1, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 111, 1, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 112, 1, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 113, 1, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 114, 1, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 115, 1, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 116, 1, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 117, 1, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 210, 2, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 211, 2, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 212, 2, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 213, 2, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 214, 2, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 215, 2, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 216, 2, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 217, 2, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 310, 3, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 311, 3, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 312, 3, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 313, 3, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 314, 3, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 315, 3, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 316, 3, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 317, 3, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 410, 4, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 411, 4, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 412, 4, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 413, 4, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 414, 4, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 415, 4, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 416, 4, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 417, 4, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 510, 5, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 511, 5, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 512, 5, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 513, 5, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 514, 5, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 515, 5, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 516, 5, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (6, 517, 5, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 110, 1, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 111, 1, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 112, 1, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 113, 1, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 114, 1, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 115, 1, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 116, 1, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 117, 1, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 210, 2, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 211, 2, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 212, 2, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 213, 2, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 214, 2, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 215, 2, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 216, 2, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 217, 2, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 310, 3, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 311, 3, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 312, 3, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 313, 3, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 314, 3, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 315, 3, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 316, 3, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 317, 3, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 410, 4, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 411, 4, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 412, 4, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 413, 4, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 414, 4, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 415, 4, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 416, 4, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 417, 4, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 510, 5, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 511, 5, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 512, 5, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 513, 5, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 514, 5, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 515, 5, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 516, 5, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (7, 517, 5, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 110, 1, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 111, 1, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 112, 1, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 113, 1, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 114, 1, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 115, 1, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 116, 1, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 117, 1, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 210, 2, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 211, 2, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 212, 2, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 213, 2, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 214, 2, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 215, 2, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 216, 2, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 217, 2, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 310, 3, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 311, 3, 11, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 312, 3, 12, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 313, 3, 13, 1)
GO
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 314, 3, 14, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 315, 3, 15, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 316, 3, 16, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 317, 3, 17, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 410, 4, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 411, 4, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 412, 4, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 413, 4, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 414, 4, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 415, 4, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 416, 4, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 417, 4, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 510, 5, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 511, 5, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 512, 5, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 513, 5, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 514, 5, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 515, 5, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 516, 5, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (8, 517, 5, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 110, 1, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 111, 1, 11, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 112, 1, 12, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 113, 1, 13, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 114, 1, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 115, 1, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 116, 1, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 117, 1, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 210, 2, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 211, 2, 11, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 212, 2, 12, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 213, 2, 13, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 214, 2, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 215, 2, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 216, 2, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 217, 2, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 310, 3, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 311, 3, 11, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 312, 3, 12, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 313, 3, 13, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 314, 3, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 315, 3, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 316, 3, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 317, 3, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 410, 4, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 411, 4, 11, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 412, 4, 12, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 413, 4, 13, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 414, 4, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 415, 4, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 416, 4, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 417, 4, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 510, 5, 10, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 511, 5, 11, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 512, 5, 12, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 513, 5, 13, 1)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 514, 5, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 515, 5, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 516, 5, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (9, 517, 5, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 110, 1, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 111, 1, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 112, 1, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 113, 1, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 114, 1, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 115, 1, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 116, 1, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 117, 1, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 210, 2, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 211, 2, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 212, 2, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 213, 2, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 214, 2, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 215, 2, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 216, 2, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 217, 2, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 310, 3, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 311, 3, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 312, 3, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 313, 3, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 314, 3, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 315, 3, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 316, 3, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 317, 3, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 410, 4, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 411, 4, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 412, 4, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 413, 4, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 414, 4, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 415, 4, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 416, 4, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 417, 4, 17, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 510, 5, 10, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 511, 5, 11, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 512, 5, 12, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 513, 5, 13, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 514, 5, 14, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 515, 5, 15, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 516, 5, 16, 0)
INSERT [dbo].[HORARIOS] ([legajo_H], [codigo_H], [dia_H], [hora_H], [disponible_H]) VALUES (10, 517, 5, 17, 0)
GO
SET IDENTITY_INSERT [dbo].[LOCALIDADES] ON 

INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (1, 1, N'Palermo')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (2, 1, N'Núñez')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (3, 1, N'Recoleta')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (4, 1, N'San Nicolás')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (5, 1, N'Retiro')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (6, 1, N'Puerto Madero')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (7, 1, N'Villa Urquiza')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (8, 1, N'Saavedra')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (9, 1, N'Villa Soldati')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (10, 2, N'San Fernando del Valle de Catamarca')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (11, 2, N'Fiambalá')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (12, 2, N'Tinogasta')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (13, 3, N'Capital')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (14, 3, N'Río Cuarto')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (15, 4, N'Resistencia')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (16, 4, N'Quitilipi')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (17, 4, N'Sáenz Peña')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (18, 5, N'Trelew')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (19, 5, N'Puerto Madryn')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (20, 5, N'Comodoro Rivadavia')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (21, 6, N'Capital')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (22, 6, N'Paso de la Patria')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (23, 6, N'Loreto')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (24, 6, N'Esquina')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (25, 6, N'Goya')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (26, 6, N'General Virasoro')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (27, 7, N'Paraná')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (28, 7, N'Diamante')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (29, 7, N'Guayleguaychú')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (30, 7, N'Colón')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (31, 6, N'Mocoretá')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (33, 7, N'Federación')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (34, 7, N'Concepción del Uruguay')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (35, 7, N'Concordia')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (36, 8, N'Capital')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (37, 8, N'Las Lomitas')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (38, 9, N'San Salvador de Jujuy')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (39, 9, N'Volcán')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (40, 9, N'Humahuaca')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (41, 9, N'Tilcara')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (42, 9, N'San Ramón de la Nueva Orán')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (43, 9, N'Purmamarca')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (44, 10, N'Santa Rosa')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (45, 10, N'Perú')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (46, 10, N'General Acha')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (47, 10, N'General Pico')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (48, 10, N'La Adela')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (49, 10, N'Alpachiri')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (50, 10, N'Macachín')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (51, 11, N'Posadas')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (52, 11, N'Iguazú')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (53, 11, N'Loreto')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (54, 11, N'Santa Ana')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (55, 11, N'San Ignacio')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (56, 11, N'Puerto Rico')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (57, 11, N'Gobernador Roca')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (58, 11, N'Capioví')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (59, 11, N'Andresito')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (60, 11, N'Eldorado')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (61, 11, N'Santo Pipó')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (63, 11, N'Libertad')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (64, 11, N'Wanda')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (65, 11, N'Montecarlo')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (66, 11, N'Piray')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (67, 11, N'El Alcázar')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (68, 11, N'2 de mayo')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (69, 11, N'Oberá')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (70, 11, N'Bernardo de Irigoyen')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (71, 11, N'Pozo Azul')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (72, 11, N'Leandro N. Alem')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (73, 11, N'Aristóbulo del Valle')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (75, 11, N'El Soberbio')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (76, 11, N'Apóstoles')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (77, 11, N'San Vicente')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (78, 12, N'Capital')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (79, 12, N'Tunuyán')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (80, 12, N'Maipú')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (81, 12, N'Godoy Cruz')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (82, 12, N'Media Agua')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (83, 12, N'Lujan de Cuyo')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (84, 13, N'Capital')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (85, 13, N'San Martín de los Andes')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (86, 13, N'Villa la Angostura')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (87, 13, N'Junín de los Andes')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (88, 13, N'Villa Pehuenia')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (89, 13, N'Zapala')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (90, 13, N'Cutral-Co')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (91, 13, N'Aluminé')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (92, 13, N'Chos Malal')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (93, 13, N'Añelo')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (94, 13, N'Plottier')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (95, 13, N'Senillosa')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (96, 13, N'Arroyito')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (97, 13, N'Picún Leufú')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (98, 13, N'El Chocón')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (99, 13, N'Villa Traful')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (100, 13, N'Villa Meliquina')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (101, 14, N'La Plata')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (102, 14, N'Mar del Plata')
GO
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (103, 14, N'Junín')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (104, 14, N'25 de mayo')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (105, 14, N'Bahía Blanca')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (106, 14, N'Pergamino')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (107, 14, N'Pilar')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (108, 14, N'General Pacheco')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (109, 14, N'Tigre')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (110, 14, N'Escobar')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (111, 14, N'Vicente López')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (112, 14, N'San Martín')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (113, 14, N'Munro')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (114, 14, N'Bella Vista')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (115, 14, N'San Isidro')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (116, 15, N'Viedma')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (117, 15, N'Cipolletti')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (119, 15, N'Allen')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (120, 15, N'General Roca')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (121, 15, N'Mainque')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (122, 15, N'Chichinales')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (123, 15, N'Chimpay')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (124, 15, N'Choele-choel')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (125, 15, N'Río Colorado')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (126, 16, N'Capital')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (127, 16, N'Anillaco')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (128, 17, N'Capital')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (129, 17, N'San Lorenzo')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (130, 17, N'Rosario de la Frontera')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (131, 17, N'Cachi')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (132, 18, N'Río Gallegos')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (133, 18, N'Calafate')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (134, 18, N'Caleta Olivia')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (135, 18, N'Puerto San Julián')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (136, 18, N'Puerto Deseado')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (137, 18, N'El Chaltén')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (138, 19, N'Capital')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (139, 19, N'Rosario')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (140, 19, N'San Lorenzo')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (141, 19, N'Venado Tuerto')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (142, 19, N'San Justo')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (143, 19, N'Reconquista')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (144, 20, N'Capital')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (145, 20, N'Termas de Río Hondo')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (146, 21, N'Capital')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (147, 21, N'Calingasta')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (148, 21, N'San José de Jachal')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (149, 21, N'Barreal')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (150, 22, N'Capital')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (151, 22, N'Potrero de Funes')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (152, 22, N'Villa Mercedes')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (153, 23, N'Ushuahia')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (154, 23, N'Río Grande')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (155, 23, N'Cerro Castor')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (156, 23, N'Tolhuín')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (157, 24, N'San Miguel de Tucumán')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (160, 24, N'Concepción')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (161, 24, N'Yerba Buena')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (162, 24, N'Raco')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (163, 24, N'Tafí del Valle')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (164, 24, N'Tafí Viejio')
INSERT [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L], [nombre_L]) VALUES (165, 24, N'Alberdi')
SET IDENTITY_INSERT [dbo].[LOCALIDADES] OFF
GO
INSERT [dbo].[MEDICOS] ([dni_M], [legajo_M], [codEspecialidad_M], [horario_M], [estado_M], [imagen_M]) VALUES (N'11000000', 8, 3, N'l/v', 1, N'~/imagenes/perfiles/lopezrosseti.jpg')
INSERT [dbo].[MEDICOS] ([dni_M], [legajo_M], [codEspecialidad_M], [horario_M], [estado_M], [imagen_M]) VALUES (N'12000000', 5, 3, NULL, 1, N'~/imagenes/perfiles/cormillot.jpg')
INSERT [dbo].[MEDICOS] ([dni_M], [legajo_M], [codEspecialidad_M], [horario_M], [estado_M], [imagen_M]) VALUES (N'15000000', 3, 3, NULL, 1, N'~/imagenes/perfiles/03.jpg')
INSERT [dbo].[MEDICOS] ([dni_M], [legajo_M], [codEspecialidad_M], [horario_M], [estado_M], [imagen_M]) VALUES (N'17000000', 1, 3, NULL, 1, N'~/imagenes/perfiles/06.jpg')
INSERT [dbo].[MEDICOS] ([dni_M], [legajo_M], [codEspecialidad_M], [horario_M], [estado_M], [imagen_M]) VALUES (N'19000000', 6, 3, NULL, 1, N'~/imagenes/perfiles/04.jpg')
INSERT [dbo].[MEDICOS] ([dni_M], [legajo_M], [codEspecialidad_M], [horario_M], [estado_M], [imagen_M]) VALUES (N'19002123', 9, 2, N'as', 1, N'~/imagenes/perfiles/zin.jpg')
INSERT [dbo].[MEDICOS] ([dni_M], [legajo_M], [codEspecialidad_M], [horario_M], [estado_M], [imagen_M]) VALUES (N'20000000', 7, 1, N'lv', 1, N'~/imagenes/perfiles/05.jpg')
INSERT [dbo].[MEDICOS] ([dni_M], [legajo_M], [codEspecialidad_M], [horario_M], [estado_M], [imagen_M]) VALUES (N'22000000', 2, 3, NULL, 1, N'~/imagenes/perfiles/08.jpg')
INSERT [dbo].[MEDICOS] ([dni_M], [legajo_M], [codEspecialidad_M], [horario_M], [estado_M], [imagen_M]) VALUES (N'25000000', 4, 8, N'lv', 1, N'~/imagenes/perfiles/07.jpg')
INSERT [dbo].[MEDICOS] ([dni_M], [legajo_M], [codEspecialidad_M], [horario_M], [estado_M], [imagen_M]) VALUES (N'33333333', 10, 3, N'lv', 1, NULL)
GO
INSERT [dbo].[PACIENTES] ([dni_PA], [estado_PA]) VALUES (N'16000000', 1)
INSERT [dbo].[PACIENTES] ([dni_PA], [estado_PA]) VALUES (N'18000000', 1)
INSERT [dbo].[PACIENTES] ([dni_PA], [estado_PA]) VALUES (N'26000000', 1)
INSERT [dbo].[PACIENTES] ([dni_PA], [estado_PA]) VALUES (N'28000000', 1)
INSERT [dbo].[PACIENTES] ([dni_PA], [estado_PA]) VALUES (N'28000001', 1)
INSERT [dbo].[PACIENTES] ([dni_PA], [estado_PA]) VALUES (N'40000001', 1)
INSERT [dbo].[PACIENTES] ([dni_PA], [estado_PA]) VALUES (N'40000002', 1)
INSERT [dbo].[PACIENTES] ([dni_PA], [estado_PA]) VALUES (N'40000003', 1)
INSERT [dbo].[PACIENTES] ([dni_PA], [estado_PA]) VALUES (N'40000004', 1)
INSERT [dbo].[PACIENTES] ([dni_PA], [estado_PA]) VALUES (N'40000005', 1)
INSERT [dbo].[PACIENTES] ([dni_PA], [estado_PA]) VALUES (N'40000006', 1)
INSERT [dbo].[PACIENTES] ([dni_PA], [estado_PA]) VALUES (N'40000007', 1)
GO
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'11000000', N'Dr. Daniel', N'López Rosetti', N'M', N'Argentino', CAST(N'1955-01-01' AS Date), N'Talcahuano 1233 4G XXX', 4, 1, N'drlopezrosetti@intramed.com', N'732922344')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'12000000', N'Dr. Alberto', N'Cormillot', N'M', N'argentino', CAST(N'1970-01-01' AS Date), N'Paso 234', 27, 7, N'drcormillot@gmail.com', N'123')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'14000000', N'Dra. Cristina', N'Sierra', N'F', N'argentina', CAST(N'1970-01-01' AS Date), N'Salta 123', 107, 14, N'dracristinasierra@hotmail.com', N'123')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'15000000', N'Dra. Silvia', N'Vuolo', N'F', N'argentina', CAST(N'1995-01-01' AS Date), N'San Martin 1', 119, 15, N'dravuolo@intramed.com', N'1')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'16000000', N'Juan', N'Spichafoco', N'M', N'argentino', CAST(N'2000-01-01' AS Date), N'Salta 123', 13, 3, N'juanspicha@example.com', N'1233')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'17000000', N'Dr. Jorge', N'Maspero', N'M', N'argentino', CAST(N'1955-01-01' AS Date), N'Paraguay 2123', 1, 1, N'maspero@medico', N'1')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'18000000', N'Rubina Susana', N'Davidian', N'F', N'argentina', CAST(N'2020-10-06' AS Date), N'Ayacucho', 5, 1, N'rubina@hotmail.com', N'1')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'19000000', N'Dra. Laura', N'Rossini', N'M', N'argentino', CAST(N'1961-01-01' AS Date), N'Defensa 342', 1, 1, N'rossini@intramed.com.ar', N'12312')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'19002123', N'Dr. Claudio', N'Zin', N'M', N'argentino', CAST(N'1970-01-01' AS Date), N'Rivadavia 1000', 4, 1, N'zin@intramed.com', N'123')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'20000000', N'Dr. Nicolás', N'Coombes', N'M', N'argentino', CAST(N'1985-01-01' AS Date), N'Isla de las Lechiguanas 2123', 107, 14, N'nico@coombes.com', N'123')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'22000000', N'Doctor', N'House', N'F', N'Argentino', CAST(N'1970-01-01' AS Date), N'Güemes 124', 1, 1, N'sanchez@intramed', N'12')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'25000000', N'Doctor', N'Dre', N'M', N'argentino', CAST(N'1970-01-01' AS Date), N'Suipacha 911', 5, 1, N'dre@dre.com', N'123')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'26000000', N'Javier', N'Speroni', N'M', N'argentino', CAST(N'1978-10-26' AS Date), N'Parana y Juncal', 3, 1, N'javi@hotmail.com', N'4819-1230')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'28000000', N'Tadeo', N'Pueyrredon', N'M', N'Argentino', CAST(N'1978-10-26' AS Date), N'MISIONES 23', 3, 1, N'tadeo@exxon', N'12')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'28000001', N'Alberto', N'Menendez', N'M', N'chileno', CAST(N'1978-07-09' AS Date), N'Figueroa Alcorta 4520', 1, 1, N'beto@chileno', N'1233')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'33333333', N'Bear', N'Forest', N'M', N'norteamericano', CAST(N'2000-07-24' AS Date), N'Besares 123', 2, 1, N'bearforest@example.com', N'123')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'40000001', N'Nicolas', N'Mamone', N'M', N'argentino', CAST(N'1997-07-22' AS Date), N'Ramallo 4823', 8, 1, N'nmamone@example.com', N'12342')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'40000002', N'Emilio', N'Mazzurque', N'M', N'argentino', CAST(N'1990-01-01' AS Date), N'Quesada 5240', 7, 1, N'emazz@example.com', N'24252332')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'40000003', N'Enrique', N'Iglesias', N'M', N'español', CAST(N'1989-07-11' AS Date), N'Cabildo 1810', 14, 3, N'quique@iglesias.com', N'2342')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'40000004', N'Pablo', N'Picasso', N'M', N'español', CAST(N'1940-01-01' AS Date), N'Paraná 123', 21, 6, N'picasso@example.com', N'123')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'40000005', N'Ernesto', N'Fernandez', N'M', N'argentino', CAST(N'1990-01-01' AS Date), N'Fleming 123', 1, 1, N'ernesto@example.com', N'123')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'40000006', N'Gonzalo', N'Higuaín', N'M', N'argentino', CAST(N'1995-01-02' AS Date), N'Villaguay 123', 33, 7, N'gh@example.com', N'123')
INSERT [dbo].[PERSONAS] ([dni_P], [nombre_P], [apellido_P], [sexo_P], [nacionalidad_P], [fechaNac_P], [direccion_P], [idLocalidad_P], [idProvincia_P], [email_P], [telefono_P]) VALUES (N'40000007', N'Angel', N'Di Maria', N'M', N'argentino', CAST(N'1990-07-01' AS Date), N'general paz 123', 78, 12, N'angel@example.com', N'123')
GO
SET IDENTITY_INSERT [dbo].[PROVINCIAS] ON 

INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (1, N'Ciudad de Buenos Aires')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (2, N'Catamarca')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (3, N'Córdoba')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (4, N'Chaco')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (5, N'Chubut')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (6, N'Corrientes')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (7, N'Entre Ríos')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (8, N'Formosa')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (9, N'Jujuy')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (10, N'La Pampa')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (11, N'Misiones')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (12, N'Mendoza')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (13, N'Neuquén')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (14, N'Buenos Aires')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (15, N'Río Negro')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (16, N'La Rioja')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (17, N'Salta')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (18, N'Santa Cruz')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (19, N'Santa Fe')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (20, N'Santiago del Estero')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (21, N'San Juan')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (22, N'San Luis')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (23, N'Tierra Del Fuego')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (24, N'Tucumán')
INSERT [dbo].[PROVINCIAS] ([idProvincia_PROV], [nombre_PROV]) VALUES (25, N'Islas Malvinas')
SET IDENTITY_INSERT [dbo].[PROVINCIAS] OFF
GO
INSERT [dbo].[TURNOS] ([fecha_T], [legajo_T], [asistencia_T], [dni_T], [observacion_T], [cancelado_T]) VALUES (CAST(N'2025-06-16T10:00:00.000' AS DateTime), 3, 1, N'18000000', N'', 0)
INSERT [dbo].[TURNOS] ([fecha_T], [legajo_T], [asistencia_T], [dni_T], [observacion_T], [cancelado_T]) VALUES (CAST(N'2025-06-16T11:00:00.000' AS DateTime), 3, 1, N'26000000', NULL, 0)
INSERT [dbo].[TURNOS] ([fecha_T], [legajo_T], [asistencia_T], [dni_T], [observacion_T], [cancelado_T]) VALUES (CAST(N'2025-06-18T10:00:00.000' AS DateTime), 8, 1, N'28000001', N'vemos 321', 1)
INSERT [dbo].[TURNOS] ([fecha_T], [legajo_T], [asistencia_T], [dni_T], [observacion_T], [cancelado_T]) VALUES (CAST(N'2025-06-23T10:00:00.000' AS DateTime), 3, 1, N'18000000', NULL, 0)
INSERT [dbo].[TURNOS] ([fecha_T], [legajo_T], [asistencia_T], [dni_T], [observacion_T], [cancelado_T]) VALUES (CAST(N'2025-06-23T11:00:00.000' AS DateTime), 3, 1, N'18000000', NULL, 0)
INSERT [dbo].[TURNOS] ([fecha_T], [legajo_T], [asistencia_T], [dni_T], [observacion_T], [cancelado_T]) VALUES (CAST(N'2025-06-25T10:00:00.000' AS DateTime), 8, 1, N'18000000', N'TODO BIEN', 0)
INSERT [dbo].[TURNOS] ([fecha_T], [legajo_T], [asistencia_T], [dni_T], [observacion_T], [cancelado_T]) VALUES (CAST(N'2025-06-30T10:00:00.000' AS DateTime), 3, 1, N'26000000', NULL, 0)
INSERT [dbo].[TURNOS] ([fecha_T], [legajo_T], [asistencia_T], [dni_T], [observacion_T], [cancelado_T]) VALUES (CAST(N'2025-06-30T11:00:00.000' AS DateTime), 3, 1, N'18000000', NULL, 0)
INSERT [dbo].[TURNOS] ([fecha_T], [legajo_T], [asistencia_T], [dni_T], [observacion_T], [cancelado_T]) VALUES (CAST(N'2025-07-07T10:00:00.000' AS DateTime), 3, 1, N'18000000', NULL, 0)
INSERT [dbo].[TURNOS] ([fecha_T], [legajo_T], [asistencia_T], [dni_T], [observacion_T], [cancelado_T]) VALUES (CAST(N'2025-07-07T11:00:00.000' AS DateTime), 3, 1, N'26000000', NULL, 0)
INSERT [dbo].[TURNOS] ([fecha_T], [legajo_T], [asistencia_T], [dni_T], [observacion_T], [cancelado_T]) VALUES (CAST(N'2025-07-14T10:00:00.000' AS DateTime), 3, 0, N'28000001', NULL, 0)
INSERT [dbo].[TURNOS] ([fecha_T], [legajo_T], [asistencia_T], [dni_T], [observacion_T], [cancelado_T]) VALUES (CAST(N'2025-07-14T11:00:00.000' AS DateTime), 3, 0, N'28000000', NULL, 0)
INSERT [dbo].[TURNOS] ([fecha_T], [legajo_T], [asistencia_T], [dni_T], [observacion_T], [cancelado_T]) VALUES (CAST(N'2025-07-17T10:00:00.000' AS DateTime), 8, 1, N'26000000', N'MANDE RX', 0)
INSERT [dbo].[TURNOS] ([fecha_T], [legajo_T], [asistencia_T], [dni_T], [observacion_T], [cancelado_T]) VALUES (CAST(N'2025-07-21T10:00:00.000' AS DateTime), 7, 0, N'28000000', NULL, 0)
INSERT [dbo].[TURNOS] ([fecha_T], [legajo_T], [asistencia_T], [dni_T], [observacion_T], [cancelado_T]) VALUES (CAST(N'2025-08-11T11:00:00.000' AS DateTime), 3, 0, N'18000000', NULL, 0)
INSERT [dbo].[TURNOS] ([fecha_T], [legajo_T], [asistencia_T], [dni_T], [observacion_T], [cancelado_T]) VALUES (CAST(N'2025-08-11T14:00:00.000' AS DateTime), 1, 0, N'28000001', NULL, 0)
GO
INSERT [dbo].[USUARIOS] ([username_U], [password_U], [email_U], [tipo_U], [estado_U], [imagen_U]) VALUES (N'admin', N'12345', NULL, N'01', 1, N'~/imagenes/perfiles/img_avatar.png')
INSERT [dbo].[USUARIOS] ([username_U], [password_U], [email_U], [tipo_U], [estado_U], [imagen_U]) VALUES (N'ariel', N'12345', N'', N'01', 1, N'~/imagenes/perfiles/arieltapia.jpg')
INSERT [dbo].[USUARIOS] ([username_U], [password_U], [email_U], [tipo_U], [estado_U], [imagen_U]) VALUES (N'carlos', N'12345', N'', N'01', 1, N'~/imagenes/perfiles/carlos.png')
INSERT [dbo].[USUARIOS] ([username_U], [password_U], [email_U], [tipo_U], [estado_U], [imagen_U]) VALUES (N'claudio', N'12345', N'', N'01', 1, N'~/imagenes/perfiles/claudiofernandez.png')
INSERT [dbo].[USUARIOS] ([username_U], [password_U], [email_U], [tipo_U], [estado_U], [imagen_U]) VALUES (N'coombes', N'12345', N'nico@coombes.com', N'02', 1, NULL)
INSERT [dbo].[USUARIOS] ([username_U], [password_U], [email_U], [tipo_U], [estado_U], [imagen_U]) VALUES (N'dravuolo', N'12345', N'dravuolo@intramed.com', N'02', 1, NULL)
INSERT [dbo].[USUARIOS] ([username_U], [password_U], [email_U], [tipo_U], [estado_U], [imagen_U]) VALUES (N'drcormillot', N'12345', N'drcormillot@gmail.com', N'02', 1, NULL)
INSERT [dbo].[USUARIOS] ([username_U], [password_U], [email_U], [tipo_U], [estado_U], [imagen_U]) VALUES (N'drlopezrosetti', N'12345', N'drlopezrosetti@intramed.com', N'02', 1, NULL)
INSERT [dbo].[USUARIOS] ([username_U], [password_U], [email_U], [tipo_U], [estado_U], [imagen_U]) VALUES (N'drvergara', N'12345', N'sf@sf12', N'02', 1, NULL)
INSERT [dbo].[USUARIOS] ([username_U], [password_U], [email_U], [tipo_U], [estado_U], [imagen_U]) VALUES (N'drzin', N'12345', N'zin@intramed.com', N'02', 1, NULL)
INSERT [dbo].[USUARIOS] ([username_U], [password_U], [email_U], [tipo_U], [estado_U], [imagen_U]) VALUES (N'mbelgrano', N'12345', NULL, N'01', 1, N'~/imagenes/perfiles/mbelgrano.jpg')
INSERT [dbo].[USUARIOS] ([username_U], [password_U], [email_U], [tipo_U], [estado_U], [imagen_U]) VALUES (N'rossini', N'12345', N'rossini@intramed.com.ar', N'02', 1, NULL)
GO
/****** Object:  Index [UQ__MEDICOS__CB30CE71A6D4E0A8]    Script Date: 21/7/2025 14:10:41 ******/
ALTER TABLE [dbo].[MEDICOS] ADD UNIQUE NONCLUSTERED 
(
	[legajo_M] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MEDICOS] ADD  DEFAULT ((1)) FOR [estado_M]
GO
ALTER TABLE [dbo].[PACIENTES] ADD  CONSTRAINT [DF_PACIENTES_estado_PA]  DEFAULT ((1)) FOR [estado_PA]
GO
ALTER TABLE [dbo].[TURNOS] ADD  CONSTRAINT [DF__TURNOS__asistenc__693CA210]  DEFAULT ((0)) FOR [asistencia_T]
GO
ALTER TABLE [dbo].[TURNOS] ADD  CONSTRAINT [DF_TURNOS_cancelado_T]  DEFAULT ((0)) FOR [cancelado_T]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_username_U]  DEFAULT ((1)) FOR [username_U]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_tipo_U]  DEFAULT ((2)) FOR [tipo_U]
GO
ALTER TABLE [dbo].[HORARIOS]  WITH CHECK ADD  CONSTRAINT [FK_HORARIOS_MEDICOS] FOREIGN KEY([legajo_H])
REFERENCES [dbo].[MEDICOS] ([legajo_M])
GO
ALTER TABLE [dbo].[HORARIOS] CHECK CONSTRAINT [FK_HORARIOS_MEDICOS]
GO
ALTER TABLE [dbo].[LOCALIDADES]  WITH CHECK ADD  CONSTRAINT [FK_LOCALIDADES_PROVINCIAS] FOREIGN KEY([idProvincia_L])
REFERENCES [dbo].[PROVINCIAS] ([idProvincia_PROV])
GO
ALTER TABLE [dbo].[LOCALIDADES] CHECK CONSTRAINT [FK_LOCALIDADES_PROVINCIAS]
GO
ALTER TABLE [dbo].[MEDICOS]  WITH CHECK ADD  CONSTRAINT [FK_MEDICOS_ESPECIALIDADES] FOREIGN KEY([codEspecialidad_M])
REFERENCES [dbo].[ESPECIALIDADES] ([codEspecialidad_E])
GO
ALTER TABLE [dbo].[MEDICOS] CHECK CONSTRAINT [FK_MEDICOS_ESPECIALIDADES]
GO
ALTER TABLE [dbo].[MEDICOS]  WITH CHECK ADD  CONSTRAINT [FK_MEDICOS_PERSONAS] FOREIGN KEY([dni_M])
REFERENCES [dbo].[PERSONAS] ([dni_P])
GO
ALTER TABLE [dbo].[MEDICOS] CHECK CONSTRAINT [FK_MEDICOS_PERSONAS]
GO
ALTER TABLE [dbo].[PACIENTES]  WITH CHECK ADD  CONSTRAINT [FK_PACIENTES_PERSONAS] FOREIGN KEY([dni_PA])
REFERENCES [dbo].[PERSONAS] ([dni_P])
GO
ALTER TABLE [dbo].[PACIENTES] CHECK CONSTRAINT [FK_PACIENTES_PERSONAS]
GO
ALTER TABLE [dbo].[PERSONAS]  WITH CHECK ADD  CONSTRAINT [FK_PERSONAS_LOCALIDADES] FOREIGN KEY([idLocalidad_P], [idProvincia_P])
REFERENCES [dbo].[LOCALIDADES] ([idLocalidad_L], [idProvincia_L])
GO
ALTER TABLE [dbo].[PERSONAS] CHECK CONSTRAINT [FK_PERSONAS_LOCALIDADES]
GO
ALTER TABLE [dbo].[TURNOS]  WITH CHECK ADD  CONSTRAINT [FK_TURNOS_PACIENTES] FOREIGN KEY([dni_T])
REFERENCES [dbo].[PACIENTES] ([dni_PA])
GO
ALTER TABLE [dbo].[TURNOS] CHECK CONSTRAINT [FK_TURNOS_PACIENTES]
GO
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD CHECK  (([tipo_U]='02' OR [tipo_U]='01'))
GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZARMEDICO]    Script Date: 21/7/2025 14:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     PROCEDURE [dbo].[SP_ACTUALIZARMEDICO]

--TABLA PERSONAS
 @DNI NCHAR(8)
 ,@NOMBRE VARCHAR(50)
 ,@APELLIDO VARCHAR(50)
 ,@SEXO CHAR
 ,@NACIONALIDAD VARCHAR(50)
 ,@FECHANAC DATE
 ,@DIRECCION VARCHAR(50)
 ,@IDPROVINCIA INT
 ,@IDLOCALIDAD INT
 ,@EMAIL VARCHAR(50)
,@TELEFONO VARCHAR(50)

 -- TABLA MEDICOS
 --@dni_M va con personas
 ,@LEGAJO INT
 ,@CODESPECIALIDAD INT
 ,@HORARIO VARCHAR(100)
 ,@IMAGEN VARCHAR(100) = NULL
-- ESTADO SE CARGA SOLO

-- TABLA USUARIOS
-- ,@USERNAME VARCHAR(20)
-- ,@PASSWORD VARCHAR(20)
 -- EMAIL (TABLA PERSONAS)
 -- TIPO USUARIO SE CARGA SOLO

AS
BEGIN
	UPDATE PERSONAS
		SET 
		nombre_P = @NOMBRE
		,apellido_P = @APELLIDO
		,sexo_P = @SEXO
		,nacionalidad_P = @NACIONALIDAD
		,fechaNac_P = @FECHANAC
		,direccion_P = @DIRECCION
		,idProvincia_P = @IDPROVINCIA
		,idLocalidad_P = @IDLOCALIDAD 
		,email_P = @EMAIL
		,telefono_P = @TELEFONO

		WHERE
		dni_P = @DNI
END

BEGIN

	UPDATE MEDICOS
		SET
		codEspecialidad_M = @CODESPECIALIDAD
		,horario_M = @HORARIO
		,imagen_M =@IMAGEN
	WHERE dni_M = @DNI		
END

GO
/****** Object:  StoredProcedure [dbo].[SP_ACTUALIZARMEDICOEMAILUSUARIOCONTRASENA]    Script Date: 21/7/2025 14:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE       PROCEDURE [dbo].[SP_ACTUALIZARMEDICOEMAILUSUARIOCONTRASENA]

--TABLA PERSONAS
 @DNI NCHAR(8)
 ,@NOMBRE VARCHAR(50)
 ,@APELLIDO VARCHAR(50)
 ,@SEXO CHAR
 ,@NACIONALIDAD VARCHAR(50)
 ,@FECHANAC DATE
 ,@DIRECCION VARCHAR(50)
 ,@IDPROVINCIA INT
 ,@IDLOCALIDAD INT
 ,@EMAIL VARCHAR(50)
 ,@EMAIL_NUEVO VARCHAR(50)
 ,@TELEFONO VARCHAR(50)

 -- TABLA MEDICOS
 --@dni_M va con personas
 ,@LEGAJO INT
 ,@CODESPECIALIDAD INT
 ,@HORARIO VARCHAR(100)
 ,@IMAGEN VARCHAR(100) = NULL
-- ESTADO SE CARGA SOLO

-- TABLA USUARIOS
 ,@USERNAME VARCHAR(20)
 ,@PASSWORD VARCHAR(20)
 -- EMAIL (TABLA PERSONAS)
 -- TIPO USUARIO SE CARGA SOLO

AS

BEGIN
	IF (@EMAIL IS NULL) 
	
	UPDATE USUARIOS
	SET 
	username_U = @USERNAME
	,password_U = @PASSWORD
	WHERE email_U = @EMAIL
	
	ELSE

	UPDATE USUARIOS
	SET 
	username_U = @USERNAME
	,password_U = @PASSWORD
	,email_U = @EMAIL_NUEVO
	WHERE email_U = @EMAIL
END

BEGIN
	UPDATE PERSONAS
		SET 
		nombre_P = @NOMBRE
		,apellido_P = @APELLIDO
		,sexo_P = @SEXO
		,nacionalidad_P = @NACIONALIDAD
		,fechaNac_P = @FECHANAC
		,direccion_P = @DIRECCION
		,idProvincia_P = @IDPROVINCIA
		,idLocalidad_P = @IDLOCALIDAD 
		,email_P = @EMAIL_NUEVO
		,telefono_P = @TELEFONO

		WHERE
		dni_P = @DNI
END
BEGIN

	UPDATE MEDICOS
		SET
		codEspecialidad_M = @CODESPECIALIDAD
		,horario_M = @HORARIO
		,imagen_M =@IMAGEN
	WHERE dni_M = @DNI		
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AGREGARMEDICO]    Script Date: 21/7/2025 14:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_AGREGARMEDICO]

--TABLA PERSONAS
 @DNI NCHAR(8)
 ,@NOMBRE VARCHAR(50)
 ,@APELLIDO VARCHAR(50)
 ,@SEXO CHAR
 ,@NACIONALIDAD VARCHAR(50)
 ,@FECHANAC DATE
 ,@DIRECCION VARCHAR(50)
 ,@IDPROVINCIA INT
 ,@IDLOCALIDAD INT
 ,@EMAIL VARCHAR(50)
 ,@TELEFONO VARCHAR(50)

 -- TABLA MEDICOS
 --@dni_M va con personas
 ,@LEGAJO INT
 ,@CODESPECIALIDAD INT
 ,@HORARIO VARCHAR(100)
 ,@IMAGEN VARCHAR(100) = NULL
-- ESTADO SE CARGA SOLO

-- TABLA USUARIOS
 ,@USERNAME VARCHAR(20)
 ,@PASSWORD VARCHAR(20)
 -- EMAIL 
 -- TIPO USUARIO

AS
	INSERT INTO PERSONAS(

		dni_P
		,nombre_P
		,apellido_P
		,sexo_P
		,nacionalidad_P
		,fechaNac_P
		,direccion_P
		,idProvincia_P
		,idLocalidad_P
		,email_P
		,telefono_P
	)
	VALUES (
		 @DNI
		 ,@NOMBRE
		 ,@APELLIDO
		 ,@SEXO
		 ,@NACIONALIDAD
		 ,@FECHANAC
		 ,@DIRECCION
		 ,@IDPROVINCIA
		 ,@IDLOCALIDAD
		 ,@EMAIL
		 ,@TELEFONO
	)


	INSERT INTO MEDICOS(
		dni_M
		,legajo_M
		,codEspecialidad_M
		,horario_M
		,imagen_M
	)
	VALUES (
		@DNI
		,@LEGAJO
		,@CODESPECIALIDAD
		,@HORARIO
		,@IMAGEN
	)



	IF (@USERNAME IS NOT NULL AND @USERNAME <> '') AND (@PASSWORD IS NOT NULL AND @PASSWORD <> '')
	
		INSERT INTO USUARIOS(
			username_U
			,password_U
			,email_U
			,tipo_U
			)
			VALUES(
			@USERNAME
			,@PASSWORD
			,@EMAIL
			,'02'
			)
	

GO
/****** Object:  StoredProcedure [dbo].[SP_AGREGARPACIENTE]    Script Date: 21/7/2025 14:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_AGREGARPACIENTE]

--TABLA PERSONAS
 @DNI NCHAR(8)
 ,@NOMBRE VARCHAR(50)
 ,@APELLIDO VARCHAR(50)
 ,@SEXO CHAR
 ,@NACIONALIDAD VARCHAR(50)
 ,@FECHANAC DATE
 ,@DIRECCION VARCHAR(50)
 ,@IDPROVINCIA INT
 ,@IDLOCALIDAD INT
 ,@EMAIL VARCHAR(50)
 ,@TELEFONO VARCHAR(50)

 -- TABLA PACIENTE
-- dni viene de personas SE CARGA SOLO
-- ESTADO SE CARGA SOLO

AS
	INSERT INTO PERSONAS(

		dni_P
		,nombre_P
		,apellido_P
		,sexo_P
		,nacionalidad_P
		,fechaNac_P
		,direccion_P
		,idProvincia_P
		,idLocalidad_P
		,email_P
		,telefono_P
	)
	VALUES (
		 @DNI
		 ,@NOMBRE
		 ,@APELLIDO
		 ,@SEXO
		 ,@NACIONALIDAD
		 ,@FECHANAC
		 ,@DIRECCION
		 ,@IDPROVINCIA
		 ,@IDLOCALIDAD
		 ,@EMAIL
		 ,@TELEFONO
	)


	INSERT INTO PACIENTES(
		dni_PA
	)
	VALUES (
		@DNI
	)

	

GO
/****** Object:  StoredProcedure [dbo].[SP_INACTIVARMEDICO]    Script Date: 21/7/2025 14:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_INACTIVARMEDICO]

@dni_P AS NCHAR(8)



AS
BEGIN
	-- Inactivar medico en tabla medico
	UPDATE MEDICOS
	SET
		estado_M = 0
	WHERE
		dni_M = @dni_P

	-- Obtener email relacionado al médico
	DECLARE @email_P VARCHAR(50)
	
	SELECT @email_P = P.email_P 
	FROM PERSONAS AS [P] 
	INNER JOIN MEDICOS AS [M] 
	ON M.dni_M = P.dni_P
	WHERE M.dni_M = @dni_P

	IF (@email_P IS NOT NULL)
	BEGIN
		UPDATE USUARIOS
		SET estado_U = 0
		WHERE email_U = @email_P
	END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECCIONARMEDICO]    Script Date: 21/7/2025 14:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_SELECCIONARMEDICO]

@codEspecialidad_M INT = NULL
AS


	SELECT 

		M.imagen_M
		,M.legajo_M
		,P.dni_P
		,P.nombre_P
		,P.apellido_P
		,P.sexo_P
		,P.nacionalidad_P
		,P.fechaNac_P
		,P.direccion_P
		,P.idLocalidad_P
		,L.nombre_L
		,P.idProvincia_P
		,PROV.nombre_PROV
		,P.email_P
		,P.telefono_P
		,E.nombre_E
		,U.username_U
		,U.password_U
		,U.tipo_U
		,M.horario_M
		,M.codEspecialidad_M
		,M.estado_M
	
	FROM PERSONAS AS [P] 

	INNER JOIN MEDICOS AS [M]
	ON dni_P = dni_M
	
	LEFT JOIN USUARIOS AS [U]
	ON P.email_P = U.email_U

	INNER JOIN LOCALIDADES AS [L]
	ON P.idLocalidad_P = L.idLocalidad_L

	INNER JOIN PROVINCIAS AS [PROV]
	ON P.idProvincia_P = PROV.idProvincia_PROV

	INNER JOIN ESPECIALIDADES AS [E]
	ON M.codEspecialidad_M = E.codEspecialidad_E

	WHERE
		(@codEspecialidad_M IS NULL OR @codEspecialidad_M = 0 OR M.codEspecialidad_M = @codEspecialidad_M)
		AND M.estado_M = 1


	ORDER BY legajo_M ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_SELECTPACIENTES]    Script Date: 21/7/2025 14:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_SELECTPACIENTES]

AS

SELECT 
	P.dni_P
	, P.nombre_P
	, P.apellido_P
	, P.sexo_P
	, P.nacionalidad_P
	, P.fechaNac_P
	, P.direccion_P
	, L.nombre_L
	, PROV.nombre_PROV
	, P.email_P
	, P.telefono_P
	, P.idLocalidad_P
	, P.idProvincia_P


FROM PERSONAS AS [P]
	INNER JOIN LOCALIDADES AS [L] ON P.idLocalidad_P = L.idLocalidad_L
	INNER JOIN PROVINCIAS AS [PROV] ON P.idProvincia_P = PROV.idProvincia_PROV 
	INNER JOIN PACIENTES AS [PA] ON P.dni_P = PA.dni_PA

WHERE PA.estado_PA = 1

ORDER BY P.apellido_P ASC
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATEMEDICO]    Script Date: 21/7/2025 14:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_UPDATEMEDICO]

--TABLA PERSONAS
 @dni_P NCHAR(8)
 ,@nombre_P VARCHAR(50)
 ,@apellido_P VARCHAR(50)
 ,@sexo_P CHAR
 ,@nacionalidad_P VARCHAR(50)
 ,@fechaNac_P DATE
 ,@direccion_P VARCHAR(50)
 ,@idProvincia_P INT
 ,@idLocalidad_P INT
-- ,@email_P VARCHAR(50)
 ,@telefono_P VARCHAR(50)

 -- TABLA MEDICOS
 --@dni_M va con personas
 ,@codEspecialidad_M INT
 ,@horario_M VARCHAR(100)
 ,@imagen_M VARCHAR(100) = NULL
-- ,@ESTADO BIT

-- TABLA USUARIOS
-- ,@USERNAME VARCHAR(20)
-- ,@PASSWORD VARCHAR(20)
-- ,@TIPO NCHAR(2)
 -- EMAIL 

AS
	UPDATE PERSONAS
	SET 
		 
		 nombre_P = @nombre_P
		 ,apellido_P=@apellido_P
		 ,sexo_P=@sexo_P
		 ,nacionalidad_P=@nacionalidad_P
		 ,fechaNac_P=@fechaNac_P
		 ,direccion_P=@direccion_P
		 ,idProvincia_P=@idProvincia_P
		 ,idLocalidad_P=@idLocalidad_P
	--	 ,email_P=@email_P
		 ,telefono_P=@telefono_P
	WHERE dni_P = @dni_P

	UPDATE MEDICOS
	SET
		codEspecialidad_M=@codEspecialidad_M
		,horario_M=@horario_M
		--,imagen_M=@imagen_M
		--,estado_M=@estado_M
	WHERE dni_M = @dni_P
	--UPDATE USUARIOS
	--SET
	--	username_U=@username_U
	--	,password_U=@password_U
	--	,email_U=@email_U
	--	,tipo_U=@tipo_U

IF (@imagen_M IS NOT NULL)
	BEGIN
	UPDATE MEDICOS
		SET
			imagen_M=@imagen_M
			--,estado_M=@estado_M
		WHERE dni_M = @dni_P
	END
	

GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATEPACIENTES]    Script Date: 21/7/2025 14:10:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SP_UPDATEPACIENTES]
@DNI NCHAR(8)
,@NOMBRE VARCHAR(50)
,@APELLIDO VARCHAR(50)
,@SEXO NCHAR(1)
,@NACIONALIDAD VARCHAR(50)
,@FECHANAC VARCHAR(50)
,@DIRECCION VARCHAR(50)
,@IDLOCALIDAD INT
,@IDPROVINCIA INT
,@EMAIL VARCHAR(50)
,@TELEFONO VARCHAR(50)

AS

UPDATE PERSONAS
SET
	nombre_P = @NOMBRE
	,apellido_P = @APELLIDO
	,sexo_P = @SEXO
	,nacionalidad_P = @NACIONALIDAD
	,fechaNac_P = @FECHANAC
	,direccion_P = @DIRECCION
	,idLocalidad_P = @IDLOCALIDAD
	,idProvincia_P = @IDPROVINCIA
	,email_P = @EMAIL
	,telefono_P = @TELEFONO

WHERE dni_P = @DNI



GO
