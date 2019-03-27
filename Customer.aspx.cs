using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Customer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            HttpCookie ckSearch = Request.Cookies["Search"];
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\\Carserv_db.mdf';Integrated Security=True");
            conn.Open();
            SqlCommand com = new SqlCommand("SELECT * FROM Customer WHERE ID=N'" + ckSearch.Values["ID"] + "'", conn);
            SqlDataReader dr = com.ExecuteReader();
            dr.Read();
            if (ckSearch == null)
            {
                Response.Redirect("Error.aspx");
            }
            else
            {
                lbname.Text = dr.GetString(1);
                lblastname.Text = dr.GetString(2);
                lbTel.Text = dr.GetString(3);
                lbCarID.Text = dr.GetString(4);
                lbStatus.Text = dr.GetString(5);
                lbCarAccept.Text = dr.GetString(6);
            }
        }
        catch
        {
            Response.Redirect("Error.aspx");
        }
    }

    protected void btnResearch_Click(object sender, EventArgs e)
    {
        try
        {
            HttpCookie ckFront = Request.Cookies["Search"];
            ckFront.Expires = DateTime.Now;
            Response.Cookies.Add(ckFront);
            Response.Redirect("Homepage.aspx");
        }
        catch
        {

        }

    }
}