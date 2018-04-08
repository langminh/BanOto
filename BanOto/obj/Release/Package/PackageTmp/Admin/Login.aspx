<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Login.aspx.cs" Inherits="BanOto.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập hệ thống</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="../Asset/Admin/assets/vendor/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../Asset/Admin/assets/vendor/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../Asset/Admin/assets/vendor/linearicons/style.css" />
    <link rel="stylesheet" href="../Asset/Admin/assets/vendor/chartist/css/chartist-custom.css" />
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="../Asset/Admin/assets/css/main.css" />
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="../Asset/Admin/assets/css/demo.css" />
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet" />
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="../Asset/Admin/assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" sizes="96x96" href="../Asset/Admin/assets/img/favicon.png" />

    <script src="../Asset/Admin/assets/vendor/jquery/jquery.min.js"></script>
    <script src="../Asset/Admin/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="../Asset/Admin/assets/vendor/bootstrap/js/bootstrap-notify.min.js"></script>

</head>
<body>
    <!-- WRAPPER -->
    <div id="wrapper">
        <div class="vertical-align-wrap">
            <div class="vertical-align-middle">
                <div class="auth-box ">
                    <div class="left">
                        <div class="content">
                            <div class="header">
                                <div class="logo text-center">
                                    <img src="../Asset/Admin/assets/img/logo-dark.png" alt="Klorofil Logo"/>
                                </div>
                                
                                <p class="lead">Đăng nhập hệ thống</p>
                            </div>
                            <form id="form1" class="form-auth-small"  runat="server">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <div>
                                    <div class="form-group">
                                        <label for="signin-email" class="control-label sr-only">Tên đăng nhập</label>
                                        <asp:TextBox TextMode="SingleLine" runat="server" CssClass="form-control" ID="txtUsername" placeholder="Tên đăng nhập"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="signin-password" class="control-label sr-only">Mật khẩu</label>
                                        <asp:TextBox TextMode="Password" runat="server" CssClass="form-control" ID="txtPassword" placeholder="Mật khẩu"></asp:TextBox>
                                    </div>
                                    <div class="form-group clearfix">
                                        <label class="fancy-checkbox element-left">
                                            <asp:CheckBox runat="server" ID="chkRemember"></asp:CheckBox>
                                            <span>Ghi nhớ đăng nhập</span>
                                        </label>
                                    </div>
                                    <asp:Button runat="server" OnClick="btnLogin_Click" ID="btnLogin" CssClass="btn btn-primary btn-lg btn-block" Text="Đăng nhập"></asp:Button>
                                    <div class="bottom">
                                        <span class="helper-text"><i class="fa fa-lock"></i><asp:LinkButton runat="server">Quên mật khẩu?</asp:LinkButton></span>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="right">
                        <div class="overlay"></div>
                        <div class="content text">
                            <h1 class="heading">Hệ thống quản trị của quản trị viên</h1>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- END WRAPPER -->
</body>
</html>
