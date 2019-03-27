<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Customer.aspx.cs" Inherits="Customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style6 {
            width: 535px;
        }
        .auto-style5 {
            width: 483px;
        }
        .auto-style7 {
            height: 39px;
            width: 483px;
        }
        .auto-style8 {
            height: 35px;
            width: 483px;
        }
        .auto-style9 {
            width: 357px;
            height: 36px;
        }
        .auto-style10 {
            width: 356px;
        }
        .auto-style11 {
            font-size: large;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table align="center" class="auto-style6">
            <tr>
                <td class="auto-style5" colspan="2">
                    <center><h1 class="auto-style9">CarServ</h1></center>
                </td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="2">
                    <center><h2 class="auto-style10">ผลการค้นหา</h2></center>
                </td>
            </tr>
            <tr>
                <td class="auto-style7"> 
                    ชื่อ<strong> <asp:Label ID="lbname" runat="server" CssClass="auto-style11"></asp:Label>
                    &nbsp;<asp:Label ID="lblastname" runat="server" CssClass="auto-style11"></asp:Label>
                    </strong>เบอร์โทรศัพท์
                    <strong>
                    <asp:Label ID="lbTel" runat="server" CssClass="auto-style11"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style7"> 
                    เลขทะเบียนรถ
                    <strong>
                    <asp:Label ID="lbCarID" runat="server" CssClass="auto-style11"></asp:Label>
                    &nbsp;</strong>วันที่รับรถเข้าซ่อม
                    <strong>
                    <asp:Label ID="lbCarAccept" runat="server" CssClass="auto-style11"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style7"> 
                    สถานะ ขั้นตอนที่
                    <strong>
                    <asp:Label ID="lbStatus" runat="server" CssClass="auto-style11"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style7"> 
                    <asp:Button ID="btnResearch" runat="server" OnClick="btnResearch_Click" Text="ค้นหาใหม่" Width="476px" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
