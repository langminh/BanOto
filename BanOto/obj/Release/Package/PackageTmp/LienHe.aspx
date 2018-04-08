<%@ Page Title="Liên hệ" Language="C#" MasterPageFile="~/Client.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="LienHe.aspx.cs" Inherits="BanOto.LienHe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Liên hệ với chúng tôi</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- content page -->
	<section class="bgwhite p-t-66 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-6 p-b-30">
					<div class="p-r-20 p-r-0-lg">
                        <img src="Images/Capture.JPG" />
					</div>
				</div>

				<div class="col-md-6 p-b-30">
					<form class="leave-comment">
						<h4 class="m-text26 p-b-36 p-t-15">
							Gửi cho chúng tôi đánh giá
						</h4>

						<div class="bo4 of-hidden size15 m-b-20">
							<asp:TextBox runat="server" ID="txtName" TextMode="SingleLine" CssClass="sizefull s-text7 p-l-22 p-r-22" type="text" name="name" placeholder="Họ tên"></asp:TextBox>
						</div>

						<div class="bo4 of-hidden size15 m-b-20">
							<asp:TextBox runat="server" TextMode="SingleLine" ID="txtPhone" class="sizefull s-text7 p-l-22 p-r-22" type="text" name="phone-number" placeholder="Số điện thoại"></asp:TextBox>
						</div>

						<div class="bo4 of-hidden size15 m-b-20">
							<asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="sizefull s-text7 p-l-22 p-r-22" type="text" name="email" placeholder="Email"></asp:TextBox>
						</div>

						<asp:TextBox runat="server" TextMode="MultiLine" ID="txtMessage" CssClass="dis-block s-text7 size20 bo4 p-l-22 p-r-22 p-t-13 m-b-20" name="message" placeholder="Nội dung"></asp:TextBox>

						<div class="w-size25">
							<!-- Button -->
							<asp:Button runat="server" ID="btnSendCmt" Text="Gửi" CssClass="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
							</asp:Button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
    <script>
        $("#servicesleft > li").eq(5).addClass("active");
    </script>

</asp:Content>
