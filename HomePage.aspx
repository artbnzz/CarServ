<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style5 {
            height: 40px;
        }
        .auto-style8 {
            height: 40px;
            width: 221px;
        }
        .auto-style16 {
            height: 40px;
            text-align: center;
            width: 221px;
        }
        .auto-style17 {
            width: 606px;
        }
        .auto-style19 {
            text-align: center;
        }
        .auto-style20 {
            height: 40px;
            width: 250px;
        }
    </style>
</head>
<body style="height: 100%;">
    <form id="form1" runat="server">
        <table width: 496px; align="center" class="auto-style17">
            <tr>
                <td class="auto-style5" colspan="2">
                    <center><h1>CarServ</h1></center>
                </td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <h3>Login พนักงาน</h3>
                </td>
                <td class="auto-style8">
                    <h3 class="auto-style19"><strong>ตรวจสอบสถานะส่งซ่อม</strong></h3>
                </td>
            </tr>
            <tr>
                <td class="auto-style20">Username : 
                    <asp:TextBox ID="tbxUsername" runat="server" Width="142px" ValidationGroup="Login"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxUsername" ErrorMessage="*" ForeColor="Red" ValidationGroup="Login"></asp:RequiredFieldValidator>
                    <br />
                </td>
                <td class="auto-style16">ใส่เลขทะเบียนรถยนต์ที่นำมาซ่อม<br />
                </td>
            </tr>
            <tr>
                <td class="auto-style20">Password : 
                    <asp:TextBox ID="tbxPassword" runat="server" Width="146px" TextMode="Password" ValidationGroup="Login"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxPassword" ErrorMessage="*" ForeColor="Red" ValidationGroup="Login"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style16">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbxCarID" ErrorMessage="กรุณาใส่เลขทะเบียนรถยนต์" ForeColor="Red" ValidationGroup="Search"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="tbxCarID" runat="server" Height="25px" ValidationGroup="Search"></asp:TextBox>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Button ID="btnSignin" runat="server" Text="เข้าสู่ระบบ" Height="25px" Width="237px" OnClick="btnSignin_Click" ValidationGroup="Login" />
                </td>
                <td class="auto-style16">
                    <asp:Button ID="btnsearch" runat="server" Text="ค้นหา" Width="197px" OnClick="btnsearch_Click" Height="26px" ValidationGroup="Search" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
