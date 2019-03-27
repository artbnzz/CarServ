using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Manager_Add : System.Web.UI.Page
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

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn1 = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\\Carserv_db.mdf';Integrated Security=True");
            conn1.Open();
            SqlCommand com1 = new SqlCommand("SELECT COUNT(*) FROM Account WHERE Username = '" + tbxUsername.Text + "' ", conn1);
            int intNumRows;
            intNumRows = Convert.ToInt32(com1.ExecuteScalar());
            if (intNumRows > 0)
            {
                Response.Write("<SCRIPT LANGUAGE= 'JavaScript'> alert('Username ถูกใช้แล้วกรุณาใช้ชื่ออื่น');</SCRIPT>");
                conn1.Close();
            }
            else
            {
                SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\\Carserv_db.mdf';Integrated Security=True");
                conn.Open();
                SqlCommand com = new SqlCommand("INSERT INTO Account(Username,Password,Name,Lastname,Job,TimetoWork,Tel,Email) VALUES(N'" + tbxUsername.Text + "',N'" + tbxPassword.Text + "',N'" + tbxName.Text + "',N'" + tbxLastname.Text + "',N'" + ddljob.Text + "',N'" + tbxtimetowork.Text + "',N'" + tbxtel.Text + "',N'" + tbxemail.Text + "')", conn);
                int row = com.ExecuteNonQuery();
                conn.Close();
                Response.Write("<SCRIPT LANGUAGE= 'JavaScript'> alert('บันทึกข้อมูลสำเร็จ');</SCRIPT>");
                tbxUsername.Text = "";
                tbxPassword.Text = "";
                tbxName.Text = "";
                tbxLastname.Text = "";
                tbxtimetowork.Text = "";
                tbxtel.Text = "";
                tbxemail.Text = "";
                ddljob.SelectedIndex = 0;
            }
        }
        catch
        {
            Response.Write("<SCRIPT LANGUAGE= 'JavaScript'> alert('กรอกข้อมูลไม่ครบ');</SCRIPT>");
        }
    }
    protected void tbxtimetowork_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        tbxtimetowork.Text = Calendar1.SelectedDate.ToLongDateString();
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

    protected void btnStaffadd_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manager_User_Add.aspx");
    }

    protected void btnStaffupdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manager_User_Update.aspx");
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
}