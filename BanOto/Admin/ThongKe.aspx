<%@ Page Title="Thống kê" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ThongKe.aspx.cs" Inherits="BanOto.Admin.ThongKe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        $("#servicesleft > li > a").eq(6).addClass("active");
    </script>
</asp:Content>
