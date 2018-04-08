<%@ Page Title="Trang cá nhân" EnableEventValidation="false" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="BanOto.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Asset/Admin/assets/vendor/linearicons/style.css" />
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="../Asset/Admin/assets/css/main.css" />
    <style>
        .profile-left {
            padding-left: 0;
            top: 10px;
            float: left;
            width: 100% !important;
            height: 100%;
            position: relative;
            background-color: #F8F8F8;
        }

        .profile-detail {
            padding-bottom: 30px;
            width: 35% !important;
        }

        .profile-header .overlay {
            position: relative !important;
        }

        .profile-header .profile-main {
            position: relative;
            padding: 20px;
            height: 250px !important;
            background-image: url(../Asset/Admin/assets/img/profile-bg.png);
            background-repeat: no-repeat;
            background-size: cover;
        }

        .icon-img {
            position: absolute;
            z-index: 10;
            float: right;
            width: 30px;
            height: 30px;
            opacity: 0.5;
            margin: 10px 10px;
            color: white;
        }

            .icon-img:hover p.cls {
                opacity: 1;
                color: white;
                display: block;
                position: fixed;
            }

        p.cls {
            display: none;
            z-index: 10;
        }

        a.fa.fa-camera {
            font-size: 30px;
        }

        #edit-profile {
            background: none repeat scroll 0 0 #f4f4f4;
            margin-bottom: 30px;
            padding: 25px;
            margin-top: 10px;
        }

        div#login-form-wrap {
            margin-top: 10px;
            min-height: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Trang cá nhân</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        
        <div class="row">
            <!-- LEFT COLUMN -->

            <div class="profile-left">
                <!-- PROFILE HEADER -->
                <div class="profile-header">
                    <div class="icon-img">
                        <asp:LinkButton CssClass="fa fa-camera" data-toggle="collapse" href="#login-form-wrap" ToolTip="Cập nhật ảnh đại diện" runat="server">
                                
                        </asp:LinkButton>
                    </div>
                    <div class="overlay">
                    </div>
                    <div class="profile-main">
                        <img src="../Asset/Admin/assets/img/user-medium.png" runat="server" id="userImg" class="img-circle" alt="Avatar">
                        <h3 class="name">
                            <asp:Label runat="server" ID="userName"></asp:Label></h3>
                        <span class="online-status status-available">Available</span>
                    </div>
                </div>
                <!-- END PROFILE HEADER -->
                <!-- PROFILE DETAIL -->
                <div class="profile-detail">
                    <div class="profile-info">
                        <h4 class="heading">Thông tin cơ bản</h4>
                        <ul class="list-unstyled list-justify">
                            <li>Số điện thoại
                                        <asp:Label runat="server" ID="userFullName" Text="Full name"></asp:Label></li>
                            <li>Số điện thoại
                                        <asp:Label runat="server" ID="lbPhone" Text="0977 206 532"></asp:Label></li>
                            <li>Email
                                        <asp:Label runat="server" ID="lbEmail" Text="samuel@mydomain.com"></asp:Label></li>
                            <li>Địa chỉ
                                        <asp:Label runat="server" ID="lbAddress" Text="Hà Nội"></asp:Label></li>
                            <li>Giới tính
                                        <asp:Label runat="server" ID="lbGT" Text="Nam"></asp:Label></li>
                        </ul>
                    </div>

                    <div class="text-center"><a href="#edit-profile" data-toggle="collapse" class="btn btn-primary">Edit Profile</a></div>
                </div>
                <!-- END PROFILE DETAIL -->
            </div>
            <!-- END LEFT COLUMN -->
        </div>


        <div class="row">
            <div class="col-md-6">

                <div id="login-form-wrap" class="login collapse">
                    <div class="col-md-4">
                        <div class="btn-group">
                            <asp:FileUpload runat="server" ID="FileUpload1" CssClass="form-control" />
                            <asp:Button runat="server" OnClick="Unnamed_Click" CssClass="form-control" Text="Tải lên" />
                        </div>
                    </div>
                    <div class="col-md-8">
                        <asp:Image runat="server" ID="Image1" ImageUrl="Images/Cars/7.jpg" class="img-upload" />
                    </div>
                    <div class="clear"></div>

                </div>
            </div>
            <div class="col-md-6">

                <div id="edit-profile" class="login collapse">
                    <asp:Label runat="server" ID="lbThongBao"></asp:Label>
                    <h3>Thông tin cá nhân</h3>
                    <div class="form-horizontal">
                        <asp:HiddenField runat="server" ID="txtUserID" />
                        <div class="form-group">
                            <label class="col-md-3 control-label">Họ tên:</label>
                            <div class="col-md-8">
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtName"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Email:</label>
                            <div class="col-md-8">
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Địa chỉ:</label>
                            <div class="col-md-8">
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtAddress"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Số điện thoại:</label>
                            <div class="col-md-8">
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtPhone"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Giới tính:</label>
                            <div class="col-md-8">
                                <label class="radio-inline">
                                    <asp:RadioButton runat="server" ID="rdoNam" />
                                    Nam
                                </label>
                                <label class="radio-inline">
                                    <asp:RadioButton runat="server" ID="rdoNu" />
                                    Nữ
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Mật khẩu:</label>
                            <div class="col-md-8">
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtPass" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Nhập lại mật khẩu:</label>
                            <div class="col-md-8">
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtRePass" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div >
                        <asp:Button runat="server" ID="btnCreateOk" OnClick="btnCreateOk_Click" CssClass="btn btn-success" Text="Cập nhật"></asp:Button>
                    </div>
                </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="profile-info">
                <h4 class="heading">Social</h4>
                <ul class="list-inline social-icons">
                    <li><a href="#" class="facebook-bg"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#" class="twitter-bg"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#" class="google-plus-bg"><i class="fa fa-google-plus"></i></a></li>
                    <li><a href="#" class="github-bg"><i class="fa fa-github"></i></a></li>
                </ul>
            </div>
            <div class="profile-info">
                <h4 class="heading">About</h4>
                <p>Interactively fashion excellent information after distinctive outsourcing.</p>
            </div>
        </div>

    </div>

    </div>
</asp:Content>
