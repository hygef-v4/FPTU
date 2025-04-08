USE [master]
GO
/****** Object:  Database [LaptopStore2]    Script Date: 03/25/25 05:22:55 PM ******/
CREATE DATABASE [LaptopStore2]
 
USE [LaptopStore2]
GO
/****** Object:  Table [dbo].[tblBrands]    Script Date: 03/25/25 05:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBrands](
	[brandID] [varchar](10) NOT NULL,
	[brandName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 03/25/25 05:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[categoryID] [varchar](10) NOT NULL,
	[categoryName] [nvarchar](255) NOT NULL,
	[describe] [nvarchar](255) NULL,
	[image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDiscounts]    Script Date: 03/25/25 05:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiscounts](
	[discountID] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[discountPercent] [int] NOT NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NOT NULL,
	[minOrderValue] [decimal](10, 2) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[discountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 03/25/25 05:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[orderID] [int] NOT NULL,
	[price] [bigint] NULL,
 CONSTRAINT [PK__tblOrder__83077839171E0AC4] PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 03/25/25 05:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[amount] [int] NOT NULL,
	[userID] [int] NULL,
	[orderDate] [datetime] NULL,
	[fullName] [nvarchar](255) NULL,
	[address] [nvarchar](max) NULL,
	[phone] [nvarchar](50) NULL,
	[note] [nvarchar](max) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK__tblOrder__0809337D1E1AF93D] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductDetails]    Script Date: 03/25/25 05:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductDetails](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NOT NULL,
	[cpu] [nvarchar](255) NULL,
	[ram] [nvarchar](50) NULL,
	[storage] [nvarchar](50) NULL,
	[screen] [nvarchar](50) NULL,
	[gpu] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 03/25/25 05:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](255) NOT NULL,
	[image] [nvarchar](255) NULL,
	[price] [bigint] NULL,
	[quantity] [int] NOT NULL,
	[categoryID] [varchar](10) NOT NULL,
	[brandID] [varchar](10) NOT NULL,
	[importDate] [date] NULL,
	[warrantyMonths] [int] NULL,
	[isFeatured] [bit] NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK__tblProdu__2D10D14AA95D3051] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductViews]    Script Date: 03/25/25 05:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductViews](
	[viewID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[viewedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[viewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReviews]    Script Date: 03/25/25 05:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReviews](
	[reviewID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[rating] [int] NOT NULL,
	[comment] [nvarchar](max) NOT NULL,
	[reviewDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 03/25/25 05:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblShipping]    Script Date: 03/25/25 05:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblShipping](
	[shippingID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[trackingNumber] [nvarchar](100) NULL,
	[estimatedDelivery] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[shippingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 03/25/25 05:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](255) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](255) NOT NULL,
	[roleID] [int] NOT NULL,
	[address] [nvarchar](max) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](255) NULL,
	[activate] [bit] NULL,
 CONSTRAINT [PK__tblUsers__CB9A1CDF0046C69F] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblWishlist]    Script Date: 03/25/25 05:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWishlist](
	[wishlistID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[productID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[wishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblBrands] ([brandID], [brandName]) VALUES (N'B001', N'Lenovo')
GO
INSERT [dbo].[tblBrands] ([brandID], [brandName]) VALUES (N'B002', N'Asus')
GO
INSERT [dbo].[tblBrands] ([brandID], [brandName]) VALUES (N'B003', N'Dell')
GO
INSERT [dbo].[tblBrands] ([brandID], [brandName]) VALUES (N'B004', N'HP')
GO
INSERT [dbo].[tblBrands] ([brandID], [brandName]) VALUES (N'B005', N'Acer')
GO
INSERT [dbo].[tblBrands] ([brandID], [brandName]) VALUES (N'B006', N'Apple')
GO
INSERT [dbo].[tblBrands] ([brandID], [brandName]) VALUES (N'B007', N'MSI')
GO
INSERT [dbo].[tblBrands] ([brandID], [brandName]) VALUES (N'B009', N'LG')
GO
INSERT [dbo].[tblCategories] ([categoryID], [categoryName], [describe], [image]) VALUES (N'C001', N'Laptop Gaming', N'Laptop chuyên dụng cho game thủ', N'https://anphat.com.vn/media/product/47728_laptop_gigabyte_g5_mf5_52vn383sh__1_.jpg')
GO
INSERT [dbo].[tblCategories] ([categoryID], [categoryName], [describe], [image]) VALUES (N'C002', N'Laptop Văn Phòng', N'Laptop phục vụ công việc văn phòng', N'https://product.hstatic.net/200000722513/product/vobook_14_oled_x1405v_m1405y_cool_silver_black_keyboard_07_fingerprint_22ac6f3f14e94f99bee84eca3aac2474_grande.png')
GO
INSERT [dbo].[tblCategories] ([categoryID], [categoryName], [describe], [image]) VALUES (N'C003', N'Laptop Mỏng Nhẹ', N'Laptop có thiết kế mỏng nhẹ, di động cao', N'https://anphat.com.vn/media/product/46137_laptop_lenovo_ideapad_slim_3_14iah8_83eq0005vn__5_.jpg')
GO
INSERT [dbo].[tblCategories] ([categoryID], [categoryName], [describe], [image]) VALUES (N'C004', N'Laptop Đồ Họa', N'Laptop chuyên dụng cho thiết kế đồ họa', N'https://product.hstatic.net/200000722513/product/legion_pro_5_16irx9_ct1_01_31ffb710c92e44c9a263fc3bf06ca0e6_grande.png')
GO
INSERT [dbo].[tblCategories] ([categoryID], [categoryName], [describe], [image]) VALUES (N'C005', N'Laptop Cao Cấp', N'Laptop cao cấp, sang trọng', N'https://cdsassets.apple.com/live/7WUAS350/images/tech-specs/mbp14-m4-2024.png')
GO
SET IDENTITY_INSERT [dbo].[tblDiscounts] ON 
GO
INSERT [dbo].[tblDiscounts] ([discountID], [code], [discountPercent], [startDate], [endDate], [minOrderValue], [quantity]) VALUES (1, N'SUMMER20', 20, CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(N'2024-08-31T00:00:00.000' AS DateTime), CAST(5000.00 AS Decimal(10, 2)), 100)
GO
SET IDENTITY_INSERT [dbo].[tblDiscounts] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 
GO
INSERT [dbo].[tblOrderDetails] ([detailID], [quantity], [productID], [orderID], [price]) VALUES (42, 1, 2, 33, 20990000)
GO
INSERT [dbo].[tblOrderDetails] ([detailID], [quantity], [productID], [orderID], [price]) VALUES (43, 2, 5, 33, 25990000)
GO
INSERT [dbo].[tblOrderDetails] ([detailID], [quantity], [productID], [orderID], [price]) VALUES (44, 1, 2, 34, 20990000)
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrders] ON 
GO
INSERT [dbo].[tblOrders] ([orderID], [amount], [userID], [orderDate], [fullName], [address], [phone], [note], [status]) VALUES (33, 0, 2, CAST(N'2025-03-23T18:42:47.253' AS DateTime), N'Khuất Quang Hưng', N'FPT, Thạch Thất, Hà Nội, Việt Nam', N'0327715098', N'không có ghi chú', 1)
GO
INSERT [dbo].[tblOrders] ([orderID], [amount], [userID], [orderDate], [fullName], [address], [phone], [note], [status]) VALUES (34, 0, 2, CAST(N'2025-03-23T18:46:20.073' AS DateTime), N'Khuất Quang Hưng', N'FPT, Thạch Thất, Hà Nội, Việt Nam', N'0327715098', N'không có ghi chú', 0)
GO
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProductDetails] ON 
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (1, 5, N'AMD Ryzen 7 5800H', N'16GB DDR4', N'512GB NVMe SSD', N'15.6-inch FHD (1920x1080) IPS 165Hz', N'NVIDIA GeForce RTX 3050 Ti')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (2, 25, N'Intel Core i9-12900HK', N'32GB DDR5', N'1TB NVMe SSD', N'17-inch UHD+ (3840 x 2400) InfinityEdge Touch', N'NVIDIA GeForce RTX 3060')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (3, 1, N'Intel Core i7-12650H', N'16GB DDR5', N'512GB NVMe SSD', N'15.6-inch FHD (1920x1080) 144Hz', N'NVIDIA GeForce RTX 3050 Ti')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (4, 2, N'AMD Ryzen 5 5600H', N'8GB DDR4', N'512GB SSD', N'15.6-inch FHD (1920x1080) IPS 144Hz', N'NVIDIA GeForce GTX 1650')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (5, 3, N'Intel Core i5-11400H', N'8GB DDR4', N'512GB NVMe SSD', N'15.6-inch FHD (1920x1080) 144Hz', N'NVIDIA GeForce RTX 3050')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (6, 4, N'AMD Ryzen 5 6600H', N'8GB DDR5', N'256GB NVMe SSD', N'15.6-inch FHD (1920x1080) 120Hz', N'NVIDIA GeForce RTX 3050')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (7, 6, N'AMD Ryzen 9 5900HS', N'16GB DDR4', N'1TB NVMe SSD', N'14-inch WQHD (2560x1440) 120Hz', N'NVIDIA GeForce RTX 3050 Ti')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (8, 7, N'Intel Core i7-1260P', N'16GB LPDDR5', N'1TB NVMe SSD', N'14-inch WQUXGA (3840x2400) OLED', N'Integrated Intel Iris Xe Graphics')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (9, 8, N'Intel Core i7-1255U', N'16GB LPDDR5', N'512GB NVMe SSD', N'13.5-inch 3K2K (3000x2000) OLED Touch', N'Integrated Intel Iris Xe Graphics')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (10, 9, N'Intel Core i5-1145G7', N'16GB DDR4', N'256GB NVMe SSD', N'14-inch FHD (1920x1080)', N'Integrated Intel Iris Xe Graphics')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (11, 10, N'Intel Core i7-1165G7', N'16GB LPDDR4X', N'1TB NVMe SSD', N'14-inch FHD (1920x1080)', N'Integrated Intel Iris Xe Graphics')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (12, 11, N'Intel Core i7-1260P', N'16GB LPDDR5', N'1TB NVMe SSD', N'17-inch WQXGA (2560x1600) IPS', N'Integrated Intel Iris Xe Graphics')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (13, 12, N'Intel Core i7-1250U', N'16GB LPDDR5', N'512GB NVMe SSD', N'13.4-inch FHD+ (1920 x 1200) InfinityEdge', N'Integrated Intel Iris Xe Graphics')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (14, 13, N'Intel Core i7-11800H', N'16GB DDR4', N'512GB NVMe SSD', N'15.6-inch FHD (1920 x 1080) IPS', N'NVIDIA GeForce RTX 3050 Ti')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (15, 14, N'AMD Ryzen 5 5600U', N'8GB DDR4', N'256GB NVMe SSD', N'13.3-inch WQXGA (2560x1600) IPS', N'Integrated AMD Radeon Graphics')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (16, 15, N'Intel Core i7-1260P', N'16GB LPDDR5', N'1TB SSD', N'14-inch WQXGA (2560x1600) Touch', N'Integrated Intel Iris Xe Graphics')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (17, 16, N'AMD Ryzen 7 5800U', N'16GB LPDDR4X', N'512GB NVMe SSD', N'14-inch FHD (1920x1080) OLED', N'Integrated AMD Radeon Graphics')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (18, 17, N'Intel Core i5-1235U', N'8GB DDR4', N'512GB NVMe SSD', N'14-inch FHD+ (1920 x 1200)', N'Integrated Intel Iris Xe Graphics')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (19, 18, N'Intel Core i5-1135G7', N'8GB LPDDR4X', N'512GB NVMe SSD', N'14-inch FHD (1920x1080) IPS', N'Integrated Intel Iris Xe Graphics')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (20, 19, N'Apple M1 chip', N'8GB Unified Memory', N'256GB SSD', N'13.3-inch Retina (2560x1600)', N'Apple 7-core GPU')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (21, 20, N'Intel Core i9-12900H', N'32GB DDR5', N'2TB NVMe SSD', N'16-inch QHD+ (2560x1600) 165Hz Touch', N'NVIDIA GeForce RTX 3070 Ti')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (22, 21, N'Intel Core i9-11950H', N'32GB DDR4', N'1TB NVMe SSD', N'15.6-inch UHD (3840x2160) OLED Touch', N'NVIDIA RTX A2000')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (23, 22, N'Intel Core i7-10875H', N'32GB DDR4', N'1TB NVMe SSD', N'15.6-inch 4K UHD (3840x2160) IPS Pantone Validated', N'NVIDIA GeForce RTX 2080 Super Max-Q')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (25, 24, N'Intel Core i7-8500Y', N'16GB LPDDR3', N'1TB SSD', N'13.3-inch FHD (1920x1080) Touch', N'Integrated Intel UHD Graphics 615')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (26, 26, N'Intel Core i9-11950H', N'32GB DDR4', N'1TB NVMe SSD', N'16-inch 4K UHD (3840x2400) IPS', N'NVIDIA GeForce RTX 3080')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (27, 27, N'Intel Core i7-1280P', N'16GB LPDDR5', N'1TB NVMe SSD', N'14-inch FHD+ (1920x1200) IPS-Level', N'NVIDIA GeForce RTX 3050')
GO
INSERT [dbo].[tblProductDetails] ([detailID], [productID], [cpu], [ram], [storage], [screen], [gpu]) VALUES (28, 28, N'Apple M1 Max chip', N'32GB Unified Memory', N'1TB SSD', N'16.2-inch Liquid Retina XDR (3456x2234)', N'Apple 32-core GPU')
GO
SET IDENTITY_INSERT [dbo].[tblProductDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProducts] ON 
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (1, N'MSI Katana GF66', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/2022_10_19_638017841585071699_msi-gaming-katana-gf66-12u-den-1.jpg', 16490000, 13, N'C001', N'B007', CAST(N'2023-03-15' AS Date), 12, 1, N'Laptop gaming với CPU và GPU mạnh, màn hình tần số quét cao, hỗ trợ chơi game nặng mượt mà.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (2, N'Acer Nitro 5', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/2021_7_5_637610884165519217_acer-nitro-gaming-an515-57-den-1.jpg', 20990000, 18, N'C001', N'B005', CAST(N'2023-05-10' AS Date), 12, 1, N'Laptop gaming với CPU và GPU mạnh, màn hình tần số quét cao, hỗ trợ chơi game nặng mượt mà.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (3, N'Asus TUF Gaming F15', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/2023_7_4_638240754677083179_asus-tuf-gaming-fx507-xam-1.jpg', 22990000, 22, N'C001', N'B002', CAST(N'2023-06-18' AS Date), 12, 1, N'Laptop gaming với CPU và GPU mạnh, màn hình tần số quét cao, hỗ trợ chơi game nặng mượt mà.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (4, N'Dell G15', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/2022_4_21_637861309658938216_dell-gaming-g15-5515-xam-1.jpg', 21990000, 20, N'C001', N'B003', CAST(N'2023-07-25' AS Date), 12, 1, N'Laptop gaming với CPU và GPU mạnh, màn hình tần số quét cao, hỗ trợ chơi game nặng mượt mà.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (5, N'Lenovo Legion 5', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/2022_10_20_638018713259494423_lenovo-gaming-legion-5-15arh7-xam-dam-1.jpg', 25990000, 18, N'C001', N'B001', CAST(N'2023-01-01' AS Date), 12, 1, N'Laptop gaming với CPU và GPU mạnh, màn hình tần số quét cao, hỗ trợ chơi game nặng mượt mà.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (6, N'Asus ROG Zephyrus G14', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/rog_zephyrus_g14_2024_ga403_gray_1_994724b4c6.png', 32990000, 15, N'C001', N'B002', CAST(N'2023-02-01' AS Date), 12, 1, N'Laptop gaming với CPU và GPU mạnh, màn hình tần số quét cao, hỗ trợ chơi game nặng mượt mà.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (7, N'Lenovo ThinkPad X1 Carbon', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/thinkpad_x1_carbon_gen_12_haptic_touchpad_34054a60b6.png', 35990000, 15, N'C002', N'B001', CAST(N'2023-04-05' AS Date), 12, 1, N'Laptop văn phòng gọn nhẹ, thời lượng pin dài, bàn phím êm, phù hợp làm việc và học tập.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (8, N'HP Spectre x360', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/2024_6_24_638548335557426654_a19blpa.jpg', 32990000, 18, N'C002', N'B004', CAST(N'2023-05-12' AS Date), 12, 0, N'Laptop văn phòng gọn nhẹ, thời lượng pin dài, bàn phím êm, phù hợp làm việc và học tập.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (9, N'Dell Latitude 7420', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/dell_latitude_15_3540_9950b79986.png', 29990000, 20, N'C002', N'B003', CAST(N'2023-06-20' AS Date), 12, 0, N'Laptop văn phòng gọn nhẹ, thời lượng pin dài, bàn phím êm, phù hợp làm việc và học tập.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (10, N'Asus ExpertBook B9', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/2022_10_26_638023821244393375_asus-expertbook-b5302-den-1.jpg', 27990000, 22, N'C002', N'B002', CAST(N'2023-07-15' AS Date), 12, 0, N'Laptop văn phòng gọn nhẹ, thời lượng pin dài, bàn phím êm, phù hợp làm việc và học tập.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (11, N'LG Gram 17', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/2023_6_9_638219264347784098_lg-gram-16z90r-gah76a5-i7-1360p-xam-2.jpg', 26990000, 16, N'C002', N'B009', CAST(N'2023-08-22' AS Date), 12, 0, N'Laptop văn phòng gọn nhẹ, thời lượng pin dài, bàn phím êm, phù hợp làm việc và học tập.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (12, N'Dell XPS 13', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/2021_9_15_637673094747847062_dell-xps-13-9310-2in1-bac-1.jpg', 28990000, 25, N'C002', N'B003', CAST(N'2023-03-01' AS Date), 12, 0, N'Laptop văn phòng gọn nhẹ, thời lượng pin dài, bàn phím êm, phù hợp làm việc và học tập.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (13, N'HP Envy 15', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/hp_envy_x360_14_blue_ffb8a04fdd.png', 23990000, 30, N'C002', N'B004', CAST(N'2023-04-01' AS Date), 12, 0, N'Laptop văn phòng gọn nhẹ, thời lượng pin dài, bàn phím êm, phù hợp làm việc và học tập.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (14, N'HP Pavilion Aero 13', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/2023_8_24_638284697135623321_hp-pavilion-aero-13-bac-1.jpg', 19990000, 30, N'C003', N'B004', CAST(N'2023-06-10' AS Date), 12, 0, N'Laptop siêu mỏng nhẹ, dễ dàng mang theo, phù hợp cho sinh viên và nhân viên di chuyển nhiều.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (15, N'Acer Swift 14 AI', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/acer_swift_14_ai_sf14_51_53p9_1_aedddbf7aa.png', 21990000, 28, N'C003', N'B005', CAST(N'2023-07-18' AS Date), 12, 0, N'Laptop siêu mỏng nhẹ, dễ dàng mang theo, phù hợp cho sinh viên và nhân viên di chuyển nhiều.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (16, N'Asus ZenBook 14', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/asus_zenbook_14_ux3405_blue_1_2b8d979b81.png', 23990000, 22, N'C003', N'B002', CAST(N'2023-08-25' AS Date), 12, 0, N'Laptop siêu mỏng nhẹ, dễ dàng mang theo, phù hợp cho sinh viên và nhân viên di chuyển nhiều.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (17, N'Dell Inspiron 14', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/dell_inspiron_5440_blue_ee119867e4.png', 18990000, 35, N'C003', N'B003', CAST(N'2023-09-12' AS Date), 12, 0, N'Laptop siêu mỏng nhẹ, dễ dàng mang theo, phù hợp cho sinh viên và nhân viên di chuyển nhiều.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (18, N'Acer Swift 3', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/2023_7_6_638242339490771203_acer-swift-3-sf314-512-vang-2.jpg', 18990000, 40, N'C003', N'B005', CAST(N'2023-05-01' AS Date), 12, 0, N'Laptop siêu mỏng nhẹ, dễ dàng mang theo, phù hợp cho sinh viên và nhân viên di chuyển nhiều.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (19, N'MacBook Air', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/macbook_air_13_m3_midnight_1_368063bb53.png', 27990000, 35, N'C003', N'B006', CAST(N'2023-06-01' AS Date), 12, 0, N'Laptop siêu mỏng nhẹ, dễ dàng mang theo, phù hợp cho sinh viên và nhân viên di chuyển nhiều.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (20, N'MSI Creator Z16', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/2023_6_16_638225119763649940_msi-gaming-creator-z16-xam-1.jpg', 46990000, 8, N'C004', N'B007', CAST(N'2023-06-05' AS Date), 12, 0, N'Laptop đồ họa chuyên dụng, trang bị card đồ họa mạnh, màn hình sắc nét, hỗ trợ thiết kế và dựng phim.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (21, N'HP ZBook Studio', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/00908901_hp_245_g10_a20tfpt_9ce2c339f9.png', 44990000, 8, N'C004', N'B004', CAST(N'2023-08-20' AS Date), 12, 0, N'Laptop đồ họa chuyên dụng, trang bị card đồ họa mạnh, màn hình sắc nét, hỗ trợ thiết kế và dựng phim.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (22, N'Acer ConceptD 7', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/2023_9_9_638298604983362410_acer-aspire-7-gaming-a715-76g-den-1.jpg', 42990000, 12, N'C004', N'B005', CAST(N'2023-09-15' AS Date), 12, 0, N'Laptop đồ họa chuyên dụng, trang bị card đồ họa mạnh, màn hình sắc nét, hỗ trợ thiết kế và dựng phim.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (24, N'Dell XPS 17', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/dell_xps_14_9440_graphite_1_ed2132563b.png', 43990000, 12, N'C005', N'B003', CAST(N'2023-07-01' AS Date), 12, 0, N'Laptop cao cấp với thiết kế tinh tế, hiệu suất mạnh mẽ, màn hình chất lượng cao dành cho doanh nhân.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (25, N'HP Spectre Folio', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/2024_6_24_638548335557426654_a19blpa.jpg', 40990000, 15, N'C005', N'B004', CAST(N'2023-08-10' AS Date), 12, 0, N'Laptop cao cấp với thiết kế tinh tế, hiệu suất mạnh mẽ, màn hình chất lượng cao dành cho doanh nhân.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (26, N'Lenovo ThinkPad X1 Extreme', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/thinkpad_x1_carbon_gen_12_haptic_touchpad_34054a60b6.png', 45990000, 10, N'C005', N'B001', CAST(N'2023-09-18' AS Date), 12, 0, N'Laptop cao cấp với thiết kế tinh tế, hiệu suất mạnh mẽ, màn hình chất lượng cao dành cho doanh nhân.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (27, N'MSI Prestige 14', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/msi_prestige_14_ai_studio_c1u_1_5ab50baa17.png', 38990000, 14, N'C005', N'B007', CAST(N'2023-11-12' AS Date), 12, 0, N'Laptop cao cấp với thiết kế tinh tế, hiệu suất mạnh mẽ, màn hình chất lượng cao dành cho doanh nhân.')
GO
INSERT [dbo].[tblProducts] ([productID], [productName], [image], [price], [quantity], [categoryID], [brandID], [importDate], [warrantyMonths], [isFeatured], [description]) VALUES (28, N'MacBook Pro 16', N'https://cdn2.fptshop.com.vn/unsafe/750x0/filters:quality(100)/macbook_pro_16_m4_pro_max_silver_1_6f38aaf8d8.png', 55990000, 0, N'C005', N'B006', CAST(N'2023-10-01' AS Date), 12, 0, N'Laptop cao cấp với thiết kế tinh tế, hiệu suất mạnh mẽ, màn hình chất lượng cao dành cho doanh nhân.')
GO
SET IDENTITY_INSERT [dbo].[tblProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[tblReviews] ON 
GO
INSERT [dbo].[tblReviews] ([reviewID], [productID], [userID], [rating], [comment], [reviewDate]) VALUES (1, 1, 1, 5, N'Máy tính xách tay tuyệt vời!  Nhanh chóng và đáng tin cậy.', CAST(N'2025-03-04T22:59:28.013' AS DateTime))
GO
INSERT [dbo].[tblReviews] ([reviewID], [productID], [userID], [rating], [comment], [reviewDate]) VALUES (2, 1, 2, 4, N'Good value for the money.', CAST(N'2025-03-04T22:59:28.050' AS DateTime))
GO
INSERT [dbo].[tblReviews] ([reviewID], [productID], [userID], [rating], [comment], [reviewDate]) VALUES (3, 5, 3, 3, N'It''s okay, but the battery life is a bit short.', CAST(N'2025-03-04T22:59:28.050' AS DateTime))
GO
INSERT [dbo].[tblReviews] ([reviewID], [productID], [userID], [rating], [comment], [reviewDate]) VALUES (4, 25, 1, 5, N'This is my dream laptop!', CAST(N'2025-03-04T22:59:28.050' AS DateTime))
GO
INSERT [dbo].[tblReviews] ([reviewID], [productID], [userID], [rating], [comment], [reviewDate]) VALUES (5, 10, 2, 1, N'Terrible product.  Would not recommend.', CAST(N'2025-03-04T22:59:28.053' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblReviews] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRoles] ON 
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (2, N'Customer')
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (3, N'Guest')
GO
SET IDENTITY_INSERT [dbo].[tblRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUsers] ON 
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [username], [password], [roleID], [address], [phone], [email], [activate]) VALUES (1, N'Nguyễn Văn A', N'admin', N'admin', 1, N'Hà Nội việt nam', N'0123456789', N'akira72005@gmail.com', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [username], [password], [roleID], [address], [phone], [email], [activate]) VALUES (2, N'Khuất Quang Hưng', N'user2', N'123', 2, N'FPT, Thạch Thất, Hà Nội, Việt Nam', N'0327715098', N'hungsct1702@gmail.com', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [username], [password], [roleID], [address], [phone], [email], [activate]) VALUES (3, N'Lê Văn C', N'user3', N'123', 2, N'Đà Nẵng', N'0934567890', N'c@example.com', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [username], [password], [roleID], [address], [phone], [email], [activate]) VALUES (4, N'Trần Thị D', N'user4', N'123', 2, N'TP HCM', N'0945678901', N'd@example.com', 0)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [username], [password], [roleID], [address], [phone], [email], [activate]) VALUES (5, N'Phạm Văn E', N'user5', N'123', 2, N'Cần Thơ', N'0956789012', N'e@example.com', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [username], [password], [roleID], [address], [phone], [email], [activate]) VALUES (6, N'Nguyễn Văn F', N'user6', N'123', 2, N'Số 10, Đường ABC, Quận XYZ, Huế', N'0967123456', N'f@example.com', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [username], [password], [roleID], [address], [phone], [email], [activate]) VALUES (7, N'Trần Thị G', N'user7', N'user7', 2, N'25 Đường DEF, Phú Nhuận, TP.HCM', N'0978234567', N'g@example.com', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [username], [password], [roleID], [address], [phone], [email], [activate]) VALUES (8, N'Lê Văn H', N'user8', N'user8', 2, N'123 Đường GHI, Sơn Trà, Đà Nẵng', N'0989345678', N'h@example.com', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [username], [password], [roleID], [address], [phone], [email], [activate]) VALUES (9, N'Nguyễn Văn K', N'hunghuhu', N'hung1702', 2, N'15 Đường JKL, Long Biên, Hà Nội', N'0918444555', N'i@example.com', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [username], [password], [roleID], [address], [phone], [email], [activate]) VALUES (10, N'Khuất Quang Dũng', N'hunghihi', N'123', 2, N'Thạch Thất, Hà Nội', N'0379914844', N'quanghung72zz@gmail.com', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [username], [password], [roleID], [address], [phone], [email], [activate]) VALUES (11, N'Default Name', N'hunghaha', N'123', 2, N'', N'', N'', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [username], [password], [roleID], [address], [phone], [email], [activate]) VALUES (12, N'Default Name', N'', N'', 2, N'', N'', N'', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [username], [password], [roleID], [address], [phone], [email], [activate]) VALUES (13, N'Default Name', N'hungkaka', N'123', 2, N'', N'', N'', 1)
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [username], [password], [roleID], [address], [phone], [email], [activate]) VALUES (14, N'test', N'testuser', N'123', 2, N'Thạch Thất, Hà Nội', N'03277150982', N'hu22ng@gmail.com', 1)
GO
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblDisco__357D4CF924684122]    Script Date: 03/25/25 05:22:56 PM ******/
ALTER TABLE [dbo].[tblDiscounts] ADD UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblOrders] ADD  CONSTRAINT [DF_tblOrders_orderDate]  DEFAULT (getdate()) FOR [orderDate]
GO
ALTER TABLE [dbo].[tblOrders] ADD  CONSTRAINT [DF_tblOrders_fullName]  DEFAULT (N'Default Name') FOR [fullName]
GO
ALTER TABLE [dbo].[tblOrders] ADD  CONSTRAINT [DF_tblOrders_note]  DEFAULT (N'không có ghi chú') FOR [note]
GO
ALTER TABLE [dbo].[tblOrders] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[tblProducts] ADD  DEFAULT ((0)) FOR [isFeatured]
GO
ALTER TABLE [dbo].[tblProductViews] ADD  DEFAULT (getdate()) FOR [viewedAt]
GO
ALTER TABLE [dbo].[tblReviews] ADD  DEFAULT (getdate()) FOR [reviewDate]
GO
ALTER TABLE [dbo].[tblShipping] ADD  DEFAULT ('Ch? x? lý') FOR [status]
GO
ALTER TABLE [dbo].[tblUsers] ADD  CONSTRAINT [DF_tblUsers_phone]  DEFAULT (N'Default Name') FOR [phone]
GO
ALTER TABLE [dbo].[tblUsers] ADD  CONSTRAINT [DF_tblUsers_activate]  DEFAULT ((1)) FOR [activate]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[tblProductDetails]  WITH CHECK ADD  CONSTRAINT [FK__tblProduc__produ__5DCAEF64] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProductDetails] CHECK CONSTRAINT [FK__tblProduc__produ__5DCAEF64]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([brandID])
REFERENCES [dbo].[tblBrands] ([brandID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategories] ([categoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[tblProductViews]  WITH CHECK ADD  CONSTRAINT [FK__tblProduc__produ__60A75C0F] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblProductViews] CHECK CONSTRAINT [FK__tblProduc__produ__60A75C0F]
GO
ALTER TABLE [dbo].[tblProductViews]  WITH CHECK ADD  CONSTRAINT [FK__tblProduc__userI__619B8048] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblProductViews] CHECK CONSTRAINT [FK__tblProduc__userI__619B8048]
GO
ALTER TABLE [dbo].[tblReviews]  WITH CHECK ADD  CONSTRAINT [FK__tblReview__produ__628FA481] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblReviews] CHECK CONSTRAINT [FK__tblReview__produ__628FA481]
GO
ALTER TABLE [dbo].[tblReviews]  WITH CHECK ADD  CONSTRAINT [FK__tblReview__userI__6383C8BA] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblReviews] CHECK CONSTRAINT [FK__tblReview__userI__6383C8BA]
GO
ALTER TABLE [dbo].[tblShipping]  WITH CHECK ADD  CONSTRAINT [FK__tblShippi__order__6477ECF3] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblShipping] CHECK CONSTRAINT [FK__tblShippi__order__6477ECF3]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[tblWishlist]  WITH CHECK ADD  CONSTRAINT [FK__tblWishli__produ__66603565] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblWishlist] CHECK CONSTRAINT [FK__tblWishli__produ__66603565]
GO
ALTER TABLE [dbo].[tblWishlist]  WITH CHECK ADD  CONSTRAINT [FK__tblWishli__userI__6754599E] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblWishlist] CHECK CONSTRAINT [FK__tblWishli__userI__6754599E]
GO
ALTER TABLE [dbo].[tblReviews]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [LaptopStore2] SET  READ_WRITE 
GO
