USE [OnlineAuctionDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 05/07/2025 5:27:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artists]    Script Date: 05/07/2025 5:27:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artists](
	[ArtistId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Country] [nvarchar](100) NULL,
	[BirthYear] [int] NULL,
	[DeathYear] [int] NULL,
	[Portrait] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bids]    Script Date: 05/07/2025 5:27:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bids](
	[BidId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[BidAmount] [decimal](18, 2) NOT NULL,
	[BidTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 05/07/2025 5:27:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemImages]    Script Date: 05/07/2025 5:27:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemImages](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[FilePath] [nvarchar](500) NOT NULL,
	[IsMain] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 05/07/2025 5:27:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](4000) NULL,
	[ArtistId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SellerId] [int] NOT NULL,
	[MinimumBid] [decimal](18, 2) NOT NULL,
	[BidIncrement] [decimal](18, 2) NOT NULL,
	[BidStartDate] [datetime] NOT NULL,
	[BidEndDate] [datetime] NOT NULL,
	[BidStatus] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[DocumentPath] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 05/07/2025 5:27:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Message] [nvarchar](1000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[IsRead] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 05/07/2025 5:27:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[RatedBy] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[Comment] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/07/2025 5:27:27 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Artists] ON 

INSERT [dbo].[Artists] ([ArtistId], [Name], [Country], [BirthYear], [DeathYear], [Portrait]) VALUES (1, N'Frida Kahlo', N'Mexico', 1907, 1954, N'/assets/img/home1/artist-img1.png')
INSERT [dbo].[Artists] ([ArtistId], [Name], [Country], [BirthYear], [DeathYear], [Portrait]) VALUES (2, N'Pablo Picasso', N'Spain', 1881, 1973, N'/assets/img/home1/artist-img2.png')
INSERT [dbo].[Artists] ([ArtistId], [Name], [Country], [BirthYear], [DeathYear], [Portrait]) VALUES (3, N'Andy Warhol', N'USA', 1928, 1987, N'/assets/img/home1/artist-img3.png')
INSERT [dbo].[Artists] ([ArtistId], [Name], [Country], [BirthYear], [DeathYear], [Portrait]) VALUES (4, N'Yayoi Kusama', NULL, NULL, NULL, N'/assets/img/home1/artist-img3.png')
INSERT [dbo].[Artists] ([ArtistId], [Name], [Country], [BirthYear], [DeathYear], [Portrait]) VALUES (5, N'Gustav Klimt', NULL, NULL, NULL, N'/assets/img/home1/artist-img5.png')
INSERT [dbo].[Artists] ([ArtistId], [Name], [Country], [BirthYear], [DeathYear], [Portrait]) VALUES (6, N'Henri Matisse', NULL, NULL, NULL, N'/assets/img/home1/artist-img6.png')
INSERT [dbo].[Artists] ([ArtistId], [Name], [Country], [BirthYear], [DeathYear], [Portrait]) VALUES (7, N'Joan Miró', NULL, NULL, NULL, N'/assets/img/home1/artist-img7.png')
INSERT [dbo].[Artists] ([ArtistId], [Name], [Country], [BirthYear], [DeathYear], [Portrait]) VALUES (8, N'dtoan', NULL, NULL, NULL, NULL)
INSERT [dbo].[Artists] ([ArtistId], [Name], [Country], [BirthYear], [DeathYear], [Portrait]) VALUES (9, N'dtoan', NULL, NULL, NULL, NULL)
INSERT [dbo].[Artists] ([ArtistId], [Name], [Country], [BirthYear], [DeathYear], [Portrait]) VALUES (10, N'dtoan', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Artists] OFF
GO
SET IDENTITY_INSERT [dbo].[Bids] ON 

INSERT [dbo].[Bids] ([BidId], [ItemId], [UserId], [BidAmount], [BidTime]) VALUES (1, 1, 2, CAST(150.00 AS Decimal(18, 2)), CAST(N'2025-06-28T21:26:16.990' AS DateTime))
INSERT [dbo].[Bids] ([BidId], [ItemId], [UserId], [BidAmount], [BidTime]) VALUES (2, 1, 2, CAST(200.00 AS Decimal(18, 2)), CAST(N'2025-06-28T22:26:16.990' AS DateTime))
INSERT [dbo].[Bids] ([BidId], [ItemId], [UserId], [BidAmount], [BidTime]) VALUES (3, 3, 2, CAST(165.00 AS Decimal(18, 2)), CAST(N'2025-06-28T22:26:16.990' AS DateTime))
INSERT [dbo].[Bids] ([BidId], [ItemId], [UserId], [BidAmount], [BidTime]) VALUES (4, 25, 5, CAST(300.00 AS Decimal(18, 2)), CAST(N'2025-07-04T21:08:15.670' AS DateTime))
INSERT [dbo].[Bids] ([BidId], [ItemId], [UserId], [BidAmount], [BidTime]) VALUES (5, 25, 5, CAST(300.00 AS Decimal(18, 2)), CAST(N'2025-07-04T21:08:54.610' AS DateTime))
INSERT [dbo].[Bids] ([BidId], [ItemId], [UserId], [BidAmount], [BidTime]) VALUES (6, 25, 5, CAST(305.00 AS Decimal(18, 2)), CAST(N'2025-07-04T21:08:58.607' AS DateTime))
INSERT [dbo].[Bids] ([BidId], [ItemId], [UserId], [BidAmount], [BidTime]) VALUES (7, 25, 5, CAST(305.00 AS Decimal(18, 2)), CAST(N'2025-07-04T21:09:38.500' AS DateTime))
INSERT [dbo].[Bids] ([BidId], [ItemId], [UserId], [BidAmount], [BidTime]) VALUES (8, 25, 5, CAST(310.00 AS Decimal(18, 2)), CAST(N'2025-07-04T21:10:05.603' AS DateTime))
INSERT [dbo].[Bids] ([BidId], [ItemId], [UserId], [BidAmount], [BidTime]) VALUES (9, 25, 5, CAST(31400.00 AS Decimal(18, 2)), CAST(N'2025-07-04T21:40:01.973' AS DateTime))
INSERT [dbo].[Bids] ([BidId], [ItemId], [UserId], [BidAmount], [BidTime]) VALUES (10, 29, 5, CAST(15100.00 AS Decimal(18, 2)), CAST(N'2025-07-04T21:41:17.863' AS DateTime))
INSERT [dbo].[Bids] ([BidId], [ItemId], [UserId], [BidAmount], [BidTime]) VALUES (11, 28, 5, CAST(13200.00 AS Decimal(18, 2)), CAST(N'2025-07-04T21:44:01.017' AS DateTime))
INSERT [dbo].[Bids] ([BidId], [ItemId], [UserId], [BidAmount], [BidTime]) VALUES (12, 27, 5, CAST(126.00 AS Decimal(18, 2)), CAST(N'2025-07-04T21:57:13.737' AS DateTime))
INSERT [dbo].[Bids] ([BidId], [ItemId], [UserId], [BidAmount], [BidTime]) VALUES (13, 16, 5, CAST(164.00 AS Decimal(18, 2)), CAST(N'2025-07-04T21:57:40.640' AS DateTime))
INSERT [dbo].[Bids] ([BidId], [ItemId], [UserId], [BidAmount], [BidTime]) VALUES (14, 28, 5, CAST(13212.00 AS Decimal(18, 2)), CAST(N'2025-07-04T22:03:48.480' AS DateTime))
INSERT [dbo].[Bids] ([BidId], [ItemId], [UserId], [BidAmount], [BidTime]) VALUES (15, 28, 5, CAST(13213.00 AS Decimal(18, 2)), CAST(N'2025-07-04T22:03:58.323' AS DateTime))
SET IDENTITY_INSERT [dbo].[Bids] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'Painting')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'Sculpture')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'Photography')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (4, N'Streaming Auctions')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (5, N'General Artwork')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (6, N'Upcoming Auctions')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemImages] ON 

INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (1, 1, N'/assets/img/home1/auction-img1.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (2, 2, N'/assets/img/home1/auction-img2.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (3, 3, N'/assets/img/home1/auction-img3.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (4, 4, N'/assets/img/home1/auction-img1.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (5, 5, N'/assets/img/home1/general-art-img1.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (6, 6, N'/assets/img/home1/upcoming-auction-img1.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (7, 7, N'/assets/img/home1/auction-img2.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (8, 8, N'/assets/img/home1/general-art-img2.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (9, 9, N'/assets/img/home1/upcoming-auction-img2.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (10, 10, N'/assets/img/home1/auction-img3.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (11, 11, N'/assets/img/home1/general-art-img3.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (12, 12, N'/assets/img/home1/upcoming-auction-img3.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (13, 13, N'/assets/img/home1/auction-img4.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (14, 14, N'/assets/img/home1/general-art-img4.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (15, 15, N'/assets/img/home1/upcoming-auction-img4.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (16, 16, N'/assets/img/home1/auction-img5.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (17, 17, N'/assets/img/home1/general-art-img5.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (18, 18, N'/assets/img/home1/upcoming-auction-img5.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (19, 19, N'/assets/img/home1/auction-img6.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (20, 20, N'/assets/img/home1/general-art-img6.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (21, 21, N'/assets/img/home1/upcoming-auction-img6.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (22, 22, N'/assets/img/home1/auction-img7.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (23, 23, N'/assets/img/home1/general-art-img7.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (24, 24, N'/assets/img/home1/upcoming-auction-img7.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (27, 25, N'/assets/img/home1/general-art-img1.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (28, 26, N'/assets/img/home1/general-art-img2.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (29, 27, N'/assets/img/home1/general-art-img3.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (30, 28, N'/assets/img/home1/general-art-img4.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (31, 29, N'/assets/img/home1/general-art-img5.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (32, 30, N'/assets/img/home1/general-art-img6.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (33, 31, N'/assets/img/home1/upcoming-auction-img1.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (34, 32, N'/assets/img/home1/upcoming-auction-img2.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (35, 33, N'/assets/img/home1/upcoming-auction-img5.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (36, 25, N'/assets/img/home1/general-art-img7.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (37, 31, N'/assets/img/home1/upcoming-auction-img3.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (38, 32, N'/assets/img/home1/upcoming-auction-img4.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (39, 33, N'/assets/img/home1/upcoming-auction-img6.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (40, 33, N'/assets/img/home1/upcoming-auction-img7.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (41, 33, N'/assets/img/home1/upcoming-auction-img8.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (42, 33, N'/assets/img/home1/upcoming-auction-img9.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (43, 25, N'/assets/img/home1/general-art-img8.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (44, 25, N'/assets/img/home1/general-art-img9.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (52, 40, N'/uploads/demo1.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (53, 41, N'/uploads/demo2.jpg', 1)
INSERT [dbo].[ItemImages] ([ImageId], [ItemId], [FilePath], [IsMain]) VALUES (54, 42, N'/uploads/demo3.jpg', 1)
SET IDENTITY_INSERT [dbo].[ItemImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (1, N'More than just art—it''s a feeling', N'An abstract artwork that evokes deep emotions.', 1, 1, 1, CAST(100.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(N'2025-06-28T23:26:16.980' AS DateTime), CAST(N'2025-10-23T12:00:00.000' AS DateTime), N'Live', CAST(N'2025-06-28T23:26:16.980' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (2, N'Modern Times Sculpture', N'A contemporary sculpture made of recycled metal pieces.', 2, 2, 1, CAST(200.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(N'2025-06-28T23:26:16.980' AS DateTime), CAST(N'2025-07-03T23:26:16.980' AS DateTime), N'Upcoming', CAST(N'2025-06-28T23:26:16.980' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (3, N'Moments in Time Photography', N'A stunning photograph capturing fleeting moments.', 3, 3, 1, CAST(150.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(N'2025-06-28T23:26:16.980' AS DateTime), CAST(N'2025-11-10T15:30:00.000' AS DateTime), N'Live', CAST(N'2025-06-28T23:26:16.980' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (4, N'Streaming Auction #1', N'Description for Streaming Auction 1', 1, 4, 1, CAST(110.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(N'2025-06-29T00:49:50.600' AS DateTime), CAST(N'2025-07-30T00:49:50.600' AS DateTime), N'Live', CAST(N'2025-06-29T00:49:50.600' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (5, N'General Artwork #1', N'Description for General Artwork 1', 1, 5, 1, CAST(55.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(N'2025-06-29T00:49:50.600' AS DateTime), CAST(N'2025-08-29T00:49:50.600' AS DateTime), N'Closed', CAST(N'2025-06-29T00:49:50.600' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (6, N'Upcoming Auction #1', N'Description for Upcoming Auction 1', 3, 6, 1, CAST(165.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(N'2025-06-30T00:49:50.600' AS DateTime), CAST(N'2025-07-31T00:49:50.600' AS DateTime), N'Upcoming', CAST(N'2025-06-29T00:49:50.600' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (7, N'Streaming Auction #2', N'Description for Streaming Auction 2', 2, 4, 1, CAST(120.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(N'2025-06-29T00:49:50.600' AS DateTime), CAST(N'2025-07-31T00:49:50.600' AS DateTime), N'Live', CAST(N'2025-06-29T00:49:50.600' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (8, N'General Artwork #2', N'Description for General Artwork 2', 2, 5, 1, CAST(60.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(N'2025-06-29T00:49:50.600' AS DateTime), CAST(N'2025-08-30T00:49:50.600' AS DateTime), N'Closed', CAST(N'2025-06-29T00:49:50.600' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (9, N'Upcoming Auction #2', N'Description for Upcoming Auction 2', 4, 6, 1, CAST(180.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(N'2025-06-30T00:49:50.600' AS DateTime), CAST(N'2025-08-01T00:49:50.600' AS DateTime), N'Upcoming', CAST(N'2025-06-29T00:49:50.600' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (10, N'Streaming Auction #3', N'Description for Streaming Auction 3', 3, 4, 1, CAST(130.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(N'2025-06-29T00:49:50.600' AS DateTime), CAST(N'2025-08-01T00:49:50.600' AS DateTime), N'Live', CAST(N'2025-06-29T00:49:50.600' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (11, N'General Artwork #3', N'Description for General Artwork 3', 3, 5, 1, CAST(65.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(N'2025-06-29T00:49:50.600' AS DateTime), CAST(N'2025-08-31T00:49:50.600' AS DateTime), N'Closed', CAST(N'2025-06-29T00:49:50.600' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (12, N'Upcoming Auction #3', N'Description for Upcoming Auction 3', 5, 6, 1, CAST(195.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(N'2025-06-30T00:49:50.600' AS DateTime), CAST(N'2025-08-02T00:49:50.600' AS DateTime), N'Upcoming', CAST(N'2025-06-29T00:49:50.600' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (13, N'Streaming Auction #4', N'Description for Streaming Auction 4', 4, 4, 1, CAST(140.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(N'2025-06-29T00:49:50.600' AS DateTime), CAST(N'2025-08-02T00:49:50.600' AS DateTime), N'Live', CAST(N'2025-06-29T00:49:50.600' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (14, N'General Artwork #4', N'Description for General Artwork 4', 4, 5, 1, CAST(70.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(N'2025-06-29T00:49:50.600' AS DateTime), CAST(N'2025-09-01T00:49:50.600' AS DateTime), N'Closed', CAST(N'2025-06-29T00:49:50.600' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (15, N'Upcoming Auction #4', N'Description for Upcoming Auction 4', 6, 6, 1, CAST(210.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(N'2025-06-30T00:49:50.600' AS DateTime), CAST(N'2025-08-03T00:49:50.600' AS DateTime), N'Upcoming', CAST(N'2025-06-29T00:49:50.600' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (16, N'Streaming Auction #5', N'Description for Streaming Auction 5', 5, 4, 1, CAST(150.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(N'2025-06-29T00:49:50.603' AS DateTime), CAST(N'2025-08-03T00:49:50.603' AS DateTime), N'Live', CAST(N'2025-06-29T00:49:50.603' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (17, N'General Artwork #5', N'Description for General Artwork 5', 5, 5, 1, CAST(75.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(N'2025-06-29T00:49:50.603' AS DateTime), CAST(N'2025-09-02T00:49:50.603' AS DateTime), N'Closed', CAST(N'2025-06-29T00:49:50.603' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (18, N'Upcoming Auction #5', N'Description for Upcoming Auction 5', 7, 6, 1, CAST(225.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(N'2025-06-30T00:49:50.603' AS DateTime), CAST(N'2025-08-04T00:49:50.603' AS DateTime), N'Upcoming', CAST(N'2025-06-29T00:49:50.603' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (19, N'Streaming Auction #6', N'Description for Streaming Auction 6', 6, 4, 1, CAST(160.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(N'2025-06-29T00:49:50.603' AS DateTime), CAST(N'2025-08-04T00:49:50.603' AS DateTime), N'Live', CAST(N'2025-06-29T00:49:50.603' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (20, N'General Artwork #6', N'Description for General Artwork 6', 6, 5, 1, CAST(80.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(N'2025-06-29T00:49:50.603' AS DateTime), CAST(N'2025-09-03T00:49:50.603' AS DateTime), N'Closed', CAST(N'2025-06-29T00:49:50.603' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (21, N'Upcoming Auction #6', N'Description for Upcoming Auction 6', 1, 6, 1, CAST(240.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(N'2025-06-30T00:49:50.603' AS DateTime), CAST(N'2025-08-05T00:49:50.603' AS DateTime), N'Upcoming', CAST(N'2025-06-29T00:49:50.603' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (22, N'Streaming Auction #7', N'Description for Streaming Auction 7', 7, 4, 1, CAST(170.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(N'2025-06-29T00:49:50.603' AS DateTime), CAST(N'2025-08-05T00:49:50.603' AS DateTime), N'Live', CAST(N'2025-06-29T00:49:50.603' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (23, N'General Artwork #7', N'Description for General Artwork 7', 7, 5, 1, CAST(85.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(N'2025-06-29T00:49:50.603' AS DateTime), CAST(N'2025-09-04T00:49:50.603' AS DateTime), N'Closed', CAST(N'2025-06-29T00:49:50.603' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (24, N'Upcoming Auction #7', N'Description for Upcoming Auction 7', 2, 6, 1, CAST(255.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(N'2025-06-30T00:49:50.603' AS DateTime), CAST(N'2025-08-06T00:49:50.603' AS DateTime), N'Live', CAST(N'2025-06-29T00:49:50.603' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (25, N'General Art 1', N'Beautiful general artwork #1', 1, 1, 1, CAST(280.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-06-29T18:08:40.417' AS DateTime), CAST(N'2025-07-29T18:08:40.417' AS DateTime), N'Closed', CAST(N'2025-06-29T18:08:40.417' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (26, N'General Art 2', N'Beautiful general artwork #2', 2, 1, 1, CAST(110.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-06-29T18:08:40.417' AS DateTime), CAST(N'2025-07-29T18:08:40.417' AS DateTime), N'Closed', CAST(N'2025-06-29T18:08:40.417' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (27, N'General Art 3', N'Beautiful general artwork #3', 3, 1, 1, CAST(120.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-06-29T18:08:40.417' AS DateTime), CAST(N'2025-07-29T18:08:40.417' AS DateTime), N'Closed', CAST(N'2025-06-29T18:08:40.417' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (28, N'General Art 4', N'Beautiful general artwork #4', 1, 1, 1, CAST(130.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-06-29T18:08:40.417' AS DateTime), CAST(N'2025-07-29T18:08:40.417' AS DateTime), N'Closed', CAST(N'2025-06-29T18:08:40.417' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (29, N'General Art 5', N'Beautiful general artwork #5', 2, 1, 1, CAST(148.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-06-29T18:08:40.417' AS DateTime), CAST(N'2025-07-29T18:08:40.417' AS DateTime), N'Closed', CAST(N'2025-06-29T18:08:40.417' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (30, N'General Art 6', N'Beautiful general artwork #6', 3, 1, 1, CAST(159.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-06-29T18:08:40.417' AS DateTime), CAST(N'2025-07-29T18:08:40.417' AS DateTime), N'Closed', CAST(N'2025-06-29T18:08:40.417' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (31, N'Upcoming Art 1', N'Sneak peek of upcoming art #1', 1, 2, 1, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-06-29T18:08:40.417' AS DateTime), CAST(N'2025-07-09T18:08:40.417' AS DateTime), N'Upcoming', CAST(N'2025-06-29T18:08:40.417' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (32, N'Upcoming Art 2', N'Sneak peek of upcoming art #2', 2, 2, 1, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-06-29T18:08:40.417' AS DateTime), CAST(N'2025-07-14T18:08:40.417' AS DateTime), N'Upcoming', CAST(N'2025-06-29T18:08:40.417' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (33, N'Upcoming Art 3', N'Sneak peek of upcoming art #3', 3, 2, 1, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-06-29T18:08:40.417' AS DateTime), CAST(N'2025-07-19T18:08:40.417' AS DateTime), N'Upcoming', CAST(N'2025-06-29T18:08:40.417' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (40, N'Demo1', N'lakdsjfldskjflasdjflk', 10, 1, 5, CAST(2818.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(N'2025-07-04T18:17:20.480' AS DateTime), CAST(N'2025-07-18T01:16:55.353' AS DateTime), N'Live', CAST(N'2025-07-04T18:17:20.480' AS DateTime), N'/docs/Môn thầy Thành.docx')
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (41, N'Demo 2', N'ádfsavadfbadfgaf', 4, 2, 5, CAST(299.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(N'2025-07-04T22:19:07.727' AS DateTime), CAST(N'2025-07-28T05:18:37.330' AS DateTime), N'Live', CAST(N'2025-07-04T22:19:07.727' AS DateTime), NULL)
INSERT [dbo].[Items] ([ItemId], [Title], [Description], [ArtistId], [CategoryId], [SellerId], [MinimumBid], [BidIncrement], [BidStartDate], [BidEndDate], [BidStatus], [CreatedAt], [DocumentPath]) VALUES (42, N'Demo 3', N'asdfsdfnaksdfjpaslkjfaplfjkspdofjksodjfaopsdjfpoasdjvpiadnvipavniwu hfaohfoihfoiasudf hoasiuhdfo asuifhoisud fhoasijnvasjnfaosjdfoiasdhfoiasdjfhkasnca', 1, 3, 5, CAST(179.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(N'2025-07-04T22:20:02.080' AS DateTime), CAST(N'2025-08-22T05:19:17.653' AS DateTime), N'Live', CAST(N'2025-07-04T22:20:02.080' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [Role], [Status]) VALUES (1, N'seller1', N'P@ssw0rd', N'seller1@example.com', N'Seller', N'Active')
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [Role], [Status]) VALUES (2, N'buyer1', N'P@ssw0rd', N'buyer1@example.com', N'Buyer', N'Active')
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [Role], [Status]) VALUES (5, N'Trần Đức Toàn', N'$2a$11$iCUbnbePt8RQqL4j3CpJ6eq.Dg.kp.eh7AyZx09LU5JjaWPdHroQS', N'toan4679@gmail.com', N'Buyer', N'Active')
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [Role], [Status]) VALUES (6, N'admin', N'$2a$12$l.K/lw078kfUS5z9S.VSUOL48X/PCbwUMlYD6RHzRa66n4oR/21Z6', N'admin@gmail.com', N'Admin', N'Active')
INSERT [dbo].[Users] ([UserId], [Username], [PasswordHash], [Email], [Role], [Status]) VALUES (7, N'Đức Toàn', N'$2a$11$MAC6afeAKwjJ34b0BfJ4keFA7mQ02ezKe3pw9KuVuiwlVQfr0Gq4O', N'toan@gmail.com', N'Buyer', N'Active')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E495080B8A]    Script Date: 05/07/2025 5:27:27 SA ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bids] ADD  DEFAULT (getdate()) FOR [BidTime]
GO
ALTER TABLE [dbo].[ItemImages] ADD  DEFAULT ((0)) FOR [IsMain]
GO
ALTER TABLE [dbo].[Items] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Bids_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([ItemId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Bids_Items]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Bids_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Bids_Users]
GO
ALTER TABLE [dbo].[ItemImages]  WITH CHECK ADD  CONSTRAINT [FK_ItemImages_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([ItemId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemImages] CHECK CONSTRAINT [FK_ItemImages_Items]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Artist] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artists] ([ArtistId])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Artist]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Artists] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artists] ([ArtistId])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Artists]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Categories]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Users] FOREIGN KEY([SellerId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Users]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Users]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([ItemId])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Items]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Users] FOREIGN KEY([RatedBy])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Users]
GO
