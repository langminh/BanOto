<%@ Page Title="Trang cá nhân" Language="C#" MasterPageFile="~/Admin/Admin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="TrangCaNhan.aspx.cs" Inherits="BanOto.Admin.TrangCaNhan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- MAIN CONTENT -->
    <div class="main-content">
        <div class="container-fluid">
            <h1>Trang cá nhân</h1>
            <div class="panel panel-profile">
                <div class="clearfix">
                    <!-- LEFT COLUMN -->
                    <div class="profile-left">
                        <!-- PROFILE HEADER -->
                        <div class="profile-header">
                            <div class="overlay"></div>
                            <div class="profile-main">
                                <img runat="server" id="userImg" src="../Asset/Admin/assets/img/user-medium.png" class="img-circle" alt="Avatar">
                                <h3 class="name">
                                    <asp:Label runat="server" ID="userName" Text="Admin"></asp:Label></h3>
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
                                        <asp:Label runat="server" ID="lbPhone" Text="0977 206 532"></asp:Label></li>
                                    <li>Email
                                        <asp:Label runat="server" ID="lbEmail" Text="samuel@mydomain.com"></asp:Label></li>
                                    <li>Địa chỉ
                                        <asp:Label runat="server" ID="lbAddress" Text="Hà Nội"></asp:Label></li>
                                    <li>Giới tính
                                        <asp:Label runat="server" ID="lbGT" Text="Nam"></asp:Label></li>
                                </ul>
                            </div>
                            <div class="profile-info">
                                <h4 class="heading">Liên kết mạng xã hội</h4>
                                <ul class="list-inline social-icons">
                                    <li><a href="#" class="facebook-bg"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#" class="twitter-bg"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#" class="google-plus-bg"><i class="fa fa-google-plus"></i></a></li>
                                    <li><a href="#" class="github-bg"><i class="fa fa-github"></i></a></li>
                                </ul>
                            </div>

                        </div>
                        <!-- END PROFILE DETAIL -->
                    </div>
                    <!-- END LEFT COLUMN -->
                    <!-- RIGHT COLUMN -->
                    <div class="profile-right">
                        <h4 class="heading">
                            <asp:Label runat="server" ID="userFullName" Text="Samuel's Awards"></asp:Label></h4>
                        <!-- TABBED CONTENT -->
                        <div class="custom-tabs-line tabs-line-bottom left-aligned">
                            <ul class="nav" role="tablist">
                                <li class="active"><a href="#tab-bottom-left1" role="tab" data-toggle="tab">Hoạt động gần đây <asp:Label runat="server" ID="lbCount" CssClass="badge" Text=""></asp:Label></a></li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="tab-bottom-left1">
                                <asp:ListView runat="server" ID="listLogs">
                                    <LayoutTemplate>
                                        <ul class="list-unstyled activity-timeline">
                                            <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                                        </ul>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <li>
                                            <i class="fa <%# DataBinder.Eval( Container.DataItem ,"Type") %> activity-icon"></i>
                                            <p><%# Eval("Messages") %> <span class="timestamp"><%# Eval("TimeCreate") %></span></p>
                                        </li>
                                    </ItemTemplate>
                                </asp:ListView>
                               <%-- <ul class="list-unstyled activity-timeline">
                                    <li>
                                        <i class="fa fa-comment activity-icon"></i>
                                        <p>Commented on post <a href="#">Prototyping</a> <span class="timestamp">2 minutes ago</span></p>
                                    </li>
                                    <li>
                                        <i class="fa fa-cloud-upload activity-icon"></i>
                                        <p>Uploaded new file <a href="#">Proposal.docx</a> to project <a href="#">New Year Campaign</a> <span class="timestamp">7 hours ago</span></p>
                                    </li>
                                    <li>
                                        <i class="fa fa-plus activity-icon"></i>
                                        <p>Added <a href="#">Martin</a> and <a href="#">3 others colleagues</a> to project repository <span class="timestamp">Yesterday</span></p>
                                    </li>
                                    <li>
                                        <i class="fa fa-check activity-icon"></i>
                                        <p>Finished 80% of all <a href="#">assigned tasks</a> <span class="timestamp">1 day ago</span></p>
                                    </li>
                                </ul>--%>
                                <div class="margin-top-30 text-center"><a href="ThongBaoMoi.aspx" class="btn btn-default">Xem tất cả các hoạt động</a></div>
                            </div>

                        </div>
                        <!-- END TABBED CONTENT -->
                    </div>
                    <!-- END RIGHT COLUMN -->
                </div>
            </div>
            <div class="row">
            <div class="profile-info text-center">
                <h4 class="heading">Giới thiệu</h4>
                <p>Interactively fashion excellent information after distinctive outsourcing.</p>
            </div>
            <div class="text-center"><a href="#" class="btn btn-primary">Chỉnh sửa thông tin cá nhân</a></div>
        </div>
        </div>
    </div>
    <!-- END MAIN CONTENT -->
</asp:Content>
