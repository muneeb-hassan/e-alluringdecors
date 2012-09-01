CREATE DATABASE AlluringDecors
GO
USE AlluringDecors
GO

CREATE TABLE Account(
	Username VARCHAR(32) PRIMARY KEY,
	[Password] VARCHAR(32) NOT NULL,
	FullName NVARCHAR(100) NOT NULL,
	[Address]	NVARCHAR(200),
	Gender BIT DEFAULT 0,
	Email VARCHAR(80) NOT NULL,
	PhoneNumber	VARCHAR(20),
	Birthday DATETIME,
	Acting TINYINT NOT NULL DEFAULT 0
);

INSERT INTO Account(Username, [Password], FullName, Email, Acting) VALUES('admincp', '123456', N'Administrator', 'example@gmail.com', 1);

/****** Object:  Table [dbo].[ttkhachhang]    Script Date: 09/01/2012 14:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ttkhachhang](
	[id] [int] NOT NULL,
	[pass] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[phoneno] [nvarchar](50) NOT NULL,
	[mail] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ttkhachhang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statusproject]    Script Date: 09/01/2012 14:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statusproject](
	[idstatus] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[services]    Script Date: 09/01/2012 14:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[services](
	[id] [int] NOT NULL,
	[service] [nvarchar](50) NOT NULL,
	[projectid] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[projecttype]    Script Date: 09/01/2012 14:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[projecttype](
	[idtype] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project]    Script Date: 09/01/2012 14:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project](
	[idproject] [int] NOT NULL,
	[projectname] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[typeid] [nvarchar](50) NOT NULL,
	[image] [nvarchar](50) NOT NULL,
	[statusid] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_project] PRIMARY KEY CLUSTERED 
(
	[idproject] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feed]    Script Date: 09/01/2012 14:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feed](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[feedback] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 09/01/2012 14:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[admin] [nvarchar](50) NOT NULL,
	[pass] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO