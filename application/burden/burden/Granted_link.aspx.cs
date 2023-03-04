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
    public partial class WebForm12 : System.Web.UI.Page
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
              
                Session["grant"] = "granted_link.aspx";
                if (con.State != ConnectionState.Open)
                    con.Open();

                OracleCommand cmd = con.CreateCommand();

                cmd.CommandText = "begin   GRA_L('" + Session["grant"].ToString() + "','" + Session["id"].ToString() + "',:p_region_name); end;";
                OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

                cmd.Parameters.Add(p_region_name);

                cmd.ExecuteNonQuery();

                if (p_region_name.Value.ToString() == "1") { } else { Response.Redirect("home.aspx"); }
            }

            OracleDataAdapter sda1 = new OracleDataAdapter("select initcap(link) link,initcap(alias) alias from link where   id in(select l_id from g_liink) or  id in( select linkid from role where lower(name)in(select lower(role) from user_role where id='" + Session["id"].ToString()+ "')and linkid not in(5,6,3,8)) order by initcap(alias)", con);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);

            Repeater1.DataSource = dt1;
            Repeater1.DataBind();

        }
        OracleConnection con = new OracleConnection(Properties.Settings.Default.connection_string);
       

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            l();
           
            int rowid = (e.Item.ItemIndex);
            //  Image t = (Image)Repeater1.Items[rowid].FindControl("Image1") as Image;
            TextBox t = (TextBox)Repeater1.Items[rowid].FindControl("Textbox1") as TextBox;
            Button t1 = (Button)Repeater1.Items[rowid].FindControl("Button2") as Button;
            // TextBox3.Text = t.Text;
            Session["grant"] = t.Text;
            Session["ch"] = Session["id"].ToString();
            Session["f"] = null;
            Session["f1"] = null;
            Session["b"] = null;
            if (t.Text.ToLower() == "ticket.aspx") { Response.Redirect("welcome.aspx"); }
            if (t.Text.ToLower() == "finger_print.aspx") { Session["f1"] = "f";  }
            if (t.Text.ToLower() == "add_foreigner.aspx") { Session["f1"] = "af"; }
            if (t.Text.ToLower() == "register.aspx") { Session["f1"] = "ap";  }
            if (t1.Text.ToLower() == "my bus location") { Session["b"] = "w"; }
            if (t1.Text.ToLower() == "bus current location") { Session["b"] = "p"; }
            if (t1.Text.ToLower() == "bus's location") { Session["b"] = "c"; }

            Response.Redirect(t.Text);

           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("home.aspx");
        }
    }
}