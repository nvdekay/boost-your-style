CREATE DATABASE BoostYourStyleDB

USE BoostYourStyleDB

CREATE TABLE Roles (
	RoleID int primary key,
	RoleName nvarchar(50),
	Create_At datetime default(getDate())
)

select * from Roles
go
INSERT INTO Roles(RoleID, RoleName) 
VALUES (1, 'Admin'), (2, 'User')

CREATE TABLE Account (
	ID int identity(1,1) primary key,
	Username nvarchar(100) not null unique,
	Email nvarchar(100) not null unique,
	Address nvarchar(100) not null,
	PhoneNumber varchar(20) not null unique,
	Password varchar(50) not null,
	RoleID int not null,
	Create_At datetime default(getDate()),
	foreign key (RoleID) references Roles(RoleID),
)
INSERT INTO Account (Username, Email, Address, PhoneNumber, Password, RoleID) 
VALUES
('user', 'user1@gmail.com', 'Nghean', '0111111111', 'user', 2)
('admin', 'admin@gmail.com', 'Hanoi', '0000000000', 'admin', 1),

SELECT * FROM Account

CREATE TABLE Categories
(
	ID [int] primary key,
	[Name] nvarchar(30) ,	
	Describe nvarchar(50),
)

go
INSERT INTO Categories values(1,'Clothes',N'Hiện đại, Phù hợp với mọi lứa tuổi.')
INSERT INTO Categories values(2,'Watches',N'Dáng đẹp, lịch lãm, cá tính, thể thao.')
INSERT INTO Categories values(3,'Shoes',N'Nhiều mẫu mã, thoáng mát, tiện lợi.')
go
SELECT * FROM Categories


CREATE TABLE Products
(
	ID varchar(10) primary key,
	[name] [nvarchar](max) NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[releaseDate] [date] NULL,
	[describe] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[cid] [int] references Categories(ID),
)

select * from Products
go
INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N'cl1 ', N'T-Shirt', 15, 1000.0,
CAST(0x12430B00 AS Date), N'một trong những loại trang phục phổ biến nhất, có thiết kế đơn giản, dễ phối đồ và phù hợp với nhiều phong cách cổ tròn hoặc cổ chữ V.
Form áo vừa vặn, không quá rộng hay quá ôm. Chất liệu cotton hoặc vải thun co giãn, thoáng mát..', 
N'https://i.pinimg.com/736x/5d/02/53/5d02539f06d72f0e9ce36c60ec50d9fb.jpg', 1)


INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N'cl2 ', N'Coat', 30, 5000.0,
CAST(0xA5410B00 AS Date), N'Coat là một loại áo khoác dáng dài, thường được làm từ vải dạ, len, da hoặc sợi tổng hợp dày dặn, giúp giữ ấm tốt và tạo vẻ ngoài thanh lịch, sang trọng.',
N'https://i.pinimg.com/736x/cb/94/9c/cb949c0a2fc49e4a64eb364a774381bc.jpg', 1)


INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N'cl3 ', N'Pants', 22, 868.686,
CAST(0x37400B00 AS Date), N'một phần quan trọng trong thời trang, có nhiều kiểu dáng phù hợp với từng phong cách và hoàn cảnh khác nhau.',
N'https://i.pinimg.com/736x/b7/79/e6/b779e6f79d4730b5c4760a7e1eae58aa.jpg', 1)


INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N'cl4', N'Hoodie', 22, 868.686,
CAST(0x37400B00 AS Date), N'Hoodie là một loại áo khoác dài tay có mũ trùm đầu, thường làm từ vải nỉ, cotton, hoặc polyester. Đây là trang phục phổ biến trong thời trang đường phố (streetwear) và thể thao nhờ vào sự thoải mái, năng động và giữ ấm tốt.', 
N'https://i.pinimg.com/736x/f8/3e/0d/f83e0db545b7cf66ec6734f579977ebb.jpg', 1)

INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N'cl5', N'Sweater', 50, 868.686,
CAST(0x37400B00 AS Date), N'Sweater là một loại áo dài tay được làm từ vải len, cotton dày hoặc sợi tổng hợp, giúp giữ ấm cơ thể trong thời tiết lạnh.', 
N'https://i.pinimg.com/736x/aa/6d/74/aa6d74eb243516e6ff12483ef66b700a.jpg', 1)

INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N'cl6', N'Cardigan', 50, 200.0,
CAST(0x37400B00 AS Date), N'Cardigan là một loại áo khoác len mỏng, nhẹ, thường có hàng cúc hoặc khóa kéo phía trước. Đây là trang phục đa năng, dễ phối đồ, phù hợp với nhiều phong cách từ thanh lịch đến năng động.', 
N'https://i.pinimg.com/736x/30/f9/7c/30f97c1fe9075f4331b8be9394277cdb.jpg', 1)

INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N'cl7', N'Jacket', 50, 400.0,
CAST(0x37400B00 AS Date), N'Jacket là loại áo khoác ngắn (thường ngang hông hoặc dài hơn một chút), có thể làm từ nhiều chất liệu khác nhau như da, denim, vải dù, cotton, nỉ hoặc lông.', 
N'https://i.pinimg.com/736x/b9/69/bb/b969bba3af3c94b29409049c2fed717b.jpg', 1)

INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N'cl8', N'Jacket', 50, 400.0,
CAST(0x37400B00 AS Date), N'Gloves là phụ kiện bao bọc bàn tay, giúp giữ ấm, bảo vệ da hoặc tăng thêm phong cách thời trang. Găng tay có nhiều kiểu dáng, chất liệu khác nhau, phù hợp với từng mục đích sử dụng như giữ ấm, đi xe máy, thể thao hoặc thời trang.', 
N'https://i.pinimg.com/736x/8f/03/b9/8f03b98bb789a0c516775d8ea13c6505.jpg', 1)







INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N'w1 ', N'Rolex', 60, 999.999,
CAST(0x93400B00 AS Date), N'Rolex là biểu tượng của sự xa xỉ và đẳng cấp, được chế tác từ những vật liệu cao cấp như vàng 18k, platinum và thép không gỉ 904L. Không chỉ nổi tiếng về độ bền, Rolex còn có khả năng chống nước tuyệt vời, phù hợp cho cả doanh nhân và những người yêu thích sự sang trọng.
', N'https://i.pinimg.com/736x/09/7c/ed/097cedfd72cd1b8961fe3a2ca60d3b4e.jpg', 2)

INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N'w2 ', N'Patek Philippe', 60, 888.888,
CAST(0x93400B00 AS Date), N'Là thương hiệu đồng hồ Thụy Sĩ cao cấp bậc nhất, Patek Philippe được giới siêu giàu và nhà sưu tầm ưa chuộng bởi những bộ máy cơ học phức tạp và thiết kế tinh xảo. Mỗi chiếc đồng hồ đều được chế tác thủ công, có giá trị lâu dài.
', N'https://i.pinimg.com/736x/08/73/81/087381851dc446ee50ba0c6916492e04.jpg', 2)

INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N'w3 ', N'Audemars Piguet', 60, 777.0,
CAST(0x93400B00 AS Date), N'Nổi bật với thiết kế mạnh mẽ và góc cạnh, Audemars Piguet kết hợp hoàn hảo giữa sự sang trọng và thể thao. Điển hình là dòng Royal Oak với thiết kế vỏ bát giác đặc trưng, tạo nên phong cách khác biệt mà ít thương hiệu nào có được.
', N'https://i.pinimg.com/736x/9d/eb/39/9deb39c7046082f69781e7d92586a7ba.jpg', 2)

UPDATE [dbo].[Products]  
SET [image] = N'https://i.pinimg.com/736x/22/4d/2b/224d2b95c3473681edbcfd20d036b2cb.jpg'  
WHERE [id] = N'w5'


INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N'w4', N'Omega', 60, 13000.0000,
CAST(0x93400B00 AS Date), N'Gắn liền với lịch sử vũ trụ và các chuyến bay vào không gian, Omega nổi tiếng với độ chính xác cực cao. Không thể không nhắc đến Speedmaster – mẫu đồng hồ từng được NASA lựa chọn và đeo trong các nhiệm vụ trên Mặt Trăng.
', N'https://i.pinimg.com/736x/05/cb/72/05cb72af8b973de71aa1b7ca4baf920a.jpg', 2)


INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N'w5 ', N'Hublot', 60, 13000.0000,
CAST(0x93400B00 AS Date), N'Thể hiện sự sáng tạo và phá cách, Hublot sử dụng nhiều vật liệu hiện đại như ceramic, carbon và sapphire để tạo nên những thiết kế táo bạo. Dòng Big Bang mang phong cách thể thao mạnh mẽ, Classic Fusion lại có nét thanh lịch hơn, còn MP là những mẫu đồng hồ có bộ máy phức tạp dành cho dân sưu tầm.
', N'https://i.pinimg.com/736x/e6/f6/6c/e6f66c0a013c1c4f9b84e89d78fc7571.jpg', 2)

INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N'w6', N'Cartier', 60, 16000.0,
CAST(0x93400B00 AS Date), N'Cartier là một thương hiệu xa xỉ của Pháp, nổi tiếng với những mẫu đồng hồ mang phong cách thanh lịch, sang trọng và mang đậm dấu ấn hoàng gia. Đồng hồ Cartier không chỉ là một phụ kiện thời gian mà còn là biểu tượng của đẳng cấp và sự tinh tế.
', N'https://i.pinimg.com/736x/a6/e0/53/a6e05368063c52f5a40e91fab9d2580a.jpg', 2)

INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N'w7', N'Longines', 60, 18000.0,
CAST(0x93400B00 AS Date), N'Longines là một trong những thương hiệu đồng hồ Thụy Sĩ lâu đời nhất, được thành lập vào năm 1832. Với khẩu hiệu "Elegance is an attitude" (Thanh lịch là một thái độ), Longines nổi tiếng với những thiết kế tinh tế, thanh lịch và chính xác, phù hợp với cả doanh nhân lẫn người yêu thích phong cách cổ điển.
', N'https://i.pinimg.com/736x/3a/aa/c0/3aaac0f307c03f4075fee247e7b6d641.jpg', 2)

INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N'w8', N'Swatch', 60, 13000.0,
CAST(0x93400B00 AS Date), N'Swatch là một thương hiệu đồng hồ Thụy Sĩ nổi tiếng với phong cách trẻ trung, sáng tạo và giá cả phải chăng. Được thành lập vào năm 1983, Swatch đã giúp cứu ngành công nghiệp đồng hồ Thụy Sĩ khỏi khủng hoảng khi đối đầu với sự bùng nổ của đồng hồ quartz từ Nhật Bản.
', N'https://i.pinimg.com/736x/6f/4f/76/6f4f76c0c285627b8762a2890d781070.jpg', 2)








INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N's1 ', N'Sneakers', 12, 20000.0000,
CAST(0x01420B00 AS Date), N'Sneakers là dòng giày thể thao phổ biến nhất, được yêu thích bởi sự thoải mái, đa dạng mẫu mã và phù hợp với nhiều phong cách. Những thương hiệu hàng đầu như Nike, Adidas, Puma, New Balance hay Converse liên tục cho ra mắt các mẫu giày mang tính biểu tượng.', 
N'https://i.pinimg.com/736x/6f/cd/fc/6fcdfc09651455d3c77a2e1285239eb9.jpg', 3)

INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N's2 ', N'Dress Shoes', 12, 18000.0000,
CAST(0xA9410B00 AS Date), N'Giày tây là biểu tượng của sự thanh lịch, phù hợp với những dịp trang trọng, từ môi trường công sở đến tiệc cưới. Các thương hiệu cao cấp như Allen Edmonds, Church’s, Salvatore Ferragamo hay John Lobb đều tạo ra những mẫu giày thủ công tinh xảo.', N'https://i.pinimg.com/736x/4d/91/dd/4d91dd7d0820fc20641dca4061af51d0.jpg', 3)

INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N's3 ', N'Boots', 34, 16000.0000,
CAST(0x3B400B00 AS Date), N'Boots là dòng giày mang phong cách mạnh mẽ, bền bỉ, phù hợp với nhiều điều kiện thời tiết và môi trường. Timberland với dòng boots da lộn dày dặn là lựa chọn phổ biến trong mùa đông, Dr. Martens lại mang phong cách retro bụi bặm, trong khi Chelsea boots của Saint Laurent hay Common Projects được giới thời trang yêu thích vì thiết kế tối giản và sang trọng.', N'https://i.pinimg.com/736x/ca/c0/29/cac0292264894005ff3528bdeba12b7d.jpg', 3)

INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N's4 ', N'Running Shoes', 19, 15000.0000, CAST(0xCE3E0B00
AS Date), N'Dành cho những ai đam mê thể thao, giày chạy bộ được thiết kế với công nghệ tiên tiến để tối ưu hóa hiệu suất và bảo vệ bàn chân. Nike ZoomX Vaporfly và Adidas Ultraboost là hai dòng giày chạy bộ được đánh giá cao về công nghệ đệm và độ phản hồi.', N'https://i.pinimg.com/736x/09/31/7b/09317bae3dd95088698b0bf51fce0f68.jpg', 3)

INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N's5 ', N'Sandals', 52, 14000.0000, CAST(0x4C3C0B00
AS Date), N'Không chỉ tiện lợi, sandals ngày nay cũng trở thành một xu hướng thời trang. Birkenstock nổi tiếng với thiết kế thoải mái và phong cách cổ điển, Crocs mang đến sự nhẹ nhàng với chất liệu EVA êm ái, còn Teva hay Chaco là những thương hiệu xăng-đan leo núi bền bỉ, phù hợp với những chuyến phiêu lưu.', N'https://i.pinimg.com/736x/70/2a/7b/702a7b051c9ece2ff33c272837766111.jpg', 3)
go

INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N's6 ', N'Chelsea Boots', 52, 7000.0, CAST(0x4C3C0B00
AS Date), N'Chelsea Boots là một trong những loại bốt phổ biến nhất, nổi bật với thiết kế tối giản, không dây buộc, có phần thun co giãn ở hai bên cổ giày, giúp dễ dàng xỏ vào và tháo ra. Đây là kiểu giày mang phong cách thanh lịch, cổ điển nhưng vẫn rất hiện đại.',
N'https://i.pinimg.com/736x/38/72/4c/38724c2d87fe8ae5efa6d2c36a81d169.jpg', 3)
go

INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N's7 ', N'Sport Shoes', 52, 8000.0, CAST(0x4C3C0B00
AS Date), N'Sport Shoes là loại giày được thiết kế để hỗ trợ vận động, giúp bảo vệ chân và tối ưu hiệu suất khi tập luyện. Mỗi loại giày thể thao đều có thiết kế và công nghệ phù hợp với từng bộ môn khác nhau.', 
N'https://i.pinimg.com/736x/95/5b/db/955bdbf7c10a5705c7c94834667aa600.jpg', 3)
go

INSERT [dbo].[Products] ([id], [name], [quantity], [price], [releaseDate], [describe],
[image], [cid]) VALUES (N's8 ', N'Football Boots', 52, 4000.0, CAST(0x4C3C0B00
AS Date), N'Giày đá bóng là một yếu tố quan trọng giúp cầu thủ tối ưu khả năng di chuyển, kiểm soát bóng và sút bóng chính xác. Tùy vào mặt sân và phong cách chơi, có nhiều loại giày đá bóng khác nhau.',
N'https://i.pinimg.com/736x/a1/2a/17/a12a17af9050ef47534343a4d119309c.jpg', 3)
go

SELECT * FROM Products