<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="BanOto.DangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
    <link href="Asset/Admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="Asset/Admin/assets/vendor/jquery/jquery.min.js"></script>
    <script src="Asset/Admin/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="Asset/Admin/assets/vendor/bootstrap/js/bootstrap-notify.min.js"></script>
    <link href="Asset/Client/login.css" rel="stylesheet" />
    <link rel="icon" type="image/png" sizes="200x120" href="../Images/logo.png" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <div class="row">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="body"></div>
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-6">
                                    <a href="#" class="active" id="login-form-link">Đăng Nhập</a>
                                </div>
                                <div class="col-xs-6">
                                    <a href="#" id="register-form-link">Đăng ký</a>
                                </div>
                            </div>
                            <hr />
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div id="login-form" role="form" style="display: block;">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" type="text" ID="txtUsername" TabIndex="1" CssClass="form-control" placeholder="Username"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" TextMode="Password" ID="txtPassword" TabIndex="2" CssClass="form-control" placeholder="Password"></asp:TextBox>
                                        </div>
                                        <div class="form-group text-center">
                                            <asp:CheckBox runat="server" TabIndex="3" class="" ID="chkRemember" />
                                            <label for="remember">Ghi nhớ đăng nhập</label>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <asp:Button runat="server" ID="btnLogin" OnClick="btnLogin_Click" TabIndex="4" class="form-control btn btn-login" Text="Đăng nhập" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="text-center">
                                                        <a href="https://phpoll.com/recover" tabindex="5" class="forgot-password">Quên mật khẩu?</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="register-form" role="form" style="display: none;">

                                        <div class="form-group">
                                            <asp:TextBox runat="server" ID="txtFullName" TabIndex="1" class="form-control" placeholder="Họ và tên"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox TextMode="Email" runat="server" ID="txtEmail" TabIndex="2" class="form-control" placeholder="Email" value=""></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" ID="txtDiaChi" TabIndex="3" class="form-control" placeholder="Địa chỉ"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" ID="txtSdt" TabIndex="4" class="form-control" placeholder="Số điện thoại"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label class="radio-inline">
                                                <asp:RadioButton runat="server" TabIndex="5" ID="rdoNam"/>Nam
                                            </label>
                                            <label class="radio-inline">
                                                <asp:RadioButton runat="server" TabIndex="6" ID="rdoNu"/>Nữ
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" ID="txtMatKhau" TabIndex="7" class="form-control" placeholder="Mật khẩu" TextMode="Password"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" ID="txtNhapLai" TabIndex="8" class="form-control" placeholder="Nhập lại mật khẩu" TextMode="Password"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <asp:Button runat="server" ID="btnDangKy" OnClick="btnDangKy_Click" tabindex="9" class="form-control btn btn-register" Text="Đăng ký"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        $(document).ready(function () {

            $('#login-form-link').click(function (e) {
                $("#login-form").delay(100).fadeIn(100);
                $("#register-form").fadeOut(100);
                $('#register-form-link').removeClass('active');
                $(this).addClass('active');
                e.preventDefault();
            });
            $('#register-form-link').click(function (e) {
                $("#register-form").delay(100).fadeIn(100);
                $("#login-form").fadeOut(100);
                $('#login-form-link').removeClass('active');
                $(this).addClass('active');
                e.preventDefault();
            });

        });

    </script>
</body>
</html>
