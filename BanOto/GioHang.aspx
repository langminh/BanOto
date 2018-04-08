<%@ Page Title="Giỏ hàng" Language="C#" MasterPageFile="~/Client.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="BanOto.GioiHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        input#ContentPlaceHolder1_btnThanhToan {
            background: forestgreen;
        }

        input#ContentPlaceHolder1_txtCoupon_code {
            height: 42px;
            text-align: center;
            width: 75px;
        }

        .cart_totals {
            float: none !important;
            margin-bottom: 50px;
            width: 40%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Giỏ hàng</h2>
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
                    <div class="row">
                        <div class="product-content-right">
                            <div class="woocommerce">
                                <asp:ListView runat="server" ID="ListCart" OnItemCommand="ListCart_ItemCommand">
                                    <LayoutTemplate>
                                        <table cellspacing="0" class="shop_table cart">
                                            <thead>
                                                <tr>
                                                    <th class="product-remove">&nbsp;</th>
                                                    <th class="product-thumbnail">&nbsp;</th>
                                                    <th class="product-name">Tên</th>
                                                    <th class="product-price">Giá</th>
                                                    <th class="product-quantity">Số lượng</th>
                                                    <th class="product-subtotal">Tổng tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:PlaceHolder runat="server" ID="ItemPlaceHolder"></asp:PlaceHolder>
                                            </tbody>
                                            <%--                                        <tfoot>
                                            <tr>
                                                <td class="actions" colspan="6">
                                                    <div class="coupon">
                                                        <asp:HiddenField runat="server" ID="txtChange" />
                                                        <label for="coupon_code">Thay đổi số lượng:</label>
                                                        <asp:TextBox runat="server" type="text" placeholder="Số lượng" min="1" step="1" title="Thay đổi số lượng mua" value="" id="txtCoupon_code" CssClass="input-text" name="coupon_code" ></asp:TextBox>
                                                    </div>
                                                    <input type="submit" runat="server" value="Cập nhật" id="btnUpdateCart" name="update_cart" class="button" />
                                                    <input type="submit" runat="server" id="btnCheckOut" value="Thanh Toán" name="proceed" class="checkout-button button alt wc-forward" />
                                                </td>
                                            </tr>
                                        </tfoot>--%>
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr class="cart_item">
                                            <td class="product-remove">
                                                <asp:LinkButton title="Xóa khỏi giỏ hàng" runat="server" CommandName="DeleteItem" CommandArgument='<%# Eval("MaXe") %>' CssClass="remove">×</asp:LinkButton>
                                                <asp:LinkButton runat="server" title="Cập nhật thay đổi số lượng" CommandName="UpdateItem" CommandArgument='<%# Eval("MaXe") %>' CssClass="fa fa-edit text-success"></asp:LinkButton>
                                            </td>

                                            <td class="product-thumbnail">
                                                <a href="single-product.html">
                                                    <img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="../Images/Cars/<%# Eval("Anh") %>" /></a>
                                            </td>

                                            <td class="product-name">
                                                <a href="ChiTiet.aspx?id=<%# Eval("MaXe") %>"><%# Eval("TenXe") %></a>
                                            </td>

                                            <td class="product-price">
                                                <span class="amount"><%#String.Format("{0:n0}", float.Parse(Eval("GiaBan").ToString()))%> VNĐ</span>
                                            </td>

                                            <td class="product-quantity">
                                                <div class="quantity buttons_added">
                                                    <asp:TextBox runat="server" ID="txtQuanti" ReadOnly="true" TextMode="Number" size="4" CssClass="input-text qty text" title="Số lượng mua" Text='<%# Bind("SoLuongMua")%>' min="0" step="1" />
                                                </div>
                                            </td>

                                            <td class="product-subtotal">
                                                <span class="amount"><%#String.Format("{0:n0}", float.Parse(Eval("TongTien").ToString()))%> VNĐ</span>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:ListView>
                                <% if (items != null && items.Count > 0)
                                    { %>

                                <div class="cart_totals ">
                                    <h2>Tổng tiền đơn hàng</h2>

                                    <table cellspacing="0">
                                        <tbody>
                                            <tr class="shipping">
                                                <th>Loại hình vận chuyển</th>
                                                <td>
                                                    <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="drVC_SelectedIndexChanged" CssClass="form-control" ID="drVC" DataTextField="TenVC" DataValueField="MaVC"></asp:DropDownList></td>
                                            </tr>
                                            <tr>
                                                <td>Phí vận chuyển</td>
                                                <td>
                                                    <asp:Label runat="server" ID="lbPhi"></asp:Label></td>
                                            </tr>
                                            <tr class="order-total">
                                                <th>Tổng đơn hàng</th>
                                                <td><strong><span class="amount">
                                                    <asp:Label runat="server" ID="lbTong"></asp:Label></span></strong> </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <asp:HiddenField runat="server" ID="txtChange" />
                                            <label for="coupon_code">Thay đổi số lượng:</label>
                                            <asp:TextBox runat="server" TextMode="Number" placeholder="Số lượng" min="1" step="1" title="Thay đổi số lượng mua" value="" ID="txtCoupon_code" CssClass="input-text" name="coupon_code"></asp:TextBox>
                                            <asp:Button runat="server" Text="Cập nhật" ID="btnUpdate" name="update_cart" OnClick="btnUpdate_Click" class="button" />
                                            <asp:Button runat="server" ID="btnThanhToan" Text="Thanh Toán" OnClick="btnThanhToan_Click" name="proceed" CssClass=" button alt wc-forward btn-success" />
                                        </div>
                                    </div>
                                </div>
                                <%}
                                    else
                                    {%>
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
                    <div class="row">
                        <div class="cart-collaterals">
                            <div class="cross-sells">
                                <h2>Có thể bạn quan tâm</h2>
                                <ul class="products">
                                    <asp:ListView runat="server" ID="list">
                                        <ItemTemplate>
                                            <li class="product">
                                                <a href="ChiTiet.aspx?id=<%# Eval("MaXe") %>">
                                                    <img width="325" height="325" alt="T_4_front" class="attachment-shop_catalog wp-post-image" src="../Images/Cars/<%# Eval("Anh") %>" />
                                                    <h3><%# Eval("TenXe") %></h3>
                                                    <span class="price"><span class="amount"><%#String.Format("{0:n0}", float.Parse(Eval("GiaBan").ToString()))%> VNĐ</span></span>
                                                </a>

                                                <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="22" rel="nofollow" href="GioHang.aspx?id=<%# Eval("MaXe") %>">Thêm vào giỏ hàng</a>
                                            </li>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script>
        $("#servicesleft > li").eq(3).addClass("active");
    </script>

</asp:Content>
