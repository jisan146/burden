using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.IO;
using System.ComponentModel;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using System.Globalization;
using System.Net.NetworkInformation;
using System.Net.Mail;
using System.Net;
using System.IO.Ports;
using System.Web.UI.HtmlControls;

namespace WebApplication1
{
    public partial class Update_zone : System.Web.UI.Page
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

        OracleConnection con = new OracleConnection(Properties.Settings.Default.connection_string);
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["id"] == null)
            {

                Response.Redirect("home.aspx");
            }
            else
            {
                l();
                Session["grant"] = "Update_zone.aspx";
                con.Open();

                OracleCommand cmd = con.CreateCommand();

                cmd.CommandText = "begin   GRA_L('" + Session["grant"].ToString() + "','" + Session["id"].ToString() + "',:p_region_name); end;";
                OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

                cmd.Parameters.Add(p_region_name);

                cmd.ExecuteNonQuery();

                if (p_region_name.Value.ToString() == "1") { } else { Response.Redirect("home.aspx"); }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            l();
            string c = null, m = null, f = null;

            try
            {




                if (con.State != ConnectionState.Open)
                    con.Open();

                OracleCommand cmd = con.CreateCommand();

                cmd.CommandText = "begin  p_voter_list('"+Session["id"].ToString()+"','"+TextBox1.Text+"'); end;";


                cmd.ExecuteNonQuery();




             

                TextBox1.Text = null;
              
                Session["f"] = null;





            }
            catch (Exception ex) { msgbox(ex.ToString()); }

        }

       
    }
}