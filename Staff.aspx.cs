using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class staff_general : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            HttpCookie ckStaff = Request.Cookies["Login_Staff"];
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\\Carserv_db.mdf';Integrated Security=True");
            conn.Open();
            SqlCommand com = new SqlCommand("SELECT * FROM Account WHERE Username=N'" + ckStaff.Values["Username"] + "'", conn);
            SqlDataReader dr = com.ExecuteReader();
            dr.Read();
            if (ckStaff == null)
            {
                Response.Redirect("Error.aspx");
            }
            else
            {
                lbUsername.Text = dr.GetString(1);
                lbJob.Text = dr.GetString(3);
                lbTimetoWork.Text = dr.GetString(4);
                lbName.Text = dr.GetString(5);
                lbLastname.Text = dr.GetString(6);
                lbTel.Text = dr.GetString(7);
                lbemail.Text = dr.GetString(8);
            }
        }
        catch
        {
            Response.Redirect("Error.aspx");
        }
    }

    protected void btnCustomerUpdate_Click(object sender, EventArgs e)
    {
        Response.Redirect("Staff_Customer_Update.aspx");
    }

    protected void btnSignout_Click(object sender, EventArgs e)
    {
        try
        {
            HttpCookie ckStaff = Request.Cookies["Login_Staff"];
            ckStaff.Expires = DateTime.Now;
            Response.Cookies.Add(ckStaff);
            Response.Redirect("Homepage.aspx");
        }
        catch
        {

        }
    }
}