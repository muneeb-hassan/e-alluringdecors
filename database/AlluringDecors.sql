CREATE DATABASE AlluringDecors
GO
USE AlluringDecors
GO

CREATE TABLE Accounts(
	Username VARCHAR(32) PRIMARY KEY,
	[Password] VARCHAR(32) NOT NULL,
	FullName NVARCHAR(100) NOT NULL,
	[Address]	NVARCHAR(200),
	Gender BIT DEFAULT 0,
	Email VARCHAR(80) NOT NULL,
	PhoneNumber	VARCHAR(20),
	Birthday DATETIME,
	Acting TINYINT NOT NULL DEFAULT 0 --0 user, 1 admin
);

INSERT INTO Accounts(Username, [Password], FullName, Email, Acting) VALUES('admincp', '123456', N'Administrator', 'example@gmail.com', 1);


CREATE TABLE [Services](
	ServiceId int identity(1,1) primary key,
	Name nvarchar(50) NOT NULL,
	[Description] nvarchar(300)
)
GO

INSERT INTO [Services](Name, [Description]) VALUES('Decorating and Furnishing with Furniture And Glass', '');
INSERT INTO [Services](Name, [Description]) VALUES('Kitchen Design', '');
INSERT INTO [Services](Name, [Description]) VALUES('Flooring Layout', '');
INSERT INTO [Services](Name, [Description]) VALUES('Lightning Effects', '');
INSERT INTO [Services](Name, [Description]) VALUES('Window Coverings', '');
INSERT INTO [Services](Name, [Description]) VALUES('Colour Schemes', '');
INSERT INTO [Services](Name, [Description]) VALUES('Curtain Designing', '');
INSERT INTO [Services](Name, [Description]) VALUES('Architectural design', '');
INSERT INTO [Services](Name, [Description]) VALUES('Planting', '');
INSERT INTO [Services](Name, [Description]) VALUES('Seating Alignment in the Living Rooms', '');

CREATE TABLE [ProjectServices](
	PServiceId int identity(1,1) primary key,
	ProjectId int NOT NULL,
	ServiceId int NOT NULL
)
GO

CREATE TABLE Projects(
	ProjectId int identity(1,1) primary key,
	Name nvarchar(50) NOT NULL,
	[Address] nvarchar(50) NOT NULL,
	ImgUrlThumb VARCHAR(200) NOT NULL,
	[Description] nvarchar(300),
	[DateStart] DATETIME NOT NULL,
	[Status] TINYINT NOT NULL DEFAULT 0, -- 0 dang tien hanh, 1 da tien hanh, 2 hoan thanh 
	[DateComplete] DATETIME,
	ProType int NOT NULL DEFAULT 0 -- 0 home, 1 hall..., 2 restaurent hotel, 3 office
)
GO

CREATE TABLE Images(
	ImageId INT identity(1,1) primary key,
	ProjectId INT NOT NULL,
	URL VARCHAR(200) NOT NULL
)
GO

CREATE TABLE Feedbacks(
	FeedbackId int identity(1,1) primary key,
	Username VARCHAR(32) NOT NULL,
	Title nvarchar(50) NOT NULL,
	Content nvarchar(300) NOT NULL
)
GO

CREATE TABLE Bills(
	BillId int identity(1,1) primary key,
	Username VARCHAR(32) NOT NULL,
	ProjectId int NOT NULL
)
GO

CREATE TABLE ServiceDetails(
	SDetailId int identity(1,1) primary key,
	ServiceId int NOT NULL,
	BillId int NOT NULL,
	Name NVARCHAR(50),
	Price FLOAT, -- TINH TIEN usd
	Quantity int NOT NULL,
	Unit NVARCHAR(30)-- cai, chiec, m3, m2,...
)
GO

CREATE TABLE PaymentDetails(
	PDetailId int identity(1,1) primary key,
	BillId int NOT NULL,
	[Date] DATETIME NOT NULL,
	PayAmount FLOAT NOT NULL, --So tien dua
	TotalAmount FLOAT NOT NULL
)
GO

ALTER TABLE PaymentDetails ADD CONSTRAINT FK_PaymentDetails_Bills FOREIGN KEY (BillId) REFERENCES Bills(BillId) ON DELETE CASCADE;
ALTER TABLE ServiceDetails ADD CONSTRAINT FK_ServiceDetails_Bills FOREIGN KEY (BillId) REFERENCES Bills(BillId) ON DELETE CASCADE;
ALTER TABLE ServiceDetails ADD CONSTRAINT FK_ServiceDetails_Services FOREIGN KEY (ServiceId) REFERENCES [Services](ServiceId) ON DELETE CASCADE;
ALTER TABLE Bills ADD CONSTRAINT FK_Bills_Projects FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId) ON DELETE CASCADE;
ALTER TABLE Bills ADD CONSTRAINT FK_Bills_Accounts FOREIGN KEY (Username) REFERENCES Accounts(Username) ON DELETE CASCADE;
ALTER TABLE Feedbacks ADD CONSTRAINT FK_Feedbacks_Accounts FOREIGN KEY (Username) REFERENCES Accounts(Username) ON DELETE CASCADE;
ALTER TABLE [ProjectServices] ADD CONSTRAINT FK_ProjectServices_Services FOREIGN KEY (ServiceId) REFERENCES [Services](ServiceId) ON DELETE CASCADE;
ALTER TABLE [ProjectServices] ADD CONSTRAINT FK_ProjectServices_Projects FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId) ON DELETE CASCADE;
ALTER TABLE Images ADD CONSTRAINT FK_Images_Projects FOREIGN KEY (ProjectId) REFERENCES Projects(ProjectId) ON DELETE CASCADE;