<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Staff_Customer_Update.aspx.cs" Inherits="Staff_Customer_Update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style9 {
            width: 640px;
        }
        .auto-style5 {
            height: 18px;
            width: 226px;
        }
        .auto-style10 {
            width: 633px;
            text-align: center;
        }
        .auto-style4 {
            width: 345px;
        }
        .auto-style8 {
            width: 612px;
        }
        .auto-style6 {
            height: 40px;
            width: 345px;
        }
        .auto-style3 {
            height: 40px;
            width: 612px;
        }
        .auto-style11 {
            font-weight: bold;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <table align="center" class="auto-style9">
            <tr>
                <td class="auto-style5" colspan="2">
                    <h1 class="auto-style10">CarServ</h1>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <h3>พนักงานซ่อม</h3>
                </td>
                <td class="auto-style8">
                    <h3>อัพเดทข้อมูลลูกค้า</h3>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                        <strong>Username :&nbsp;
                        </strong>
                        <asp:Label ID="lbUsername" runat="server"></asp:Label>
                </td>
                <td class="auto-style3">
                    เลขทะเบียนรถ&nbsp;
                    <asp:TextBox ID="tbxCarid" runat="server" Width="169px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxCarid" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                &nbsp;<asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="ค้นหา" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">

                    <asp:Button ID="btnCustomerUpdate" runat="server" OnClick="btnCustomerUpdate_Click" Text="อัพเดทข้อมูลลูกค้า" Width="142px" CausesValidation="False"/>

                </td>
                <td class="auto-style3">
                    <asp:Label ID="lbname" runat="server" Text="ชื่อ"></asp:Label>
&nbsp;<strong><asp:Label ID="lbCname" runat="server"></asp:Label>
                    </strong>&nbsp;<asp:Label ID="lblastname" runat="server" Text="นามสกุล"></asp:Label>
&nbsp;<strong><asp:Label ID="lbClastname" runat="server"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">

                    <asp:Button ID="btnSignout" runat="server" Text="ออกจากระบบ" Width="142px" OnClick="btnSignout_Click" CausesValidation="False"/>

                </td>
                <td class="auto-style3">
                    <asp:Label ID="lbtel" runat="server" Text="เบอร์โทรศัพท์"></asp:Label>
&nbsp;<strong><asp:Label ID="lbCtel" runat="server"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">

                    &nbsp;</td>
                <td class="auto-style3">

                    <asp:Label ID="lbstatus" runat="server" Text="สถานะซ่อมรถ"></asp:Label>
&nbsp;<strong><asp:DropDownList ID="Cddlstatus" runat="server" Height="22px" Width="280px" CssClass="auto-style11">
                        <asp:ListItem>1/5 รับรถยนต์เข้าซ่อม</asp:ListItem>
                        <asp:ListItem>2/5 ตรวจเช็คสภาพรถยนต์</asp:ListItem>
                        <asp:ListItem Value="3/5 รออะไหล่ซ่อมรถยนต์">3/5 รออะไหล่ซ่อมรถยนต์</asp:ListItem>
                        <asp:ListItem>4/5 กำลังซ่อมรถยนต์</asp:ListItem>
                        <asp:ListItem>5/5 ซ่อมเสร็จสมบูรณ์ลูกค้าสามารถมารับรถได้</asp:ListItem>
                    </asp:DropDownList>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">

                    &nbsp;</td>
                <td class="auto-style3">

                    <asp:Label ID="lbacceptcar" runat="server" Text="วันที่รับรถเข้าซ่อม"></asp:Label>
&nbsp;<strong><asp:Label ID="lbCcaraccept" runat="server"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">

                </td>
                <td class="auto-style3">

                    <asp:Button ID="btnSave" runat="server" Text="บันทึก" Width="142px" OnClick="btnSave_Click" />
                &nbsp;<asp:Button ID="btnResearch" runat="server" OnClick="btnResearch_Click" Text="ค้นหาใหม่" CausesValidation="False"/>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
