<%@ Page Title="Thanh toán" Language="C#" MasterPageFile="~/Client.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="BanOto.ThanhToan" %>

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
                        <form action="#">
                            <asp:TextBox runat="server" ID="txtSearch" TextMode="SingleLine" placeholder="Tìm xe..." />
                            <asp:Button runat="server" ID="btnSearch" Text="Tìm kiếm" />
                        </form>
                    </div>

                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Xe mới</h2>
                        <div class="thubmnail-recent">
                            <img src="../Asset/Client/img/product-thumb-1.jpg" class="recent-thumb" alt="" />
                            <h2><a href="single-product.html">Sony Smart TV - 2015</a></h2>
                            <div class="product-sidebar-price">
                                <ins>$700.00</ins> <del>$800.00</del>
                            </div>
                        </div>
                        <div class="thubmnail-recent">
                            <img src="../Asset/Client/img/product-thumb-1.jpg" class="recent-thumb" alt="" />
                            <h2><a href="single-product.html">Sony Smart TV - 2015</a></h2>
                            <div class="product-sidebar-price">
                                <ins>$700.00</ins> <del>$800.00</del>
                            </div>
                        </div>
                        <div class="thubmnail-recent">
                            <img src="../Asset/Client/img/product-thumb-1.jpg" class="recent-thumb" alt="" />
                            <h2><a href="single-product.html">Sony Smart TV - 2015</a></h2>
                            <div class="product-sidebar-price">
                                <ins>$700.00</ins> <del>$800.00</del>
                            </div>
                        </div>
                        <div class="thubmnail-recent">
                            <img src="../Asset/Client/img/product-thumb-1.jpg" class="recent-thumb" alt="" />
                            <h2><a href="single-product.html">Sony Smart TV - 2015</a></h2>
                            <div class="product-sidebar-price">
                                <ins>$700.00</ins> <del>$800.00</del>
                            </div>
                        </div>
                    </div>

                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Xe cùng loại</h2>
                        <ul>
                            <li><a href="#">Sony Smart TV - 2015</a></li>
                            <li><a href="#">Sony Smart TV - 2015</a></li>
                            <li><a href="#">Sony Smart TV - 2015</a></li>
                            <li><a href="#">Sony Smart TV - 2015</a></li>
                            <li><a href="#">Sony Smart TV - 2015</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">
                            <div class="woocommerce-info">
                                Bạn có tài khoản? <a class="showlogin" data-toggle="collapse" href="#login-form-wrap" aria-expanded="false" aria-controls="login-form-wrap">Bấm đây để đăng nhập</a>
                            </div>

                            <div id="login-form-wrap" class="login collapse">


                                <p>Nếu bạn đã có tài khoản, đăng nhập vào ô dưới đây để được giảm tối đa 20% phí vận chuyển. Nếu bạn là khách hàng mới hãy điền các thông tin vào bảng thông tin &amp; phiên giao hàng.</p>

                                <p class="form-row form-row-first">
                                    <label for="username">
                                        Email <span class="required">*</span>
                                    </label>
                                    <input runat="server" type="text" id="username" name="username" class="input-text" />
                                </p>
                                <p class="form-row form-row-last">
                                    <label for="password">
                                        Mật khẩu <span class="required">*</span>
                                    </label>
                                    <input type="password" runat="server" id="password" name="password" class="input-text" />
                                </p>
                                <div class="clear"></div>


                                <p class="form-row">
                                    <input runat="server" type="submit" value="Đăng nhập" name="login" class="button">
                                    <label class="inline" for="rememberme">
                                        <input runat="server" type="checkbox" value="forever" id="rememberme" name="rememberme">
                                        Ghi nhớ đăng nhập </label>
                                </p>
                                <p class="lost_password">
                                    <a href="#">Quên mật khẩu?</a>
                                </p>

                                <div class="clear"></div>
                            </div>

                            <div class="checkout">
                                <div id="customer_details" class="col2-set">
                                    <div class="col-md-12">
                                        <div class="woocommerce-billing-fields">
                                            <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">
                                                    Họ và tên
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input runat="server" type="text" value="" placeholder="" id="billing_first_name" name="billing_first_name" class="input-text " />
                                            </p>
                                            <div class="clear"></div>
                                            <p id="billing_address_1_field" class="form-row form-row-wide address-field validate-required">
                                                <label class="" for="billing_address_1">
                                                    Địa chỉ
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="Địa chỉ" runat="server" id="billing_address_1" name="billing_address_1" class="input-text " />
                                            </p>
                                            <div class="clear"></div>
                                            <p id="billing_email_field" class="form-row form-row-first validate-required validate-email">
                                                <label class="" for="billing_email">
                                                    Email<abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" runat="server" id="billing_email" name="billing_email" class="input-text " />
                                            </p>
                                            <p id="billing_phone_field" class="form-row form-row-last validate-required validate-phone">
                                                <label class="" for="billing_phone">
                                                    Điện thoại
                                                    <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" runat="server" id="billing_phone" name="billing_phone" class="input-text " />
                                            </p>
                                            <div class="clear"></div>
                                        </div>
                                    </div>
                                </div>
                                <h3 id="order_review_heading">Đơn hàng của bạn</h3>
                                <div id="order_review" style="position: relative;">
                                    <table class="shop_table">
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
                                    </table>
                                    <div id="payment">
                                        <ul class="payment_methods methods">
                                            <li class="payment_method_bacs">
                                                <input type="radio" data-order_button_text="" checked="checked" value="bacs" name="payment_method" class="input-radio" id="payment_method_bacs"/>
                                                <label for="payment_method_bacs">Chuyển khoản trực tiếp </label>
                                                <div class="payment_box payment_method_bacs">
                                                    <p>
                                                        Thanh toán trực tiếp vào tài khoản ngân hàng của chúng tôi. Vui lòng sử dụng ID đơn đặt hàng của bạn làm tham chiếu thanh toán. Đơn đặt hàng của bạn sẽ được được vận chuyển khi bạn tiến hành thanh toán.
                                                    </p>
                                                </div>
                                            </li>
                                            <li class="payment_method_paypal">
                                                <input type="radio" data-order_button_text="Proceed to PayPal" value="paypal" name="payment_method" class="input-radio" id="payment_method_paypal"/>
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
                                            <input runat="server" type="submit" data-value="Place order" value="Tiến hành đặt hàng" id="place_order" name="woocommerce_checkout_place_order" class="button alt"/>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $("#servicesleft > li").eq(4).addClass("active");
    </script>
</asp:Content>
