<%@ Page Title="Quản lý hãng xe" Language="C#" MasterPageFile="~/Admin/Admin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="QuanLyHangXe.aspx.cs" Inherits="BanOto.Admin.QuanLyHangXe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .content {
            margin-top: 50px;
        }

        td {
            padding: 0 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid content">
        <h1>Quản lý hãng xe</h1>
        <div class="row">
            <div class="col-md-12">
                <asp:HiddenField runat="server" ID="txtMaTH" />
                Tên hãng
                <asp:TextBox runat="server" ID="txtTenTH" CssClass="form-control" Width="200px"></asp:TextBox>
                <br />
                <div class="row">
                    <div style="float: left; width: 200px; margin-left: 20px;">
                        Ảnh
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                    </div>
                    <div style="float: left;">
                        <br />
                        <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-primary" OnClick="btnUpload_Click" />

                        <asp:Button runat="server" ID="btnThem" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
                        <asp:Button runat="server" ID="btnSua" Text="Sửa" CssClass="btn btn-primary" OnClick="btnSua_Click" />
                        <asp:Button runat="server" ID="btnXoa" Text="Xóa" CssClass="btn btn-danger" OnClick="btnXoa_Click" />
                        <asp:Button runat="server" ID="btnReset" Text="Reset" CssClass="btn btn-success" OnClick="btnReset_Click" />
                        <br />
                    </div>
                    <div style="clear: both;"></div>

                </div>
                <asp:Image ID="Image1" runat="server" />
                <div class="row">

                    <asp:Label ID="lbThongBao" runat="server" Text=""></asp:Label>
                </div>
                <hr />
                <div class="col-md-8">

                    <asp:GridView ID="GridView1" ClientIDMode="Static" PageSize="5" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="MaTH" AllowSorting="true" CssClass="table" runat="server"
                        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="MaTH" Visible="true" HeaderText="Mã hãng xe" />
                            <asp:BoundField DataField="TenTH" HeaderText="Tên hãng xe" HtmlEncode="false" />
                            <asp:ImageField HeaderText="Ảnh" DataImageUrlFormatString="~\Images\logo\{0}" NullDisplayText="Không có ảnh" ControlStyle-Width="75" DataImageUrlField="Anh"></asp:ImageField>
                            <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>

                </div>
            </div>
        </div>
    </div>
    <script>
        $("#servicesleft > li > a").eq(2).addClass("active");
    </script>
</asp:Content>
