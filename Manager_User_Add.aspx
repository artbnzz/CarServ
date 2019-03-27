<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manager_User_Add.aspx.cs" Inherits="Manager_Add" %>

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
<body style="height: 100%;">
    <form id="form1" runat="server">
        <table style="width: 585px;" align="center">
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
                    <h3>เพิ่มพนักงาน</h3>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                        <strong>Username :&nbsp;
                        </strong>
                        <asp:Label ID="lbUsername" runat="server"></asp:Label>
                </td>
                <td class="auto-style3">
                    Username&nbsp;
                    <asp:TextBox ID="tbxUsername" runat="server" Width="142px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnStaffadd" runat="server" Text="เพิ่มพนักงาน" Width="142px" OnClick="btnStaffadd_Click" CausesValidation="False"/>
                </td>
                <td class="auto-style3">Password&nbsp; <asp:TextBox ID="tbxPassword" runat="server" Width="142px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnStaffupdate" runat="server" Text="แก้ไข/ลบ พนักงาน" Width="142px" OnClick="btnStaffupdate_Click" CausesValidation="False"/>
                </td>
                <td class="auto-style3">ชื่อ <asp:TextBox ID="tbxName" runat="server" Width="142px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbxName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">

                    <asp:Button ID="btnCustomer" runat="server" Text="เพิ่มลูกค้า" Width="142px" OnClick="btnCustomer_Click" CausesValidation="False"/>

                </td>
                <td class="auto-style3">นามสกุล&nbsp; <asp:TextBox ID="tbxLastname" runat="server" Width="142px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbxLastname" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">

                    <asp:Button ID="btnCustomerUpdate" runat="server" OnClick="btnCustomerUpdate_Click" Text="อัพเดทข้อมูลลูกค้า" Width="142px" CausesValidation="False"/>

                </td>
                <td class="auto-style3">

                    ตำแหน่ง&nbsp; 
                    <asp:DropDownList ID="ddljob" runat="server">
                        <asp:ListItem>พนักงานต้อนรับ</asp:ListItem>
                        <asp:ListItem>พนักงานซ่อม</asp:ListItem>
                        <asp:ListItem>ผู้จัดการ</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddljob" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnSignout" runat="server" Text="ออกจากระบบ" Width="142px" OnClick="btnSignout_Click" CausesValidation="False"/>

                </td>
                <td class="auto-style3">

                    เบอร์โทรศัพท์&nbsp;<asp:TextBox ID="tbxtel" runat="server" Width="170px" AutoCompleteType="Cellular"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbxtel" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">

                    &nbsp;
                </td>
                <td class="auto-style3">

                    อีเมล์&nbsp; <asp:TextBox ID="tbxemail" runat="server" Width="142px" AutoCompleteType="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tbxemail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">

                    &nbsp;</td>
                <td class="auto-style3">

                    วันที่สมัครเข้าทำงาน <asp:TextBox ID="tbxtimetowork" runat="server" Width="142px" OnTextChanged="tbxtimetowork_TextChanged" AutoCompleteType="Enabled" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tbxtimetowork" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                &nbsp;<asp:Button ID="btncalendar" runat="server" OnClick="btncalendar_Click" Text=".." Width="20px" CausesValidation="False"/>
        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="82px" Width="236px">
            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
            <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="btnSave" runat="server" Text="บันทึก" Width="142px" OnClick="btnSave_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
