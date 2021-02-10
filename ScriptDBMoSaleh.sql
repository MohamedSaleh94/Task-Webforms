USE [master]
GO
/****** Object:  Database [MoSalehTask]    Script Date: 2021-02-10 08:14:11 م ******/
CREATE DATABASE [MoSalehTask]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MoSalehTask', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MoSalehTask.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MoSalehTask_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MoSalehTask_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MoSalehTask] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MoSalehTask].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MoSalehTask] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MoSalehTask] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MoSalehTask] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MoSalehTask] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MoSalehTask] SET ARITHABORT OFF 
GO
ALTER DATABASE [MoSalehTask] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MoSalehTask] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MoSalehTask] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MoSalehTask] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MoSalehTask] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MoSalehTask] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MoSalehTask] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MoSalehTask] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MoSalehTask] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MoSalehTask] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MoSalehTask] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MoSalehTask] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MoSalehTask] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MoSalehTask] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MoSalehTask] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MoSalehTask] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MoSalehTask] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MoSalehTask] SET RECOVERY FULL 
GO
ALTER DATABASE [MoSalehTask] SET  MULTI_USER 
GO
ALTER DATABASE [MoSalehTask] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MoSalehTask] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MoSalehTask] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MoSalehTask] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MoSalehTask] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MoSalehTask', N'ON'
GO
ALTER DATABASE [MoSalehTask] SET QUERY_STORE = OFF
GO
USE [MoSalehTask]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MoSalehTask]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2021-02-10 08:14:11 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2021-02-10 08:14:12 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2021-02-10 08:14:12 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2021-02-10 08:14:12 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2021-02-10 08:14:12 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2021-02-10 08:14:12 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 2021-02-10 08:14:12 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssignedDate] [datetime] NOT NULL,
	[Attachment] [nvarchar](max) NULL,
	[AssignedToUser] [nvarchar](128) NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedByUser] [nvarchar](128) NULL,
	[UpdatedByUser] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.Task] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202102092211185_CreateDb', N'MoSalehTask.Migrations.Configuration', 0x1F8B0800000000000400ED5DD96EE4B8157D0F907F10F494049E2A2FE946C728CFC05DB62785B41774D983BC192C8955165A4B8D44B96D04F36579C827E517426AE52A91926A0B06030C5C2279371E929797BCECFFFEFB3F939FDE02DF7A8571E245E1857D323AB62D183A91EB85AB0B3B45CB1F3ED93FFDF8C73F4CAEDDE0CDFAA5AC7746EAE196617261BF20B43E1F8F13E705062019059E134749B44423270AC6C08DC6A7C7C77F1B9F9C8C212661635A9635F99A86C80B60F603FF9C46A103D72805FE6DE4423F29BEE3927946D5BA03014CD6C08117F66D34073E7C7904C9B7D11540C0B62E7D0F6039E6D05FDA1608C3080184A53C7F4AE01CC551B89AAFF107E03FBEAF21AEB7047E020BE9CFEBEABA8A1C9F1245C675C392949326280A0C099E9C159619F3CD3BD9D7AE2C876D778D6D8CDE89D699FD2EEC990BB34F5F231F1B8067783EF56352199BB8627199ACEF201A950D4739C99B1893FB1EC5DF4634C5234BBBDD5185A4D3D131F9EFC89AA63E4A637811C214C5C03FB21ED285EF39FF80EF8FD137185E9C9D2C96679F3E7C04EED9C7BFC2B30FB4A658575C8FF9803F3DC4D11AC65836B8ACF4B7AD31DB6ECC37AC9A516D72AB602CE141615BB7E0ED0B0C57E8050F97D34FB675E3BD41B7FC5280EB29F4F018C28D509CE29F77A9EF83850FABF271234FF2FF06AEA71F3E0EC2F50EBC7AABACEB39FE78E0C4896D7D857E569ABC78EB7C7831FDFD5C54BB89A380FC66F195973ECFA33476883291B2CA23885710B1D24DC63578B5204D480D0FEB92EAFE439B482AC25B5A9528D46524942CB63D1A4A7937CB571B7164E1694419B53EE5AB590E110F2623F21163A9AE51A3E544172D21D662FB93DF2C4467A71213521698A328863FC310C60041F7012004E3B01EA16DDD7C9924DE2A842E5ED3ABC98FFCFDE805E698B94408382F01E6DC801BFCA7166EF4E47E8CC8001900A6CDEC1E3DE4372D0EC32875051327F6D6B91FB2615E738C9F34A9D89065A6FC64D8EBD31862C00C02A0A7B54B502CA7D5DC74965C411FE2C665C3CF119EC140D8511DF7F3FB56805568BC296E4A67A31E3F528F83CC92CF749DDADDE08A045F832F97391A4D9255F6570B4655E1E4AA4AE462D5C5A65255FDA4968AAAC2495595C8A5AA8B7B396597EB355EB132D1723019AD965CEBC35C2FB7E71E5D07C0F307D82D6870C1DBF4A51707FD67B6079024D85976FF0E9297CDAF2FD049630C50BCA804EB8D737B7889427897068BC64974705E8375CDE3F7E80638D895BB0E49ABDEF4BE44CEB72845D761B6963E21C77439AD080C22CEA5E3C024B9C16086EE344A6BFF50E5E0B62C9A7882DAF56E7DEA032F906FD7B9A9F4B9AC5AAF0AF21AC2EAA0A866BA767D89565EA8276A59552D6A5EA355D4A29AA9A884989EA4454DB5A059855639F35A830543B21E1A3E1A9291DDFF70C8BE6F7677154BC9BA8F30DDF8DA9471FA05F8E9D0AC3A8D866C12187E346464F77F346462E2CFAF9E4BBC128D1861591993D7AA2F0F3FB68F394EB26D0F0746CD6D33DFCE1CA01E2E69400D9632E2324B6E7CB0AA4FC90CE39C699014C19B41B66D5853DC3BFE3BB60C3D33B366BD85C4012E8F4EE077DBCAA69D0BFB58E801A6EA8C006F156377B06A71D2DC621A056B12D9A9EA9F8AB6CEAD4A7FBC4C92C8F132EB49CEE18A5314962BF696ADF623953A5EC61EECDD62D37AC4B9C05F643A35522F1D1009F5FA8C85E5F01781039E18604C1A01B2674C70077B211267112F74BC35F05B55E55A6AAEF8A43F2A1E7CC9155CC390306CB5840E73F9910A11A0E2C34D8C6D169A8C29D834A349E1E4ABFABCCDE3AFFB5D08E3E803AB65BFA00057E1B36E045DCD6A6F0161CD26D1114079C6B70B9415FB335D00F09BB58DA08CDBEA295056F8825B4119ABF60E50C69AE4E05096EFAD75FB9FDB686F0463EC367DFBAB64A3CE3B0018638FBDC7177F9AA4EA75E5D152DDDFF93D80B63E56939440A805A6C7A39188D44E2052C8B205F8280CABC3993F68DF1D80EA53BFC6CE961C01F6848F786AB833F408A26C0B3C825575187347E9BB834E7D34DBD8D19273DA9ED0118F7677061D41946D4147B0AAD67AC5DE8BD80274F2800D6E83708B2AF840F5D1D58214C2372489CF60298B104D52C487785810E27388D8738E3A48240D2908D86289F0BE4F13C1DA3F6A214ABA4C4628877F4BE3E26EAAD05840BA8166E5E959A36AC51ED6806C79D2D548B6D8B47064290089B4E93BBA5445F54D5E1ED95A51A84AB30A4AC208D18A3751742468E2E3CAACE21A46519D848A86D109A798045428C58ACE6830504BDC4461A45299C1AD5442B3DD4AB270804940A09795B87DBFC24AA532835BA9C068BB9124BB5983FD6C2F13B1DBD60D0F36E1CE9E689AC68D98D6568CD2A158291ACCA1DA7CB5D9B4ABF2D4BD4085EE8A3D84CE2EC25C7371DFB029C5A9AB870AC5151EB08E0F6CAEB8E8F5F650BC3C4AAB3CB3AA6C32CEF3D48A0F93B122A16D720BD66B2F5C51096EC5176B9E67B74D7F989B277E05398DB1C34C2EBC1F597142510C56902B25A75B2EBCF1E20491ACBA0520A77F533710AA49FD5085B753B2A45D4DB1C74AB7A7AC4DFECE5BF0B97EAC572A7AEF05851BAC1FB9FB9FA90A25939DBCB945D20D810F62C9C59069E4A741A8DE8AA85BE7D7C3E8F6F91791C264CCC92F6C35045B71D0E50DAFD52DE20A304817557E7EF76E52935019BB0C2ED2E656051CD554CAE33C9A8AEA886F67DD96CF80BDBA2ADB4999778FBCD966460F9B1544D3614B0C2852A9410C3DEABBB97C65505226A12A60A9A65A24F9D0C48A4FFA3498141E9A1253A04FAFBC2142932ABFE953A15374684AF4777D6A4C960E33E6E9027D7A54EA0E03D9FAB3A9A655DC48545619526AD55746B3254CB5B3694A155A3098A6F8988DF98CD54A61339357919A4113283E19D2A06EF70BC4A8327DAA6C02064D932D31981ED82C0B6696608B0CA4A473291821E9824EF4141695D73098B885EC09660E174AF5294BF22868D292E20EB42532F365064BA3986AC1AC8E62B1C14458E55DF09EDE1E3BD7CA486247EF3A0F35F773AF153436331F0EE39D5377D89945B5FE6C48ABB8A52E102BBEEF259694F1D68E58CACF17FA614941433DEB3077BFD949A7F1C2BA9A2673A19B99D89B2EB4ABE9992176A3B810A24F7C958A7B1585E2A24D9322F2D3FEC692100ACAABD8566946BCA8BF2708063990E6BFFA53DFCB764E65855B107A4B98A0FC32B77D7A7C72CA3DD4B43F8F268D93C4F5259133D5CB496C9F6D211F297C05B1F30262313BA0C7C3423551E10C7916BAF0EDC2FE57D6EA3C8BA792BFB2CF47D62C790ABD5F535CF018A7D0FA4DCC761CE6A1158DA77D2A417F3B883773F44D3EFBE773DEF4C8BA8FF1703AB78E394377E97EF6251D2369F2A63DA4317B5F67EB43CC2393576B529F69B2B1E4491BB24B47C33C695376E09F02F0F6679A5EF7676B8C30C192D0C586F12337BDD4943C64D38B1EFB584D869ADE8FD4748684E4911A192D1DBD84476B165E57D5B827648C20C550181251D2D76DCCE6639A4277D13A3FA272B85E07F34289942AE735747F90A40B6A658F91F49B23640F8EF4A228795464287A839850F56848175ACA0743BA4E6DF20744BA88A67C3CA4CB3AC03F1DA23F19952D77E88F4BC24607EBA5ED978F2EBCD0D06BA08BAF3018901BF4A5857E5BB5037BC160B0A553F240C160B477897B15B406CB951F343DBE8E40EC362B7E9B89F00DD777FEAFF2DF87CA1395E400EC3ECB7DDB80519D48ED591668BF5CF64D20A65835779FB1BE6DC4A8CE9DF61C314679E99B00CCAE96A31DC3457B453A882CF31E3891A664B297DF3BE48C1E0A241417570F3B67FC77346C1A0D079405FE3B18360D867DC9EB16D36EF89E93A70EE78B7CBD8D96EE75F37B1B17B6BB88709FE7DBF1FC8D4A79AE9F8A59ED552819D655D44CD549863CE31C9402B3FCB38C815656B830720406428D6665CC2C58ECFC1A4D58D46966AB48F86DE25DEC211A7917759A792BD26877918A2E4D6495BD2DD0E2462BEEB3495F29D8E7D473469396970EDA82178DF7450F29D37C10A330A34771F1F17012CB0731C93686CEA089E44319815E9AEA7CB8BD4A1C3F0855874915DF17550D92C3C56BB8D8A9A4FE4154ECD366702E49907F1E35840EE34E567566E1322A9D5B4EA2B20A77EE730B11C076059731F296C041B8981C6B67AF4F17EF1A5F070BE8CEC2FB14AD53845586C1C2678ED18877DCC43FCB8067659EDC67B7B0922154C0627A041AF7E1E7D4F3DD4AEE1BC94993820471BB8B4364D297881C26AFDE2B4A7751A849A8305FB55B7884C1DAC7C492FB700E5E6117D93058BFC01570DEEB73451591F68E60CD3EB9F2C02A064152D0A8DBE39F18C36EF0F6E3FF006A1E939417780000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'7f7c651e-c718-4fc2-88c9-e3bb3d6b094b', N'admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'19205d55-c2d7-43bb-8a77-4ac812810fe0', N'user')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4ceefdb9-5bd7-4d01-854e-746292db17c3', N'19205d55-c2d7-43bb-8a77-4ac812810fe0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'77389dd7-a48b-457c-aeb1-cbef5a6e83d0', N'19205d55-c2d7-43bb-8a77-4ac812810fe0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9ad3b2ef-7aeb-493d-b23e-84f9898cfbc1', N'19205d55-c2d7-43bb-8a77-4ac812810fe0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c47f8ac6-e449-4262-a390-cb153bd39409', N'19205d55-c2d7-43bb-8a77-4ac812810fe0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f4c480b4-9cde-4636-9b28-d540d7d60c0f', N'19205d55-c2d7-43bb-8a77-4ac812810fe0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b7de6316-f35e-4dd2-8419-383ec08ad733', N'7f7c651e-c718-4fc2-88c9-e3bb3d6b094b')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4ceefdb9-5bd7-4d01-854e-746292db17c3', N'user2@gmail.com', 0, N'AIRm+59m8yIIlzdtykYTowcJsHP9rUtfJVs69U/Ne92BQA9VWC8QOxI3ckNiuBwazg==', N'8a1327b9-9931-4f06-afb5-73fb679c721d', NULL, 0, 0, NULL, 0, 0, N'user2')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'77389dd7-a48b-457c-aeb1-cbef5a6e83d0', N'user1@gmail.com', 0, N'ADBrXav3CzSbvZGZkpe5uvfZm7myot04MvSHMBRABuQIvIH+LPXxz1rMJYHE+/NZ9Q==', N'46fd1225-3f4c-4857-a1c8-f344a9fa25ce', NULL, 0, 0, NULL, 0, 0, N'user1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9ad3b2ef-7aeb-493d-b23e-84f9898cfbc1', N'user5@gmail.com', 0, N'AFjNDDBPqyxdefhCdnEFl96I/GBcWs4+yxkNTxEriHLCEaRFjIWj0qd5lez0SMUSHw==', N'e91ae895-4271-4672-b707-6fa4e8f4780a', NULL, 0, 0, NULL, 0, 0, N'user5')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b7de6316-f35e-4dd2-8419-383ec08ad733', N'admin@gmail.com', 0, N'AA5L6iyXU09jzOJrPswzA3JlbN/1e3I31qAoce9NEtS3YalA6pTZ89cJJE1Jdw6Uhw==', N'ae81c915-4030-4d95-8ebf-6267e7e9bc99', NULL, 0, 0, NULL, 0, 0, N'admin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c47f8ac6-e449-4262-a390-cb153bd39409', N'user4@gmail.com', 0, N'AMPnkou3tm7h6zbnfMIihX6j2POrg4MgCMyCnYU+rIbAc5bPgN4/4Mh9tUsX9A1Vvw==', N'5043bff6-787c-4fa9-ae42-00c0b1fc638a', NULL, 0, 0, NULL, 0, 0, N'user4')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f4c480b4-9cde-4636-9b28-d540d7d60c0f', N'user3@gmail.com', 0, N'AEG6DwNVgpYbOwpA3w6np+EhrnlI8UUTiYiiiU9Nmu/Ya+SLbLhr4y+3X+0BnkWH+g==', N'f36a86b7-def9-4b6d-9a24-4367f281d3e0', NULL, 0, 0, NULL, 0, 0, N'user3')
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([Id], [AssignedDate], [Attachment], [AssignedToUser], [Title], [Description], [Status], [CreateDate], [UpdatedDate], [IsDeleted], [CreatedByUser], [UpdatedByUser]) VALUES (1, CAST(N'2021-02-10T20:05:19.287' AS DateTime), N'~/Attachments/Task/Capture2021210195750.PNG', N'9ad3b2ef-7aeb-493d-b23e-84f9898cfbc1', N'Hamada', N'Ahooo', 2, CAST(N'2021-02-10T19:57:50.150' AS DateTime), CAST(N'2021-02-10T20:05:19.287' AS DateTime), 0, N'b7de6316-f35e-4dd2-8419-383ec08ad733', N'b7de6316-f35e-4dd2-8419-383ec08ad733')
INSERT [dbo].[Task] ([Id], [AssignedDate], [Attachment], [AssignedToUser], [Title], [Description], [Status], [CreateDate], [UpdatedDate], [IsDeleted], [CreatedByUser], [UpdatedByUser]) VALUES (2, CAST(N'2021-02-10T19:58:35.610' AS DateTime), N'~/Attachments/Task/Capture2021210195835.PNG', N'77389dd7-a48b-457c-aeb1-cbef5a6e83d0', N'Mohamed', N'', 0, CAST(N'2021-02-10T19:58:35.610' AS DateTime), NULL, 0, N'b7de6316-f35e-4dd2-8419-383ec08ad733', NULL)
INSERT [dbo].[Task] ([Id], [AssignedDate], [Attachment], [AssignedToUser], [Title], [Description], [Status], [CreateDate], [UpdatedDate], [IsDeleted], [CreatedByUser], [UpdatedByUser]) VALUES (3, CAST(N'2021-02-10T20:06:44.790' AS DateTime), NULL, N'77389dd7-a48b-457c-aeb1-cbef5a6e83d0', N'Task1', N'اى حاجة', 0, CAST(N'2021-02-10T20:06:44.790' AS DateTime), NULL, 0, N'b7de6316-f35e-4dd2-8419-383ec08ad733', NULL)
SET IDENTITY_INSERT [dbo].[Task] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2021-02-10 08:14:12 م ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 2021-02-10 08:14:12 م ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 2021-02-10 08:14:12 م ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 2021-02-10 08:14:12 م ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 2021-02-10 08:14:12 م ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2021-02-10 08:14:12 م ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AssignedToUser]    Script Date: 2021-02-10 08:14:12 م ******/
CREATE NONCLUSTERED INDEX [IX_AssignedToUser] ON [dbo].[Task]
(
	[AssignedToUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CreatedByUser]    Script Date: 2021-02-10 08:14:12 م ******/
CREATE NONCLUSTERED INDEX [IX_CreatedByUser] ON [dbo].[Task]
(
	[CreatedByUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UpdatedByUser]    Script Date: 2021-02-10 08:14:12 م ******/
CREATE NONCLUSTERED INDEX [IX_UpdatedByUser] ON [dbo].[Task]
(
	[UpdatedByUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Task_dbo.AspNetUsers_AssignedToUser] FOREIGN KEY([AssignedToUser])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_dbo.Task_dbo.AspNetUsers_AssignedToUser]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Task_dbo.AspNetUsers_CreatedByUser] FOREIGN KEY([CreatedByUser])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_dbo.Task_dbo.AspNetUsers_CreatedByUser]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Task_dbo.AspNetUsers_UpdatedByUser] FOREIGN KEY([UpdatedByUser])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_dbo.Task_dbo.AspNetUsers_UpdatedByUser]
GO
USE [master]
GO
ALTER DATABASE [MoSalehTask] SET  READ_WRITE 
GO
