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
    public partial class WebForm17 : System.Web.UI.Page
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
        void tk()
        {
            if (con.State != ConnectionState.Open)
                con.Open();

            OracleCommand cmd = con.CreateCommand();

            cmd.CommandText = "begin   x_p_balance('" + Session["id"].ToString() + "',:p_region_name); end;";
            OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

            cmd.Parameters.Add(p_region_name);

            cmd.ExecuteNonQuery();
            TextBox1.Text = p_region_name.Value.ToString();
            TextBox5.Text = "Current Balance (tk): "+p_region_name.Value.ToString();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
                Response.Redirect("home.aspx");
            else
            {
                l();
                tk();
               
                Session["grant"] = "balance.aspx";
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
            float a, b;
            a = float.Parse(TextBox1.Text);
            b = float.Parse(TextBox3.Text);
            if (a>=b) { 
            if (Session["pass"].ToString()==TextBox4.Text)
            {

                //TextBox1.Text= d.fun_md5(TextBox2.Text).ToString();

                try
                {
                    if (con.State != ConnectionState.Open)
                        con.Open();
                    //  OracleTransaction trans = con.BeginTransaction();
                    OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);
                    OracleCommand cmd = con.CreateCommand();
                    cmd.CommandText = "begin x_balance_tra('"+Session["id"].ToString()+"','"+TextBox2.Text+"','"+TextBox3.Text+"'); end;";
                   
                    cmd.ExecuteNonQuery();
                    //  trans.Commit();







                  



                }
                catch (Exception) { }

            }
            else { msgbox("Password Not Match"); }
        } else { msgbox("No Balance");
    }
            tk();
            TextBox2.Text = null;
            TextBox3.Text = null;
            TextBox4.Text = null;
        }
    }
}