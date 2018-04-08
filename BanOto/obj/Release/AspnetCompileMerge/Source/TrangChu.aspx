<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Client.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="BanOto.TrangChu" %>

<%@ Import Namespace="BanOto.Entity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .caption-group {
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Begin slider area -->
    <div class="slider-area">
        <!-- Slider -->
        <div class="block-slider block-slider4">
            <ul class="" id="bxslider-home4">
                <asp:ListView runat="server" ID="ListSlide">
                    <ItemTemplate>
                        <li>
                            <img src="../Images/slides/<%#Eval("Anh") %>" alt="Slide" />
                            <div class="caption-group">
                                <h2 class="caption title"><%# Eval("Tilte") %></span>
                                </h2>
                                <h4 class="caption subtitle"><%# Eval("Type") %></h4>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:ListView>
            </ul>
        </div>
        <!-- ./Slider -->
    </div>
    <!-- End slider area -->

    <!-- Begin promo area -->
    <div class="promo-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo1">
                        <i class="fa fa-refresh"></i>
                        <p>30 ngày đổi trả</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo2">
                        <i class="fa fa-truck"></i>
                        <p>Bảo hành dài hạn</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo3">
                        <i class="fa fa-lock"></i>
                        <p>Bảo mật thanh toán</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo4">
                        <i class="fa fa-automobile"></i>
                        <p>Nhiều loại xe mới</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End promo area -->

    <!-- Begin main content area -->
    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">Xe mới nhất</h2>
                        <div class="product-carousel">
                            <asp:ListView runat="server" ID="listCars">
                                <ItemTemplate>
                                    <div class="single-product col-md-3">
                                        <div class="product-f-image">
                                            <img class="img-product" src="../Images/Cars/<%# Eval("Anh") %>" alt="" />
                                            <div class="product-hover">
                                                <a href="GioHang.aspx?id=<%# Eval("MaXe") %>" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
                                                <a href="ChiTiet.aspx?id=<%# Eval("MaXe") %>" class="view-details-link"><i class="fa fa-link"></i>Xem chi tiết</a>
                                            </div>
                                        </div>

                                        <h2><a href="ChiTiet.aspx?id=<%# Eval("MaXe") %>"><%# Eval("TenXe") %></a></h2>
                                        <div class="product-wid-price <%# Eval("GiamGia").ToString().Equals("0") ? "none-display" : "" %>">
                                            <span class="text-uppercase">Giảm &nbsp</span><ins class="text-danger"><%#String.Format("{0:n0}", float.Parse(Eval("GiamGia").ToString()))%> %</ins>
                                        </div>
                                        <div class="product-carousel-price">
                                            <ins><%#String.Format("{0:n0}", float.Parse(Eval("GiaBan").ToString()))%> VNĐ</ins> <%--<del>$100.00</del>--%>
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
    <!-- End main content area -->

    <!-- Begin brands area -->
    <div class="brands-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">

                    <div class="container">
                        <br />
                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <% BanOtoEntities db = new BanOtoEntities();%>
                                <% var a = db.ThuongHieux.ToList(); %>
                                <% int slide = a.Count % 4; %>
                                <%for (int i = 0; i < slide; i++)
                                    { %>
                                <li data-target="#myCarousel" data-slide-to="<%= i %>" class="<% if (i == 0)
                                    { %>active<% } %>"></li>
                                <% }%>
                            </ol>
                            <% var total = 0; %>
                            <div class="carousel-inner" role="listbox">
                                <% for (int i = 0; i < slide; i++)
                                    { %>
                                <!-- Wrapper for slides -->
                                <% var count = 0; %>
                                <%var list = a.Skip(total).ToList(); %>

                                <div class="item <% if (i == 0)
                                    { %>active<% } %>">
                                    <% foreach (var item in list)
                                        { %>
                                    <a href="Xe.aspx?thuonghieu=<%= item.MaTH %>">
                                        <img class="img-logo" src="../Images/logo/<%= item.Anh %>" />
                                        <% count++; %>
                                        <% if (count > 3) { total += 4; break; }%>
                                    </a>
                                    <%} %>
                                </div>
                                <%} %>
                                <!-- Left and right controls -->
                                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End brands area -->


    <!-- Begin product widget area -->
    <div class="product-widget-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">Đang giảm giá</h2>
                        <a href="Xe.aspx?type=khuyenmai" class="wid-view-more">Xem tất cả</a>
                        <asp:ListView runat="server" ID="listKhuyenmai">
                            <ItemTemplate>
                                <div class="single-wid-product">
                                    <a href="ChiTiet.aspx?<%# Eval("MaXe") %>">
                                        <img src="../Images/Cars/<%# Eval("Anh") %>" alt="" class="product-thumb" /></a>
                                    <h2><a href="ChiTiet.aspx?id=<%# Eval("MaXe") %>"><%# Eval("TenXe") %></a></h2>
                                    <div class="product-wid-price">
                                        <span class="text-uppercase">Giảm &nbsp</span><ins class="text-danger"><%#String.Format("{0:n0}", float.Parse(Eval("GiamGia").ToString()))%> %</ins>
                                    </div>
                                    <div class="product-wid-price">
                                        <ins><%#String.Format("{0:n0}", float.Parse(Eval("GiaBan").ToString()))%> VNĐ</ins>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">Quan tâm nhiều</h2>
                        <a href="Xe.aspx?type=quantam" class="wid-view-more">Xem tất cả</a>
                        <asp:ListView runat="server" ID="listQuanTam">
                            <ItemTemplate>
                                <div class="single-wid-product">
                                    <a href="ChiTiet.aspx?id=<%# Eval("MaXe") %>">
                                        <img src="../Images/Cars/<%# Eval("Anh") %>" alt="" class="product-thumb" /></a>
                                    <h2><a href="ChiTiet.aspx?id=<%# Eval("MaXe") %>"><%# Eval("TenXe") %></a></h2>

                                    <div class="product-wid-price <%# Eval("GiamGia").ToString().Equals("0") ? "none-display" : "" %>">
                                        <span class="text-uppercase">Giảm &nbsp</span><ins class="text-danger"><%#String.Format("{0:n0}", float.Parse(Eval("GiamGia").ToString()))%> %</ins>
                                    </div>
                                    <div class="product-wid-price">
                                        <ins><%#String.Format("{0:n0}", float.Parse(Eval("GiaBan").ToString()))%> VNĐ</ins>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">Xe mới</h2>
                        <a href="Xe.aspx?type=xemoi" class="wid-view-more">Xem tất cả</a>
                        <asp:ListView runat="server" ID="listNew">
                            <ItemTemplate>
                                <div class="single-wid-product">
                                    <a href="single-product.html">
                                        <img src="../Images/Cars/<%# Eval("Anh") %>" alt="" class="product-thumb" /></a>
                                    <h2><a href="ChiTiet.aspx?id=<%# Eval("MaXe") %>"><%# Eval("TenXe") %></a></h2>
                                    <div class="product-wid-price <%# Eval("GiamGia").ToString().Equals("0") ? "none-display" : "" %>">
                                        <span class="text-uppercase">Giảm &nbsp</span><ins class="text-danger"><%#String.Format("{0:n0}", float.Parse(Eval("GiamGia").ToString()))%> %</ins>
                                    </div>
                                    <div class="product-wid-price">
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
    <!-- End product widget area -->

    <script>
        jQuery(document).ready(function () {
            $("#servicesleft > li").eq(0).addClass("active");
        });
    </script>
</asp:Content>
