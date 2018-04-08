<%@ Page Title="Thanh toán" Language="C#" MasterPageFile="~/Client.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="BanOto.ThanhToan" %>

<%@ Import Namespace="BanOto.Helper" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Thanh toán</h2>
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
                    <% if (items != null && items.Count > 0)
                        { %>
                    <div class="product-content-right">
                        <div class="woocommerce">
                            <div>
                                <% if (Session[CommonContanst.USER_SESSION] == null)
                                    { %>
                                <div class="woocommerce-info">
                                    Bạn có tài khoản? <a class="showlogin" data-toggle="collapse" href="#login-form-wrap" aria-expanded="false" aria-controls="login-form-wrap">Bấm đây để đăng nhập</a>
                                </div>

                                <div id="login-form-wrap" class="login collapse">


                                    <p>Nếu bạn đã có tài khoản, đăng nhập vào ô dưới đây để được giảm tối đa 20% phí vận chuyển. Nếu bạn là khách hàng mới hãy điền các thông tin vào bảng thông tin &amp; phiên giao hàng.</p>

                                    <p class="form-row form-row-first">
                                        <label for="username">
                                            Email <span class="required">*</span>
                                        </label>
                                        <asp:TextBox runat="server" TextMode="SingleLine" ID="txtUserName" name="username" CssClass="input-text"></asp:TextBox>
                                    </p>
                                    <p class="form-row form-row-last">
                                        <label for="password">
                                            Mật khẩu <span class="required">*</span>
                                        </label>
                                        <asp:TextBox TextMode="Password" runat="server" ID="txtPass" name="password" CssClass="input-text"></asp:TextBox>
                                    </p>
                                    <div class="clear"></div>


                                    <p class="form-row">
                                        <asp:Button runat="server" type="submit" OnClick="btnLogin_Click" Text="Đăng nhập" name="login" CssClass="button" />
                                        <label class="inline" for="rememberme">
                                            <asp:CheckBox runat="server" ID="chkRemember" name="rememberme" />
                                            Ghi nhớ đăng nhập
                                        </label>
                                    </p>
                                    <p class="lost_password">
                                        <a href="#">Quên mật khẩu?</a>
                                    </p>

                                    <div class="clear"></div>
                                </div>
                                <%} %>
                                <p>
                                    <asp:Label runat="server" ID="lbThongBao" Text="Bạn chưa đăng nhập"></asp:Label>
                                </p>
                            </div>
                            <div class="checkout">

                                <h3 id="order_review_heading">Đơn hàng của bạn</h3>
                                <div id="order_review" style="position: relative;">

                                    <asp:ListView runat="server" ID="ListCart">
                                        <LayoutTemplate>
                                            <table cellspacing="0" class="shop_table cart">
                                                <thead>
                                                    <tr>
                                                        <th class="product-remove">STT</th>
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
                                            </table>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <tr class="cart_item">
                                                <td>
                                                    <%# Container.DataItemIndex + 1 %>
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
                                                        <asp:Label runat="server" ID="txtQuanti" title="Số lượng mua" Text='<%# Bind("SoLuongMua")%>'></asp:Label>
                                                    </div>
                                                </td>

                                                <td class="product-subtotal">
                                                    <span class="amount"><%#String.Format("{0:n0}", float.Parse(Eval("TongTien").ToString()))%> VNĐ</span>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <div class="cart_totals ">
                                        <h2>Tổng tiền đơn hàng</h2>

                                        <table cellspacing="0">
                                            <tbody>
                                                <tr class="shipping">
                                                    <th>Loại hình Thanh toán</th>
                                                    <td>
                                                        <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="drTT_SelectedIndexChanged" CssClass="form-control" ID="drTT" DataTextField="TenTT" DataValueField="MaTT"></asp:DropDownList></td>
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
                                    <%-- <table class="shop_table">
                                        <thead>
                                            <tr>
                                                <th class="product-name">Tên xe</th>
                                                <th class="product-total">Tổng tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="cart_item">
                                                <td class="product-name">Ship Your Idea <strong class="product-quantity">× 1</strong> </td>
                                                <td class="product-total">
                                                    <span class="amount">£15.00</span> </td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr class="shipping">
                                                <th>Vận chuyển</th>
                                                <td>Tàu thủy
                                                </td>
                                            </tr>


                                            <tr class="order-total">
                                                <th>Tổng</th>
                                                <td><strong><span class="amount">£15.00</span></strong> </td>
                                            </tr>

                                        </tfoot>
                                    </table>--%>
                                    <%--                                    <div id="payment">
                                        <ul class="payment_methods methods">
                                            <li class="payment_method_bacs">
                                                <input type="radio" data-order_button_text="" checked="checked" value="bacs" name="payment_method" class="input-radio" id="payment_method_bacs" />
                                                <label for="payment_method_bacs">Chuyển khoản trực tiếp </label>
                                                <div class="payment_box payment_method_bacs">
                                                    <p>
                                                        Thanh toán trực tiếp vào tài khoản ngân hàng của chúng tôi. Vui lòng sử dụng ID đơn đặt hàng của bạn làm tham chiếu thanh toán. Đơn đặt hàng của bạn sẽ được được vận chuyển khi bạn tiến hành thanh toán.
                                                    </p>
                                                </div>
                                            </li>
                                            <li class="payment_method_paypal">
                                                <input type="radio" data-order_button_text="Proceed to PayPal" value="paypal" name="payment_method" class="input-radio" id="payment_method_paypal" />
                                                <label for="payment_method_paypal">
                                                    PayPal
                                                    <img alt="PayPal Acceptance Mark" src="https://www.paypalobjects.com/webstatic/mktg/Logo/AM_mc_vs_ms_ae_UK.png"><a title="What is PayPal?" onclick="javascript:window.open('https://www.paypal.com/gb/webapps/mpp/paypal-popup','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;" class="about_paypal" href="https://www.paypal.com/gb/webapps/mpp/paypal-popup">What is PayPal?</a>
                                                </label>
                                                <div style="display: none;" class="payment_box payment_method_paypal">
                                                    <p>
                                                        Thanh toán qua PayPal; bạn có thể thanh toán bằng thẻ tín dụng nếu bạn có tài khoản PayPal.
                                                    </p>
                                                </div>
                                            </li>
                                        </ul>
                                        <div class="form-row place-order">
                                            <input runat="server" type="submit" data-value="Place order" value="Tiến hành đặt hàng" id="place_order" name="woocommerce_checkout_place_order" class="button alt" />
                                        </div>
                                        <div class="clear"></div>
                                    </div>--%>
                                </div>
                                <div id="customer_details" class="col2-set">
                                    <div class="col-md-12">
                                        <div class="woocommerce-billing-fields">
                                            <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="txtHoTen">
                                                    Họ và tên
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <asp:TextBox runat="server" placeholder="" ID="txtHoTen" ClientIDMode="Static" CssClass="input-text "></asp:TextBox>
                                            </p>
                                            <div class="clear"></div>
                                            <p id="billing_address_1_field" class="form-row form-row-wide address-field validate-required">
                                                <label class="" for="txtDiaChi">
                                                    Địa chỉ
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <asp:TextBox placeholder="Địa chỉ" runat="server" ID="txtDiaChi" ClientIDMode="Static" CssClass="input-text "></asp:TextBox>
                                            </p>
                                            <div class="clear"></div>
                                            <p id="billing_email_field" class="form-row form-row-first validate-required validate-email">
                                                <label class="" for="txtEmail">
                                                    Email<abbr title="required" class="required">*</abbr>
                                                </label>
                                                <asp:TextBox placeholder="" runat="server" ClientIDMode="Static" ID="txtEmail_Booking" CssClass="input-text "></asp:TextBox>
                                            </p>
                                            <p id="billing_phone_field" class="form-row form-row-last validate-required validate-phone">
                                                <label class="" for="billing_phone">
                                                    Điện thoại
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <asp:TextBox runat="server" ID="txtSdt" CssClass="input-text " />
                                            </p>
                                            <div class="clear"></div>
                                            <p id="btn" class="form-row form-row-last validate-required validate-phone">
                                                <asp:Button runat="server" ID="btnBooking" Text="Đặt hàng" OnClick="btnBooking_Click" />
                                            </p>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <%}
                    else
                    { %>
                    <div class="text-center">
                        <p>Không có sản phẩm nào trong giỏ hàng của bạn. Hãy tiếp tục tìm kiếm chiếc xe 
                            bạn yêu thích, hoặc <a href="TrangChu.aspx">&nbsp;Bấm vào đây</a>&nbsp;để quay lại <a href="TrangChu.aspx">trang
                            chủ</a>
                        </p>
                        <a href="Xe.aspx" class="btn btn-primary">Tiếp tục mua hàng</a>
                    </div>
                    <%} %>
                </div>
            </div>
        </div>
    </div>

    <script>
        $("#servicesleft > li").eq(4).addClass("active");
    </script>
</asp:Content>
