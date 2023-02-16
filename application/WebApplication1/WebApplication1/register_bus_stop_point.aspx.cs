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
    public partial class WebForm30 : System.Web.UI.Page
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
                if (con.State != ConnectionState.Open)
                    con.Open();
                l();
                Session["grant"] = "register_bus_stop_point.aspx";
               

                OracleCommand cmd = con.CreateCommand();

                cmd.CommandText = "begin   GRA_L('" + Session["grant"].ToString() + "','" + Session["id"].ToString() + "',:p_region_name); end;";
                OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

                cmd.Parameters.Add(p_region_name);

                cmd.ExecuteNonQuery();

                if (p_region_name.Value.ToString() == "1") { } else { Response.Redirect("home.aspx"); }
            }
            con.Close();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            int a = int.Parse(TextBox7.Text);
            a = a + 1;
            TextBox7.Text = a.ToString();
            if (a == 5) { ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "myScript", "myMap()()", true); TextBox7.Text = "0"; }
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "myScript", "getLocation()", true);

        }
       
        protected void Button1_Click(object sender, EventArgs e)
        {

            // 
            // 
            if (con.State != ConnectionState.Open)
                con.Open();

            if (TextBox1.Text != "")
            {
                TextBox3.Text = TextBox1.Text.Substring(13);
                TextBox5.Text = TextBox2.Text.Substring(12);

                TextBox9.Visible = true;
                  TextBox8.Visible = true;
                  TextBox10.Visible = true;
                  Button2.Visible = true;
                  Button1.Visible = false; 
            };


            con.Close();


        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            
            if (TextBox1.Text != "")
            {
                TextBox6.Text = TextBox1.Text.Substring(13);
                TextBox11.Text = TextBox2.Text.Substring(12);
                if (TextBox3.Text != TextBox6.Text && TextBox5.Text != TextBox11.Text)
                {
                    if (con.State != ConnectionState.Open)
                        con.Open();
                    OracleCommand cmd = con.CreateCommand();
                    cmd.CommandText = "begin   x_bus_stop_office('" + TextBox8.Text + "','" + TextBox9.Text + "','" + TextBox10.Text + "','" + TextBox3.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox11.Text + "','" + Session["id"].ToString() + "');end;";
                    cmd.ExecuteNonQuery();
             


            TextBox10.Text = null;
            TextBox8.Text = null;
            TextBox9.Text = null;
            TextBox9.Visible = false;
            TextBox8.Visible = false;
            TextBox10.Visible = false;
            Button2.Visible = false;
            Button1.Visible = true;
            TextBox3.Text = null;
            TextBox5.Text = null;
            TextBox6.Text = null;
            TextBox11.Text = null;
                }
                else { msgbox("Please Change your possition"); }
            }
            con.Close();  }
        }
}