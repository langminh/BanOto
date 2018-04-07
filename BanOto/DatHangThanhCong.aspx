<%@ Page Title="Đặt hàng thành công" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="DatHangThanhCong.aspx.cs" Inherits="BanOto.DatHangThanhCong" %>

<%@ Import Namespace="BanOto.Helper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <%if (Session[CommonContanst.CART_SESSION] != null)
                    { %>
                <% Session[CommonContanst.CART_SESSION] = null; %>
                <div class="text-center">
                    <h2>Đặt hàng thành công.&nbsp<a href="TrangChu.aspx">Bấm đây</a> để quay về trang chủ.</h2>
                    <p>
                        Đơn hàng của bạn đã được đặt thành công. chúng tôi sẽ liên lạc với bạn dựa trên các thông
                    tin mà bạn đã cung cấp. Xin cảm ơn.
                    </p>
                </div>
                <%}
                else
                { %>
                <div class="text-center">
                    <p>
                        Không có sản phẩm nào trong giỏ hàng của bạn. Hãy tiếp tục tìm kiếm chiếc xe 
                            bạn yêu thích, hoặc <a href="TrangChu.aspx">&nbsp;Bấm vào đây</a>&nbsp;để quay lại <a href="TrangChu.aspx">trang
                            chủ</a>
                    </p>
                    <a href="Xe.aspx" class="btn btn-primary">Tiếp tục mua hàng</a>
                </div>
                <%} %>
            </div>
        </div>
    </div>
</asp:Content>
