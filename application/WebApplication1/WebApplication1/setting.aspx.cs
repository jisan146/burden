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

namespace WebApplication1
{
    public partial class setting : System.Web.UI.Page
    {
        private void msgbox(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "CallMyFunction", "alert('" + msg + "')", true);
        }

        OracleConnection con = new OracleConnection(Properties.Settings.Default.connection_string);
        void l()
        {
            Class1 d = new Class1();
            string log_out = d.my(Session["id"].ToString(), Session["pass"].ToString());
            if (log_out != "1") { Session.RemoveAll(); Response.Redirect("home.aspx"); }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
                Response.Redirect("home.aspx");
            else
            {
                l();
                TextBox1.Text = Session["id"].ToString();
                Session["grant"] = "Setting.aspx";
                if (con.State != ConnectionState.Open)
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
           

              

                try
                {
                    if (con.State != ConnectionState.Open)
                        con.Open();
                    //  OracleTransaction trans = con.BeginTransaction();
                    OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);
                    OracleCommand cmd = con.CreateCommand();
                    cmd.CommandText = "begin c_pass('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',:p_region_name); end;";
                    cmd.Parameters.Add(p_region_name);
                    cmd.ExecuteNonQuery();
                    //  trans.Commit();







                    msgbox(p_region_name.Value.ToString());



                }
                catch (Exception) { }

           
        
        }
    }
}