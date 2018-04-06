<%@ Page Title="Quản lý Đơn hàng" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="QuanLyDonHang.aspx.cs" Inherits="BanOto.Admin.QuanLyDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .content {
            margin-top: 50px;
        }
    </style>
    <link href="../Asset/Admin/assets/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="../Asset/Admin/assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid content">
        <h1>Danh sách đơn hàng</h1>
        <div class="row">
            <div class="col-md-12">
                <asp:ListView ID="listDH" runat="server" OnItemCommand="listDH_ItemCommand">
                    <LayoutTemplate>
                        <table id="data-table" class="table table-striped table-bordered table-hover" id="data-table">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Mã hóa đơn</th>
                                    <th>Người mua</th>
                                    <th>Ngày mua</th>
                                    <th>Tổng tiền</th>
                                    <th>Trạng thái</th>
                                    <th>&nbsp</th>
                                    <th>&nbsp</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:PlaceHolder runat="server" ID="ItemPlaceholder"></asp:PlaceHolder>
                            </tbody>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Container.DataItemIndex + 1 %></td>
                            <td><%# Eval("MaDH") %></td>
                            <td><%# Eval("HoTen") %></td>
                            <td><%# Eval("NgayDH") %></td>
                            <td><%# Eval("TongTien") %></td>
                            <td><%# Eval("TrangThai") %></td>
                            <td>
                                <asp:LinkButton runat="server" Text="Xem chi tiết" CommandName="ChiTiet" CommandArgument='<%#Eval("MaDH") %>' CssClass="edit-delete text-primary" ID="LinkButton2"></asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton runat="server" Text="Xem hóa đơn" CommandName="Xem" CommandArgument='<%#Eval("MaDH") %>' CssClass="edit-delete text-warning" ID="LinkButton1"></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
    <script>
        $("#servicesleft > li > a").eq(5).addClass("active");
        $(document).ready(function () {
            $("#data-table").DataTable({
                "lengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]],
                "language": {
                    "search": "Tìm kiếm",
                    "lengthMenu": "Hiển thị _MENU_ mục",
                    "zeroRecords": "Không có dữ liệu",
                    "info": "Đang hiển thị _PAGE_ của _PAGES_",
                    "infoEmpty": "Dữ liệu không tồn tại",
                    "infoFiltered": "(Lọc từ _MAX_ tổng số bản ghi)",
                    "paginate": {
                        "previous": "Trang trước",
                        "next": "Trang kế"
                    }
                }
            });
        });
    </script>
</asp:Content>
