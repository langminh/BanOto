<%@ Page Title="Chi tiết" Language="C#" MasterPageFile="~/Client.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="ChiTiet.aspx.cs" Inherits="BanOto.ChiTiet" %>

<%@ Import Namespace="BanOto.Helper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Asset/Client/css/detail.css" rel="stylesheet" />
    <link href="Asset/Client/css/owl.carousel.css" rel="stylesheet" />
    <style>
        .chat {
            list-style: none;
            margin: 0;
            padding: 0;
            background-color: lightblue;
            width: 100%;
            height: 400px;
            overflow: auto;
        }

            .chat li {
                margin-bottom: 10px;
                padding-bottom: 5px;
                border-bottom: 1px dotted #B3A9A9;
                padding-top: 10px;
            }

                .chat li.left .chat-body {
                    margin-left: 60px;
                    padding: 0 10px;
                }

                .chat li.right .chat-body {
                    margin-right: 60px;
                }


                .chat li .chat-body p {
                    margin: 0 30px;
                    color: black;
                    text-align: justify;
                }

        img.img-circle {
            max-width: 75px;
        }

        .panel .slidedown .glyphicon, .chat .glyphicon {
            margin-right: 5px;
        }

        .panel-body {
            overflow-y: scroll;
            height: 250px;
        }

        ::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            background-color: #F5F5F5;
        }

        ::-webkit-scrollbar {
            width: 12px;
            background-color: #F5F5F5;
        }

        ::-webkit-scrollbar-thumb {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Chi tiết &nbsp
                            <asp:Label runat="server" ID="lbName"></asp:Label></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>


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

                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Xe cùng loại</h2>
                        <asp:ListView runat="server" ID="listCungLoai">
                            <ItemTemplate>
                                <ul>
                                    <li><a href="Xe.aspx?id=<%# Eval("MaXe") %>"><%# Eval("TenXe") %></a></li>
                                </ul>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="row">
                            <div class="col-md-12">

                                <div class="gallery">
                                    <div class="carousel">
                                        <% for (int i = 0; i < anhs.Count; i++)
                                            {%>
                                        <%{
                                                var a = i; %>
                                        <input type="radio" id="image<%= a+1 %>" name="gallery-control" />
                                        <%} %>
                                        <%} %>
                                        <input type="checkbox" id="fullscreen" name="gallery-fullscreen-control" />

                                        <div class="wrap-img">
                                            <% for (int i = 0; i < anhs.Count; i++)
                                                { %>
                                            <figure>
                                                <label for="fullscreen">
                                                    <img src="../Images/Cars/<%= anhs[i].Src %>" />
                                                </label>
                                            </figure>
                                            <%} %>
                                        </div>
                                        <div class="thumbnails">
                                            <div class="slider">
                                                <div class="indicator"></div>
                                            </div>
                                            <% for (int i = 0; i < anhs.Count; i++)
                                                {
                                                    var a = i;%>
                                            <label for="image<%= a+1 %>" class="thumb" style="background-image: url('../Images/Cars/<%= anhs[i].Src %>')"></label>
                                            <%} %>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-12">
                                <div class="product-inner">
                                    <h2 class="product-name">
                                        <asp:HiddenField runat="server" ID="lbMaXe" />
                                        <asp:Label runat="server" ID="lbNameCar" Text="San pham"></asp:Label></h2>
                                    <div class="product-inner-price">
                                        <ins><span>Giá: </span>
                                            <asp:Label runat="server" ID="lbGia" Text="20000090"></asp:Label></ins>
                                    </div>

                                    <div class="cart">
                                        <div class="quantity">
                                            <span>Số lượng: </span>
                                            <input type="number" runat="server" id="txtSoLuong" size="10" class="input-text qty text" title="Qty" value="1" name="quantity" min="1" step="1" />
                                        </div>
                                        <asp:Button runat="server" ID="btnCart" OnClick="btnCart_Click" CssClass="add_to_cart_button" Text="Thêm vào giỏ hàng"></asp:Button>
                                    </div>

                                    <div role="tabpanel" class="tab">
                                        <ul class="product-tab" role="tablist">
                                            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Mô tả</a></li>
                                            <li role="presentation"><a href="#product" aria-controls="product" role="tab" data-toggle="tab">Thông số kỹ thuật</a></li>
                                            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Đánh giá</a></li>
                                        </ul>
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="home">
                                                <h2>Thông tin sản phẩm</h2>
                                                <asp:Literal ID="MyLiteral" runat="server" />
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="product">
                                                <h2>Thông số kỹ thuật</h2>
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <th colspan="2">Thông tin chi tiết</th>
                                                        </tr>
                                                        <tr>
                                                            <td>Loại xe</td>
                                                            <td>
                                                                <asp:Label runat="server" ID="lbLoaiXe"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Xuất xứ</td>
                                                            <td>
                                                                <asp:Label runat="server" ID="lbXuatXu"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Hãng xe</td>
                                                            <td>
                                                                <asp:Label runat="server" ID="lbHang"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Màu xe</td>
                                                            <td>
                                                                <asp:Label runat="server" ID="lbMau"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Dung tích xi lanh</td>
                                                            <td>
                                                                <asp:Label runat="server" ID="lbDungTichXiLanh"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Công suất</td>
                                                            <td>
                                                                <asp:Label runat="server" ID="lbCongSuay"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Loại hộp số</td>
                                                            <td>
                                                                <asp:Label runat="server" ID="lbLoaiHS"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Mô men xoắn</td>
                                                            <td>
                                                                <asp:Label runat="server" ID="lbMomen"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Kiểu truyền động</td>
                                                            <td>
                                                                <asp:Label runat="server" ID="lbKieuTD"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Khoảng sáng gầm xe</td>
                                                            <td>
                                                                <asp:Label runat="server" ID="lbKhoangSang"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Trọng lượng</td>
                                                            <td>
                                                                <asp:Label runat="server" ID="lbTrongLuong"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Kích thước</td>
                                                            <td>
                                                                <asp:Label runat="server" ID="lbDai"></asp:Label>
                                                                X
                                                                <asp:Label runat="server" ID="lbRong"></asp:Label>
                                                                X
                                                                <asp:Label runat="server" ID="lbCao"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Hệ thống treo trước/sau</td>
                                                            <td>
                                                                <asp:Label runat="server" ID="lbHTTreo"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Kích cỡ lốp trước/sau</td>
                                                            <td>
                                                                <asp:Label runat="server" ID="lbKClop"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Tăng áp</td>
                                                            <td>
                                                                <asp:Label runat="server" ID="lbTangAp"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Chống bó cứng phanh ABS</td>
                                                            <td>
                                                                <asp:Label runat="server" ID="lbABS"></asp:Label></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="profile">
                                                <h2>Đánh giá sản phẩm</h2>
                                                <div class="submit-review">
                                                    <% var session = Session[CommonContanst.USER_SESSION] as UserLogin; %>
                                                    <% if (session == null)
                                                        { %>
                                                    <p>
                                                        <label for="name">Họ tên</label>
                                                        <asp:TextBox runat="server" ID="txtTen" type="text" />
                                                    </p>
                                                    <p>
                                                        <label for="email">Email</label>
                                                        <asp:TextBox runat="server" TextMode="Email" ID="txtEmail" type="text" />
                                                    </p>
                                                    <%}
                                                        else
                                                        {%>
                                                    <asp:ListView runat="server" ID="listComment">
                                                        <LayoutTemplate>
                                                            <ul class="chat">
                                                                <asp:PlaceHolder runat="server" ID="ItemPlaceHolder"></asp:PlaceHolder>
                                                            </ul>
                                                        </LayoutTemplate>
                                                        <ItemTemplate>
                                                            <li class="left clearfix">
                                                                <div class="chat-body clearfix">
                                                                    <div class="header">
                                                                        <strong class="primary-font"><%# Eval("Email") %></strong> <small class="pull-right text-muted">
                                                                            <span class="glyphicon glyphicon-time"></span><%# Eval("CreateTime") %></small>
                                                                    </div>
                                                                    <p>
                                                                        <%# Eval("NoiDung") %>
                                                                    </p>
                                                                </div>
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                    <%} %>
                                                    <p>
                                                        <label for="review">Đánh giá của bạn</label>
                                                        <asp:TextBox runat="server" ID="txtNoiDung" TextMode="MultiLine" cols="30" Rows="10"></asp:TextBox>
                                                    </p>
                                                    <p>
                                                        <asp:Button runat="server" ID="btnSend" OnClick="btnSend_Click" Text="Gửi" />
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
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

    <script>
        $("#servicesleft > li").eq(2).addClass("active");
    </script>
    <script src="Asset/Client/js/owl.carousel.min.js"></script>
    <script src="Asset/Client/js/jquery.sticky.js"></script>
</asp:Content>
