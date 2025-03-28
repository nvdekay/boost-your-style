USE [master]
GO
/****** Object:  Database [BoostYourStyleDB]    Script Date: 3/16/2025 3:46:35 PM ******/
CREATE DATABASE [BoostYourStyleDB]
GO
ALTER DATABASE [BoostYourStyleDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BoostYourStyleDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BoostYourStyleDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BoostYourStyleDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BoostYourStyleDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BoostYourStyleDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BoostYourStyleDB] SET  MULTI_USER 
GO
ALTER DATABASE [BoostYourStyleDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BoostYourStyleDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BoostYourStyleDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BoostYourStyleDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BoostYourStyleDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BoostYourStyleDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BoostYourStyleDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [BoostYourStyleDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BoostYourStyleDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/16/2025 3:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Create_At] [datetime] NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/16/2025 3:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Describe] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/16/2025 3:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[productName] [nvarchar](255) NULL,
	[productImage] [nvarchar](255) NULL,
	[productPrice] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/16/2025 3:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[totalPrice] [float] NULL,
	[note] [nvarchar](255) NULL,
	[create_date] [date] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/16/2025 3:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [varchar](10) NOT NULL,
	[name] [nvarchar](max) NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[releaseDate] [date] NULL,
	[describe] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[cid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/16/2025 3:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Create_At] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [Username], [Email], [Address], [PhoneNumber], [Password], [RoleID], [Create_At], [active]) VALUES (1, N'user', N'user1@gmail.com', N'Nghean', N'0111111111', N'user', 2, CAST(N'2025-03-12T22:30:29.097' AS DateTime), 1)
INSERT [dbo].[Account] ([ID], [Username], [Email], [Address], [PhoneNumber], [Password], [RoleID], [Create_At], [active]) VALUES (2, N'admin', N'admin@gmail.com', N'Hanoi', N'0000000000', N'admin', 1, CAST(N'2025-03-12T22:30:29.097' AS DateTime), 1)
INSERT [dbo].[Account] ([ID], [Username], [Email], [Address], [PhoneNumber], [Password], [RoleID], [Create_At], [active]) VALUES (3, N'jane@example.com', N'jane@example.com', N'123 Beach Ave,Ocean City', N'09822221331', N'1', 1, CAST(N'2025-03-16T11:58:22.133' AS DateTime), 1)
INSERT [dbo].[Account] ([ID], [Username], [Email], [Address], [PhoneNumber], [Password], [RoleID], [Create_At], [active]) VALUES (5, N'cr7@gmail.com', N'cr7@gmail.com', N'123 Beach Ave,Ocean City', N'08223241331', N'1', 2, CAST(N'2025-03-16T12:00:26.493' AS DateTime), 1)
INSERT [dbo].[Account] ([ID], [Username], [Email], [Address], [PhoneNumber], [Password], [RoleID], [Create_At], [active]) VALUES (6, N'thanhdo9901@gmail.com', N'thanhdo9901@gmail.com', N'van quan', N'09342424231', N'grNj1wPe', 2, CAST(N'2025-03-16T15:04:28.377' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Categories] ([ID], [Name], [Describe]) VALUES (1, N'Clothes', N'Hiện đại, Phù hợp với mọi lứa tuổi.')
INSERT [dbo].[Categories] ([ID], [Name], [Describe]) VALUES (2, N'Watches', N'Dáng đẹp, lịch lãm, cá tính, thể thao.')
INSERT [dbo].[Categories] ([ID], [Name], [Describe]) VALUES (3, N'Shoes', N'Nhiều mẫu mã, thoáng mát, tiện lợi.')
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (6, 1, N'Coat', N'https://i.pinimg.com/736x/cb/94/9c/cb949c0a2fc49e4a64eb364a774381bc.jpg', 5000, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (7, 2, N'T-Shirt', N'https://i.pinimg.com/736x/5d/02/53/5d02539f06d72f0e9ce36c60ec50d9fb.jpg', 1000, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (8, 3, N'Hoodie', N'https://i.pinimg.com/736x/f8/3e/0d/f83e0db545b7cf66ec6734f579977ebb.jpg', 868.686, 4)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (9, 4, N'Coat', N'https://i.pinimg.com/736x/cb/94/9c/cb949c0a2fc49e4a64eb364a774381bc.jpg', 5000, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (10, 5, N'Pants', N'https://i.pinimg.com/736x/b7/79/e6/b779e6f79d4730b5c4760a7e1eae58aa.jpg', 868.686, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (11, 6, N'T-Shirt', N'https://i.pinimg.com/736x/5d/02/53/5d02539f06d72f0e9ce36c60ec50d9fb.jpg', 1000, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (12, 7, N'T-Shirt', N'https://i.pinimg.com/736x/5d/02/53/5d02539f06d72f0e9ce36c60ec50d9fb.jpg', 1000, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (13, 8, N'T-Shirt', N'https://i.pinimg.com/736x/5d/02/53/5d02539f06d72f0e9ce36c60ec50d9fb.jpg', 1000, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (14, 9, N'T-Shirt', N'https://i.pinimg.com/736x/5d/02/53/5d02539f06d72f0e9ce36c60ec50d9fb.jpg', 1000, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date]) VALUES (1, 1, 10000, N'ship', CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date]) VALUES (2, 1, 2000, N'fdfd', CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date]) VALUES (3, 1, 3474.744, N'ship', CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date]) VALUES (4, 1, 5000, N'fdfd', CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date]) VALUES (5, 1, 868.686, N'ship', CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date]) VALUES (6, 1, 1000, N'fdfd', CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date]) VALUES (7, 1, 1000, N'ship', CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date]) VALUES (8, 1, 1000, N'fdfd', CAST(N'2025-03-16' AS Date))
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date]) VALUES (9, 1, 1000, N'ship', CAST(N'2025-03-16' AS Date))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'cl1 ', N'T-Shirt', 0, 1000.0000, CAST(N'2025-03-12' AS Date), N'một trong những loại trang phục phổ biến nhất, có thiết kế đơn giản, dễ phối đồ và phù hợp với nhiều phong cách cổ tròn hoặc cổ chữ V.
Form áo vừa vặn, không quá rộng hay quá ôm. Chất liệu cotton hoặc vải thun co giãn, thoáng mát..', N'https://i.pinimg.com/736x/5d/02/53/5d02539f06d72f0e9ce36c60ec50d9fb.jpg', 1)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'cl2 ', N'Coat', 30, 5000.0000, CAST(N'2020-10-04' AS Date), N'Coat là một loại áo khoác dáng dài, thường được làm từ vải dạ, len, da hoặc sợi tổng hợp dày dặn, giúp giữ ấm tốt và tạo vẻ ngoài thanh lịch, sang trọng.', N'https://i.pinimg.com/736x/cb/94/9c/cb949c0a2fc49e4a64eb364a774381bc.jpg', 1)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'cl3 ', N'Pants', 22, 868.6860, CAST(N'2019-10-04' AS Date), N'một phần quan trọng trong thời trang, có nhiều kiểu dáng phù hợp với từng phong cách và hoàn cảnh khác nhau.', N'https://i.pinimg.com/736x/b7/79/e6/b779e6f79d4730b5c4760a7e1eae58aa.jpg', 1)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'cl4', N'Hoodie', 22, 868.6860, CAST(N'2019-10-04' AS Date), N'Hoodie là một loại áo khoác dài tay có mũ trùm đầu, thường làm từ vải nỉ, cotton, hoặc polyester. Đây là trang phục phổ biến trong thời trang đường phố (streetwear) và thể thao nhờ vào sự thoải mái, năng động và giữ ấm tốt.', N'https://i.pinimg.com/736x/f8/3e/0d/f83e0db545b7cf66ec6734f579977ebb.jpg', 1)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'cl5', N'Sweater', 50, 868.6860, CAST(N'2019-10-04' AS Date), N'Sweater là một loại áo dài tay được làm từ vải len, cotton dày hoặc sợi tổng hợp, giúp giữ ấm cơ thể trong thời tiết lạnh.', N'https://i.pinimg.com/736x/aa/6d/74/aa6d74eb243516e6ff12483ef66b700a.jpg', 1)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'cl6', N'Cardigan', 50, 200.0000, CAST(N'2019-10-04' AS Date), N'Cardigan là một loại áo khoác len mỏng, nhẹ, thường có hàng cúc hoặc khóa kéo phía trước. Đây là trang phục đa năng, dễ phối đồ, phù hợp với nhiều phong cách từ thanh lịch đến năng động.', N'https://i.pinimg.com/736x/30/f9/7c/30f97c1fe9075f4331b8be9394277cdb.jpg', 1)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'cl7', N'Jacket', 50, 400.0000, CAST(N'2019-10-04' AS Date), N'Jacket là loại áo khoác ngắn (thường ngang hông hoặc dài hơn một chút), có thể làm từ nhiều chất liệu khác nhau như da, denim, vải dù, cotton, nỉ hoặc lông.', N'https://i.pinimg.com/736x/b9/69/bb/b969bba3af3c94b29409049c2fed717b.jpg', 1)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'cl8', N'Gloves', 50, 400.0000, CAST(N'2019-10-04' AS Date), N'Gloves là phụ kiện bao bọc bàn tay, giúp giữ ấm, bảo vệ da hoặc tăng thêm phong cách thời trang. Găng tay có nhiều kiểu dáng, chất liệu khác nhau, phù hợp với từng mục đích sử dụng như giữ ấm, đi xe máy, thể thao hoặc thời trang.', N'https://i.pinimg.com/736x/8f/03/b9/8f03b98bb789a0c516775d8ea13c6505.jpg', 1)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'cl9', N'Zara Top', 100, 800.0000, CAST(N'2019-10-04' AS Date), N'Zara Tops là dòng áo thời trang của Zara, thương hiệu thời trang nổi tiếng đến từ Tây Ban Nha. Với thiết kế hiện đại, đa dạng và dễ phối đồ, Zara Tops luôn là lựa chọn hàng đầu của những người yêu thích phong cách thanh lịch, tối giản nhưng vẫn sành điệu.', N'https://i.pinimg.com/736x/a8/b8/56/a8b8568434d0b29754b983731f9dc182.jpg', 1)


INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N's1 ', N'Sneakers', 12, 20000.0000, CAST(N'2021-01-04' AS Date), N'Sneakers là dòng giày thể thao phổ biến nhất, được yêu thích bởi sự thoải mái, đa dạng mẫu mã và phù hợp với nhiều phong cách. Những thương hiệu hàng đầu như Nike, Adidas, Puma, New Balance hay Converse liên tục cho ra mắt các mẫu giày mang tính biểu tượng.', N'https://i.pinimg.com/736x/6f/cd/fc/6fcdfc09651455d3c77a2e1285239eb9.jpg', 3)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N's2 ', N'Dress Shoes', 12, 18000.0000, CAST(N'2020-10-08' AS Date), N'Giày tây là biểu tượng của sự thanh lịch, phù hợp với những dịp trang trọng, từ môi trường công sở đến tiệc cưới. Các thương hiệu cao cấp như Allen Edmonds, Church’s, Salvatore Ferragamo hay John Lobb đều tạo ra những mẫu giày thủ công tinh xảo.', N'https://i.pinimg.com/736x/4d/91/dd/4d91dd7d0820fc20641dca4061af51d0.jpg', 3)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N's3 ', N'Boots', 34, 16000.0000, CAST(N'2019-10-08' AS Date), N'Boots là dòng giày mang phong cách mạnh mẽ, bền bỉ, phù hợp với nhiều điều kiện thời tiết và môi trường. Timberland với dòng boots da lộn dày dặn là lựa chọn phổ biến trong mùa đông, Dr. Martens lại mang phong cách retro bụi bặm, trong khi Chelsea boots của Saint Laurent hay Common Projects được giới thời trang yêu thích vì thiết kế tối giản và sang trọng.', N'https://i.pinimg.com/736x/ca/c0/29/cac0292264894005ff3528bdeba12b7d.jpg', 3)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N's4 ', N'Running Shoes', 19, 15000.0000, CAST(N'2018-10-08' AS Date), N'Dành cho những ai đam mê thể thao, giày chạy bộ được thiết kế với công nghệ tiên tiến để tối ưu hóa hiệu suất và bảo vệ bàn chân. Nike ZoomX Vaporfly và Adidas Ultraboost là hai dòng giày chạy bộ được đánh giá cao về công nghệ đệm và độ phản hồi.', N'https://i.pinimg.com/736x/09/31/7b/09317bae3dd95088698b0bf51fce0f68.jpg', 3)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N's5 ', N'Sandals', 52, 14000.0000, CAST(N'2017-01-04' AS Date), N'Không chỉ tiện lợi, sandals ngày nay cũng trở thành một xu hướng thời trang. Birkenstock nổi tiếng với thiết kế thoải mái và phong cách cổ điển, Crocs mang đến sự nhẹ nhàng với chất liệu EVA êm ái, còn Teva hay Chaco là những thương hiệu xăng-đan leo núi bền bỉ, phù hợp với những chuyến phiêu lưu.', N'https://i.pinimg.com/736x/70/2a/7b/702a7b051c9ece2ff33c272837766111.jpg', 3)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N's6 ', N'Chelsea Boots', 52, 7000.0000, CAST(N'2025-03-12' AS Date), N'Chelsea Boots là một trong những loại bốt phổ biến nhất, nổi bật với thiết kế tối giản, không dây buộc, có phần thun co giãn ở hai bên cổ giày, giúp dễ dàng xỏ vào và tháo ra. Đây là kiểu giày mang phong cách thanh lịch, cổ điển nhưng vẫn rất hiện đại.', N'https://i.pinimg.com/736x/38/72/4c/38724c2d87fe8ae5efa6d2c36a81d169.jpg', 3)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N's7 ', N'Sport Shoes', 52, 8000.0000, CAST(N'2025-03-12' AS Date), N'Sport Shoes là loại giày được thiết kế để hỗ trợ vận động, giúp bảo vệ chân và tối ưu hiệu suất khi tập luyện. Mỗi loại giày thể thao đều có thiết kế và công nghệ phù hợp với từng bộ môn khác nhau.', N'https://i.pinimg.com/736x/95/5b/db/955bdbf7c10a5705c7c94834667aa600.jpg', 3)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N's8 ', N'Charles & Keith', 52, 9000.0000, CAST(N'2025-03-12' AS Date), N'Guốc Charles & Keith là một trong những dòng sản phẩm giày dép nổi bật của thương hiệu, được thiết kế theo phong cách thanh lịch, hiện đại và thời thượng.', N'https://i.pinimg.com/736x/c8/88/38/c88838cc9ec23d298c5077922b6dd068.jpg', 3)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N's9 ', N'Future Ultimate', 100, 2000.0000, CAST(N'2025-03-12' AS Date), N'Puma Future Ultimate là dòng giày đá bóng cao cấp của Puma, được thiết kế để tối ưu tốc độ, sự linh hoạt và kiểm soát bóng. Đây là mẫu giày được rất nhiều cầu thủ chuyên nghiệp sử dụng, trong đó có Neymar Jr.', N'https://i.pinimg.com/736x/53/90/a7/5390a7b064e07b1308f7aa6bd8f80352.jpg', 3)


INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'w1 ', N'Rolex', 60, 999.9990, CAST(N'2020-01-04' AS Date), N'Rolex là biểu tượng của sự xa xỉ và đẳng cấp, được chế tác từ những vật liệu cao cấp như vàng 18k, platinum và thép không gỉ 904L. Không chỉ nổi tiếng về độ bền, Rolex còn có khả năng chống nước tuyệt vời, phù hợp cho cả doanh nhân và những người yêu thích sự sang trọng.
', N'https://i.pinimg.com/736x/09/7c/ed/097cedfd72cd1b8961fe3a2ca60d3b4e.jpg', 2)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'w2 ', N'Patek Philippe', 60, 888.8880, CAST(N'2020-01-04' AS Date), N'Là thương hiệu đồng hồ Thụy Sĩ cao cấp bậc nhất, Patek Philippe được giới siêu giàu và nhà sưu tầm ưa chuộng bởi những bộ máy cơ học phức tạp và thiết kế tinh xảo. Mỗi chiếc đồng hồ đều được chế tác thủ công, có giá trị lâu dài.
', N'https://i.pinimg.com/736x/08/73/81/087381851dc446ee50ba0c6916492e04.jpg', 2)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'w3 ', N'Audemars Piguet', 60, 777.0000, CAST(N'2020-01-04' AS Date), N'Nổi bật với thiết kế mạnh mẽ và góc cạnh, Audemars Piguet kết hợp hoàn hảo giữa sự sang trọng và thể thao. Điển hình là dòng Royal Oak với thiết kế vỏ bát giác đặc trưng, tạo nên phong cách khác biệt mà ít thương hiệu nào có được.
', N'https://i.pinimg.com/736x/9d/eb/39/9deb39c7046082f69781e7d92586a7ba.jpg', 2)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'w4', N'Omega', 60, 13000.0000, CAST(N'2020-01-04' AS Date), N'Gắn liền với lịch sử vũ trụ và các chuyến bay vào không gian, Omega nổi tiếng với độ chính xác cực cao. Không thể không nhắc đến Speedmaster – mẫu đồng hồ từng được NASA lựa chọn và đeo trong các nhiệm vụ trên Mặt Trăng.
', N'https://i.pinimg.com/736x/05/cb/72/05cb72af8b973de71aa1b7ca4baf920a.jpg', 2)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'w5 ', N'Hublot', 60, 13000.0000, CAST(N'2020-01-04' AS Date), N'Thể hiện sự sáng tạo và phá cách, Hublot sử dụng nhiều vật liệu hiện đại như ceramic, carbon và sapphire để tạo nên những thiết kế táo bạo. Dòng Big Bang mang phong cách thể thao mạnh mẽ, Classic Fusion lại có nét thanh lịch hơn, còn MP là những mẫu đồng hồ có bộ máy phức tạp dành cho dân sưu tầm.
', N'https://i.pinimg.com/736x/e6/f6/6c/e6f66c0a013c1c4f9b84e89d78fc7571.jpg', 2)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'w6', N'Cartier', 60, 16000.0000, CAST(N'2020-01-04' AS Date), N'Cartier là một thương hiệu xa xỉ của Pháp, nổi tiếng với những mẫu đồng hồ mang phong cách thanh lịch, sang trọng và mang đậm dấu ấn hoàng gia. Đồng hồ Cartier không chỉ là một phụ kiện thời gian mà còn là biểu tượng của đẳng cấp và sự tinh tế.
', N'https://i.pinimg.com/736x/a6/e0/53/a6e05368063c52f5a40e91fab9d2580a.jpg', 2)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'w7', N'Longines', 60, 18000.0000, CAST(N'2020-01-04' AS Date), N'Longines là một trong những thương hiệu đồng hồ Thụy Sĩ lâu đời nhất, được thành lập vào năm 1832. Với khẩu hiệu "Elegance is an attitude" (Thanh lịch là một thái độ), Longines nổi tiếng với những thiết kế tinh tế, thanh lịch và chính xác, phù hợp với cả doanh nhân lẫn người yêu thích phong cách cổ điển.
', N'https://i.pinimg.com/736x/3a/aa/c0/3aaac0f307c03f4075fee247e7b6d641.jpg', 2)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'w8', N'Swatch', 60, 13000.0000, CAST(N'2020-01-04' AS Date), N'Swatch là một thương hiệu đồng hồ Thụy Sĩ nổi tiếng với phong cách trẻ trung, sáng tạo và giá cả phải chăng. Được thành lập vào năm 1983, Swatch đã giúp cứu ngành công nghiệp đồng hồ Thụy Sĩ khỏi khủng hoảng khi đối đầu với sự bùng nổ của đồng hồ quartz từ Nhật Bản.
', N'https://i.pinimg.com/736x/6f/4f/76/6f4f76c0c285627b8762a2890d781070.jpg', 2)
INSERT [dbo].[Products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'w9', N'Bulova', 1000, 16000.0000, CAST(N'2020-01-04' AS Date), N'Bulova là thương hiệu đồng hồ danh tiếng từ Mỹ, nổi bật với thiết kế sang trọng, tinh xảo và bộ máy bền bỉ, chính xác. Đồng hồ nữ Bulova không chỉ là phụ kiện thời trang mà còn thể hiện phong cách và đẳng cấp.', N'https://i.pinimg.com/736x/1b/c5/41/1bc5410cd4e649369031caea0b0263e3.jpg', 2)



GO
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Create_At]) VALUES (1, N'Admin', CAST(N'2025-03-12T22:30:29.060' AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Create_At]) VALUES (2, N'User', CAST(N'2025-03-12T22:30:29.060' AS DateTime))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__536C85E464BAD99F]    Script Date: 3/16/2025 3:46:35 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__85FB4E38860733BF]    Script Date: 3/16/2025 3:46:35 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__A9D105346556D19D]    Script Date: 3/16/2025 3:46:35 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT (getdate()) FOR [Create_At]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [Create_At]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Account]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Categories] ([ID])
GO
USE [master]
GO
ALTER DATABASE [BoostYourStyleDB] SET  READ_WRITE 
GO
