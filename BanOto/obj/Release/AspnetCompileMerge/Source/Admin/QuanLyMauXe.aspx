﻿<%@ Page Title="Quản lý màu xe" Language="C#" MasterPageFile="~/Admin/Admin.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="QuanLyMauXe.aspx.cs" Inherits="BanOto.Admin.QuanLyMauXe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .content {
            margin-top: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid content">
        <h1>Quản lý màu xe</h1>
        <div class="row">
            <div class="col-md-12">
                <asp:HiddenField runat="server" ID="txtMaMau" />
                Màu
    <asp:TextBox runat="server" ID="txtTenMau" CssClass="form-control" Width="200px"></asp:TextBox>

                <br />

                <asp:Button runat="server" ID="btnThem" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
                <asp:Button runat="server" ID="btnSua" Text="Sửa" CssClass="btn btn-primary" OnClick="btnSua_Click" />
                <asp:Button runat="server" ID="btnXoa" Text="Xóa" CssClass="btn btn-danger" OnClick="btnXoa_Click" />
                <asp:Button runat="server" ID="btnReset" Text="Reset" CssClass="btn btn-success" OnClick="btnReset_Click" />
                <br />
                <asp:Label ID="lbThongBao" runat="server" Text=""></asp:Label>
                <hr />
                <asp:GridView ID="GridView1" PageSize="5" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" CssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="MaMau" HeaderText="Mã màu" />
                        <asp:BoundField DataField="TenMau" HeaderText="Màu" HtmlEncode="false" />
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </div>
        </div>
    </div>
    <script>
        $("#servicesleft > li > a").eq(2).addClass("active");
    </script>
</asp:Content>
