<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Admin/Admin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="BanOto.Admin.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Asset/Admin/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../Asset/Admin/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
    <script src="../Asset/Admin/assets/vendor/chartist/js/chartist.min.js"></script>
    <script src="../Asset/Admin/assets/scripts/klorofil-common.js"></script>
    <style>
        .col-md-4.cls {
            padding: 5px 55px;
            /* margin: 0 10px; */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- MAIN CONTENT -->
    <div class="main-content">
        <div class="container-fluid">
            <h1>Trang chủ</h1>
            <!-- OVERVIEW -->
            <div class="panel panel-headline">
                <div class="panel-heading">
                    <h3 class="panel-title">Tình trạng trong tuần</h3>
                    <p class="panel-subtitle">
                        <asp:Label runat="server" ID="time"></asp:Label>
                    </p>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="metric">
                                <span class="icon"><i class="fa fa-eye"></i></span>
                                <p>
                                    <asp:Label runat="server" ID="lbTruyCap" Text="" CssClass="number"></asp:Label>
                                    <span class="title">Lượt truy cập</span>
                                </p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="metric">
                                <span class="icon"><i class="fa fa-comment"></i></span>
                                <p>
                                    <asp:Label runat="server" ID="lbComment" Text="" CssClass="number"></asp:Label>
                                    <span class="title">Online</span>
                                </p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="metric">
                                <span class="icon"><i class="fa fa-shopping-bag"></i></span>
                                <p>
                                    <asp:Label runat="server" ID="lbSoild" Text="" CssClass="number"></asp:Label>
                                    <span class="title">sản phẩm đã bán</span>
                                </p>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="metric">
                                <span class="icon"><i class="fa fa-envelope-o"></i></span>
                                <p>
                                    <asp:Label runat="server" ID="lbMessage" Text="" CssClass="number"></asp:Label>
                                    <span class="title">Thông báo mới</span>
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">Lượt sản phẩm trong tháng</h3>
                            <div class="right">
                                <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                            </div>
                        </div>
                        <div class="panel-body no-padding">
                            <div class="row">
                                <div class="col-md-4 cls">
                                    <asp:Label runat="server" ID="lbTotalSoild" Text="120" CssClass="number"></asp:Label>
                                    <span class="info-label">Tổng lượng bán</span>
                                </div>
                                <div class="col-md-4 cls">
                                    <asp:Label runat="server" ID="lbTotalMonth" Text="" CssClass="number"></asp:Label>
                                    <span class="info-label">Trong tháng qua</span>
                                </div>
                                <div class="col-md-4 cls">
                                    <asp:Label Text="" runat="server" ID="lbTotalWeek" CssClass="number"></asp:Label>
                                    <span class="info-label">Trong tuần này</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">Lượt người dùng trong tháng</h3>
                            <div class="right">
                                <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                            </div>
                        </div>
                        <div class="panel-body no-padding">
                            <div class="row">
                                <div class="col-md-4 cls">
                                    <asp:Label runat="server" ID="Label1" Text="" CssClass="number"></asp:Label>
                                    <span class="info-label">Tổng lượt người truy cập</span>
                                </div>
                                <div class="col-md-4 cls">
                                    <asp:Label runat="server" ID="Label2" Text="" CssClass="number"></asp:Label>
                                    <span class="info-label">Trong tháng qua</span>
                                </div>
                                <div class="col-md-4 cls">
                                    <asp:Label Text="" runat="server" ID="Label3" CssClass="number"></asp:Label>
                                    <span class="info-label">Trong tuần này</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- END OVERVIEW -->
        <div class="row">
            <div class="col-md-12">
                <!-- RECENT PURCHASES -->
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">Yêu cầu hóa đơn mới</h3>
                        <div class="right">
                            <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                            <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                        </div>
                    </div>
                    <div class="panel-body no-padding">
                        <asp:ListView runat="server" ID="listDH" OnItemCommand="listDH_ItemCommand">
                            <LayoutTemplate>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Mã hóa đơn</th>
                                            <th>Tên khách hàng</th>
                                            <th>Số lượng</th>
                                            <th>Thời gian</th>
                                            <th>Trạng thái</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                                    </tbody>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:LinkButton runat="server" CommandName="See" CommandArgument='<%#Eval("MaDH") %>' ID="LinkButton2"><%#Eval("MaDH") %></asp:LinkButton></td>
                                    <td><%# Eval("HoTen") %></td>
                                    <td><%# Eval("SoLuong") %></td>
                                    <td><%# Eval("ThoiGian") %></td>
                                    <td><%# Eval("TrangThai") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                    <div class="panel-footer">
                        <div class="row">
                            <div class="col-md-6"><span class="panel-note"><i class="fa fa-clock-o"></i>Trong vòng 24h qua</span></div>
                            <div class="col-md-6 text-right">
                                <a href="/Admin/QuanLyDonHang.aspx" class="btn btn-primary">Xem tất cả đơn hàng</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END RECENT PURCHASES -->
            </div>
        </div>
    </div>
    </div>
    <!-- END MAIN CONTENT -->

    <script>
        $("#servicesleft > li > a").eq(0).addClass("active");
    </script>
    <script>
        $(function () {
            var data, options;

            // headline charts
            data = {
                labels: ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'],
                series: [
                    [23, 29, 24, 40, 25, 24, 35],
                    [14, 25, 18, 34, 29, 38, 44],
                ]
            };

            options = {
                height: 300,
                showArea: true,
                showLine: false,
                showPoint: false,
                fullWidth: true,
                axisX: {
                    showGrid: false
                },
                lineSmooth: false,
            };

            new Chartist.Line('#headline-chart', data, options);


            // visits trend charts
            data = {
                labels: ['T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'T8', 'T9', 'T10', 'T11', 'T12'],
                series: [{
                    name: 'series-real',
                    data: [200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
                }, {
                    name: 'series-projection',
                    data: [240, 350, 360, 380, 400, 450, 480, 523, 555, 600, 700, 800],
                }]
            };

            options = {
                fullWidth: true,
                lineSmooth: false,
                height: "270px",
                low: 0,
                high: 'auto',
                series: {
                    'series-projection': {
                        showArea: true,
                        showPoint: false,
                        showLine: false
                    },
                },
                axisX: {
                    showGrid: false,

                },
                axisY: {
                    showGrid: false,
                    onlyInteger: true,
                    offset: 0,
                },
                chartPadding: {
                    left: 20,
                    right: 20
                }
            };

            new Chartist.Line('#visits-trends-chart', data, options);


            options = {
                height: 300,
                axisX: {
                    showGrid: false
                },
            };


        });
	</script>

</asp:Content>
