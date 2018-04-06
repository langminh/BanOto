<%@ Page Title="Danh sách xe" Language="C#" EnableEventValidation="false" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DanhSachXe.aspx.cs" Inherits="BanOto.Admin.DanhSachXe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .content {
            margin-top: 50px;
        }
        .img-product{
            max-width: 75px;
        }
    </style>
    <script src="../Asset/Admin/assets/vendor/bootstrap/js/bootstrap-notify.min.js"></script>
    <script src="../Asset/Admin/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <link href="../Asset/Admin/assets/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="../Asset/Admin/assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid content">
        <h1>Danh sách xe</h1>
        <div class="row">
            <div class="col-md-12">
                <div class="panel-body">
                    <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
                    <asp:ListView ID="listCars" runat="server" OnItemCommand="listCars_ItemCommand">
                        <LayoutTemplate>
                            <table id="data-table" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Mã xe</th>
                                        <th>Tên xe</th>
                                        <th>Ảnh</th>
                                        <th>Giá</th>
                                        <th>Giảm giá</th>
                                        <th>Số lương</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Container.DataItemIndex + 1 %></td>
                                <td><%# Eval("MaXe") %></td>
                                <td>
                                    <img class="img-product" src='../Images/Cars/<%# Eval("Anh") %>' /></td>
                                <td><%# Eval("TenXe") %></td>
                                <td><%#String.Format("{0:n0}", float.Parse(Eval("GiaBan").ToString()))%> VNĐ</td>
                                <td><%# Eval("GiamGia") %></td>
                                <td><%# Eval("SoLuong") %></td>
                                <td class="last">
                                    <asp:LinkButton runat="server" CommandName="UpdateItem" CommandArgument='<%#Eval("MaXe") %>' CssClass="edit-delete btn btn-success fa fa-info info-item" ID="LinkButton2"></asp:LinkButton>
                                    <asp:LinkButton runat="server" CommandName="DeleteItem" CommandArgument='<%#Eval("MaXe") %>' CssClass="edit-delete btn btn-danger fa fa-times info-item" ID="LinkButton1"></asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                    <div class="form-group pull-left">
                        <asp:LinkButton runat="server" CssClass="btn btn-primary form-control" PostBackUrl="~/Admin/QuanLyXe.aspx" Text="Thêm mới mặt hàng"></asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <!-- Modal Delete -->
    <div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="deleteModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title"><span id="delete-label"></span>Xóa</h4>
                        </div>
                        <div class="modal-body">
                            <div class="input-group">
                                <div class="col-md-12 col-sm-12">
                                    <div class="input-group">
                                        <asp:HiddenField runat="server" ID="txtCarID_Delete" />
                                    </div>
                                    <br />
                                    <div class="input-group text-center">
                                        <asp:Label runat="server" ID="delete_name" Text="Bạn có chắc chắn muốn xóa sản phẩm này?"></asp:Label>
                                    </div>
                                    <br />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button runat="server" ID="btnDelete" OnClick="btnDelete_Click" CssClass="btn btn-success" Text="Xóa"></asp:Button>
                            <button type="button" class="btn btn-info" data-dismiss="modal" id="btn-cancel-delete">Hủy</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <script>
        $("#servicesleft > li > a").eq(2).addClass("active");
        $(document).ready(function () {
            $("#data-table").DataTable({
                "lengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]],
                "language": {
                    "search": "Tìm kiếm",
                    "lengthMenu": "Hiển thị _MENU_ danh mục",
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
            $('#btnCancel').click(function (e) {
                e.preventDefault();
                $('#update').modal('hide');
            });
        });
    </script>
</asp:Content>
