<%@ Page Title="Chi tiết đơn hàng" Language="C#" MasterPageFile="~/Admin/Admin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="CTHoaDon.aspx.cs" Inherits="BanOto.Admin.CTHoaDon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .content {
            margin-top: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid content">
        <h1>Chi tiết đơn hàng</h1>
        <div class="row">
            <div class="col-md-12">
                <asp:ListView runat="server" ID="listChiTiet" OnItemCommand="listChiTiet_ItemCommand">
                    <LayoutTemplate>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Mã hóa đơn</th>
                                    <th>Mã Xe</th>
                                    <th>Giá bán</th>
                                    <th>Số lượng</th>
                                    <th>Tổng tiền</th>
                                    <th>Trạng thái</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:PlaceHolder runat="server" ID="ItemPlaceHolder"></asp:PlaceHolder>
                            </tbody>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("MaDH") %></td>
                            <td><%# Eval("MaXe") %></td>
                            <td><%# Eval("GiaBan") %></td>
                            <td><%# Eval("SoLuong") %></td>
                            <td><%# Eval("TongTien") %></td>
                            <td>
                                <asp:LinkButton runat="server" CommandName="UpdateItem" CommandArgument='<%#Eval("MaDH") %>' CssClass="edit-delete bg-warning" ID="LinkButton2"><%#Eval("TrangThai") %></asp:LinkButton>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
        <div class="row">
            <asp:LinkButton runat="server" PostBackUrl="~/Admin/QuanLyDonHang.aspx" Text="Trở lại trang trước" CssClass="btn btn-primary"></asp:LinkButton>
        </div>
    </div>

    <script>$("#servicesleft > li > a").eq(5).addClass("active");</script>
</asp:Content>
