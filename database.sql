USE [BanOto]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GetCarIDNext]    Script Date: 21-Apr-18 12:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[FN_GetCarIDNext]()
returns varchar(50)
as
begin
	declare @Idx int
	declare @CarID varchar(50) = 'XE00001'
	set @Idx = 1;

	while(exists(select * from [Xe] where MaXe = @CarID))
	begin
		set @Idx = @Idx + 1
		set @CarID = 'XE'+REPLICATE('0', 5-LEN(cast(@Idx as varchar))) + CAST(@Idx as varchar)
	end
	return @CarID
end
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GetHoaDonIDNext]    Script Date: 21-Apr-18 12:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[FN_GetHoaDonIDNext]()
returns varchar(50)
as
begin
	declare @Idx int
	declare @HoaDonID varchar(50) = 'HD00001'
	set @Idx = 1;

	while(exists(select * from [DonHang] where MaDH = @HoaDonID))
	begin
		set @Idx = @Idx + 1
		set @HoaDonID = 'HD'+REPLICATE('0', 5-LEN(cast(@Idx as varchar))) + CAST(@Idx as varchar)
	end
	return @HoaDonID
end
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GetLogIDNext]    Script Date: 21-Apr-18 12:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[FN_GetLogIDNext]()
returns varchar(50)
as
begin
	declare @Idx int
	declare @LogID varchar(50) = 'LOG00001'
	set @Idx = 1;

	while(exists(select * from [Logs] where MaLog = @LogID))
	begin
		set @Idx = @Idx + 1
		set @LogID = 'LOG'+REPLICATE('0', 5-LEN(cast(@Idx as varchar))) + CAST(@Idx as varchar)
	end
	return @LogID
end
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GetUserIDNext]    Script Date: 21-Apr-18 12:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[FN_GetUserIDNext]()
returns varchar(50)
as
begin
	declare @Idx int
	declare @UserID varchar(50) = 'US00001'
	set @Idx = 1;

	while(exists(select * from [User] where UserName = @UserID))
	begin
		set @Idx = @Idx + 1
		set @UserID = 'US'+REPLICATE('0', 5-LEN(cast(@Idx as varchar))) + CAST(@Idx as varchar)
	end
	return @UserID
end
GO
/****** Object:  Table [dbo].[Anh]    Script Date: 21-Apr-18 12:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anh](
	[MaAnh] [int] IDENTITY(1,1) NOT NULL,
	[Src] [nvarchar](250) NULL,
	[MaXe] [varchar](50) NULL,
 CONSTRAINT [PK_Anh] PRIMARY KEY CLUSTERED 
(
	[MaAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBL] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[NoiDung] [nvarchar](550) NULL,
	[MaXe] [varchar](50) NULL,
	[HoTen] [nvarchar](250) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[MaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Counter]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Counter](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[IPAdress] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Counter] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTDonHang]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDonHang](
	[MaDH] [varchar](50) NOT NULL,
	[MaXe] [varchar](50) NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_CTDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Sdt] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[TrangThai] [nvarchar](50) NULL,
	[ChuThich] [nvarchar](250) NULL,
	[MaTT] [int] NULL,
	[MaVC] [int] NULL,
	[NgayDH] [datetime] NULL,
	[TongTien] [money] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiHopSo]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHopSo](
	[MaHS] [int] IDENTITY(1,1) NOT NULL,
	[TenHS] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiHopSo] PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiXe]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiXe](
	[MaLX] [int] IDENTITY(1,1) NOT NULL,
	[TenLX] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiXe] PRIMARY KEY CLUSTERED 
(
	[MaLX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[MaLog] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Messages] [nvarchar](250) NULL,
	[TimeLogin] [datetime] NULL,
	[TimeLogout] [datetime] NULL,
	[TimeCreate] [datetime] NULL,
	[Type] [varchar](50) NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[MaLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mau]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mau](
	[MaMau] [int] IDENTITY(1,1) NOT NULL,
	[TenMau] [nvarchar](50) NULL,
 CONSTRAINT [PK_Mau] PRIMARY KEY CLUSTERED 
(
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoiDung]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoiDung](
	[From] [varchar](50) NOT NULL,
	[To] [varchar](50) NOT NULL,
	[Message] [nvarchar](550) NULL,
 CONSTRAINT [PK_NoiDung] PRIMARY KEY CLUSTERED 
(
	[From] ASC,
	[To] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Tilte] [nvarchar](250) NULL,
	[Type] [nvarchar](250) NULL,
	[Anh] [nvarchar](250) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhToan]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhToan](
	[MaTT] [int] IDENTITY(1,1) NOT NULL,
	[TenTT] [nvarchar](50) NULL,
	[ChietKhau] [float] NULL,
 CONSTRAINT [PK_ThanhToan] PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[MaTH] [int] IDENTITY(1,1) NOT NULL,
	[TenTH] [nvarchar](50) NULL,
	[Anh] [nvarchar](250) NULL,
 CONSTRAINT [PK_ThuongHieu] PRIMARY KEY CLUSTERED 
(
	[MaTH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinNhan]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinNhan](
	[From] [varchar](50) NOT NULL,
	[To] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TinNhan_1] PRIMARY KEY CLUSTERED 
(
	[From] ASC,
	[To] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Sdt] [varchar](20) NULL,
	[GT] [bit] NULL,
	[MaQuyen] [int] NOT NULL,
	[Avatar] [nvarchar](250) NULL,
	[IsLock] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VanChuyen]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VanChuyen](
	[MaVC] [int] IDENTITY(1,1) NOT NULL,
	[TenVC] [nvarchar](50) NULL,
	[PhiVC] [float] NULL,
 CONSTRAINT [PK_VanChuyen] PRIMARY KEY CLUSTERED 
(
	[MaVC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Xe]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xe](
	[MaXe] [varchar](50) NOT NULL,
	[TenXe] [nvarchar](150) NOT NULL,
	[DungTichXiLanh] [nvarchar](250) NULL,
	[MaMau] [int] NULL,
	[LoaiHopSo] [int] NULL,
	[MaXX] [int] NULL,
	[MaLoaiXe] [int] NULL,
	[MaTH] [int] NULL,
	[CongXuat] [nvarchar](250) NULL,
	[ChoNgoi] [int] NULL,
	[GiaBan] [money] NOT NULL,
	[GiamGia] [float] NULL,
	[MomenXoan] [nvarchar](250) NULL,
	[KieuTruyenDong] [nvarchar](550) NULL,
	[TrongLuong] [float] NULL,
	[ChieuCao] [int] NULL,
	[ChieuRong] [int] NULL,
	[ChieuDai] [int] NULL,
	[TangAp] [bit] NULL,
	[MamVanh] [nvarchar](250) NULL,
	[PhanhTruoc] [nvarchar](250) NULL,
	[PhanhSau] [nvarchar](250) NULL,
	[KichCoLopT] [nvarchar](250) NULL,
	[KichCoLopS] [nvarchar](250) NULL,
	[HeThongTreoTruoc] [nvarchar](550) NULL,
	[HeThongTreoSau] [nvarchar](550) NULL,
	[KhoangSangGam] [int] NULL,
	[HeThongDenT] [nvarchar](550) NULL,
	[HeThongDenS] [nvarchar](550) NULL,
	[HeThongLoa] [nvarchar](550) NULL,
	[GuongChieuHau] [bit] NULL,
	[ChongBoABS] [bit] NULL,
	[MoTa] [nvarchar](550) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[DanhGia] [int] NULL,
	[TinhTrang] [bit] NULL,
	[SoLuong] [int] NULL,
	[NamSX] [varchar](50) NULL,
	[Anh] [nvarchar](250) NULL,
	[TimeCreate] [datetime] NULL,
 CONSTRAINT [PK_Xe] PRIMARY KEY CLUSTERED 
(
	[MaXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XuatXu]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XuatXu](
	[MaXX] [int] IDENTITY(1,1) NOT NULL,
	[TenXX] [nvarchar](50) NULL,
 CONSTRAINT [PK_XuatXu] PRIMARY KEY CLUSTERED 
(
	[MaXX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Anh] ON 

INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (1, N'1.jpg', N'XE00001')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (2, N'2.jpg', N'XE00001')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (3, N'3.jpg', N'XE00001')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (4, N'4.jpg', N'XE00001')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (5, N'5.jpg', N'XE00001')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (6, N'6.jpg', N'XE00001')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (9, N'Normal-2018-Toyota-Corolla-Altis-1-8G-CVT-20180311170827716.jpg', N'XE00002')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (10, N'Normal-2018-Toyota-Corolla-Altis-1-8G-CVT-20180311170827950.jpg', N'XE00002')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (11, N'Normal-2018-Toyota-Corolla-Altis-1-8G-CVT-20180311170829763.jpg', N'XE00002')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (12, N'Normal-2018-Toyota-Corolla-Altis-1-8G-CVT-20180311170834888.jpg', N'XE00002')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (13, N'Normal-2018-Nissan-Sunny-XV-1-5-20180405031209373.jpg', N'XE00003')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (14, N'Normal-2018-Nissan-Sunny-XV-1-5-20180405031215795.jpg', N'XE00003')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (15, N'Normal-2018-Nissan-Sunny-XV-1-5-20180405031226264.jpg', N'XE00003')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (16, N'Normal-2018-Toyota-Innova-2-0E-20180311165305667.jpg', N'XE00004')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (17, N'Normal-2018-Toyota-Innova-2-0E-20180311165306277.jpg', N'XE00004')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (18, N'Normal-2018-Toyota-Innova-2-0E-20180311165307027.jpg', N'XE00004')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (20, N'Normal-2018-Toyota-Innova-2-0E-20180311165321886.jpg', N'XE00004')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (21, N'Normal-2018-Hyundai-Tucson-2-0-xang-ban-dac-biet-khuyen-mai-den-102-Tr-20180403133439321.jpg', N'XE00005')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (22, N'Normal-2018-Hyundai-Tucson-2-0-xang-ban-dac-biet-khuyen-mai-den-102-Tr-20180403133439696.jpg', N'XE00005')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (23, N'Normal-2018-Hyundai-Tucson-2-0-xang-ban-dac-biet-khuyen-mai-den-102-Tr-20180403133552884.jpg', N'XE00005')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (24, N'Normal-2017-Chevrolet-Orlando-LT-1-8-20180405034054439.jpg', N'XE00006')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (25, N'Normal-2017-Chevrolet-Orlando-LT-1-8-20180405034056064.jpg', N'XE00006')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (26, N'Normal-2017-Chevrolet-Orlando-LT-1-8-20180405035450785.jpg', N'XE00006')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (27, N'Normal-2018-KIA-Morning-S-AT-20180405043241727.jpg', N'XE00007')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (28, N'Normal-2018-KIA-Morning-S-AT-20180405043254930.jpg', N'XE00007')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (29, N'Normal-2018-KIA-Morning-S-AT-20180405043317367.jpg', N'XE00007')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (30, N'Normal-2018-Mazda-6-2-0L-Premium-20180314012927216.jpg', N'XE00007')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (31, N'Normal-2018-Mazda-CX-5-2-5L-FWD-20180308075233459.jpg', N'XE00008')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (32, N'Normal-2018-Mazda-CX-5-2-5L-FWD-20180308075407288.jpg', N'XE00008')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (33, N'Normal-2018-Mazda-CX-5-2-5L-FWD-20180308080412445.jpg', N'XE00008')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (34, N'Normal-2015-Ford-Everest-XLT-4x2-20180405034734768.jpg', N'XE00009')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (35, N'Normal-2015-Ford-Everest-XLT-4x2-20180405034753518.jpg', N'XE00009')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (36, N'Normal-2015-Ford-Everest-XLT-4x2-20180405034809815.jpg', N'XE00009')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (37, N'Normal-2018-Hyundai-Elantra-Sport-2018-mau-Trang-Vung-Tau-chi-voi-198tr-20180130044551912.jpg', N'XE00010')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (38, N'Normal-2018-Hyundai-Elantra-Sport-2018-mau-Trang-Vung-Tau-chi-voi-198tr-20180130044552818.jpg', N'XE00010')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (39, N'Normal-2018-Hyundai-Elantra-Sport-2018-mau-Trang-Vung-Tau-chi-voi-198tr-20180130044554833.jpg', N'XE00010')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (40, N'Normal-2018-Hyundai-Elantra-Sport-2018-mau-Trang-Vung-Tau-chi-voi-198tr-20180130044558865.jpg', N'XE00010')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (41, N'Normal-2018-Toyota-Camry-2-0E-20180405042337788.jpg', N'XE00011')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (42, N'Normal-2018-Toyota-Camry-2-0E-20180405042401632.jpg', N'XE00011')
INSERT [dbo].[Anh] ([MaAnh], [Src], [MaXe]) VALUES (43, N'Normal-2018-Toyota-Camry-2-0E-20180405042410398.jpg', N'XE00011')
SET IDENTITY_INSERT [dbo].[Anh] OFF
SET IDENTITY_INSERT [dbo].[BinhLuan] ON 

INSERT [dbo].[BinhLuan] ([MaBL], [Email], [NoiDung], [MaXe], [HoTen], [CreateTime]) VALUES (0, N'nguyenvanb@gmail.com', N'Trong khi đó, không gian nội thất ghi dấu với vật liệu chất lượng cao hơn như nhôm bóng, gỗ và da. Ngoài ra, còn phải kể đến cửa sổ trời toàn cảnh cỡ lớn, màn hình hiển thị thông tin trên kính lái 10.5 inch, màn hình thông tin giải trí 10.2 inch chạy hệ điều hành Android, touchpad điều khiển, nhận diện giọng nói, nút chuyển 4 chế độ lái, hệ thống âm thanh 710W, 16 kênh được phát triển với Panasonic…', N'XE00010', N'Nguyễn Văn B', CAST(N'2018-04-08T21:37:09.110' AS DateTime))
INSERT [dbo].[BinhLuan] ([MaBL], [Email], [NoiDung], [MaXe], [HoTen], [CreateTime]) VALUES (1, N'nguyenvanb@gmail.com', N'Đánh giá xe', N'XE00002', N'Nguyễn Văn B', CAST(N'2018-04-08T21:56:45.307' AS DateTime))
INSERT [dbo].[BinhLuan] ([MaBL], [Email], [NoiDung], [MaXe], [HoTen], [CreateTime]) VALUES (2, N'nguyenvanb@gmail.com', N'Xe rất tốt, cảm giác lái tuyệt vời', N'XE00010', N'Nguyễn Văn B', CAST(N'2018-04-08T22:03:55.687' AS DateTime))
INSERT [dbo].[BinhLuan] ([MaBL], [Email], [NoiDung], [MaXe], [HoTen], [CreateTime]) VALUES (3, N'nguyenvana@gmail.com', N'Đánh giá xe rất tốt, động cơ mạnh mẽ, cơ cấu lái ổn định', N'XE00010', N'Nguyễn Văn A', CAST(N'2018-04-08T22:08:15.333' AS DateTime))
INSERT [dbo].[BinhLuan] ([MaBL], [Email], [NoiDung], [MaXe], [HoTen], [CreateTime]) VALUES (4, N'nguyenvana@gmail.com', N'Đánh giá xe rất tốt, động cơ mạnh mẽ, cơ cấu lái ổn định', N'XE00010', N'Nguyễn Văn A', CAST(N'2018-04-08T22:09:09.267' AS DateTime))
INSERT [dbo].[BinhLuan] ([MaBL], [Email], [NoiDung], [MaXe], [HoTen], [CreateTime]) VALUES (5, N'nguyenvanb@gmail.com', N'màu sắc rất tao nhã, thanh lịch, ai lai kịt', N'XE00002', N'Nguyễn Văn B', CAST(N'2018-04-08T22:16:10.233' AS DateTime))
INSERT [dbo].[BinhLuan] ([MaBL], [Email], [NoiDung], [MaXe], [HoTen], [CreateTime]) VALUES (6, N'nguyenvanb@gmail.com', N'động cơ rất tốt, hoạt động bền bỉ', N'XE00002', N'Nguyễn Văn B', CAST(N'2018-04-08T22:16:41.910' AS DateTime))
SET IDENTITY_INSERT [dbo].[BinhLuan] OFF
SET IDENTITY_INSERT [dbo].[Counter] ON 

INSERT [dbo].[Counter] ([STT], [IPAdress], [CreateTime]) VALUES (1, N'::1', CAST(N'2018-04-09T05:31:10.313' AS DateTime))
INSERT [dbo].[Counter] ([STT], [IPAdress], [CreateTime]) VALUES (2, N'::1', CAST(N'2018-04-20T07:52:11.863' AS DateTime))
INSERT [dbo].[Counter] ([STT], [IPAdress], [CreateTime]) VALUES (1002, N'::1', CAST(N'2018-04-21T06:43:20.090' AS DateTime))
SET IDENTITY_INSERT [dbo].[Counter] OFF
INSERT [dbo].[CTDonHang] ([MaDH], [MaXe], [SoLuong]) VALUES (N'HD00001', N'XE00001', 1)
INSERT [dbo].[CTDonHang] ([MaDH], [MaXe], [SoLuong]) VALUES (N'HD00002', N'XE00010', 1)
INSERT [dbo].[DonHang] ([MaDH], [HoTen], [DiaChi], [Sdt], [Email], [TrangThai], [ChuThich], [MaTT], [MaVC], [NgayDH], [TongTien]) VALUES (N'HD00001', N'Nguyen Van A', N'Ha Noi', N'0977206532', N'nguoiyeuemchanthan@gmail.com', N'Đã xử lý', NULL, 1, 4, CAST(N'2018-04-04T00:00:00.000' AS DateTime), 1560000000.0000)
INSERT [dbo].[DonHang] ([MaDH], [HoTen], [DiaChi], [Sdt], [Email], [TrangThai], [ChuThich], [MaTT], [MaVC], [NgayDH], [TongTien]) VALUES (N'HD00002', N'Nguyễn Văn B', N'Hà Nội', NULL, NULL, N'Chưa xử lý', NULL, 1, 4, CAST(N'2018-04-05T00:00:00.000' AS DateTime), 843908625.0000)
SET IDENTITY_INSERT [dbo].[LoaiHopSo] ON 

INSERT [dbo].[LoaiHopSo] ([MaHS], [TenHS]) VALUES (1, N'Tự động')
INSERT [dbo].[LoaiHopSo] ([MaHS], [TenHS]) VALUES (3, N'Số sàn')
SET IDENTITY_INSERT [dbo].[LoaiHopSo] OFF
SET IDENTITY_INSERT [dbo].[LoaiXe] ON 

INSERT [dbo].[LoaiXe] ([MaLX], [TenLX]) VALUES (1, N'Sedan')
INSERT [dbo].[LoaiXe] ([MaLX], [TenLX]) VALUES (4, N'SUV')
INSERT [dbo].[LoaiXe] ([MaLX], [TenLX]) VALUES (5, N'Coupe')
INSERT [dbo].[LoaiXe] ([MaLX], [TenLX]) VALUES (6, N'Hybrib')
INSERT [dbo].[LoaiXe] ([MaLX], [TenLX]) VALUES (7, N'Bán tải')
INSERT [dbo].[LoaiXe] ([MaLX], [TenLX]) VALUES (8, N'Xe gia đình')
SET IDENTITY_INSERT [dbo].[LoaiXe] OFF
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'', N'US00001', N'admin@admin.com Đăng xuất hệ thống vào 01:04 05-49-2018', NULL, CAST(N'2018-04-05T01:49:20.120' AS DateTime), CAST(N'2018-04-05T01:49:20.120' AS DateTime), N'logout', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00001', N'US00001', N'Login to administrator system', CAST(N'2018-04-03T00:00:00.000' AS DateTime), NULL, CAST(N'2018-04-03T17:05:00.000' AS DateTime), N'fa-sign-in', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00002', N'US00001', N'Upload file to server', CAST(N'2018-04-03T17:05:31.593' AS DateTime), NULL, CAST(N'2018-04-03T17:05:31.593' AS DateTime), N'fa-upload', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00003', N'US00001', N'Delete user abc', CAST(N'2018-04-03T17:06:47.360' AS DateTime), NULL, CAST(N'2018-04-03T17:06:47.360' AS DateTime), N'fa-times', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00004', N'US00001', N'Đăng nhập hệ thống quản trị.', CAST(N'2018-04-03T17:26:42.640' AS DateTime), NULL, CAST(N'2018-04-03T17:26:42.640' AS DateTime), NULL, 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00005', N'US00001', N'Đăng nhập hệ thống quản trị.', CAST(N'2018-04-03T17:28:57.850' AS DateTime), NULL, CAST(N'2018-04-03T17:28:57.850' AS DateTime), N'fa-bell-o', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00006', N'US00001', N'Đăng nhập hệ thống quản trị.', CAST(N'2018-04-03T18:58:05.993' AS DateTime), NULL, CAST(N'2018-04-03T18:58:05.993' AS DateTime), N'fa-bell-o', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00007', N'US00001', N'Đăng nhập hệ thống quản trị.', CAST(N'2018-04-04T02:53:58.150' AS DateTime), NULL, CAST(N'2018-04-04T02:53:58.150' AS DateTime), N'fa-bell-o', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00008', N'US00001', N'Đăng nhập hệ thống quản trị.', CAST(N'2018-04-04T03:20:40.470' AS DateTime), NULL, CAST(N'2018-04-04T03:20:40.470' AS DateTime), N'fa-bell-o', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00009', N'US00001', N'Đăng nhập hệ thống quản trị.', CAST(N'2018-04-04T22:40:01.287' AS DateTime), NULL, CAST(N'2018-04-04T22:40:01.287' AS DateTime), N'fa-bell-o', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00010', N'US00001', N'Đăng nhập hệ thống quản trị.', CAST(N'2018-04-04T23:32:34.673' AS DateTime), NULL, CAST(N'2018-04-04T23:32:34.673' AS DateTime), N'fa-bell-o', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00011', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị.', CAST(N'2018-04-05T00:07:38.167' AS DateTime), NULL, CAST(N'2018-04-05T00:07:38.167' AS DateTime), N'fa-bell-o', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00012', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị.', CAST(N'2018-04-05T00:09:32.190' AS DateTime), NULL, CAST(N'2018-04-05T00:09:32.190' AS DateTime), NULL, 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00013', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị.', CAST(N'2018-04-05T00:11:19.467' AS DateTime), NULL, CAST(N'2018-04-05T00:11:19.467' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00014', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị.', CAST(N'2018-04-05T00:11:36.173' AS DateTime), NULL, CAST(N'2018-04-05T00:11:36.173' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00015', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị.', CAST(N'2018-04-05T00:12:21.343' AS DateTime), NULL, CAST(N'2018-04-05T00:12:21.343' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00016', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 01:04 05-43-2018', CAST(N'2018-04-05T01:43:30.490' AS DateTime), NULL, CAST(N'2018-04-05T01:43:30.490' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00017', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 01:04 05-48-2018', CAST(N'2018-04-05T01:48:31.427' AS DateTime), NULL, CAST(N'2018-04-05T01:48:31.427' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00018', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 01:04 05-49-2018', CAST(N'2018-04-05T01:49:21.777' AS DateTime), NULL, CAST(N'2018-04-05T01:49:21.777' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00019', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 01:04 05-51-2018', CAST(N'2018-04-05T01:51:54.980' AS DateTime), NULL, CAST(N'2018-04-05T01:51:54.980' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00020', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 01:04 05-54-2018', CAST(N'2018-04-05T01:54:22.640' AS DateTime), NULL, CAST(N'2018-04-05T01:54:22.640' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00021', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 01:04 05-58-2018', CAST(N'2018-04-05T01:58:24.497' AS DateTime), NULL, CAST(N'2018-04-05T01:58:24.497' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00022', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 09:04 05-10-2018', CAST(N'2018-04-05T09:10:22.610' AS DateTime), NULL, CAST(N'2018-04-05T09:10:22.610' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00023', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 09:04 05-21-2018', CAST(N'2018-04-05T09:21:56.213' AS DateTime), NULL, CAST(N'2018-04-05T09:21:56.213' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00024', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 12:04 05-21-2018', CAST(N'2018-04-05T12:21:17.377' AS DateTime), NULL, CAST(N'2018-04-05T12:21:17.377' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00025', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 02:04 06-53-2018', CAST(N'2018-04-06T02:53:42.447' AS DateTime), NULL, CAST(N'2018-04-06T02:53:42.447' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00026', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 03:04 06-05-2018', CAST(N'2018-04-06T03:05:15.227' AS DateTime), NULL, CAST(N'2018-04-06T03:05:15.227' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00027', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 10:04 07-50-2018', CAST(N'2018-04-07T22:50:01.430' AS DateTime), NULL, CAST(N'2018-04-07T22:50:01.430' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00028', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 11:04 07-58-2018', CAST(N'2018-04-07T23:58:08.673' AS DateTime), NULL, CAST(N'2018-04-07T23:58:08.673' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00029', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 05:04 09-31-2018', CAST(N'2018-04-09T05:31:36.383' AS DateTime), NULL, CAST(N'2018-04-09T05:31:36.383' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00030', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 05:04 09-55-2018', CAST(N'2018-04-09T05:55:39.227' AS DateTime), NULL, CAST(N'2018-04-09T05:55:39.227' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00031', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 06:04 09-05-2018', CAST(N'2018-04-09T06:05:27.080' AS DateTime), NULL, CAST(N'2018-04-09T06:05:27.080' AS DateTime), N'login', 1)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00032', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 07:04 20-52-2018', CAST(N'2018-04-20T07:52:22.807' AS DateTime), NULL, CAST(N'2018-04-20T07:52:22.807' AS DateTime), N'login', 0)
INSERT [dbo].[Logs] ([MaLog], [UserName], [Messages], [TimeLogin], [TimeLogout], [TimeCreate], [Type], [IsRead]) VALUES (N'LOG00033', N'US00001', N'admin@admin.com Đăng nhập hệ thống quản trị vào 04:04 20-26-2018', CAST(N'2018-04-20T16:26:57.127' AS DateTime), NULL, CAST(N'2018-04-20T16:26:57.127' AS DateTime), N'login', 0)
SET IDENTITY_INSERT [dbo].[Mau] ON 

INSERT [dbo].[Mau] ([MaMau], [TenMau]) VALUES (1, N'Trắng')
INSERT [dbo].[Mau] ([MaMau], [TenMau]) VALUES (2, N'Xanh dương')
INSERT [dbo].[Mau] ([MaMau], [TenMau]) VALUES (3, N'Đỏ')
INSERT [dbo].[Mau] ([MaMau], [TenMau]) VALUES (4, N'Vàng ghi')
SET IDENTITY_INSERT [dbo].[Mau] OFF
SET IDENTITY_INSERT [dbo].[Quyen] ON 

INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (1, N'Admin')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Quyen] OFF
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Tilte], [Type], [Anh], [CreateTime]) VALUES (1, N'Khuyến mại đến 20%', N'khuyến mại 20% các sản phẩm', N'banner-05.jpg', NULL)
INSERT [dbo].[Slide] ([ID], [Tilte], [Type], [Anh], [CreateTime]) VALUES (3, N'Sản phẩm mới nhập', N'Sản phẩm mới về', N'Normal-2018-Toyota-Corolla-Altis-1-8G-CVT-20180311170834888.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[ThanhToan] ON 

INSERT [dbo].[ThanhToan] ([MaTT], [TenTT], [ChietKhau]) VALUES (1, N'Thẻ tín dụng', 5)
INSERT [dbo].[ThanhToan] ([MaTT], [TenTT], [ChietKhau]) VALUES (2, N'Chuyển khoản', 5)
INSERT [dbo].[ThanhToan] ([MaTT], [TenTT], [ChietKhau]) VALUES (3, N'Thanh toán trực tiếp', 0)
SET IDENTITY_INSERT [dbo].[ThanhToan] OFF
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [Anh]) VALUES (1, N'Toyota', N'toyota.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [Anh]) VALUES (2, N'Ford', N'ford.jpg')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [Anh]) VALUES (3, N'Honda', N'honda.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [Anh]) VALUES (4, N'KIA', N'kia.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [Anh]) VALUES (6, N'Hyundai', N'hyundai.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [Anh]) VALUES (7, N'Chevorlet', N'chevrolet.jpg')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [Anh]) VALUES (8, N'BMW', N'bmw.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [Anh]) VALUES (9, N'Suzuki', N'suzuki.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [Anh]) VALUES (10, N'Nissan', N'nissan.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [Anh]) VALUES (11, N'Audi', N'audi.jpg')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [Anh]) VALUES (12, N'Mercedes-Benz', N'mercedesbenz.png')
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
INSERT [dbo].[User] ([UserName], [HoTen], [MatKhau], [Email], [DiaChi], [Sdt], [GT], [MaQuyen], [Avatar], [IsLock]) VALUES (N'US00001', N'admin', N'admin', N'admin@admin.com', NULL, NULL, 0, 1, N'dummy.png', 0)
INSERT [dbo].[User] ([UserName], [HoTen], [MatKhau], [Email], [DiaChi], [Sdt], [GT], [MaQuyen], [Avatar], [IsLock]) VALUES (N'US00002', N'user', N'user', N'user@user.com', NULL, NULL, 0, 2, N'dummy.png', 0)
INSERT [dbo].[User] ([UserName], [HoTen], [MatKhau], [Email], [DiaChi], [Sdt], [GT], [MaQuyen], [Avatar], [IsLock]) VALUES (N'US00003', N'user', N'12345', N'user@user.com', N'', N'', 0, 2, N'dummy.png', 0)
INSERT [dbo].[User] ([UserName], [HoTen], [MatKhau], [Email], [DiaChi], [Sdt], [GT], [MaQuyen], [Avatar], [IsLock]) VALUES (N'US00004', N'Nguyễn Văn A', N'12345', N'nguyenvana@gmail.com', N'Hà nội', N'01648470832', 0, 2, N'AltafAjpg.jpg', 0)
SET IDENTITY_INSERT [dbo].[VanChuyen] ON 

INSERT [dbo].[VanChuyen] ([MaVC], [TenVC], [PhiVC]) VALUES (4, N'Tàu hỏa', 5)
INSERT [dbo].[VanChuyen] ([MaVC], [TenVC], [PhiVC]) VALUES (5, N'Tàu thủy', 10)
INSERT [dbo].[VanChuyen] ([MaVC], [TenVC], [PhiVC]) VALUES (6, N'Ôtô', 5)
SET IDENTITY_INSERT [dbo].[VanChuyen] OFF
INSERT [dbo].[Xe] ([MaXe], [TenXe], [DungTichXiLanh], [MaMau], [LoaiHopSo], [MaXX], [MaLoaiXe], [MaTH], [CongXuat], [ChoNgoi], [GiaBan], [GiamGia], [MomenXoan], [KieuTruyenDong], [TrongLuong], [ChieuCao], [ChieuRong], [ChieuDai], [TangAp], [MamVanh], [PhanhTruoc], [PhanhSau], [KichCoLopT], [KichCoLopS], [HeThongTreoTruoc], [HeThongTreoSau], [KhoangSangGam], [HeThongDenT], [HeThongDenS], [HeThongLoa], [GuongChieuHau], [ChongBoABS], [MoTa], [NoiDung], [DanhGia], [TinhTrang], [SoLuong], [NamSX], [Anh], [TimeCreate]) VALUES (N'XE00001', N'Mercedes-Benz C200', N'0', 1, NULL, 1, 1, 1, N'0', 0, 1489000000.0000, 10, N'0', N'', 0, 0, 0, 0, 1, N'', NULL, NULL, N'', N'', N'', N'', 0, NULL, NULL, N'', 1, 1, N'Mercedes C200 2018 là mẫu xe khá được ưa chuộng trong bộ sưu tập C-class của hãng xe danh tiếng Mercedes, 1 phiên bản duy nhất, tên mã AVANTGARDE, hiện đang có giá bán khá cạnh tranh 1,489 tỉ đồng', N'&lt;p&gt;&lt;strong&gt;Đ&#225;nh gi&#225; xe Mercedes Benz C200 2018&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Mercedes C200 2018&lt;/strong&gt;&amp;nbsp;l&#224; mẫu xe kh&#225; được ưa chuộng trong bộ sưu tập C-class của h&#227;ng xe danh tiếng Mercedes, 1 phi&#234;n bản duy nhất, t&#234;n m&#227; AVANTGARDE, hiện đang c&#243; gi&#225; b&#225;n kh&#225; cạnh tranh 1,489 tỉ đồng, chỉ nhỉnh hơn c&#225;c d&#242;ng xe phổ th&#244;ng dạng D như&amp;nbsp;&lt;a href=&quot;https://muaxegiatot.vn/san-pham/xe-toyota-camry&quot; target=&quot;_blank&quot;&gt;Camry 2018&lt;/a&gt;&amp;nbsp;,&amp;nbsp;&lt;a href=&quot;https://muaxegiatot.vn/danh-gia-honda-accord-2017.html&quot; target=&quot;_blank&quot;&gt;Accord 2018&lt;/a&gt;một ch&#250;t, với rất nhiều t&#237;nh năng vượt trội về cảm gi&#225;c l&#225;i v&#224; tiện nghi, hứa hẹn những trải nghiệm th&#250; vị tr&#234;n từng v&#242;ng b&#225;nh.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Mercedes C200 2018 :&amp;nbsp;Vận h&#224;nh mạnh mẽ, ch&#250; trọng cảm gi&#225;c l&#225;i&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Mercedes C200&amp;nbsp;&lt;/strong&gt;tự h&#224;o với khối động cơ dung t&#237;ch 2.0 l&#237;t, 4 xi-lanh thẳng h&#224;ng, phun xăng trực tiếp, t&#237;ch hợp c&#244;ng nghệ tăng &#225;p để tạo ra những th&#244;ng số ấn tượng: c&#244;ng suất tối đa 184 m&#227; lực tại 5500 v&#242;ng/ph&#250;t v&#224; momen xoắn cực đại 300 Nm tại dải v&#242;ng tua 1200 &amp;ndash; 4000 v&#242;ng/ph&#250;t.&lt;/p&gt;

&lt;p&gt;Với sức mạnh đ&#243;, chủ nh&#226;n c&#243; thể nhấn ga để trải nghiệm khả năng tăng tốc từ 0-100 km/h (s) chỉ trong 7.3 gi&#226;y, v&#224; đ&#243; thực sự l&#224; một cảm gi&#225;c đầy phấn kh&#237;ch. Sự mượt m&#224; thể hiện rất r&#245;, hầu như kh&#244;ng c&#243; bất k&#236; giật cục n&#224;o khi xe chuyển số nhờ hộp số Tự động 9 cấp 9G-TRONIC Plus được thiết kế tối ưu.&lt;/p&gt;
', NULL, 1, 10, NULL, N'1.jpg', CAST(N'2018-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [DungTichXiLanh], [MaMau], [LoaiHopSo], [MaXX], [MaLoaiXe], [MaTH], [CongXuat], [ChoNgoi], [GiaBan], [GiamGia], [MomenXoan], [KieuTruyenDong], [TrongLuong], [ChieuCao], [ChieuRong], [ChieuDai], [TangAp], [MamVanh], [PhanhTruoc], [PhanhSau], [KichCoLopT], [KichCoLopS], [HeThongTreoTruoc], [HeThongTreoSau], [KhoangSangGam], [HeThongDenT], [HeThongDenS], [HeThongLoa], [GuongChieuHau], [ChongBoABS], [MoTa], [NoiDung], [DanhGia], [TinhTrang], [SoLuong], [NamSX], [Anh], [TimeCreate]) VALUES (N'XE00002', N'2018 TOYOTA COROLLA ALTIS 1.8G CVT', N'Xăng 1.8L', 1, NULL, 2, 1, 1, N'138 Hp @6,400 vòng/phút', 4, 967000000.0000, 0, N'173 Nm @4,000 vòng/phút', N'2WD(Cầu trước)', 1250, 0, 0, 0, 0, N'Hợp kim 16"', NULL, NULL, N'205/55R16', N'205/55R16', N'Bán độc lập, cơ cấu dầm xoắn (torsion beam) và thanh cân bằng', N'Độc lập, cơ cấu thanh chống MacPherson và thanh cân bằng', 130, NULL, NULL, N'', 0, 0, N'TOYOTA ALTIS 2018 DÁNG THỂ THAO THẬT BẢNH BAO Với Diện mạo bảnh bao chất lừ từ ngoài vào trong, là người cộng sự đáng tự hào của chủ nhân. Corolla Altis xứng đáng là thủ lĩnh những cung đường, là lựa chọn hoàn hảo để thể hiện chất riêng lẫn phục vụ công việc hiệu quả', N'&lt;p&gt;&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Toyota Altis 1.8G CVT 2018&amp;lt;/strong&amp;gt;&amp;amp;nbsp;l&#224; phi&#234;n bản tầm trung trong 5 phi&#234;n bản của&amp;amp;nbsp;&amp;lt;a href=&amp;quot;https://muaxegiatot.vn/san-pham/xe-toyota-altis&amp;quot; target=&amp;quot;_blank&amp;quot;&amp;gt;&amp;lt;strong&amp;gt;Altis 2018&amp;lt;/strong&amp;gt;&amp;lt;/a&amp;gt;, sở hữu khả năng vận h&#224;nh mạnh mẽ của động cơ 1.8L v&#224; hộp số tự động v&#244; cấp song mức tiện nghi kh&#244;ng bằng bản 2.0V, mặc d&#249; vậy, lần ra mắt n&#224;y cũng c&#243; những cải tiến đ&#225;ng kể.&amp;lt;/p&amp;gt; &amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Ngoại thất xe Altis 1.8G CVT&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt; &amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Toyota Altis 1.8G CVT 2018&amp;lt;/strong&amp;gt;&amp;amp;nbsp;nay đ&#227; sở hữu kiểu d&#225;ng thể thao v&#224; năng động hơn nhưng vẫn giữ được vẻ đĩnh đạc vốn c&#243;. Với k&#237;ch thước tổng thể l&#224; 4620 x 1775 x 1460 mm, Altis 1.8G CVT kh&#244;ng qu&#225; to lớn v&#224; mang đến lợi thế khi di chuyển trong c&#225;c đ&#244; thị đ&#244;ng đ&#250;c.&amp;lt;/p&amp;gt; &amp;lt;p&amp;gt;Mẫu xe n&#224;y cũng sở hữu những đường n&#233;t sắc sảo v&#224; trau chuốt đến từng chi tiết của thế hệ mới. Phần đầu xe&amp;amp;nbsp;&amp;lt;strong&amp;gt;Toyota Atis 1.8G CVT&amp;lt;/strong&amp;gt;&amp;amp;nbsp;mang thiết kế sắc sảo v&#224; thể thao hơn, lưới tản nhiệt tr&#234;n đ&#227; thanh mảnh hơn với 1 nan mạ crom, liền mạch với cụm đ&#232;n pha tạo n&#234;n vẻ sang trọng v&#224; hiện đại. Cụm đ&#232;n pha chỉ được trang bị b&#243;ng Halogen phản chiếu đa chiều v&#224; kh&#244;ng c&#243; chức năng đặc biệt như c&#225;c bản cao cấp.&amp;lt;/p&amp;gt; &amp;lt;p&amp;gt;Ph&#237;a dưới, hốc gi&#243; cỡ lớn kết hợp c&#249;ng đ&#232;n sương m&#249; mang đến cảm gi&#225;c hầm hố. Đặc biệt l&#224; hốc gi&#243; phụ 2 b&#234;n gi&#250;p cho xe mang hơi thở thể thao hơn. Đ&#232;n sương m&#249; hiện đại g&#243;p phần đ&#225;ng kể cải thiện khả năng quan s&#225;t trong điều kiện thời tiết xấu.&amp;lt;/p&amp;gt; &amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;&lt;/p&gt;
', NULL, 0, 5, NULL, N'Normal-2018-Toyota-Corolla-Altis-1-8G-CVT-20180311170827716.jpg', CAST(N'2018-04-05T12:28:35.010' AS DateTime))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [DungTichXiLanh], [MaMau], [LoaiHopSo], [MaXX], [MaLoaiXe], [MaTH], [CongXuat], [ChoNgoi], [GiaBan], [GiamGia], [MomenXoan], [KieuTruyenDong], [TrongLuong], [ChieuCao], [ChieuRong], [ChieuDai], [TangAp], [MamVanh], [PhanhTruoc], [PhanhSau], [KichCoLopT], [KichCoLopS], [HeThongTreoTruoc], [HeThongTreoSau], [KhoangSangGam], [HeThongDenT], [HeThongDenS], [HeThongLoa], [GuongChieuHau], [ChongBoABS], [MoTa], [NoiDung], [DanhGia], [TinhTrang], [SoLuong], [NamSX], [Anh], [TimeCreate]) VALUES (N'XE00003', N'2018 NISSAN SUNNY XV 1.5', N' Xăng 1.5L', 1, NULL, 2, 1, 10, N'99 Hp @6,000 vòng/phút', 4, 493000000.0000, 5, N'134 Nm @4,000 vòng/phút', N'2WD(Cầu trước)', 1059, 1505, 1695, 4425, 0, N'Hợp kim 15''''', NULL, NULL, N'185/65R15', N'185/65R15', N'Độc lập, cơ cấu thanh chống MacPherson và thanh cân bằng', N'Bán độc lập, cơ cấu dầm xoắn (torsion beam) và thanh cân bằng', 150, NULL, NULL, N'', 1, 1, N' Chiếc sedan bán chạy nhất toàn cầu của Nissan. Giá cả cạnh tranh nhất trong phân khúc hạng B với giá từ 493tr ', N'&lt;p&gt;08 L&#253; do lựa chọn&amp;nbsp;&lt;a href=&quot;https://otos.vn/ban-xe-nissan-sunny&quot; target=&quot;_blank&quot;&gt;Nissan Sunny&lt;/a&gt;&amp;nbsp;cho c&#244;ng việc v&#224; gia đ&#236;nh với nhưng ưu điểm sau:&amp;nbsp;&lt;br /&gt;
1. Chiếc sedan b&#225;n chạy nhất to&#224;n cầu của&amp;nbsp;&lt;a href=&quot;https://otos.vn/ban-xe-nissan&quot; target=&quot;_blank&quot;&gt;Nissan&lt;/a&gt;&amp;nbsp;&lt;br /&gt;
2. Gi&#225; cả cạnh tranh nhất trong ph&#226;n kh&#250;c hạng B với gi&#225; từ 493tr&amp;nbsp;&lt;br /&gt;
3. Động cơ nguy&#234;n khối nhập khẩu với 100% linh kiện v&#224; được lắp đặt tại nh&#224; m&#225;y TCIE Việt Nam&amp;nbsp;&lt;br /&gt;
4. Kh&#244;ng gian trong xe thoải m&#225;i với để ch&#226;n hai h&#224;ng ghế, cốp rộng 490 l&#237;t mang lại nhiều tiện &#237;ch&amp;nbsp;&lt;br /&gt;
5. Vận h&#224;nh &#234;m &#225;i, nhẹ nh&#224;ng với cảm gi&#225;c gi&#225;c l&#225;i tuyệt vời chỉ c&#243; tr&#234;n&amp;nbsp;&lt;a href=&quot;https://otos.vn/ban-xe-nissan-sunny&quot; target=&quot;_blank&quot;&gt;Nissan Sunny&lt;/a&gt;&amp;nbsp;&lt;br /&gt;
6. Bền bỉ với thế hệ thứ 10 được&amp;nbsp;&lt;a href=&quot;https://otos.vn/ban-xe-nissan&quot; target=&quot;_blank&quot;&gt;Nissan&lt;/a&gt;&amp;nbsp;nghi&#234;n cứu v&#224; ph&#225;t triển&amp;nbsp;&lt;br /&gt;
7. An to&#224;n cao với th&#226;n vỏ khung gầm cấu tr&#250;c ZoneBody, hỗ trợ ABS,EBD,BA ...&amp;nbsp;&lt;br /&gt;
8. Khoảng s&#225;ng gầm xe 15 cm đ&#225;p ứng rất tốt c&#225;c cung đường.&amp;nbsp;&lt;/p&gt;
', NULL, 1, 4, NULL, N'Normal-2018-Nissan-Sunny-XV-1-5-20180405031226264.jpg', CAST(N'2018-04-05T12:34:06.730' AS DateTime))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [DungTichXiLanh], [MaMau], [LoaiHopSo], [MaXX], [MaLoaiXe], [MaTH], [CongXuat], [ChoNgoi], [GiaBan], [GiamGia], [MomenXoan], [KieuTruyenDong], [TrongLuong], [ChieuCao], [ChieuRong], [ChieuDai], [TangAp], [MamVanh], [PhanhTruoc], [PhanhSau], [KichCoLopT], [KichCoLopS], [HeThongTreoTruoc], [HeThongTreoSau], [KhoangSangGam], [HeThongDenT], [HeThongDenS], [HeThongLoa], [GuongChieuHau], [ChongBoABS], [MoTa], [NoiDung], [DanhGia], [TinhTrang], [SoLuong], [NamSX], [Anh], [TimeCreate]) VALUES (N'XE00004', N'2018 TOYOTA INNOVA 2.0E', N'Xăng 2.0L', 4, NULL, 2, 8, 1, N'137 Hp @5,600 vòng/phút', 7, 160000000.0000, 0, N'183 Nm @4,000 vòng/phút', N'2WD(Cầu sau)', 1700, 1795, 1830, 4735, 0, N'Hợp kim 16"', NULL, NULL, N'205/65R16', N'205/65R16', N'Tay đòn kép, lò xo cuộn và thanh cân bằng', N'Liên kết 4 điểm, lò xo cuộn và tay đòn bên', 178, NULL, NULL, N'', 1, 1, N'Toyota Innova 2.0E là phiên bản bán tốt nhất dòng xe Toyota Innova xe được trang bị hộp số sàn cho khả năng sang số chủ động và đặc biệt là hộp số tiết kiệm nhiên liệu tốt nhất rất phù hợp cho khách hàng yêu thích hộp số sàn và khách hàng kinh doanh du lịch và vận tải hành khách.', N'&lt;p&gt;&lt;a href=&quot;http://ototoyota.vn/toyota-innova/toyota-innova-2-0-e&quot;&gt;&lt;strong&gt;Toyota Innova 2.0E&lt;/strong&gt;&lt;/a&gt;&amp;nbsp;l&#224; phi&#234;n bản b&#225;n tốt nhất d&#242;ng xe&amp;nbsp;&lt;a href=&quot;http://ototoyota.vn/toyota-innova&quot;&gt;Toyota Innova&lt;/a&gt;&amp;nbsp;xe được trang bị&amp;nbsp;&lt;em&gt;hộp số s&#224;n&lt;/em&gt;cho khả năng sang số chủ động v&#224; đặc biệt l&#224; hộp số tiết kiệm nhi&#234;n liệu tốt nhất rất ph&#249; hợp cho kh&#225;ch h&#224;ng y&#234;u th&#237;ch&amp;nbsp;&lt;em&gt;hộp số s&#224;n&lt;/em&gt;&amp;nbsp;v&#224; kh&#225;ch h&#224;ng kinh doanh du lịch v&#224; vận tải h&#224;nh kh&#225;ch.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;&lt;a href=&quot;http://ototoyota.vn/toyota-innova&quot; name=&quot;Toyota Innova&quot;&gt;Toyota Innova&lt;/a&gt;&amp;nbsp;&lt;/strong&gt;l&#224; d&#242;ng xe bẩy chỗ b&#236;nh d&#226;n b&#225;n chạy nhất của&amp;nbsp;&lt;strong&gt;&lt;a href=&quot;http://ototoyota.vn/toyota&quot; name=&quot;Xe Toyota&quot;&gt;Toyota&lt;/a&gt;&amp;nbsp;&lt;/strong&gt;n&#243;i chung v&#224; c&#225;c d&#242;ng &#244; t&#244; tr&#234;n thị trường&amp;nbsp;&lt;strong&gt;Việt Nam&lt;/strong&gt;&amp;nbsp;n&#243;i ri&#234;ng.&amp;nbsp;&lt;strong&gt;&lt;em&gt;Innova số s&#224;n&lt;/em&gt;&amp;nbsp;&lt;/strong&gt;l&#224; phi&#234;n bản rất ph&#249; hợp cho kh&#225;ch h&#224;ng y&#234;u th&#237;ch hộp số s&#224;n v&#224; kh&#225;ch h&#224;ng kinh doanh vận tải h&#224;nh kh&#225;ch&lt;/p&gt;

&lt;p&gt;&lt;a href=&quot;http://ototoyota.vn/toyota&quot; name=&quot;Xe Toyota&quot;&gt;&lt;strong&gt;Toyota Innova&lt;/strong&gt;&lt;/a&gt;&amp;nbsp;lu&#244;n thay đổi để khẳng định vị thế. Đ&#227; l&#224; d&#242;ng xe b&#225;n chạy nhất thị trường trong ph&#226;n kh&#250;c xe 07 chỗ từ l&#226;u nhưng&amp;nbsp;&lt;a href=&quot;http://ototoyota.vn/&quot; name=&quot;Toyota Việt Nam&quot;&gt;&lt;strong&gt;Toyota Việt Nam&lt;/strong&gt;&lt;/a&gt;&amp;nbsp;kh&#244;ng ngủ qu&#234;n tr&#234;n chiến thắng m&#224; lu&#244;n nghi&#234;n cứu thay đổi l&#224;m thương hiệu,&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;ng&#224;y c&#224;ng d&#224;nh được sự tin tưởng của người sử dụng.&lt;/p&gt;

&lt;p&gt;&lt;em&gt;&lt;strong&gt;Toyota Innova 2018&lt;/strong&gt;&lt;/em&gt;&amp;nbsp;đều sử dụng động cơ&amp;nbsp;xăng,&amp;nbsp;&lt;em&gt;VVT-i k&#233;p&lt;/em&gt;, 4 xy lanh thẳng h&#224;ng, 16 van&amp;nbsp; đạt&amp;nbsp;ti&#234;u chuẩn kh&#237; thải&amp;nbsp;&lt;em&gt;Euro 4&lt;/em&gt;. Sử dụng hộp số s&#224;n&amp;nbsp;Cho mức ti&#234;u hao nhi&#234;n liệu thấp v&#224; chủ động sang số.&lt;/p&gt;

&lt;p&gt;Với ưu thế của&amp;nbsp;&lt;em&gt;hộp số s&#224;n&lt;/em&gt;&amp;nbsp;gi&#250;p xe chủ động tăng tốc vượt dốc chủ động v&#224; tiết kiệm nhi&#234;n liệu hơn.&lt;/p&gt;
', NULL, 1, 2, NULL, N'Normal-2018-Toyota-Innova-2-0E-20180311165321886.jpg', CAST(N'2018-04-05T12:39:00.833' AS DateTime))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [DungTichXiLanh], [MaMau], [LoaiHopSo], [MaXX], [MaLoaiXe], [MaTH], [CongXuat], [ChoNgoi], [GiaBan], [GiamGia], [MomenXoan], [KieuTruyenDong], [TrongLuong], [ChieuCao], [ChieuRong], [ChieuDai], [TangAp], [MamVanh], [PhanhTruoc], [PhanhSau], [KichCoLopT], [KichCoLopS], [HeThongTreoTruoc], [HeThongTreoSau], [KhoangSangGam], [HeThongDenT], [HeThongDenS], [HeThongLoa], [GuongChieuHau], [ChongBoABS], [MoTa], [NoiDung], [DanhGia], [TinhTrang], [SoLuong], [NamSX], [Anh], [TimeCreate]) VALUES (N'XE00005', N'2018 HYUNDAI TUCSON 2.0 XĂNG', N'Xăng 2.0L', 1, NULL, 2, 4, 6, N'130 Hp @6,300 vòng/phút', 7, 828000000.0000, 15, N'156 Nm @4,850 vòng/phút', N'2WD(Cầu trước)', 1078, 1520, 1800, 4570, 0, N'18', NULL, NULL, N'195/65R18', N'18', N'McPherson', N'Bán độc lập, cơ cấu dầm xoắn (torsion beam) và thanh cân bằng', 167, NULL, NULL, N'', 1, 1, N'sản xuất năm 2018. Xe thuộc phân khúc SUV/Crossover, 5 chỗ ngồi, 5 cửa, động cơ xăng 2L, không tăng áp, sử dụng hộp số tự động 6 cấp với hệ dẫn động cầu trước.   Hệ thống an toàn bao gồm cảm biến lùi, túi khí người lái, túi khí khách ngồi phía trước, chống bó cứng phanh (ABS), phân bố lực phanh điện tử (EBD), trợ lực phanh khẩn cấp (EBA), điều khiển hành trình. ', N'&lt;p&gt;&amp;raquo;&amp;nbsp;Năng lượng hứng khởi cho từng gi&#226;y ph&#250;t gi&#226;y cầm l&#225;i&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;Hyundai Tucson thế hệ ho&#224;n to&#224;n mới mang ngoại h&#236;nh của 1 chiếc SUV lịch l&#227;m nhưng kh&#244;ng k&#233;m phần mạnh mẽ, đem lại cho người l&#225;i những trải nghiệm l&#225;i thực sự tuyệt vời, đủ khả năng đ&#225;p ứng những y&#234;u cầu vận h&#224;nh kh&#243; khăn nhất.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;raquo;&amp;nbsp;Thiết kế đậm chất thể thao&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;Hyundai Tucson sở hữu cụm đ&#232;n pha được trang bị c&#244;ng nghệ LED sắc cạnh vuốt từ cắp lưới tản nhiệt đặc trưng h&#236;nh lục gi&#225;c sang hai b&#234;n, tạo n&#234;n d&#225;ng vẻ đậm chất thể thao đầy c&#225; t&#237;nh.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;raquo;&amp;nbsp;Tinh hoa đi&#234;u khắc d&#242;ng chảy&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;Hyundai Tucson thế hệ ho&#224;n to&#224;n mới mang ngoại h&#236;nh của 1 chiếc SUV lịch l&#227;m nhưng kh&#244;ng k&#233;m phần mạnh mẽ, đem lại cho người l&#225;i những trải nghiệm l&#225;i thực sự tuyệt vời, đủ khả năng đ&#225;p ứng những y&#234;u cầu vận h&#224;nh kh&#243; khăn nhất.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;Hyundai Tucson sở hữu thiết kế tổng thể c&#226;n đối với tư tưởng gi&#250;p người l&#225;i c&#249;ng chiếc xe h&#242;a nhập c&#249;ng thi&#234;n nhi&#234;n.&lt;/p&gt;
', NULL, 1, 3, NULL, N'Normal-2018-Hyundai-Tucson-2-0-xang-ban-dac-biet-khuyen-mai-den-102-Tr-20180403133439696.jpg', CAST(N'2018-04-05T12:43:25.873' AS DateTime))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [DungTichXiLanh], [MaMau], [LoaiHopSo], [MaXX], [MaLoaiXe], [MaTH], [CongXuat], [ChoNgoi], [GiaBan], [GiamGia], [MomenXoan], [KieuTruyenDong], [TrongLuong], [ChieuCao], [ChieuRong], [ChieuDai], [TangAp], [MamVanh], [PhanhTruoc], [PhanhSau], [KichCoLopT], [KichCoLopS], [HeThongTreoTruoc], [HeThongTreoSau], [KhoangSangGam], [HeThongDenT], [HeThongDenS], [HeThongLoa], [GuongChieuHau], [ChongBoABS], [MoTa], [NoiDung], [DanhGia], [TinhTrang], [SoLuong], [NamSX], [Anh], [TimeCreate]) VALUES (N'XE00006', N'2017 CHEVROLET ORLANDO LT 1.8', N' Xăng 1.8L', 1, NULL, 2, 8, 7, N'', 7, 639000000.0000, 0, N'', N'2WD(Cầu trước)', 0, 0, 0, 0, 0, N'', NULL, NULL, N'', N'', N'225/50R17', N'225/50R17', 0, NULL, NULL, N'', 1, 1, N'Nằm cùng phân khúc với đối thủ rất mạnh Toyota Innova 2.0 E MT, gần như thống trị trong dòng xe đa dụng MPV tại thị trường Việt Nam. Nhưng Chevrolet Orlando LT 1.8 MT vẫn có những lợi thế riêng về kiểu dáng với thiết kế mạnh mẽ, hiện đại và đặc biệt là không đụng hàng, về tính năng an toàn xe nổi bật hơn hẳn đối thủ khi được trang bị hệ thống cân bằng điện tử (ESC)... còn giá bán, Orlando LT có mức giá hấp dẫn hơn Innova 2.0E MT đến 150 triệu đồng.', N'&lt;p&gt;&lt;em&gt;&lt;strong&gt;&lt;a href=&quot;https://giaotosaigon.com/gia-xe-chevrolet-orlando&quot;&gt;Chevrolet Orlando&lt;/a&gt;&lt;/strong&gt;&lt;/em&gt;&amp;nbsp;sở hữu những tiện nghi v&#224; c&#244;ng nghệ th&#244;ng minh vượt trội trong ph&#226;n kh&#250;c, ho&#224;n hảo cho phong c&#225;ch sống hiện đại.&lt;/p&gt;

&lt;p&gt;Bề ngo&#224;i với thiết kế khỏe khoắn, cứng c&#225;p, trẻ trung nhưng cũng đồng thời mang lại cho kh&#225;ch h&#224;ng cảm gi&#225;c lịch l&#227;m, sang&amp;nbsp; trọng của mẫu xe đa dụng d&#224;nh cho gia định hoặc kinh doanh dịch vụ.&lt;/p&gt;

&lt;p&gt;AN TO&#192;N SỐ 1 khung xe c&#243; kết cấu vững chắc khi sử dụng th&#233;p cường lực ở những vị tr&#237; trọng yếu v&#224; c&#225;c thanh tăng cứng đảm bảo sự an to&#224;n vượt trội.&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;em&gt;&lt;a href=&quot;https://giaotosaigon.com/gia-xe-chevrolet-orlando&quot;&gt;Chevrolet Orlando 1.8 LT&lt;/a&gt;&lt;/em&gt;&amp;nbsp;mới được thiết kế trở th&#224;nh chiếc xe an to&#224;n vượt trội cho bạn v&#224; những người th&#226;n y&#234;u nhờ c&#225;c t&#237;nh năng an to&#224;n th&#244;ng minh chủ động v&#224; thụ động.&lt;/p&gt;

&lt;p&gt;Khung xe sử dụng th&#233;p cường lực ở những vị tr&#237; trọng yếu gi&#250;p hấp thụ lực tối ưu khi xảy ra va chạm,&amp;nbsp;&lt;/p&gt;

&lt;p&gt;Khoang kh&#225;ch rộng r&#227;i Thiết kế linh hoạt ở h&#224;ng ghế 2-3 c&#243; thể chở đến 7 người hoặc chở h&#224;ng k&#237;ch thước lớn nhất ph&#226;n kh&#250;c, rất thuận tiện cho việc di chuyển đi xa.&lt;/p&gt;

&lt;p&gt;H&#224;ng ghế thứ hai v&#224; thứ ba c&#243; thể gập đồng thời hoặc ri&#234;ng rẽ, tạo ra kh&#244;ng gian lớn để chứa h&#224;ng ho&#225; hay vật dụng cồng kềnh. Thậm ch&#237; khi gập lại tạo th&#224;nh 1 mặt phẳng, khoang h&#224;nh kh&#225;ch c&#242;n c&#243; thể biến th&#224;nh một chiếc giường di động cỡ lớn.&lt;/p&gt;

&lt;p&gt;Hai h&#224;ng ghế ph&#237;a sau rất linh hoạt gập được 16 kiểu với c&#225;c chốt gập, mở nhẹ nh&#224;ng, Chevrolet Orlando gi&#250;p bạn thoải m&#225;i sắp xếp chỗ cho gia đ&#236;nh, bạn b&#232;, mang th&#234;m nhiều h&#224;nh l&#253;, hay c&#242;n c&#243; thể đưa cả th&#250; cưng đi c&#249;ng trong những chuyến h&#224;nh tr&#236;nh của m&#236;nh.&amp;nbsp;&lt;/p&gt;
', NULL, 0, 6, NULL, N'Normal-2017-Chevrolet-Orlando-LT-1-8-20180405034056064.jpg', CAST(N'2018-04-05T12:47:41.700' AS DateTime))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [DungTichXiLanh], [MaMau], [LoaiHopSo], [MaXX], [MaLoaiXe], [MaTH], [CongXuat], [ChoNgoi], [GiaBan], [GiamGia], [MomenXoan], [KieuTruyenDong], [TrongLuong], [ChieuCao], [ChieuRong], [ChieuDai], [TangAp], [MamVanh], [PhanhTruoc], [PhanhSau], [KichCoLopT], [KichCoLopS], [HeThongTreoTruoc], [HeThongTreoSau], [KhoangSangGam], [HeThongDenT], [HeThongDenS], [HeThongLoa], [GuongChieuHau], [ChongBoABS], [MoTa], [NoiDung], [DanhGia], [TinhTrang], [SoLuong], [NamSX], [Anh], [TimeCreate]) VALUES (N'XE00007', N'2018 KIA MORNING S AT', N'Xăng 1.25L', 3, NULL, 2, 5, 4, N'85', 5, 639000000.0000, 5, N'', N'', 0, 0, 0, 0, 0, N'', NULL, NULL, N'', N'', N'', N'', 0, NULL, NULL, N'', 0, 0, N'Mới đây, THACO Trường Hải vừa công bố giá bán lẻ mới cho các mẫu xe KIA và Mazda. Cụ thể, từ ngày 21/11 đến hết 31/12/2017, giá bán được điều chỉnh giảm từ 10-20 triệu đồng tùy từng phiên bản, cao nhất là 40 triệu. Đáng chú ý trong đợt “sale off” này, dòng xe cỡ nhỏ Morning được bổ sung thêm phiên bản cao cấp mới có tên gọi Morning S.', N'&lt;p&gt;&amp;lt;p&amp;gt;Mới đ&#226;y, THACO Trường Hải vừa c&#244;ng bố gi&#225; b&#225;n lẻ mới cho c&#225;c mẫu xe&amp;amp;nbsp;&amp;lt;a href=&amp;quot;https://www.danhgiaxe.com/kia&amp;quot;&amp;gt;KIA&amp;amp;nbsp;&amp;lt;/a&amp;gt;v&#224;&amp;lt;a href=&amp;quot;https://www.danhgiaxe.com/mazda&amp;quot;&amp;gt;&amp;amp;nbsp;Mazda&amp;lt;/a&amp;gt;. Cụ thể, từ ng&#224;y 21/11 đến hết 31/12/2017, gi&#225; b&#225;n được điều chỉnh giảm từ 10-20 triệu đồng t&#249;y từng phi&#234;n bản, cao nhất l&#224; 40 triệu. Đ&#225;ng ch&#250; &#253; trong đợt &amp;amp;ldquo;sale off&amp;amp;rdquo; n&#224;y, d&#242;ng xe cỡ nhỏ&amp;lt;a href=&amp;quot;https://www.danhgiaxe.com/kia-morning-picanto&amp;quot;&amp;gt;&amp;amp;nbsp;Morning&amp;lt;/a&amp;gt;được bổ sung th&#234;m phi&#234;n bản cao cấp mới c&#243; t&#234;n gọi Morning S.&amp;lt;/p&amp;gt; &amp;lt;p&amp;gt;Theo đ&#243;, Morning S sẽ thay thế mẫu Si, trở th&#224;nh phi&#234;n bản cao cấp nhất của KIA Morning tại thị trường Việt Nam. Xe c&#243; duy nhất 1 phi&#234;n bản số tự động, gi&#225; b&#225;n 394 triệu đồng (đắt hơn Si 15 triệu). Từ 1/1/2018, gi&#225; sẽ giảm c&#242;n 390 triệu nhờ hưởng ưu đ&#227;i về thuế cho c&#225;c d&#242;ng xe dung t&#237;ch dưới 2.0L.&amp;lt;/p&amp;gt; &amp;lt;p&amp;gt;Ngoại thất&amp;lt;/p&amp;gt; &amp;lt;p&amp;gt;So với phi&#234;n bản Si, KIA Morning S c&#243; sự thay đổi nhẹ về thiết kế. Ở ph&#237;a trước, điểm kh&#225;c biệt nhất l&#224; mặt ca-lăng được l&#224;m mới với lưới tản nhiệt v&#224; hốc đ&#232;n sương m&#249; t&#225;ch ri&#234;ng. Tr&#234;n bản Si l&#224; dạng h&#236;nh thang ngược t&#237;ch hợp hai đ&#232;n dạng cầu.&amp;lt;/p&amp;gt; &amp;lt;p&amp;gt;Ngo&#224;i ra, c&#225;c chi tiết kh&#225;c được giữ nguy&#234;n như lưới tản nhiệt h&#236;nh mũi hổ đặc trưng, đ&#232;n pha tự động kiểu projector v&#224; dải LED chạy ban ng&#224;y.&amp;lt;/p&amp;gt; &amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt; &amp;lt;p&amp;gt;Xe vẫn sử dụng bộ lazang hợp kim 15-inch dạng xo&#225;y, tay nắm cửa mạ chrome. Gương chiếu hậu được sơn đen, c&#243; t&#237;nh năng gập/chỉnh điện v&#224; t&#237;ch hợp đ&#232;n b&#225;o rẽ.&amp;lt;/p&amp;gt;&lt;/p&gt;
', NULL, 0, 1, NULL, N'Normal-2018-KIA-Morning-S-AT-20180405043254930.jpg', CAST(N'2018-04-05T12:50:05.497' AS DateTime))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [DungTichXiLanh], [MaMau], [LoaiHopSo], [MaXX], [MaLoaiXe], [MaTH], [CongXuat], [ChoNgoi], [GiaBan], [GiamGia], [MomenXoan], [KieuTruyenDong], [TrongLuong], [ChieuCao], [ChieuRong], [ChieuDai], [TangAp], [MamVanh], [PhanhTruoc], [PhanhSau], [KichCoLopT], [KichCoLopS], [HeThongTreoTruoc], [HeThongTreoSau], [KhoangSangGam], [HeThongDenT], [HeThongDenS], [HeThongLoa], [GuongChieuHau], [ChongBoABS], [MoTa], [NoiDung], [DanhGia], [TinhTrang], [SoLuong], [NamSX], [Anh], [TimeCreate]) VALUES (N'XE00008', N'2018 MAZDA CX-5 2.5L FWD', N'Xăng 2.5L', 1, NULL, 1, 4, 4, N'188 Hp @5,700 vòng/phút', 5, 999000000.0000, 0, N'251 Nm @3,250 vòng/phút', N'2WD(Cầu trước)', 1570, 1680, 1840, 4550, 0, N'Hợp kim 19''''', NULL, NULL, N'225/55R19', N'225/55R19', N'', N'', 200, NULL, NULL, N'', 0, 0, N'Cuối năm 2011, Mazda CX-5 chính thức ra mắt trên thế giới, trở thành mẫu xe đầu tiên mang ngôn ngữ thiết kế mới KODO - Soul of Motion. Đồng thời, CX-5 còn tiên phong cho công nghệ SkyActiv với động cơ xăng phun trực tiếp. Ngay lập tức, chiếc crossover đã “làm mưa làm gió” trên thị trường. Doanh số sau 1 năm ra mắt đạt 87.819 chiếc và lên đến hơn 1 triệu xe vào năm 2017.', N'&lt;p&gt;Cuối năm 2011,&amp;nbsp;&lt;a href=&quot;https://www.danhgiaxe.com/mazda-cx-5&quot;&gt;Mazda CX-5&lt;/a&gt;&amp;nbsp;ch&#237;nh thức ra mắt tr&#234;n thế giới, trở th&#224;nh mẫu xe đầu ti&#234;n mang ng&#244;n ngữ thiết kế mới KODO - Soul of Motion. Đồng thời, CX-5 c&#242;n ti&#234;n phong cho c&#244;ng nghệ SkyActiv với động cơ xăng phun trực tiếp. Ngay lập tức, chiếc crossover đ&#227; &amp;ldquo;l&#224;m mưa l&#224;m gi&#243;&amp;rdquo; tr&#234;n thị trường. Doanh số sau 1 năm ra mắt đạt 87.819 chiếc v&#224; l&#234;n đến hơn 1 triệu xe v&#224;o năm 2017.&lt;/p&gt;

&lt;p&gt;Tại Việt Nam, những chiếc CX-5 đầu ti&#234;n được Vina Mazda nhập khẩu từ Nhật Bản v&#224;o giữa th&#225;ng 4/2012. Gi&#225; b&#225;n của xe l&#250;c đ&#243; l&#224; 1,185 tỷ đồng, ngang ngửa Hyundai SantaFe. Một năm sau, CX-5 trở th&#224;nh mẫu xe c&#243; tốc độ tăng trưởng nhanh nhất, lu&#244;n nằm trong TOP 5 xe b&#225;n chạy của VAMA. Đầu năm 2017, số lượng xe&amp;nbsp; b&#225;n ra tr&#234;n to&#224;n l&#227;nh thổ Việt Nam c&#225;n mốc 20.000 chiếc.&lt;/p&gt;

&lt;p&gt;Tiếp nối th&#224;nh c&#244;ng ấy, giữa th&#225;ng 11 vừa qua, THACO đ&#227; ch&#237;nh thức giới thiệu Mazda CX-5 2018 tới người ti&#234;u d&#249;ng Việt. Bước sang thế hệ thứ 2, xe c&#243; bước &amp;ldquo;chuyển m&#236;nh&amp;rdquo; r&#245; rệt từ thiết kế, trang bị tiện nghi đến t&#237;nh năng an to&#224;n.&lt;/p&gt;

&lt;p&gt;Hiện tại, Mazda CX-5 2018 được ph&#226;n phối với 3 phi&#234;n bản như sau:&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Mazda CX-5 AT FWD 2.0L: 879 triệu đồng&lt;br /&gt;
Mazda CX-5 AT FWD 2.5L: 939 triệu đồng&lt;br /&gt;
Mazda CX-5 AT AWD 2.5L: 989 triệu đồng&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;So với c&#225;c đối thủ kh&#225;c, mức gi&#225; bản cao nhất của CX-5 hiện thấp hơn cả&amp;nbsp;&lt;a href=&quot;https://www.danhgiaxe.com/honda-cr-v&quot;&gt;Honda CR-V&lt;/a&gt;&amp;nbsp;Turbo (1,1 tỷ) v&#224;&amp;nbsp;&lt;a href=&quot;https://www.danhgiaxe.com/nissan-x-trail&quot;&gt;Nissan X-Trail&lt;/a&gt;&amp;nbsp;2.5 SV 4WD (1,113 tỷ). Đ&#226;y c&#243; thể n&#243;i l&#224; một lợi thế rất lớn cho CX-5 khi m&#224; gi&#225; b&#225;n lu&#244;n l&#224; yếu tố quan trọng khi quyết định mua xe.&lt;/p&gt;

&lt;p&gt;Trong b&#224;i viết h&#244;m nay, nh&#226;n vật ch&#237;nh sẽ l&#224; phi&#234;n bản 2.0L, ngo&#224;i ra, em cũng sẽ lồng gh&#233;p th&#244;ng tin về hai bản c&#242;n lại để c&#225;c b&#225;c c&#243; thể h&#236;nh dung r&#245; hơn về mẫu xe đang hot n&#224;y&lt;/p&gt;
', NULL, 0, 15, NULL, N'Normal-2018-Mazda-CX-5-2-5L-FWD-20180308080412445.jpg', CAST(N'2018-04-05T12:54:57.140' AS DateTime))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [DungTichXiLanh], [MaMau], [LoaiHopSo], [MaXX], [MaLoaiXe], [MaTH], [CongXuat], [ChoNgoi], [GiaBan], [GiamGia], [MomenXoan], [KieuTruyenDong], [TrongLuong], [ChieuCao], [ChieuRong], [ChieuDai], [TangAp], [MamVanh], [PhanhTruoc], [PhanhSau], [KichCoLopT], [KichCoLopS], [HeThongTreoTruoc], [HeThongTreoSau], [KhoangSangGam], [HeThongDenT], [HeThongDenS], [HeThongLoa], [GuongChieuHau], [ChongBoABS], [MoTa], [NoiDung], [DanhGia], [TinhTrang], [SoLuong], [NamSX], [Anh], [TimeCreate]) VALUES (N'XE00009', N'2015 FORD EVEREST XLT 4X2', N'Xăng 2.5L', 4, NULL, 2, 4, 2, N'141 Hp @3,500 vòng/phút', 7, 647000000.0000, 0, N'329 Nm @1,800 vòng/phút', N'2WD(Cầu sau)', 1896, 1826, 1788, 5062, 0, N'Hợp kim 18''''', NULL, NULL, N'255/60R18', N'255/60R18', N'Độc lập, cơ cấu tay đòn đôi (double wishbone) và thanh cân bằng', N'Phụ thuộc, cơ cấu trục cố định, đòn kéo (trailing) và thanh cân bằng', 210, NULL, NULL, N'', 1, 1, N'Everest XLT 4×2 MT phản ánh các chuẩn mực huyền thoại của Ford về kết cấu vững chắc, đảm bảo khả năng chinh phục mọi địa hình. Everest XLT 4×2 MT vượt xa các loại xe khác cùng dòng nhờ động cơ Duratorq TDCi 2.5L vô địch với công suất 143PS và mô men xoắn 330Nm. Ngoài ra, hệ thống khung gầm chắc chắn với kết cấu các dầm bậc thang gối lên nhau càng làm tăng thêm độ vững chãi của xe . Hãy cảm nhận sức mạnh đích thực khi tăng tốc và tạo dấu ấn riêng cả bạn.', N'&lt;p&gt;Everest XLT 4&amp;times;2 MT phản &#225;nh c&#225;c chuẩn mực huyền thoại của Ford về kết cấu vững chắc, đảm bảo khả năng chinh phục mọi địa h&#236;nh.&lt;/p&gt;

&lt;p&gt;&lt;a href=&quot;http://hanoiford.com.vn/xe-oto/everest-xlt-4x2-mt/&quot;&gt;Everest XLT 4&amp;times;2 MT&lt;/a&gt;&amp;nbsp;vượt xa c&#225;c loại xe kh&#225;c c&#249;ng d&#242;ng nhờ động cơ Duratorq TDCi 2.5L v&#244; địch với c&#244;ng suất 143PS v&#224; m&#244; men xoắn 330Nm. Ngo&#224;i ra, hệ thống khung gầm chắc chắn với kết cấu c&#225;c dầm bậc thang gối l&#234;n nhau c&#224;ng l&#224;m tăng th&#234;m độ vững ch&#227;i của xe . H&#227;y cảm nhận sức mạnh đ&#237;ch thực khi tăng tốc v&#224; tạo dấu ấn ri&#234;ng cả bạn.&lt;/p&gt;

&lt;p&gt;Everest XLT 4&amp;times;2 MT mới hiện đại đến từng chi tiết, từ cửa gi&#243; b&#234;n h&#244;ng xe sơn nhũ bạc đến kiểu d&#225;ng gương chiếu hậu t&#237;ch hợp đ&#232;n b&#225;o rẽ. Ngay khi vừa lăn b&#225;nh, bạn đ&#227; khiến mọi người phải ch&#250; &#253; với chiếc v&#224;nh xe 18&amp;Prime; kiểu thể thao ấn tượng. Kh&#244;ng chỉ thế, mọi kh&#225;ch h&#224;ng đều tận hưởng cảm gi&#225;c khoan kho&#225;i, thư gi&#227;n với hệ thống 3 d&#224;n cửa gi&#243;.&lt;/p&gt;

&lt;p&gt;Với&amp;nbsp;Everest XLT 4&amp;times;2 MT mới , bạn ho&#224;n to&#224;n y&#234;n t&#226;m v&#236; an to&#224;n l&#224; yếu tố lu&#244;n được đặt l&#234;n h&#224;ng đầu. Kết cấu khung xe cực k&#253; vững chắc c&#249;ng c&#225;c thanh gia cường chống lực va chạm ngang b&#234;n h&#244;ng, t&#250;i kh&#237; ph&#237;a trước v&#224; b&#234;n cạnh an to&#224;n cho người l&#225;i v&#224; h&#224;nh kh&#225;ch ph&#237;a trước, c&#249;ng hệ thống phanh ABS v&#224; hệ thống ph&#226;n bố lực phanh điện tử EBD đảm bảo tăng cường bảo vệ bạn từ mọi ph&#237;a.&lt;/p&gt;
', NULL, 1, 5, NULL, N'Normal-2015-Ford-Everest-XLT-4x2-20180405034809815.jpg', CAST(N'2018-04-05T13:02:41.257' AS DateTime))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [DungTichXiLanh], [MaMau], [LoaiHopSo], [MaXX], [MaLoaiXe], [MaTH], [CongXuat], [ChoNgoi], [GiaBan], [GiamGia], [MomenXoan], [KieuTruyenDong], [TrongLuong], [ChieuCao], [ChieuRong], [ChieuDai], [TangAp], [MamVanh], [PhanhTruoc], [PhanhSau], [KichCoLopT], [KichCoLopS], [HeThongTreoTruoc], [HeThongTreoSau], [KhoangSangGam], [HeThongDenT], [HeThongDenS], [HeThongLoa], [GuongChieuHau], [ChongBoABS], [MoTa], [NoiDung], [DanhGia], [TinhTrang], [SoLuong], [NamSX], [Anh], [TimeCreate]) VALUES (N'XE00010', N'2018 HYUNDAI ELANTRA SPORT', N'Xăng 1.6L', 1, NULL, 2, 1, 6, N'204 Hp @6,000 vòng/phút', 5, 729000000.0000, 0, N'245 Nm @1,500-4,500 vòng/phút', N'', 1245, 1450, 1800, 4570, 1, N'Hợp kim 17''''', NULL, NULL, N'205/55R17', N'205/55R17', N'McPherson', N'Hệ thống treo sau độc lập đa điểm', 150, NULL, NULL, N'', 1, 1, N'Elantra Sport là phiên bản thể thao của mẫu Hyundai Elantra đang được lắp ráp và phân phối tại Việt Nam. Chiếc xe sở hữu ngoại hình đẹp mắt dựa trên cảm hứng thiết kế “Điêu khắc dòng chảy 2.0” cùng lưới tản nhiệt lục giác mạ chrome quen thuộc đã được tinh chỉnh theo xu hướng thể thao với các đường gân cứng cáp và được chữ Turbo đỏ đặc trưng.', N'&lt;p&gt;Elantra Sport l&#224; phi&#234;n bản thể thao của mẫu Hyundai Elantra đang được lắp r&#225;p v&#224; ph&#226;n phối tại Việt Nam. Chiếc xe sở hữu ngoại h&#236;nh đẹp mắt dựa tr&#234;n cảm hứng thiết kế &amp;ldquo;Đi&#234;u khắc d&#242;ng chảy 2.0&amp;rdquo; c&#249;ng lưới tản nhiệt lục gi&#225;c mạ chrome quen thuộc đ&#227; được tinh chỉnh theo xu hướng thể thao với c&#225;c đường g&#226;n cứng c&#225;p v&#224; được chữ Turbo đỏ đặc trưng.&lt;/p&gt;

&lt;p&gt;Elantra Sport sở hữu cụm đ&#232;n trước Bi-Xenon tạo h&#236;nh ngũ gi&#225;c (cả đ&#232;n chiếu gần v&#224; đ&#232;n pha chung b&#243;ng projector c&#244;ng nghệ HID), kết hợp c&#249;ng dải đ&#232;n LED chạy ban ng&#224;y Daytime Running Light. Cụm đ&#232;n hậu thiết kế dạng LED 3D kiểu mới tạo h&#236;nh xương c&#225; đem đến hiệu quả hiển thị đẹp mắt.&lt;/p&gt;

&lt;p&gt;Xe vẫn sở hữu k&#237;ch thước D&#224;i x Rộng x Cao lần lượt l&#224; 4.570 x 1.800 x 1450 (mm), chiều d&#224;i cơ sở 2.700 (mm) c&#249;ng khoảng s&#225;ng gầm xe 150 (mm).&lt;/p&gt;

&lt;p&gt;Elantra Sport&amp;nbsp; mang phong c&#225;ch của 1 chiếc coupe 4 cửa thiết kế kh&#237; động học cao với hệ số cản gi&#243; 0,27Cd, phần mui xe được vuốt xuống thấp, nắp capo được tạo đường g&#226;n h&#250;t gi&#243; h&#236;nh chữ V v&#225;t dần về sau, cột A, B v&#224; C được kết nối liền mạch. Chiếc xe được trang bị body-kit thể thao (cản trước, bộ khuếch t&#225;n ph&#237;a sau, 2 b&#234;n sườn xe). Điểm nhấn b&#234;n ngo&#224;i c&#242;n được thể hiện th&#244;ng qua cặp ống xả k&#233;p crom s&#225;ng b&#243;ng v&#224; bộ lazang hợp kim 17 inch 5 chấu k&#233;p kim cương cắt.&lt;/p&gt;

&lt;p&gt;Kh&#244;ng gian nội thất của xe được trang bị ghế ngồi bọc da c&#249;ng chức năng sưởi ghế với c&#225;c lỗ tho&#225;t kh&#237; nhỏ. T&#244;ng m&#224;u nội thất đen chỉ đỏ, kết hợp c&#249;ng nhiều chi tiết nhựa dạng carbon v&#224; crom tạo n&#234;n kh&#244;ng gian đậm chất thể thao.&lt;/p&gt;

&lt;p&gt;Bảng taplo xe trang bị m&#224;n h&#236;nh AVN 7 inch cảm ứng t&#237;ch hợp camera l&#249;i c&#249;ng bản đồ dẫn đường ch&#237;nh h&#227;ng d&#224;nh ri&#234;ng cho thị trường Việt Nam kết hợp c&#249;ng hệ thống giải tr&#237; hỗ trợ Mp3/Aux/Usb/Bluetooth/Radio FM với 6 loa.&lt;/p&gt;

&lt;p&gt;Elantra Sport sở hữu những trang bị cao cấp: Ch&#236;a kh&#243;a th&#244;ng minh Smartkey c&#249;ng n&#250;t bấm khởi động Start/Stop engine, ghế l&#225;i chỉnh điện 10 hướng, v&#244; lăng điều chỉnh 4 hướng, cốp điều khiển từ xa th&#244;ng minh, điều khiển h&#224;nh tr&#236;nh Cruise Control, cảm biến đ&#232;n v&#224; gạt mưa tự động, k&#237;nh l&#225;i chống sương m&#249; tự động, điều h&#242;a tự động 2 v&#249;ng độc lập, gương chiếu hậu chống ch&#243;i điện tử,...&lt;/p&gt;

&lt;p&gt;Xe được trang bị v&#244; lăng D-Cut với đ&#225;y v&#225;t phẳng, lẫy chuyển số tr&#234;n v&#244;, đồng hồ c&#244;ng tơ m&#233;t cũng c&#243; thiết kế kiểu mới tạo cảm hứng thể thao v&#224; mạnh mẽ hơn.&lt;/p&gt;
', NULL, 1, 7, NULL, N'Normal-2018-Hyundai-Elantra-Sport-2018-mau-Trang-Vung-Tau-chi-voi-198tr-20180130044558865.jpg', CAST(N'2018-04-05T13:06:33.643' AS DateTime))
INSERT [dbo].[Xe] ([MaXe], [TenXe], [DungTichXiLanh], [MaMau], [LoaiHopSo], [MaXX], [MaLoaiXe], [MaTH], [CongXuat], [ChoNgoi], [GiaBan], [GiamGia], [MomenXoan], [KieuTruyenDong], [TrongLuong], [ChieuCao], [ChieuRong], [ChieuDai], [TangAp], [MamVanh], [PhanhTruoc], [PhanhSau], [KichCoLopT], [KichCoLopS], [HeThongTreoTruoc], [HeThongTreoSau], [KhoangSangGam], [HeThongDenT], [HeThongDenS], [HeThongLoa], [GuongChieuHau], [ChongBoABS], [MoTa], [NoiDung], [DanhGia], [TinhTrang], [SoLuong], [NamSX], [Anh], [TimeCreate]) VALUES (N'XE00011', N'2018 TOYOTA CAMRY 2.0E', N'Xăng 2.0L', 3, NULL, 2, 1, 1, N'165 Hp @6,500 vòng/phút', 5, 967000000.0000, 0, N'199 Nm @4,600 vòng/phút', N'2WD(Cầu trước)', 1480, 1470, 1825, 4850, 0, N'Hợp kim 16"', NULL, NULL, N'215/55R17', N'215/55R17', N'Macpherson với thanh cân bằng', N'Độc lập 2 liên kết với thanh cân bằng', 150, NULL, NULL, N'', 1, 1, N'Toyota Camry 2.0 e 2018 là phiên bản Camry công suất thấp nhất trong các phiên bản Toyota Camry 2018 ra mắt trong tháng 10/2017.', N'&lt;p&gt;- Phần ngoại thất Toyota Camry 2.0E mới chỉ c&#243; thay đổi về c&#244;ng nghệ đ&#232;n chiếu gần từ HID sang LED, cho &#225;nh s&#225;ng nhanh hơn. Đ&#232;n sương m&#249; t&#237;ch hợp lu&#244;n v&#224;o cản trước, chỗ h&#250;t gi&#243; 2 b&#234;n.&lt;/p&gt;

&lt;p&gt;- M&#224;u sắc: C&#243; th&#234;m phi&#234;n bản m&#224;u n&#226;u cam với m&#227; m&#224;u 4W9 giống với Toyota Fortuner. M&#224;u xanh x&#225;m cũ do b&#225;n kh&#244;ng chạy đ&#227; được bỏ đi.&lt;/p&gt;

&lt;p&gt;- Nội thất Toyota Camry 2.0E 2018:&amp;nbsp; Bảng taplo tất cả c&#225;c phi&#234;n bản c&#243; th&#234;m c&#225;c đường chỉ m&#224;u&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Camry 2.0&lt;/strong&gt;&amp;nbsp;E 2017 được thiết kế với ngoại thất kh&#225; bắt mắt. Đường n&#233;t th&#226;n xe l&#224; sự pha trộn vẻ thanh lịch của Camry 2015 cũ với ng&#244;n ngữ thiết kế gợi cảm, tinh tế của Lexus. Đ&#226;y l&#224; xu hướng thiết kế mới của c&#225;c d&#242;ng xe Toyota trong tương lai.&lt;/p&gt;

&lt;p&gt;Thiết kế h&#236;nh khối kh&#237; động học gi&#250;p cải tiến hệ số cản (Cd=0,28) qua đ&#243; gi&#250;p xe vận h&#224;nh ổn định v&#224; tiết kiệm nhi&#234;n liệu tối đa. C&#243; thể nhận thấy chiều cao được hạ thấp v&#224; chiều rộng th&#226;n xe&amp;nbsp; được gia tăng, gi&#250;p xe th&#234;m phần thể thao v&#224; sang trọng, bề thế. K&#237;ch thước xe Camry 2.0 cũng như 2 mẫu xe 2.5 l&#224;: 4826x1825x1470mm. Chiều d&#224;i cơ sở l&#224; 2775mm. Như vậy so với model Camry 2.4 2011 th&#236; model mới vẫn giữ nguy&#234;n chiều d&#224;i nhưng chiều rộng rộng hơn v&#224; chiều cao thấp hơn. Điều n&#224;y tạo ra một chiếc xe bề thế hơn v&#224; thể thao hơn.&lt;/p&gt;

&lt;p&gt;Phần đầu xe thiết kế mới theo tr&#224;o lưu hiện đại với calăng to bản, hốc gi&#243; k&#233;o d&#224;i kết nối liền mạch với đ&#232;n sương m&#249;. Cụm đ&#232;n pha g&#243;c cạnh với c&#244;ng nghệ chiếu s&#225;ng LED cho &#225;nh s&#225;ng nhanh v&#224; mạnh. Nắp capo với những đường g&#226;n dập nổi vừa mạnh mẽ v&#224; c&#225; t&#237;nh.&lt;/p&gt;
', NULL, 1, 3, NULL, N'Normal-2018-Toyota-Camry-2-0E-20180405042410398.jpg', CAST(N'2018-04-05T13:12:01.750' AS DateTime))
SET IDENTITY_INSERT [dbo].[XuatXu] ON 

INSERT [dbo].[XuatXu] ([MaXX], [TenXX]) VALUES (1, N'Nhập khẩu')
INSERT [dbo].[XuatXu] ([MaXX], [TenXX]) VALUES (2, N'Trong nước')
SET IDENTITY_INSERT [dbo].[XuatXu] OFF
ALTER TABLE [dbo].[BinhLuan] ADD  CONSTRAINT [DF_BinhLuan_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Counter] ADD  CONSTRAINT [DF_Counter_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[CTDonHang] ADD  CONSTRAINT [DF_CTDonHang_SoLuong]  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[DonHang] ADD  CONSTRAINT [DF_DonHang_NgayDH]  DEFAULT (getdate()) FOR [NgayDH]
GO
ALTER TABLE [dbo].[Logs] ADD  CONSTRAINT [DF_Logs_TimeLogin]  DEFAULT (getdate()) FOR [TimeLogin]
GO
ALTER TABLE [dbo].[Logs] ADD  CONSTRAINT [DF_Logs_TimeCreate]  DEFAULT (getdate()) FOR [TimeCreate]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[ThanhToan] ADD  CONSTRAINT [DF_ThanhToan_ChietKhau]  DEFAULT ((0)) FOR [ChietKhau]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsLock]  DEFAULT ((0)) FOR [IsLock]
GO
ALTER TABLE [dbo].[Xe] ADD  CONSTRAINT [DF_Xe_GiaBan]  DEFAULT ((0)) FOR [GiaBan]
GO
ALTER TABLE [dbo].[Xe] ADD  CONSTRAINT [DF_Xe_TangAp]  DEFAULT ((0)) FOR [TangAp]
GO
ALTER TABLE [dbo].[Xe] ADD  CONSTRAINT [DF_Xe_ChongBoABS]  DEFAULT ((0)) FOR [ChongBoABS]
GO
ALTER TABLE [dbo].[Xe] ADD  CONSTRAINT [DF_Xe_DanhGia]  DEFAULT ((0)) FOR [DanhGia]
GO
ALTER TABLE [dbo].[Xe] ADD  CONSTRAINT [DF_Xe_TinhTrang]  DEFAULT ((1)) FOR [TinhTrang]
GO
ALTER TABLE [dbo].[Xe] ADD  CONSTRAINT [DF_Xe_SoLuong]  DEFAULT ((0)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[Xe] ADD  CONSTRAINT [DF_Xe_TimeCreate]  DEFAULT (getdate()) FOR [TimeCreate]
GO
ALTER TABLE [dbo].[Anh]  WITH CHECK ADD  CONSTRAINT [FK_Anh_Xe] FOREIGN KEY([MaXe])
REFERENCES [dbo].[Xe] ([MaXe])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Anh] CHECK CONSTRAINT [FK_Anh_Xe]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_Xe] FOREIGN KEY([MaXe])
REFERENCES [dbo].[Xe] ([MaXe])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_Xe]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonHang_DonHang] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [FK_CTDonHang_DonHang]
GO
ALTER TABLE [dbo].[CTDonHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonHang_Xe] FOREIGN KEY([MaXe])
REFERENCES [dbo].[Xe] ([MaXe])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTDonHang] CHECK CONSTRAINT [FK_CTDonHang_Xe]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_ThanhToan] FOREIGN KEY([MaTT])
REFERENCES [dbo].[ThanhToan] ([MaTT])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_ThanhToan]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_VanChuyen] FOREIGN KEY([MaVC])
REFERENCES [dbo].[VanChuyen] ([MaVC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_VanChuyen]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_User]
GO
ALTER TABLE [dbo].[NoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NoiDung_TinNhan] FOREIGN KEY([From], [To])
REFERENCES [dbo].[TinNhan] ([From], [To])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NoiDung] CHECK CONSTRAINT [FK_NoiDung_TinNhan]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Quyen]
GO
ALTER TABLE [dbo].[Xe]  WITH CHECK ADD  CONSTRAINT [FK_Xe_LoaiHopSo] FOREIGN KEY([LoaiHopSo])
REFERENCES [dbo].[LoaiHopSo] ([MaHS])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Xe] CHECK CONSTRAINT [FK_Xe_LoaiHopSo]
GO
ALTER TABLE [dbo].[Xe]  WITH CHECK ADD  CONSTRAINT [FK_Xe_LoaiXe] FOREIGN KEY([MaLoaiXe])
REFERENCES [dbo].[LoaiXe] ([MaLX])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Xe] CHECK CONSTRAINT [FK_Xe_LoaiXe]
GO
ALTER TABLE [dbo].[Xe]  WITH CHECK ADD  CONSTRAINT [FK_Xe_Mau] FOREIGN KEY([MaMau])
REFERENCES [dbo].[Mau] ([MaMau])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Xe] CHECK CONSTRAINT [FK_Xe_Mau]
GO
ALTER TABLE [dbo].[Xe]  WITH CHECK ADD  CONSTRAINT [FK_Xe_ThuongHieu] FOREIGN KEY([MaTH])
REFERENCES [dbo].[ThuongHieu] ([MaTH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Xe] CHECK CONSTRAINT [FK_Xe_ThuongHieu]
GO
ALTER TABLE [dbo].[Xe]  WITH CHECK ADD  CONSTRAINT [FK_Xe_XuatXu] FOREIGN KEY([MaXX])
REFERENCES [dbo].[XuatXu] ([MaXX])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Xe] CHECK CONSTRAINT [FK_Xe_XuatXu]
GO
/****** Object:  StoredProcedure [dbo].[FC_GetUserIDNext]    Script Date: 21-Apr-18 12:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FC_GetUserIDNext]
@UserID varchar(50) out
as
begin
	declare @Idx int
	set @UserID = 'US00001'
	set @Idx = 1;

	while(exists(select * from [User] where UserName = @UserID))
	begin
		set @Idx = @Idx + 1
		set @UserID = 'US'+REPLICATE('0', 5-LEN(cast(@Idx as varchar))) + CAST(@Idx as varchar)
	end
	return @UserID
end
GO
