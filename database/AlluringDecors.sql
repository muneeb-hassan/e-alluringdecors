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

CREATE TABLE Acting(
	ActingID INT IDENTITY(1,1) PRIMARY KEY,
	Username VARCHAR(32) NOT NULL,
	[View] BIT NOT NULL DEFAULT 0,
	[Delete] BIT NOT NULL DEFAULT 0,
	[Edit] BIT NOT NULL DEFAULT 0,
	[Add] BIT NOT NULL DEFAULT 0
);

INSERT INTO Account(Username, [Password], FullName, Email, Acting) VALUES('admincp', '123456', N'Administrator', 'example@gmail.com', 2);
INSERT INTO Acting(Username, [Add], [Delete], Edit, [View]) VALUES('admincp', 1, 1, 1, 1);
45