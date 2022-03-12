<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DNDK.aspx.cs" Inherits="LabGroup._0" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta charset="utf-8" />
    <title>Trang bắt đầu!</title>
    <style type="text/css">
        body{
            background-color:gray;
        }
        
        div{
            background-color:white;
        }
        .auto-style1 {
            text-align: center;
            margin-top:10%;
        }
        .auto-style2 {
            margin:auto;
            width:500px;
        }
        .auto-style3 {
            width: 10px;
        }
        .auto-style4 {
            width: 200px;
        }
        .auto-style5 {
            width: 10px;
        }
        .auto-style6 {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            font-size: xx-large;
            text-transform: uppercase;
        }
        .auto-style7 {
            width: 10px;
            height: 24px;
        }
        .auto-style8 {
            height: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style1">
        <!--------------------------------------------Đăng nhập-------------------------------------------------------> 
        <div class="auto-style2">
            <asp:Panel ID="dn" runat="server" Width="500px" BorderStyle="Outset">
                <div>
                    <br />
                    <h2 style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: xx-large; text-transform: uppercase;">Đăng nhập</h2>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td style="text-align: right; font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif; font-size: 17px; font-weight: bolder;" colspan="2">
                                <asp:Label ID="lError" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
                                &nbsp;&nbsp;&nbsp; </td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style4" style="text-align: left; font-family: 'Courier New', Courier, monospace; font-size: 17px; font-weight: bolder;">&nbsp;Tên người dùng:&nbsp;</td>
                            <td>&nbsp;<asp:TextBox ID="tbTK" runat="server" BorderStyle="Dotted" Font-Size="17px" Width="90%"></asp:TextBox>
                            </td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style4" style="text-align: left; font-family: 'Courier New', Courier, monospace; font-size: 17px; font-weight: bolder;">&nbsp;Mật khẩu:&nbsp;</td>
                            <td >&nbsp;<asp:TextBox ID="tbMK" runat="server" Width="90%" TextMode="Password" BorderStyle="Dotted" Font-Size="17px"></asp:TextBox>
                                </td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td colspan="2" style="text-align: left; vertical-align: middle;">Bạn chưa có tài khoản?
                                <asp:Button ID="Button2" runat="server" BackColor="White" BorderStyle="None" Font-Bold="True" Font-Italic="True" Font-Underline="True" ForeColor="#0066FF" Text="Đăng ký ngay!" Width="129px" OnClick="Button2_Click" />
                            </td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td style="text-align: left">
                                <asp:Button ID="Button3" runat="server" BackColor="White" BorderStyle="None" Font-Bold="True" Font-Italic="True" Font-Underline="True" ForeColor="#0066FF" Text="Quên mật khẩu?" Width="129px" OnClick="Button3_Click" />
                            </td>
                            <td style="text-align: right">
                                <asp:Button ID="Button1" runat="server" BackColor="Black" Font-Bold="True" Font-Italic="True" Font-Size="17px" Font-Strikeout="False" ForeColor="White" Text="Đăng nhập" OnClick="Button1_Click" Width="150px" />
                                &nbsp;
                            </td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td style="text-align: left">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </div>
        <!--------------------------------------------Đăng ký-------------------------------------------------------> 
        <div class="auto-style2">
            <asp:Panel ID="dk" runat="server" Width="500px" Visible="False" BorderStyle="Outset">
                <div>
                    <br />
                    <h2 style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: xx-large; text-transform: uppercase;">Đăng ký</h2>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td style="text-align: right; font-family: 'Courier New', Courier, monospace; font-size: 17px; font-weight: bolder;" colspan="2">
                                <asp:Label ID="lError0" runat="server" Font-Italic="True" ForeColor="Red">Hãy xác nhận email trước khi nhập mật khẩu!</asp:Label>
                                &nbsp;&nbsp; </td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style4" style="text-align: left; font-family: 'Courier New', Courier, monospace; font-size: 17px; font-weight: bolder;">&nbsp;Tên người dùng:&nbsp;</td>
                            <td>&nbsp;<asp:TextBox ID="tbTK0" runat="server" BorderStyle="Dotted" Font-Size="17px" Width="90%"></asp:TextBox>
                            </td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td style="text-align: left; font-family: 'Courier New', Courier, monospace; font-size: 17px; font-weight: bolder;" class="auto-style4">&nbsp;Email:</td>
                            <td>&nbsp;<asp:TextBox ID="tbEmail0" runat="server" BorderStyle="Dotted" Font-Size="17px" TextMode="Email" Width="90%"></asp:TextBox>
                            </td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td style="text-align: left; font-family: 'Courier New', Courier, monospace; font-size: 17px; font-weight: bolder;" class="auto-style4">&nbsp;<asp:Button ID="Button5" runat="server" Text="Xác nhận mail" BackColor="White" BorderColor="#0066FF" BorderStyle="Solid" Font-Bold="True" Font-Italic="True" Font-Names="Courier New" Font-Size="17px" ForeColor="#0066FF" Width="180px" OnClick="Button5_Click" /></td>
                            <td>&nbsp;<asp:TextBox ID="tbXN0" runat="server" BorderStyle="Dotted" Font-Size="17px" Width="90%"></asp:TextBox>
                            </td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style4" style="text-align: left; font-family: 'Courier New', Courier, monospace; font-size: 17px; font-weight: bolder;">&nbsp;Mật khẩu:&nbsp;</td>
                            <td >&nbsp;<asp:TextBox ID="tbMK0" runat="server" Width="90%" TextMode="Password" BorderStyle="Dotted" Font-Size="17px"></asp:TextBox></td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style4" style="text-align: left; font-family: 'Courier New', Courier, monospace; font-size: 17px; font-weight: bolder;">&nbsp;Mật khẩu xác nhận:</td>
                            <td >&nbsp;<asp:TextBox ID="tbMK00" runat="server" Width="90%" TextMode="Password" BorderStyle="Dotted" Font-Size="17px"></asp:TextBox><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Mật khẩu không khớp!" ControlToCompare="tbMK0" ControlToValidate="tbMK00" Display="Dynamic" Font-Italic="True" ForeColor="Red"></asp:CompareValidator></td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td style="text-align: left; vertical-align: middle;" colspan="2">Bạn đã có tài khoản?
                                <asp:Button ID="Button4" runat="server" BackColor="White" BorderStyle="None" Font-Bold="True" Font-Italic="True" Font-Underline="True" ForeColor="#0066FF" Text="Đăng nhập nào!" Width="129px" OnClick="Button4_Click" />
                            </td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td style="text-align: left">
                                &nbsp;</td>
                            <td style="text-align: right">
                                <asp:Button ID="Button6" runat="server" BackColor="Black" Font-Bold="True" Font-Italic="True" Font-Size="17px" Font-Strikeout="False" ForeColor="White" Text="Đăng ký" Width="150px" OnClick="Button6_Click" />
                                &nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td style="text-align: left">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </div>
        <!--------------------------------------------Quên mật khẩu-------------------------------------------------------> 
        <div class="auto-style2">
            <asp:Panel ID="QMK" runat="server" Width="500px" Visible="False" BorderStyle="Outset">
                <div>
                    <br />
                    <h2 class="auto-style6">Khôi phục mật khẩu</h2>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td style="text-align: right; font-family: 'Courier New', Courier, monospace; font-size: 17px; font-weight: bolder;" colspan="2">
                                <asp:Label ID="lError1" runat="server" Font-Italic="True" ForeColor="Red">Hãy lấy mã email trước khi nhập mật khẩu!</asp:Label>
                                &nbsp; </td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td style="text-align: left; font-family: 'Courier New', Courier, monospace; font-size: 17px; font-weight: bolder;" class="auto-style4">&nbsp;Email:</td>
                            <td>&nbsp;<asp:TextBox ID="tbEmail1" runat="server" BorderStyle="Dotted" Font-Size="17px" TextMode="Email" Width="90%"></asp:TextBox>
                            </td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td style="text-align: left; font-family: 'Courier New', Courier, monospace; font-size: 17px; font-weight: bolder;" class="auto-style4">&nbsp;<asp:Button ID="Button7" runat="server" Text="Lấy mã" BackColor="White" BorderColor="#0066FF" BorderStyle="Solid" Font-Bold="True" Font-Italic="True" Font-Names="Courier New" Font-Size="17px" ForeColor="#0066FF" Width="180px" OnClick="Button7_Click" /></td>
                            <td>&nbsp;<asp:TextBox ID="tbXN1" runat="server" BorderStyle="Dotted" Font-Size="17px" Width="90%"></asp:TextBox>
                            </td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style4" style="text-align: left; font-family: 'Courier New', Courier, monospace; font-size: 17px; font-weight: bolder;">&nbsp;Mật khẩu mới:&nbsp;</td>
                            <td >&nbsp;<asp:TextBox ID="tbMK1" runat="server" Width="90%" TextMode="Password" BorderStyle="Dotted" Font-Size="17px"></asp:TextBox></td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style4" style="text-align: left; font-family: 'Courier New', Courier, monospace; font-size: 17px; font-weight: bolder;">&nbsp;Mật khẩu xác nhận:</td>
                            <td >&nbsp;<asp:TextBox ID="tbMK10" runat="server" Width="90%" TextMode="Password" BorderStyle="Dotted" Font-Size="17px"></asp:TextBox><asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Mật khẩu không khớp!" ControlToCompare="tbMK0" ControlToValidate="tbMK00" Display="Dynamic" Font-Italic="True" ForeColor="Red"></asp:CompareValidator></td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td style="text-align: left; vertical-align: middle;" colspan="2">Bạn đã nhớ mật khẩu?
                                <asp:Button ID="Button8" runat="server" BackColor="White" BorderStyle="None" Font-Bold="True" Font-Italic="True" Font-Underline="True" ForeColor="#0066FF" Text="Quay lại đăng nhập!" Width="129px" OnClick="Button8_Click" />
                            </td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td style="text-align: left">
                                &nbsp;</td>
                            <td style="text-align: right">
                                <asp:Button ID="Button9" runat="server" BackColor="Black" Font-Bold="True" Font-Italic="True" Font-Size="17px" Font-Strikeout="False" ForeColor="White" Text="Gửi" Width="150px" OnClick="Button9_Click" />
                                &nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td style="text-align: left">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                        </tr>
                    </table>
                </div>
                </asp:Panel>
            </div>
    </form>
</body>
</html>
