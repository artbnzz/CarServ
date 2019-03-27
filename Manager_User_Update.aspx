<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manager_User_Update.aspx.cs" Inherits="Manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style11 {
            height: 619px;
        }
        
        .auto-style9 {
            width: 1212px;
        }
        .auto-style5 {
            height: 18px;
            width: 226px;
        }
        .auto-style10 {
            width: 660px;
            text-align: right;
        }
        .auto-style4 {
            width: 200px;
        }
        .auto-style8 {
            width: 612px;
        }
        .auto-style6 {
            height: 40px;
            width: 200px;
        }
        .auto-style12 {
            text-align: left;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style11">
        <table align="center" class="auto-style9">
            <tr>
                <td class="auto-style5" colspan="2">
                    <h1 class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CarServ</h1>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <h3>ผู้จัดการ</h3>
                </td>
                <td class="auto-style8">
                    <h3>อัพเดทข้อมูลพนักงาน</h3>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                        <strong>Username :&nbsp;
                        </strong>
                        <asp:Label ID="lbUsername" runat="server"></asp:Label>
                </td>
                <td rowspan="3" class="auto-style12">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" CellPadding="3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1038px" AllowPaging="True" AllowSorting="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                        <Columns>
                            <asp:TemplateField HeaderText="Username" SortExpression="Username">
                                <EditItemTemplate>
                                    <asp:TextBox ID="gvUsername" runat="server" Height="16px" ReadOnly="True" Text='<%# Bind("Username") %>' Width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Password" SortExpression="Password">
                                <EditItemTemplate>
                                    <br />
                                    <asp:TextBox ID="gvPassword" runat="server" Height="16px" Text='<%# Bind("Password") %>' Width="100px" ValidationGroup="gv"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="gvPassword" ErrorMessage="*" ForeColor="Red" ValidationGroup="gv"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ตำแหน่ง" SortExpression="Job">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddljob" runat="server" Height="22px" SelectedValue='<%# Bind("Job") %>'>
                                        <asp:ListItem>พนักงานต้อนรับ</asp:ListItem>
                                        <asp:ListItem>พนักงานซ่อม</asp:ListItem>
                                        <asp:ListItem>ผู้จัดการ</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Job") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="วันสมัครเข้าทำงาน" SortExpression="TimetoWork">
                                <EditItemTemplate>
                                    <br />
                                    <asp:TextBox ID="gvTimetoWork" runat="server" Height="16px" Text='<%# Bind("TimetoWork") %>' Width="130px" ValidationGroup="gv"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="gvTimetoWork" ErrorMessage="*" ForeColor="Red" ValidationGroup="gv"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("TimetoWork") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ชื่อ" SortExpression="Name">
                                <EditItemTemplate>
                                    <br />
                                    <asp:TextBox ID="gvName" runat="server" Height="16px" Text='<%# Bind("Name") %>' Width="85px" ValidationGroup="gv"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="gvName" ErrorMessage="*" ForeColor="Red" ValidationGroup="gv"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="นามสกุล" SortExpression="Lastname">
                                <EditItemTemplate>
                                    <br />
                                    <asp:TextBox ID="gvLastname" runat="server" Height="16px" Text='<%# Bind("Lastname") %>' Width="85px" ValidationGroup="gv"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="gvLastname" ErrorMessage="*" ForeColor="Red" ValidationGroup="gv"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Lastname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="เบอร์โทร" SortExpression="Tel">
                                <EditItemTemplate>
                                    <br />
                                    <asp:TextBox ID="gvTel" runat="server" Height="16px" Text='<%# Bind("Tel") %>' Width="80px" ValidationGroup="gv"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="gvTel" ErrorMessage="*" ForeColor="Red" ValidationGroup="gv"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Tel") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="อีเมล์" SortExpression="Email">
                                <EditItemTemplate>
                                    <br />
                                    <asp:TextBox ID="gvEmail" runat="server" Height="30px" Text='<%# Bind("Email") %>' TextMode="MultiLine" Width="183px" ValidationGroup="gv"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="gvEmail" ErrorMessage="*" ForeColor="Red" ValidationGroup="gv"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Button ID="gvUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="อัพเดท" ValidationGroup="gv" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="gvEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="แก้ไข" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Button ID="gvDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="ลบ" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">

                    <asp:Button ID="btnaddstaff" runat="server" OnClick="btnaddstaff_Click" Text="เพิ่มพนักงาน" Width="142px" />

                    <br />
                    <br />

                    <asp:Button ID="btnStaffUpdate" runat="server" OnClick="btnStaffUpdate_Click" Text="แก้ไข / ลบ พนักงาน" Width="142px" />

                    <br />
                    <br />

                    <asp:Button ID="btnCustomer" runat="server" Text="เพิ่มลูกค้า" Width="142px" OnClick="btnCustomer_Click" />

                    <br />
                    <br />

                    <asp:Button ID="btnCustomerUpdate" runat="server" OnClick="btnCustomerUpdate_Click" Text="อัพเดทข้อมูลลูกค้า" Width="142px" />

                    <br />
                    <br />

                    <asp:Button ID="btnSignout" runat="server" Text="ออกจากระบบ" Width="142px" OnClick="btnSignout_Click" />

                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM Account WHERE ID=@ID" SelectCommand="SELECT * FROM [Account]" UpdateCommand="UPDATE Account SET Password=@Password, Job=@Job, TimetoWork=@TimetoWork, Name=@Name, Lastname=@Lastname, Tel=@Tel, Email=@Email WHERE Username=@Username">
            <DeleteParameters>
                <asp:Parameter Name="ID" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Password" />
                <asp:Parameter Name="Job" />
                <asp:Parameter Name="TimetoWork" />
                <asp:Parameter Name="Name" />
                <asp:Parameter Name="Lastname" />
                <asp:Parameter Name="Tel" />
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="Username" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
