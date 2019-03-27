using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Manager_Customer_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                Calendar1.Visible = false;
            }
            HttpCookie ckManager = Request.Cookies["Login_Manager"];
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\\Carserv_db.mdf';Integrated Security=True");
            conn.Open();
            SqlCommand com = new SqlCommand("SELECT * FROM Account WHERE Username=N'" + ckManager.Values["Username"] + "'", conn);
            SqlDataReader dr = com.ExecuteReader();
            dr.Read();
            if (ckManager == null)
            {
                Response.Redirect("Error.aspx");
            }
            else
            {
                lbUsername.Text = dr.GetString(1);
            }
        }
        catch
        {
            Response.Redirect("Error.aspx");
        }
    }

    protected void tbxtimetowork_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        tbxCaraccept.Text = Calendar1.SelectedDate.ToLongDateString();
        Calendar1.Visible = false;
    }

    protected void btncalendar_Click(object sender, EventArgs e)
    {
        if (Calendar1.Visible == false)
        {
            Calendar1.Visible = true;
        }
        else
        {
            Calendar1.Visible = false;
        }
    }

    protected void btnCustomer_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manager_Customer_Add.aspx");
    }

    protected void btnCustomerUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manager_Customer_Update.aspx");
    }

    protected void btnSignout_Click(object sender, EventArgs e)
    {
        try
        {
            HttpCookie ckManager = Request.Cookies["Login_Manager"];
            ckManager.Expires = DateTime.Now;
            Response.Cookies.Add(ckManager);
            Response.Redirect("HomePage.aspx");
        }
        catch
        {
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn1 = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\\Carserv_db.mdf';Integrated Security=True");
            conn1.Open();
            SqlCommand com1 = new SqlCommand("SELECT COUNT(*) FROM Customer WHERE CarID = N'" + tbxCarid.Text + "' ", conn1);
            int intNumRows;
            intNumRows = Convert.ToInt32(com1.ExecuteScalar());
            if (intNumRows > 0)
            {
                Response.Write("<SCRIPT LANGUAGE= 'JavaScript'> alert('Error : มีเลขทะเบียนรถนี้ในระบบแล้ว');</SCRIPT>");
                tbxCarid.Text = "";
                conn1.Close();
            }
            else
            {
                SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\\Carserv_db.mdf';Integrated Security=True");
                conn.Open();
                SqlCommand com = new SqlCommand("INSERT INTO Customer(Name,Lastname,Tel,CarID,Status,DateAccept) VALUES(N'" + tbxName.Text + "',N'" + tbxLastname.Text + "',N'" + tbxtel.Text + "',N'" + tbxCarid.Text + "',N'" + ddlstatus.Text + "',N'" + tbxCaraccept.Text + "')", conn);
                int row = com.ExecuteNonQuery();
                conn.Close();
                Response.Write("<SCRIPT LANGUAGE= 'JavaScript'> alert('บันทึกข้อมูลสำเร็จ');</SCRIPT>");
                tbxName.Text = "";
                tbxLastname.Text = "";
                tbxCaraccept.Text = "";
                tbxtel.Text = "";
                tbxCarid.Text = "";
                tbxCaraccept.Text = "";
                ddlstatus.SelectedIndex = 0;
            }
        }
        catch
        {
            Response.Write("< SCRIPT LANGUAGE = 'JavaScript' > alert('Error : กรอกข้อมูลไม่ครบ');</ SCRIPT >");
        }
    }

    protected void btnaddstaff_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manager_User_Add.aspx");
    }

    protected void btnStaffUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manager_User_Update.aspx");
    }
}