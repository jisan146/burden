using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Threading.Tasks;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using System.Security.Cryptography;
using System.IO.Ports;
using System.Threading;

namespace WebApplication1
{
    public partial class verify_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
                Response.Redirect("profile.aspx");

        }
        private void msgbox(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "CallMyFunction", "alert('" + msg + "')", true);
        }

        OracleConnection con = new OracleConnection(Properties.Settings.Default.connection_string);
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["v"].ToString() == TextBox1.Text)
            {
                Session["id"] = Session["idv"];
                Session["id1"] = Session["id1v"];
                Session["pass"] = Session["passv"];
                //  Session["a123"] = pf.Value.ToString().ToLower();
                if (con.State != ConnectionState.Open)
                    con.Open();
                OracleCommand cmd1 = con.CreateCommand();
                cmd1.CommandText = "begin log_act_time('" + Session["id"].ToString() + "','Login From '||'" + Session["op"].ToString() + "'); end;";
                cmd1.ExecuteNonQuery();
                if (Session["a123"].ToString().ToLower() == "n")
                    Response.Redirect("profile.aspx");
                if (Session["a123"].ToString().ToLower() == "y")
                    Response.Redirect("granted_link.aspx");
            }
            else { msgbox("Verification Code not match"); }

        }
    }
}