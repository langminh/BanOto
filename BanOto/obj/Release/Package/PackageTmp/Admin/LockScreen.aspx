<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="LockScreen.aspx.cs" Inherits="BanOto.Admin.LockScreen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập</title>
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

    <style>
        .outside {
            position: relative;
            height: 340px;
        }

        .inside {
            position: absolute;
            bottom: 0px;
            /* top: 200px; */
            margin-left: 5px;
        }
    </style>

</head>
<body>
    <!-- WRAPPER -->
    <div id="wrapper">

        <div class="vertical-align-wrap">
            <div class="vertical-align-middle">
                <div class="auth-box lockscreen clearfix">
                    <div class="content">
                        <form id="form1" runat="server" class="outside">
                            <h1 class="sr-only">Klorofil - Free Bootstrap dashboard</h1>
                            <div class="logo text-center">
                                <img src="../Asset/Admin/assets/img/logo-dark.png" runat="server" id="userImage" alt="Klorofil Logo" />
                            </div>
                            <div class="user text-center">
                                <img id="imgUser" src="../Asset/Admin/assets/img/user-medium.png" class="img-circle" alt="Avatar" />
                                <h2 class="name">
                                    <asp:Label runat="server" ID="userName"></asp:Label></h2>
                            </div>

                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <div class="input-group">
                                <asp:TextBox TextMode="Password" ID="txtPass" runat="server" CssClass="form-control" placeholder="Nhập mật khẩu..." />
                                <span class="input-group-btn">
                                    <asp:Button runat="server" CssClass="btn btn-primary" ID="btnLogin" Text="Đăng nhập" OnClick="btnLogin_Click"></asp:Button></span>
                            </div>

                            <div class="pull-left inside">
                                <asp:LinkButton runat="server" PostBackUrl="~/Admin/Login.aspx" Text="Quay về trang đăng nhập..."></asp:LinkButton>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END WRAPPER -->
</body>
</html>
