using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Data;
//using System.Drawing;
using System.Text;
using System.Threading.Tasks;

using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using System.Globalization;
using System.Net.NetworkInformation;
using System.Net.Mail;
using System.Net;

namespace WebApplication1
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        void l()
        {
            Class1 d = new Class1();
            string log_out = d.my(Session["id"].ToString(), Session["pass"].ToString());
            if (log_out != "1") { Session.RemoveAll(); Response.Redirect("home.aspx"); }
        }
        private void msgbox(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "CallMyFunction", "alert('" + msg + "')", true);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
           
            TextBox3.Text = Session["ch"].ToString();

            if (Session["id"] == null)
                Response.Redirect("home.aspx");
            else
            {
                l();
                Session["grant"] = "delete_link.aspx";
                if (con.State != ConnectionState.Open)
                    con.Open();

                OracleCommand cmd = con.CreateCommand();

                cmd.CommandText = "begin   GRA_L('" + Session["grant"].ToString() + "','" + Session["id"].ToString() + "',:p_region_name); end;";
                OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

                cmd.Parameters.Add(p_region_name);

                cmd.ExecuteNonQuery();

                if (p_region_name.Value.ToString() == "1") { } else { Response.Redirect("home.aspx"); }
            }

            OracleDataAdapter sda1 = new OracleDataAdapter("select initcap(link) link,alias,g.L_ID from g_liink g , link l where g.L_ID=l.ID and g.id='" + TextBox3.Text + "' order by initcap(link) ", con);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);

            Repeater1.DataSource = dt1;
            Repeater1.DataBind();

        }
        OracleConnection con = new OracleConnection(Properties.Settings.Default.connection_string);
        protected void Button1_Click(object sender, EventArgs e)
        {
            l();
            OracleDataAdapter sda1 = new OracleDataAdapter("select initcap(link) link,alias,g.L_ID from g_liink g , link l where g.L_ID=l.ID and g.id='" + TextBox3.Text + "' order by initcap(link) ", con);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);

            Repeater1.DataSource = dt1;
            Repeater1.DataBind();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            l();
            int rowid = (e.Item.ItemIndex);
            //  Image t = (Image)Repeater1.Items[rowid].FindControl("Image1") as Image;
            TextBox t = (TextBox)Repeater1.Items[rowid].FindControl("TextBox1") as TextBox;
            // TextBox3.Text = t.Text;

            if (con.State != ConnectionState.Open)
                con.Open();

            OracleCommand cmd = con.CreateCommand();

            cmd.CommandText = "begin  g_l_d ('" + TextBox3.Text+"' , '"+t.Text+"'); end ;";

            cmd.ExecuteNonQuery();
            OracleDataAdapter sda1 = new OracleDataAdapter("select initcap(link) link,alias,g.L_ID from g_liink g , link l where g.L_ID=l.ID and g.id='" + TextBox3.Text + "' order by initcap(link)  ", con);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);

            Repeater1.DataSource = dt1;
            Repeater1.DataBind();


        }

        
    }
}