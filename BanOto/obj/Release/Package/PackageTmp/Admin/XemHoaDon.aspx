<%@ Page Title="Xem hóa đơn" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="XemHoaDon.aspx.cs" Inherits="BanOto.Admin.XemHoaDon" %>

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
        <h1>Xem hóa đơn</h1>
        <div class="row">
            <div class="col-md-6">
                <p>Mã đơn hàng: &nbsp
                <asp:Label runat="server" ID="lbMaDH"></asp:Label>
                </p>
                <p>
                    Tên người mua:
                    <asp:Label runat="server" ID="lbName"></asp:Label>
                </p>
                <p>
                    Địa chỉ:
                    <asp:Label runat="server" ID="lbDiaChi"></asp:Label>
                </p>
                <p>
                    Hình thức thanh toán:
                    <asp:Label runat="server" ID="lbThanhToan"></asp:Label>
                </p>
            </div>
            <div class="col-md-6">
                <p>
                    Email:
                    <asp:Label runat="server" ID="lbEmail"></asp:Label>
                </p>
                <p>
                    Số điện thoại:
                    <asp:Label runat="server" ID="lbSdt"></asp:Label>
                </p>
                <p>
                    Hình thức vận chuyển:
                    <asp:Label runat="server" ID="lbVanChuyen"></asp:Label>
                </p>
            </div>
        </div>
        <div class="row">
            <h2>Danh sách hàng đã đặt</h2>
            <asp:ListView runat="server" ID="listCars">
                <LayoutTemplate>
                    <table id="data-table" class="table table-responsive">
                        <thead>
                            <tr>
                                <th>STT</th>
                                <th>Mã xe</th>
                                <th>Tên xe</th>
                                <th>Số lượng</th>
                                <th>Tổng tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder ID="ItemPlaceholder" runat="server"></asp:PlaceHolder>
                        </tbody>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Container.DataItemIndex + 1 %></td>
                        <td><%# Eval("MaXe") %></td>
                        <td><%# Eval("TenXe") %></td>
                        <td><%# Eval("SoLuong") %></td>
                        <td><%# Eval("TongTien") %></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div class="row">
            <a href="QuanLyDonHang.aspx" class="btn btn-success">Trở về trang trước</a>
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
