<%@ Page Title="Quản lý slide" Language="C#" MasterPageFile="~/Admin/Admin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="QuanLySlide.aspx.cs" Inherits="BanOto.Admin.QuanLySlide" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        .img-car {
            max-width: 400px;
        }

        .img-car-add {
            max-width: 75px;
        }

        #myModal {
            margin-top: 100px;
        }
    </style>
    <link href="../Asset/Admin/modal.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="main-content">
        <div class="container-fluid">
            <h1>Thêm Slide cho sản phẩm</h1>
            <div class="row">
                <div class="col-md-6">
                    <h3>Thông tin chung</h3>
                    <asp:Label runat="server" ID="lbThongBao"></asp:Label>
                    <div class="form-group row">
                        <label for="txtMaXe" class="col-sm-2 col-form-label">Tiêu đề</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtTieuDe" ClientIDMode="Static"></asp:TextBox>
                        </div>
                        <asp:HiddenField runat="server" ID="lbMa" />
                    </div>
                    <div class="form-group row">
                        <label for="inputPassword" class="col-sm-2 col-form-label">Nội dung:</label>
                        <div class="col-sm-10">
                            <asp:TextBox runat="server" ID="txtNoiDung" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-3">
                            <asp:FileUpload runat="server" ID="FileUpload1" CssClass="form-control" />
                        </div>
                        <div class="col-md-9">
                            <div class="col-sm-4 cls">
                                <asp:Button runat="server" ID="btnUpload" Text="Tải ảnh lên" OnClick="btnUpload_Click" CssClass="btn btn-primary" />
                            </div>
                             <div class="col-sm-4 cls">
                                <asp:Button runat="server" ID="btnSua" Text="Trở lại" CssClass="btn btn-primary" OnClick="btnSua_Click" />
                            </div>
                            <div class="col-sm-4 cls">
                                <asp:Button runat="server" ID="btnBack" Text="Trở lại" CssClass="btn btn-danger" OnClick="btnBack_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <h3>Ảnh</h3>

                    <asp:Image runat="server" ID="Image1" CssClass="img-car"></asp:Image>

                </div>
            </div>
            <div class="row">
                <asp:ListView runat="server" ID="listImg" OnItemCommand="listImg_ItemCommand">
                    <LayoutTemplate>
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Tên ảnh</th>
                                    <th>Ảnh</th>
                                    <th>Nội dung</th>
                                    <th>&nbsp</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:PlaceHolder runat="server" ID="Itemplaceholder"></asp:PlaceHolder>
                            </tbody>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Container.DataItemIndex + 1 %></td>
                            <td><%# Eval("Tilte") %></td>
                            <td>
                                <img class="img-car-add" id="myImg" onclick="openModal(this)" src="../Images/Cars/<%# Eval("Anh") %>" /></td>
                            <td><%# Eval("Type") %></td>
                            <td>
                                <asp:LinkButton runat="server" CommandName="UpdateItem" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-success fa fa-edit"></asp:LinkButton>
                                <asp:LinkButton runat="server" CommandName="DeleteItem" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-danger fa fa-times"></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            <!-- The Modal -->
            <div id="myModal" class="modal">
                <span class="close">&times;</span>
                <div class="text-center">
                    <img class="modal-content" id="img01">
                </div>
            </div>
        </div>
    </div>
    <script>
        $("#servicesleft > li > a").eq(2).addClass("active");
    </script>
    <script>
        function openModal(img) {
            // Get the modal
            var modal = document.getElementById('myModal');

            var modalImg = document.getElementById("img01");
            modal.style.display = "block";
            modalImg.src = img.src;

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            }
        }
    </script>
</asp:Content>
