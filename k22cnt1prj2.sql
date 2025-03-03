USE [lvnk22cnt1]
GO
/****** Object:  Table [dbo].[CHI_TIET_DON_HANG]    Script Date: 31/10/2024 8:12:26 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHI_TIET_DON_HANG](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[So_luong] [int] NULL,
	[Gia] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DON_HANG]    Script Date: 31/10/2024 8:12:26 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DON_HANG](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[Ngay_dat_hang] [datetime] NULL,
	[Tong_gia] [decimal](10, 2) NULL,
	[Trang_thai] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACH_HANG]    Script Date: 31/10/2024 8:12:26 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACH_HANG](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Ho_ten] [varchar](100) NULL,
	[Tai_khoan] [varchar](50) NOT NULL,
	[Mat_khau] [varchar](32) NULL,
	[Dia_chi] [nvarchar](200) NULL,
	[Dien_thoai] [varchar](30) NULL,
	[Email] [varchar](50) NOT NULL,
	[Ngay_sinh] [datetime] NULL,
	[Ngay_cap_nhat] [datetime] NULL,
	[Gioi_tinh] [tinyint] NULL,
	[Tich_diem] [int] NULL,
	[Trang_thai] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUAN_TRI]    Script Date: 31/10/2024 8:12:26 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUAN_TRI](
	[Tai_khoan] [varchar](50) NOT NULL,
	[Mat_khau] [varchar](32) NULL,
	[Trang_thai] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Tai_khoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAN_PHAM]    Script Date: 31/10/2024 8:12:26 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAN_PHAM](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Ten_san_pham] [varchar](100) NULL,
	[Mo_ta] [text] NULL,
	[Gia] [decimal](10, 2) NULL,
	[So_luong_ton_kho] [int] NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACH_HA__52AE88F546ECBE26]    Script Date: 31/10/2024 8:12:26 SA ******/
ALTER TABLE [dbo].[KHACH_HANG] ADD UNIQUE NONCLUSTERED 
(
	[Tai_khoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CHI_TIET_DON_HANG]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[DON_HANG] ([OrderID])
GO
ALTER TABLE [dbo].[CHI_TIET_DON_HANG]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[SAN_PHAM] ([ProductID])
GO
ALTER TABLE [dbo].[DON_HANG]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[KHACH_HANG] ([CustomerID])
GO
