﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manager.aspx.cs" Inherits="Manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        .auto-style2 {
            height: 40px;
        }
        .auto-style3 {
            height: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 496px;" align="center">
            <tr>
                <td class="auto-style5" colspan="2">
                    <center><h1>CarServ</h1></center>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <h3>ผู้จัดการ</h3>
                </td>
                <td class="auto-style8">
                        <h3>ข้อมูลผู้ใช้</h3>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"> 
                    <strong>Username :</strong> 
                    <asp:Label ID="lbUsername" runat="server"></asp:Label>
                </td>
                <td class="auto-style3"><strong>ชื่อ :</strong>
                    <asp:Label ID="lbName" runat="server"></asp:Label>
&nbsp;<strong>นามสกุล :</strong>
                    <asp:Label ID="lbLastname" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnStaffadd" runat="server" Text="เพิ่มพนักงาน" Width="142px" OnClick="btnStaffadd_Click" />
                </td>
                <td class="auto-style3"><strong>วันที่สมัครเข้าทำงาน :</strong>
                    <asp:Label ID="lbTimetoWork" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnStaffupdate" runat="server" Text="แก้ไข/ลบ พนักงาน" Width="142px" OnClick="btnStaffupdate_Click" />
                </td>
                <td class="auto-style3"><strong>ตำแหน่งงาน :</strong>
                    <asp:Label ID="lbJob" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">

                    <asp:Button ID="btnCustomer" runat="server" Text="เพิ่มลูกค้า" Width="142px" OnClick="btnCustomer_Click" />

                </td>
                <td class="auto-style3">

                    <strong>เบอร์โทรศัพท์ :</strong> <asp:Label ID="lbTel" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">

                    <asp:Button ID="btnCustomerUpdate" runat="server" OnClick="btnCustomerUpdate_Click" Text="อัพเดตข้อมูลลูกค้า" Width="141px" />

                </td>
                <td class="auto-style3">

                    <strong>อีเมล์ :</strong> <asp:Label ID="lbemail" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">

                    <asp:Button ID="btnSignout" runat="server" Text="ออกจากระบบ" Width="142px" OnClick="btnSignout_Click" />

                </td>
                <td class="auto-style3">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
