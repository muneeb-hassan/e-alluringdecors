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
