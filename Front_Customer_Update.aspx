<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Front_Customer_Update.aspx.cs" Inherits="staff_car_changestatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style8 {
            width: 612px;
        }
        .auto-style5 {
            height: 18px;
            width: 226px;
        }
        .auto-style4 {
            width: 345px;
        }
        .auto-style6 {
            height: 40px;
            width: 345px;
        }
        .auto-style3 {
            height: 40px;
            width: 612px;
        }
        .auto-style9 {
            width: 640px;
        }
        .auto-style10 {
            width: 633px;
            text-align: center;
        }
    </style>
</head>
<body style="height: 521px">
    <form id="form1" runat="server">
        <table align="center" class="auto-style9">
            <tr>
                <td class="auto-style5" colspan="2">
                    <h1 class="auto-style10">CarServ</h1>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <h3>พนักงานต้อนรับ</h3>
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
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxCarid" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="ค้นหา" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">

                    <asp:Button ID="btnCustomer" runat="server" Text="เพิ่มลูกค้า" Width="142px" OnClick="btnCustomer_Click" CausesValidation="False"/>

                </td>
                <td class="auto-style3">
                    <asp:Label ID="lbname" runat="server" Text="ชื่อ"></asp:Label>
&nbsp;<asp:TextBox ID="tbxName" runat="server" Width="142px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">

                    <asp:Button ID="btnCustomerUpdate" runat="server" OnClick="btnCustomerUpdate_Click" Text="อัพเดทข้อมูลลูกค้า" Width="142px" CausesValidation="False"/>

                </td>
                <td class="auto-style3">
                    <asp:Label ID="lblastname" runat="server" Text="นามสกุล"></asp:Label>
&nbsp;<asp:TextBox ID="tbxLastname" runat="server" Width="142px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbxLastname" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">

                    <asp:Button ID="btnSignout" runat="server" Text="ออกจากระบบ" Width="142px" OnClick="btnSignout_Click" CausesValidation="False"/>

                </td>
                <td class="auto-style3"><asp:Label ID="lbtel" runat="server" Text="เบอร์โทรศัพท์"></asp:Label>
&nbsp;<asp:TextBox ID="tbxtel" runat="server" Width="170px" AutoCompleteType="Cellular"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbxtel" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">

                    &nbsp;</td>
                <td class="auto-style3">

                    <asp:Label ID="lbstatus" runat="server" Text="สถานะซ่อมรถ"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlstatus" runat="server" Height="22px" Width="280px">
                        <asp:ListItem>1/5 รับรถยนต์เข้าซ่อม</asp:ListItem>
                        <asp:ListItem>2/5 ตรวจเช็คสภาพรถยนต์</asp:ListItem>
                        <asp:ListItem Value="3/5 รออะไหล่ซ่อมรถยนต์">3/5 รออะไหล่ซ่อมรถยนต์</asp:ListItem>
                        <asp:ListItem>4/5 กำลังซ่อมรถยนต์</asp:ListItem>
                        <asp:ListItem>5/5 ซ่อมเสร็จสมบูรณ์ลูกค้าสามารถมารับรถได้</asp:ListItem>
                    </asp:DropDownList>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlstatus" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">

                </td>
                <td class="auto-style3">

                    <asp:Label ID="lbacceptcar" runat="server" Text="วันที่รับรถเข้าซ่อม"></asp:Label>
&nbsp;<asp:TextBox ID="tbxCaraccept" runat="server" OnTextChanged="tbxCaraccept_TextChanged" ReadOnly="True"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbxCaraccept" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="btnSave" runat="server" Text="บันทึก" Width="142px" OnClick="btnSave_Click" Height="26px" />
                &nbsp;<asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="ลบออกจากฐานข้อมูล" Width="142px" Height="26px" CausesValidation="False"/>
                &nbsp;<asp:Button ID="btnResearch" runat="server" Height="26px" OnClick="btnResearch_Click" Text="ค้นหาใหม่" CausesValidation="False"/>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
