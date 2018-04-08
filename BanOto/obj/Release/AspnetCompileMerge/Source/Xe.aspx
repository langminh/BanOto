<%@ Page Title="Danh sách xe" Language="C#" MasterPageFile="~/Client.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Xe.aspx.cs" Inherits="BanOto.Xe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        a.add_to_cart_button {
            position:  unset !important;
            bottom: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>
                            <asp:Label runat="server" ID="lbType"></asp:Label></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="input-group col-md-11">
                        <div class="form-group col-md-2">
                            <label for="filterHang">Lọc theo</label>
                            <asp:DropDownList runat="server" ID="DropDownList1" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ClientIDMode="Static" CssClass="form-control">
                                <asp:ListItem Value="0" Text="Mặc định" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Theo tên(A->Z)"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Theo tên(Z->A)"></asp:ListItem>
                                <asp:ListItem Value="3" Text="Theo giá(tăng dần)"></asp:ListItem>
                                <asp:ListItem Value="4" Text="Theo giá(giảm dần)"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="filterHang">Hãng xe</label>
                            <asp:DropDownList runat="server" ID="filterHang" DataTextField="TenTH" DataValueField="MaTH" ClientIDMode="Static" OnSelectedIndexChanged="filterHang_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <!-- /btn-group -->
                        <div class="form-group col-md-2">
                            <label for="filterLoaiHS">Loại hộp số</label>
                            <asp:DropDownList runat="server" ID="filterLoaiHS" AutoPostBack="true" OnSelectedIndexChanged="filterLoaiHS_SelectedIndexChanged" DataTextField="TenHS" DataValueField="MaHS" ClientIDMode="Static" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="filterMau">Màu sắc</label>
                            <asp:DropDownList runat="server" ID="filterMau" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="filterMau_SelectedIndexChanged" DataTextField="TenMau" DataValueField="MaMau"></asp:DropDownList>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="filterLoaiXe">Loại xe</label>
                            <asp:DropDownList runat="server" ID="filterLoaiXe" ClientIDMode="Static" CssClass="form-control" DataTextField="TenLX" AutoPostBack="true" OnSelectedIndexChanged="filterLoaiXe_SelectedIndexChanged" DataValueField="MaLX"></asp:DropDownList>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="filterXX">Xuất xứ</label>
                            <asp:DropDownList runat="server" DataTextField="TenXX" DataValueField="MaXX" ID="filterXX" ClientIDMode="Static" AutoPostBack="true" OnSelectedIndexChanged="filterXX_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <!-- /btn-group -->
                    </div>
                    <!-- /input-group -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <div class="row">
                <asp:ListView runat="server" ID="listCars">
                    <ItemTemplate>
                        <div class="col-md-3 col-sm-6">
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
                </asp:ListView>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="product-pagination text-center">
                        <nav>

                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="listCars" PageSize="16">
                                <Fields>
                                    <asp:NextPreviousPagerField PreviousPageText="Trang trước" ShowFirstPageButton="false" ShowNextPageButton="false" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField LastPageText="Trang cuối" NextPageText="Trang kế" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                                </Fields>
                            </asp:DataPager>
                            <%--                            <ul class="pagination">
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>--%>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">

                    <h2>Có thể bạn quan tâm</h2>
                    <asp:ListView runat="server" ID="listQuanTam">
                        <ItemTemplate>
                            <div class="col-md-3 col-sm-6">
                                <div class="single-shop-product">
                                    <div class="product-upper">
                                        <img class="img-car" src="../Images/Cars/<%# Eval("Anh") %>" alt="" />
                                    </div>
                                    <h2><a href="ChiTiet"><%# Eval("TenXe") %></a></h2>
                                    <div class="product-wid-price <%# Eval("GiamGia").ToString().Equals("0") ? "none-display" : "" %>">
                                        <span class="text-uppercase">Giảm &nbsp</span><ins class="text-danger"><%#String.Format("{0:n0}", float.Parse(Eval("GiamGia").ToString()))%> %</ins>
                                    </div>
                                    <div class="product-carousel-price">
                                        <ins><%#String.Format("{0:n0}", float.Parse(Eval("GiaBan").ToString()))%> VNĐ</ins> <%--<del>$100.00</del>--%>
                                    </div>

                                    <div class="product-option-shop">
                                        <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="ChiTiet.aspx?id=<%# Eval("MaXe") %>">Xem chi tiết</a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>

        </div>
    </div>
    <% if (isOld)
        { %>
    <script>
        $("#servicesleft > li").eq(2).addClass("active");
    </script>
    <%} %>
    <%else
        {%>
    <script>
        $("#servicesleft > li").eq(1).addClass("active");
    </script>
    <%} %>
</asp:Content>
