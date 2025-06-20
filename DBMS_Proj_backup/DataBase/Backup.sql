USE [master]
GO
/****** Object:  Database [DBMS_proj]    Script Date: 28/05/2025 11:28:14 ******/
CREATE DATABASE [DBMS_proj]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBMS_proj', FILENAME = N'C:\Program Files\Microsoft SQL Server.2\MSSQL16.SQLEXPRESS\MSSQL\DATA\DBMS_proj.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBMS_proj_log', FILENAME = N'C:\Program Files\Microsoft SQL Server.2\MSSQL16.SQLEXPRESS\MSSQL\DATA\DBMS_proj_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBMS_proj] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBMS_proj].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBMS_proj] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBMS_proj] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBMS_proj] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBMS_proj] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBMS_proj] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBMS_proj] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBMS_proj] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBMS_proj] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBMS_proj] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBMS_proj] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBMS_proj] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBMS_proj] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBMS_proj] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBMS_proj] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBMS_proj] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBMS_proj] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBMS_proj] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBMS_proj] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBMS_proj] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBMS_proj] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBMS_proj] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBMS_proj] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBMS_proj] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBMS_proj] SET  MULTI_USER 
GO
ALTER DATABASE [DBMS_proj] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBMS_proj] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBMS_proj] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBMS_proj] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBMS_proj] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBMS_proj] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBMS_proj] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBMS_proj] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBMS_proj]
GO
/****** Object:  Table [dbo].[Bids]    Script Date: 28/05/2025 11:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bids](
	[BidID] [int] NOT NULL,
	[ProjectID] [int] NULL,
	[FreelancerID] [int] NULL,
	[BidAmount] [int] NULL,
	[DeliveryTime] [varchar](50) NULL,
	[BidDate] [date] NULL,
	[Status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[BidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 28/05/2025 11:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 28/05/2025 11:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[CompanyWebsiteURL] [varchar](50) NULL,
	[Industry] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[Verified] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 28/05/2025 11:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[ContractID] [int] NOT NULL,
	[BidID] [int] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[ContractTerms] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[PaymentSchedule] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Freelancers]    Script Date: 28/05/2025 11:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Freelancers](
	[FreelancerID] [int] NOT NULL,
	[ExperienceLevel] [varchar](50) NULL,
	[HourlyRate] [int] NULL,
	[Availability] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
	[LinkedInProfileURL] [varchar](200) NULL,
	[WebsiteURL] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[FreelancerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 28/05/2025 11:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageID] [int] NOT NULL,
	[SenderID] [int] NULL,
	[ReceiverID] [int] NULL,
	[Content] [varchar](200) NULL,
	[SentDate] [date] NULL,
	[IsRead] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 28/05/2025 11:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] NOT NULL,
	[UserID] [int] NULL,
	[Content] [varchar](50) NULL,
	[NotificationDate] [date] NULL,
	[IsRead] [varchar](50) NULL,
	[NotificationType] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 28/05/2025 11:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] NOT NULL,
	[ContractID] [int] NULL,
	[Amount] [int] NULL,
	[PaymentDate] [date] NULL,
	[PaymentMethod] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[TransactionReference] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Portfolio]    Script Date: 28/05/2025 11:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Portfolio](
	[PortfolioID] [int] NOT NULL,
	[FreelancerID] [int] NULL,
	[ProjectTitle] [varchar](50) NULL,
	[ProjectDescription] [varchar](200) NULL,
	[SkillsUsed] [varchar](50) NULL,
	[CompletionDate] [date] NULL,
	[ClientFeedback] [varchar](50) NULL,
	[ProjectURL] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PortfolioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 28/05/2025 11:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] NOT NULL,
	[ClientID] [int] NULL,
	[Title] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[CategoryID] [int] NULL,
	[Budget] [int] NULL,
	[Deadline] [date] NULL,
	[PostingDate] [date] NULL,
	[Status] [varchar](50) NULL,
	[Visibility] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 28/05/2025 11:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [int] NOT NULL,
	[ContractID] [int] NULL,
	[ReviewerID] [int] NULL,
	[RevieweeID] [int] NULL,
	[Rating] [int] NULL,
	[Comment] [varchar](50) NULL,
	[ReviewDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 28/05/2025 11:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[SkillID] [int] NOT NULL,
	[SkillName] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionHistory]    Script Date: 28/05/2025 11:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionHistory](
	[TransactionID] [int] NOT NULL,
	[UserID] [int] NULL,
	[TransactionType] [varchar](50) NULL,
	[Amount] [int] NULL,
	[TransactionDate] [date] NULL,
	[Description] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28/05/2025 11:28:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[Username] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[PasswordHash] [varchar](50) NULL,
	[UserType] [varchar](50) NULL,
	[RegistrationDate] [date] NULL,
	[LastLoginDate] [date] NULL,
	[ProfilePictureURL] [varchar](50) NULL,
	[Bio] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD FOREIGN KEY([FreelancerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD FOREIGN KEY([BidID])
REFERENCES [dbo].[Bids] ([BidID])
GO
ALTER TABLE [dbo].[Freelancers]  WITH CHECK ADD FOREIGN KEY([FreelancerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD FOREIGN KEY([ReceiverID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD FOREIGN KEY([SenderID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contracts] ([ContractID])
GO
ALTER TABLE [dbo].[Portfolio]  WITH CHECK ADD FOREIGN KEY([FreelancerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contracts] ([ContractID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([ReviewerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([RevieweeID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[TransactionHistory]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
USE [master]
GO
ALTER DATABASE [DBMS_proj] SET  READ_WRITE 
GO
