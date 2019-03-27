using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Staff_Customer_Update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                btnSave.Visible = false;
                btnResearch.Visible = false;
                lbacceptcar.Visible = false;
                lblastname.Visible = false;
                lbname.Visible = false;
                lbstatus.Visible = false;
                lbtel.Visible = false;
                lbCcaraccept.Visible = false;
                lbClastname.Visible = false;
                lbCname.Visible = false;
                lbCtel.Visible = false;
                Cddlstatus.Visible = false;
            }
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\\Carserv_db.mdf';Integrated Security=True");
        conn.Open();
        SqlCommand com = new SqlCommand("SELECT * FROM Customer WHERE CarID=N'" + tbxCarid.Text + "'", conn);
        SqlDataReader dr = com.ExecuteReader();
        dr.Read();
        try
        {
            if (btnSave.Visible == false)
            {
                tbxCarid.ReadOnly = true;
                btnSave.Visible = true;
                btnSearch.Visible = false;
                btnResearch.Visible = true;
                lbacceptcar.Visible = true;
                lblastname.Visible = true;
                lbname.Visible = true;
                lbstatus.Visible = true;
                lbtel.Visible = true;
                lbCcaraccept.Visible = true;
                lbClastname.Visible = true;
                lbCname.Visible = true;
                lbCtel.Visible = true;
                Cddlstatus.Visible = true;
            }
            else { }
            lbCname.Text = dr.GetString(1);
            lbClastname.Text = dr.GetString(2);
            lbCtel.Text = dr.GetString(3);
            lbCcaraccept.Text = dr.GetString(6);
            tbxCarid.Text = dr.GetString(4);
            Cddlstatus.SelectedValue = dr.GetString(5);
        }
        catch
        {
            Response.Write("<SCRIPT LANGUAGE= 'JavaScript'> alert('ไม่พบข้อมูล');</SCRIPT>");
            if (btnSave.Visible == true)
            {
                tbxCarid.ReadOnly = false;
                btnSave.Visible = false;
                btnSearch.Visible = true;
                btnResearch.Visible = false;
                lbacceptcar.Visible = false;
                lblastname.Visible = false;
                lbname.Visible = false;
                lbstatus.Visible = false;
                lbtel.Visible = false;
                lbCcaraccept.Visible = false;
                lbClastname.Visible = false;
                lbCname.Visible = false;
                lbCtel.Visible = false;
                Cddlstatus.Visible = false;
            }
            else { }
            tbxCarid.Text = "";
        }
        conn.Close();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename='|DataDirectory|\\Carserv_db.mdf';Integrated Security=True");
            conn.Open();
            SqlCommand com = new SqlCommand("UPDATE Customer SET Status=N'" + Cddlstatus.SelectedValue + "' WHERE CarID=N'" + tbxCarid.Text + "' ", conn);
            int row = com.ExecuteNonQuery();
            conn.Close();
            Response.Write("<SCRIPT LANGUAGE= 'JavaScript'> alert('บันทึกข้อมูลสำเร็จ');</SCRIPT>");
            if (btnSave.Visible == true)
            {
                tbxCarid.ReadOnly = false;
                btnSave.Visible = false;
                btnResearch.Visible = false;
                btnSearch.Visible = true;
                lbacceptcar.Visible = false;
                lblastname.Visible = false;
                lbname.Visible = false;
                lbstatus.Visible = false;
                lbtel.Visible = false;
                lbCcaraccept.Visible = false;
                lbClastname.Visible = false;
                lbCname.Visible = false;
                lbCtel.Visible = false;
                Cddlstatus.Visible = false;
            }
            else { }
            tbxCarid.Text = "";
        }
        catch
        {
            Response.Write("<SCRIPT LANGUAGE= 'JavaScript'> alert('เกิดข้อผิดพลาดไม่สามารถเชื่อมต่อฐานข้อมูลได้');</SCRIPT>");
            if (btnSave.Visible == true)
            {
                tbxCarid.ReadOnly = true;
                btnSave.Visible = false;
                btnResearch.Visible = false;
                btnSearch.Visible = true;
                lbacceptcar.Visible = false;
                lblastname.Visible = false;
                lbname.Visible = false;
                lbstatus.Visible = false;
                lbtel.Visible = false;
                lbCcaraccept.Visible = false;
                lbClastname.Visible = false;
                lbCname.Visible = false;
                lbCtel.Visible = false;
                Cddlstatus.Visible = false;
            }
            else { }
            tbxCarid.Text = "";
        }
    }

    protected void btnResearch_Click(object sender, EventArgs e)
    {
        try
        {
            if (btnSave.Visible == true)
            {
                tbxCarid.ReadOnly = false;
                btnSave.Visible = false;
                btnSearch.Visible = true;
                btnResearch.Visible = false;
                lbacceptcar.Visible = false;
                lblastname.Visible = false;
                lbname.Visible = false;
                lbstatus.Visible = false;
                lbtel.Visible = false;
                lbCcaraccept.Visible = false;
                lbClastname.Visible = false;
                lbCname.Visible = false;
                lbCtel.Visible = false;
                Cddlstatus.Visible = false;
            }
            else { }
            tbxCarid.Text = "";
        }
        catch
        {

        }
    }
}