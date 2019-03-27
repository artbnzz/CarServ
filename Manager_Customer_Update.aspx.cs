using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Manager_Customer_Update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
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

    protected void btnaddstaff_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manager_User_Add.aspx");
    }

    protected void btnStaffUpdate_Click(object sender, EventArgs e)
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

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //
    }

    protected void gvCaraccept_TextChanged(object sender, EventArgs e)
    {
        //
    }
}