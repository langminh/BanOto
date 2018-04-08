<%@ Page Title="Kết quả tìm kiếm" EnableEventValidation="false" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="TimKiem.aspx.cs" Inherits="BanOto.TimKiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        a.add_to_cart_button {
            min-width: 239px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Kết quả tìm kiếm</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Page title area -->
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Tìm xe</h2>
                        <asp:TextBox runat="server" ID="txtSearch" TextMode="SingleLine" placeholder="Tìm xe..." />
                        <asp:Button runat="server" ID="btnSearch" OnClick="btnSearch_Click" Text="Tìm kiếm" />
                    </div>

                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Xe mới</h2>
                        <asp:ListView runat="server" ID="listNewCars">
                            <ItemTemplate>
                                <div class="thubmnail-recent">
                                    <img src="../Images/Cars/<%# Eval("Anh") %>" class="recent-thumb" alt="" />
                                    <h2><a href="ChiTiet.aspx?id=<%# Eval("MaXe") %>"><%# Eval("TenXe") %></a></h2>
                                    <div class="product-sidebar-price">
                                        <div class="product-wid-price <%# Eval("GiamGia").ToString().Equals("0") ? "none-display" : "" %>">
                                            <span class="text-uppercase">Giảm &nbsp</span><ins class="text-danger"><%#String.Format("{0:n0}", float.Parse(Eval("GiamGia").ToString()))%> %</ins>
                                        </div>
                                        <div class="product-carousel-price">
                                            <ins><%#String.Format("{0:n0}", float.Parse(Eval("GiaBan").ToString()))%> VNĐ</ins> <%--<del>$100.00</del>--%>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="row">
                            <div class="row">
                                <asp:ListView runat="server" ID="listCars">
                                    <ItemTemplate>
                                        <div class="col-md-4 col-sm-6">
                                            <div class="single-shop-product">
                                                <div class="product-upper">
                                                    <img class="img-car" src="../Images/Cars/<%# Eval("Anh") %>" alt="" />
                                                </div>
                                                <h2><a href="ChiTiet.aspx?id=<%# Eval("MaXe") %>"><%# Eval("TenXe") %></a></h2>
                                                <div class="product-wid-price <%# Eval("GiamGia").ToString().Equals("0") ? "none-display" : "" %>">
                                                    <span class="text-uppercase">Giảm &nbsp</span><ins class="text-danger"><%#String.Format("{0:n0}", float.Parse(Eval("GiamGia").ToString()))%> %</ins>
                                                </div>
                                                <div class="product-carousel-price">
                                                    <ins><%#String.Format("{0:n0}", float.Parse(Eval("GiaBan").ToString()))%> VNĐ</ins> <%--<del>$100.00</del>--%>
                                                </div>

                                                <div class="product-option-shop">
                                                    <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="GioHang.aspx?id=<%# Eval("MaXe") %>">Thêm vào giỏ hàng</a>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        <div class="text-center">
                                            Không có kết quả phù hợp. <a href="TrangChu.aspx">Bấm đây</a>&nbsp; để quay về trang chủ, hoặc <a href="Xe.aspx">Bấm đây</a>&nbsp; để tiếp tục mua hàng.
                                        </div>
                                    </EmptyDataTemplate>
                                </asp:ListView>
                            </div>
                        </div>

                        <div class="related-products-wrapper">
                            <h2 class="related-products-title">Xe được quan tâm nhiều</h2>
                            <div class="related-products-carousel">
                                <asp:ListView runat="server" ID="list">
                                    <ItemTemplate>
                                        <div class="single-product">
                                            <div class="product-f-image">
                                                <img class="img-product" src="../Images/Cars/<%# Eval("Anh") %>" alt="" />
                                                <div class="product-hover">
                                                    <a href="GioHang.aspx?id=<%# Eval("MaXe") %>" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i>Giỏ hàng</a>
                                                    <a href="ChiTiet.aspx?id=<%# Eval("MaXe") %>" class="view-details-link"><i class="fa fa-link"></i>Chi tiết</a>
                                                </div>
                                            </div>
                                            <h2><a href="ChiTiet.aspx?id=<%# Eval("MaXe") %>"><%# Eval("TenXe") %></a></h2>
                                            <div class="product-carousel-price">
                                                <ins><%#String.Format("{0:n0}", float.Parse(Eval("GiaBan").ToString()))%> VNĐ</ins>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="Asset/Client/js/owl.carousel.min.js"></script>
    <script src="Asset/Client/js/jquery.sticky.js"></script>
</asp:Content>
