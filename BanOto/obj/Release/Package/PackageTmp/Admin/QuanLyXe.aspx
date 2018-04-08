<%@ Page Title="Quản lý xe" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="QuanLyXe.aspx.cs" Inherits="BanOto.Admin.QuanLyXe" ValidateRequest="false" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="ckeditor/ckeditor.js"></script>
    <style>
        .content {
            margin-top: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid content">
        <div class="row">
            <div class="pull-right">
                <asp:Label runat="server" ID="lbThongBao"></asp:Label>
            </div>
            <div class="col-md-12">
                <h2>Thông tin chung</h2>
                
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Mã sản phẩm:</label>
                        <asp:TextBox runat="server" ID="txtIDXe" CssClass="form-control" Enabled="False"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Tên sản phẩm:</label>
                        <asp:TextBox runat="server" ID="txtTenXe" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Loại xe:</label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="drLoaiXe" DataTextField="TenLX" DataValueField="MaLX" AppendDataBoundItems="True" AutoPostBack="false"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Loại hộp số:</label>
                        <asp:DropDownList runat="server" CssClass="form-control" DataTextField="TenHS" DataValueField="MaHS" ID="drLoaiHS" AppendDataBoundItems="True" AutoPostBack="false"></asp:DropDownList>
                    </div>
                    <div>
                        <div style="float: left; width: 200px;">
                            Ảnh
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                        </div>
                        <div style="float: left; width: 70px">
                            <br />
                            <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-primary" OnClick="btnUpload_Click" />
                        </div>
                        <div style="clear: both;"></div>
                        <asp:Image ID="Image1" runat="server" Height="159px" Width="131px" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Màu sắc:</label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="drMau" AppendDataBoundItems="True" AutoPostBack="false" DataTextField="TenMau" DataValueField="MaMau"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Hãng:</label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="drHang" AppendDataBoundItems="True" AutoPostBack="false" DataTextField="TenTH" DataValueField="MaTH"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Xuất xứ:</label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="drXuatXu" AppendDataBoundItems="True" AutoPostBack="false" DataTextField="TenXX" DataValueField="MaXX"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Giá:</label>
                        <asp:TextBox runat="server" TextMode="Number" min="0" ID="txtGia" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <h2>Thông tin chi tiết</h2>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Dung tích xilanh:</label>
                        <asp:TextBox runat="server" ID="txtDTXilanh" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Công suất:</label>
                        <asp:TextBox runat="server"  ID="txtCongSuat" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Chỗ ngồi:</label>
                        <asp:TextBox runat="server" Text="0" min="0" TextMode="Number" ID="txtChoNgoi" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Momen xoắn:</label>
                        <asp:TextBox runat="server" ID="txtMomen" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Trọng lượng:</label>
                        <asp:TextBox runat="server" Text="0" min="0" TextMode="Number" ID="txtKhoiLuong" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Giảm giá(%):</label>
                        <asp:TextBox runat="server" Text="0" min="0" TextMode="Number" ID="txtGiamGia" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Khoảng sáng gầm xe:</label>
                        <asp:TextBox runat="server" Text="0" min="0" TextMode="Number" ID="txtGamXe" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Kiểu truyền động:</label>
                        <asp:TextBox runat="server" ID="txtKieuTD" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Mâm vành:</label>
                        <asp:TextBox runat="server" ID="txtMamVanh" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Phanh trước:</label>
                        <asp:TextBox runat="server" ID="txtPhanhTruoc" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Năm sản xuất:</label>
                        <asp:TextBox runat="server" ID="txtNamSX" TextMode="Number" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="txtChieuCao">Chiều cao(mm)</label>
                            <asp:TextBox runat="server" Text="0" min="0" ID="txtChieuCao" ClientIDMode="Static" CssClass="form-control" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="txtChieuDai">Chiều dài(mm)</label>
                            <asp:TextBox runat="server" Text="0" min="0" ID="txtChieuDai" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="txtChieuRong">Chiều rộng(mm)</label>
                            <asp:TextBox runat="server" Text="0" min="0" ID="txtChieuRong" CssClass="form-control" ClientIDMode="Static" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Phanh Sau:</label>
                        <asp:TextBox runat="server" ID="txtPhanhSau" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="">Kích cỡ lốp trước:</label>
                        <asp:TextBox runat="server" ID="txtKCLopT" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Kích cỡ lốp sau:</label>
                        <asp:TextBox runat="server" ID="txtKCLopS" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Hệ thống treo trước:</label>
                        <asp:TextBox runat="server" ID="txtTreoT" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <label>Hệ thống treo sau:</label>
                        <asp:TextBox runat="server" ID="txtTreoS" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Hệ thống loa:</label>
                        <asp:TextBox runat="server" ID="txtHTLoa" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Số lượng:</label>
                        <asp:TextBox runat="server" Text="0" min="0" ID="txtSL" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="chkChieuHau" class="checkbox-inline">Hệ thống gương chiếu hậu chỉnh điện:</label>
                            <asp:CheckBox runat="server" ID="chkChieuHau" ClientIDMode="Static" CssClass="form-check-input"></asp:CheckBox>
                        </div>
                        <div class="form-group">
                            <label for="chkABS" class="checkbox-inline">Chống bó cứng phanh ABS:</label>
                            <asp:CheckBox runat="server" ID="chkABS" ClientIDMode="Static" CssClass="form-check-input"></asp:CheckBox>
                            <label for="chkTT" class="checkbox-inline">Tình trạng:</label>
                            <asp:CheckBox runat="server" ID="chkTT" ClientIDMode="Static" CssClass="form-check-input"></asp:CheckBox>
                            <label for="chkTangAp" class="checkbox-inline">Tăng áp:</label>
                            <asp:CheckBox runat="server" ID="chkTangAp" ClientIDMode="Static" CssClass="form-check-input"></asp:CheckBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Mô tả:</label>
                        <asp:TextBox runat="server" ID="txtMoTa" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:LinkButton runat="server" ID="btnAddAnh" Visible="false" Text="Thêm ảnh" OnClick="Unnamed_Click" CssClass="btn btn-success"></asp:LinkButton>
                    </div>
                </div>
                <div class="col-md-12">
                    <label>Bài viết:</label>
                    <asp:TextBox runat="server" ID="txtBaiViet" ClientIDMode="Static" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

        </div>
        <div class="row content">
            <div class="col-md-6 col-md-offset-4">

                <div class="form-inline">
                    <div class="form-group">
                        <asp:Button runat="server" ID="btnThem" Visible="true" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
                    </div>
                    <div class="form-group">
                        <asp:Button runat="server" ID="btnSua" Text="Sửa" Visible="false" CssClass="btn btn-primary" OnClick="btnSua_Click" />
                    </div>

                    <div class="form-group">
                        <asp:Button runat="server" ID="btnReset" Text="Reset" CssClass="btn btn-primary" OnClick="btnReset_Click" />
                    </div>
                </div>
            </div>
            <div style="clear: both;"></div>
        </div>
    </div>
    <script>
        config = {};
        config.language = 'vi';
        config.entities_latin = false;
        config.toolbarGroups = [
            { name: 'basicstyles', groups: ['basicstyles', 'cleanup'] },
            { name: 'clipboard', groups: ['clipboard', 'undo'] },
            { name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi', 'paragraph'] },
            { name: 'editing', groups: ['find', 'selection', 'spellchecker', 'editing'] },
            { name: 'links', groups: ['links'] },
            { name: 'insert', groups: ['insert'] },
            { name: 'forms', groups: ['forms'] },
            { name: 'tools', groups: ['tools'] },
            { name: 'document', groups: ['mode', 'document', 'doctools'] },
            { name: 'others', groups: ['others'] },
            '/',
            { name: 'styles', groups: ['styles'] },
            { name: 'colors', groups: ['colors'] },
            { name: 'about', groups: ['about'] }
        ];

        config.removeButtons = 'Underline,Subscript,Superscript,Blockquote,About,Styles,Format,Table,HorizontalRule,SpecialChar,Maximize,Cut,Copy,Paste,PasteText,PasteFromWord,Scayt';
        CKEDITOR.replace('txtBaiViet', config);
    </script>
    <script>
        $("#servicesleft > li > a").eq(2).addClass("active");
    </script>
</asp:Content>
