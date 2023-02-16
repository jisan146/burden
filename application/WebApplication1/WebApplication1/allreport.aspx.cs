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
    public partial class allreport : System.Web.UI.Page
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
            Session["f"] = null;
            Session["f1"] = null;

            if (Session["id"] == null)
                Response.Redirect("home.aspx");
            else
            {
                l();
                Session["grant"] = "allreport.aspx";
                if (con.State != ConnectionState.Open)
                    con.Open();

                OracleCommand cmd = con.CreateCommand();

                cmd.CommandText = "begin   GRA_L('" + Session["grant"].ToString() + "','" + Session["id"].ToString() + "',:p_region_name); end;";
                OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

                cmd.Parameters.Add(p_region_name);

                cmd.ExecuteNonQuery();

                if (p_region_name.Value.ToString() == "1") { } else { Response.Redirect("home.aspx"); }
            }

            OracleDataAdapter sda1 = new OracleDataAdapter("select a,query link,initcap(alias) alias from ALLVIEW where VIEW_ID in (select view_id from g_view) or view_id in (select view_id from vrole where lower(name) in (select lower(viewname) from user_view where id='" + Session["id"].ToString()+"')) order by initcap(alias)", con);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);

            Repeater1.DataSource = dt1;
            Repeater1.DataBind();

        }
        OracleConnection con = new OracleConnection(Properties.Settings.Default.connection_string);


        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            l();
            Session["que"] = null;
            int rowid = (e.Item.ItemIndex);
            //  Image t = (Image)Repeater1.Items[rowid].FindControl("Image1") as Image;
            TextBox t = (TextBox)Repeater1.Items[rowid].FindControl("Textbox1") as TextBox;
            TextBox t2 = (TextBox)Repeater1.Items[rowid].FindControl("Textbox2") as TextBox;
            Button t1 = (Button)Repeater1.Items[rowid].FindControl("Button2") as Button;
            // TextBox3.Text = t.Text;
            Session["allow"]= t2.Text;
            if (t1.Text.ToLower() == "family")
            {
                Session["que"] = "1";
            }
            else { Session["que"] = t.Text; }
            Response.Redirect("report.aspx");


        }
    }
}