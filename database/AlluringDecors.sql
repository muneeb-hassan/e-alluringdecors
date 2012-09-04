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


CREATE TABLE customer(
	idcus int primary key,
	[password] nvarchar(50) NOT NULL,
	name nvarchar(50) NOT NULL,
	[address] nvarchar(50) NOT NULL,
	phoneno nvarchar(50) NOT NULL,
	mail nvarchar(50) NOT NULL,
	feedbackid int NOT NULL 
)
GO

CREATE TABLE statusproject(
	idstatus int primary key,
	[status] nvarchar(50) NOT NULL,
	projectid int NOT NULL
)
GO

CREATE TABLE [services](
	idservice int primary key,
	[service] nvarchar(50) NOT NULL,
	projectid int NOT NULL
)
GO

CREATE TABLE projecttype(
	idtype nvarchar(50) primary key,
	[type] nvarchar(50) NOT NULL,
	projectid int NOT NULL
)
GO

CREATE TABLE project(
	idproject int primary key,
	projectname nvarchar(50) NOT NULL,
	[address] nvarchar(50) NOT NULL,
	typeid int NOT NULL,
	[image] nvarchar(50) NOT NULL,
	statusid int NOT NULL,
	serviceid int NOT NULL
)
GO

CREATE TABLE feedback(
	idfeedback int primary key,
	name nvarchar(50) NOT NULL,
	[feedback] [nvarchar](100) NOT NULL
)
GO

CREATE TABLE [admin](
	[admin] [nvarchar](50) NOT NULL,
	pass [nvarchar](50) NOT NULL
)
GO

CREATE TABLE bill(
	idbill int primary key,
	cusid int NOT NULL,
	projectid int NOT NULL,
	total int NOT NULL,
	status int NOT NULL
)