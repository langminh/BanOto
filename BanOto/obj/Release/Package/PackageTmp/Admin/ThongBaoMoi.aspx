<%@ Page Title="Nhật ký hệ thống" Language="C#" MasterPageFile="~/Admin/Admin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="ThongBaoMoi.aspx.cs" Inherits="BanOto.Admin.ThongBaoMoi" %>

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
        <div class="row">
            <h1>Nhật ký hệ thống</h1>
            <div class="col-md-12">
                <asp:ListView runat="server" ID="listLogs">
                    <LayoutTemplate>
                        <table id="data-table" class="table table-responsive">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Thời gian</th>
                                    <th>Thông báo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                            </tbody>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Container.DataItemIndex + 1 %></td>
                            <td><%# Eval("TimeCreate") %></td>
                            <td><%# Eval("Messages") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
    <script>
        $("#servicesleft > li > a").eq(4).addClass("active");
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
