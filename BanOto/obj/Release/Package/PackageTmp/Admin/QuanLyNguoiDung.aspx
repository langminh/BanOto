<%@ Page Title="Quản lý người dùng" Language="C#" MasterPageFile="~/Admin/Admin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="QuanLyNguoiDung.aspx.cs" Inherits="BanHangDienTu.Admin.AddCatalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../Asset/Admin/assets/vendor/bootstrap/js/bootstrap-notify.min.js"></script>
    <link href="../Asset/Admin/assets/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="../Asset/Admin/assets/vendor/datatables/js/jquery.dataTables.min.js"></script>

    <style>
        .img-user {
            max-width: 65px;
        }

        .cls {
            border: 1px solid #9ac2f5;
        }

        .avatar {
            max-width: 150px;
            max-height: 150px;
        }

        #chkStatus {
            margin-top: 13px;
        }
    </style>
    <script>
        //// Diplay Image Preview on File Upload 
        $(document).on('change', '#FileUpload2', function (e) {

            var tmppath = URL.createObjectURL(e.target.files[0]);
            $("#ImgDisp").attr('src', tmppath);

        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Content -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Danh Sách Người Dùng</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-md-10">

                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
                        <asp:ListView ID="userList" runat="server" OnItemCommand="userList_ItemCommand">
                            <LayoutTemplate>
                                <table id="data-table" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Họ tên</th>
                                            <th>Ảnh đại diện</th>
                                            <th>Email</th>
                                            <th>Địa chỉ</th>
                                            <th>SĐT</th>
                                            <th>Giới tính</th>
                                            <th>Trạng thái</th>
                                            <th>&nbsp</th>
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
                                    <td><%# Eval("HoTen") %></td>
                                    <td>
                                        <img class="img-user" src="../Images/Avatars/<%# Eval("Avatar") == null ?"dummy.png" : Eval("Avatar")%>" />
                                    </td>
                                    <td><%# Eval("Email") %></td>
                                    <td><%# Eval("Sdt") %></td>
                                    <td><%# Eval("DiaChi") %></td>
                                    <td>

                                        <%# Eval("GT") ==null ?"" : (Eval("GT").ToString().ToUpper().Equals("False".ToUpper()) ? "Nam" : "Nữ")%>

                                    </td>
                                    <td><%# Eval("IsLock") %></td>
                                    <td class="last">
                                        <asp:LinkButton runat="server" CommandName="UpdateItem" CommandArgument='<%#Eval("UserName") %>' CssClass="edit-delete fa fa-info btn btn-success info-item" ID="Update"></asp:LinkButton>
                                        <asp:LinkButton runat="server" CommandName="DeleteItem" CommandArgument='<%#Eval("UserName") %>' CssClass="edit-delete fa fa-times btn btn-danger info-item" ID="Delete"></asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <div>
                            <div class="form-group pull-left">
                                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" CssClass="form-control btn btn-success" Text="Thêm mới người dùng" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.row -->
    </div>
    <!-- Modal Create -->
    <div class="modal fade" id="create" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <asp:UpdatePanel ID="updateModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title"><asp:Label runat="server" ID="createlabel"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <!-- left side -->
                                    <div class="col-md-3">
                                        <div class="text-center">
                                            <img id="ImgDisp" src="../Images/Avatars/dummy.png" class="user-image avatar img-circle" style="height: 100px;" />
                                            <%--                                    <img runat="server" id="imgUser" class="avatar img-circle" />--%>
                                            <h6>Ảnh đại diện</h6>
                                        </div>
                                    </div>
                                    <div class="col-md-6 personal-info">
                                        <asp:Label runat="server" ID="lbThongBao"></asp:Label>
                                        <h3>Thông tin cá nhân</h3>
                                        <div class="form-horizontal">
                                            <asp:HiddenField runat="server" ID="txtUserID" />
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Họ tên:</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtName"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Email:</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Địa chỉ:</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtAddress"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Số điện thoại:</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtPhone"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Giới tính:</label>
                                                <div class="col-md-8">
                                                    <label class="radio-inline">
                                                        <asp:RadioButton runat="server" ID="rdoNam" />
                                                        Nam
                                                    </label>
                                                    <label class="radio-inline">
                                                        <asp:RadioButton runat="server" ID="rdoNu" />
                                                        Nữ
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Mật khẩu:</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtPass" TextMode="Password"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Nhập lại mật khẩu:</label>
                                                <div class="col-md-8">
                                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtRePass" TextMode="Password"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="chkStatus" class="col-md-5 control-label">Trạng thái(Khóa người dùng):</label>
                                                <div class="col-md-6">
                                                    <asp:CheckBox runat="server" ID="chkStatus" ClientIDMode="Static" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button runat="server" ID="btnCreateOk" OnClick="Update_Click" CssClass="btn btn-success" Text="Cập nhật"></asp:Button>
                            <button type="button" class="btn btn-info" id="btn-cancel-create">Hủy</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <!-- Modal Delete -->
    <div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="deleteModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content" style="width: 668px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Xóa &nbsp;&nbsp;<asp:Label runat="server" ID="deletelabel"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <div class="input-group">
                                <div class="col-md-12 col-sm-12">
                                    <div class="input-group">
                                        <asp:HiddenField runat="server" ID="txtUserID_Delete" />
                                    </div>
                                    <br />
                                    <div class="input-group text-center">
                                        <asp:Label runat="server" ID="delete_name" Text="Bạn có chắc chắn muốn xóa người dùng này?"></asp:Label>
                                    </div>
                                    <br />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button runat="server" ID="btnDelete" OnClick="Delete_Click" CssClass="btn btn-success" Text="Xóa"></asp:Button>
                            <button type="button" class="btn btn-info" data-dismiss="modal" id="btn-cancel-delete">Hủy</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <script>
        $("#servicesleft > li > a").eq(1).addClass("active");
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
                },
                "columns": [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    { "width": "30%" }
                ]
            });

            function uploadComplete(sender, args) {
                var imgDisplay = $get("imgUser");
                imgDisplay.src = "images/loading.gif";
                imgDisplay.style.cssText = "";
                var img = new Image();
                img.onload = function () {
                    imgDisplay.style.cssText = "Display:none;";
                    imgDisplay.src = img.src;
                };

                imgDisplay.src = "<%# ResolveUrl(UploadFolderPath) %>" + args.get_fileName();
            }

            $('#btnCancel').click(function (e) {
                e.preventDefault();
                $('#update').modal('hide');
            });

            $('#btn-cancel-delete').click(function (e) {
                e.preventDefault();
                $('#delete').modal('hide');
            });

            $('#btn-cancel-create').click(function (e) {
                e.preventDefault();
                $('#create').modal('hide');
            });
        })
    </script>

    <!-- /.container-fluid -->
</asp:Content>
