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
    public partial class WebForm13 : System.Web.UI.Page
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
             

              if (Session["id"] == null)
                  Response.Redirect("home.aspx");
              else
            {
                l();
                Session["grant"] = "update_data.aspx";
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
        OracleConnection con = new OracleConnection(Properties.Settings.Default.connection_string);
        protected void Button1_Click(object sender, EventArgs e)
        {
           
            
                if (con.State != ConnectionState.Open)
                    con.Open();

                OracleCommand cmd = con.CreateCommand();

                cmd.CommandText = "begin  p_d_update(:aaa,:bbb,:ccc,:ddd,:eee,'" + TextBox2.Text+ "','"+Session["id"].ToString()+"'); end;";

                OracleParameter aaa = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);
                cmd.Parameters.Add(aaa);
                OracleParameter bbb = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);
                cmd.Parameters.Add(bbb);
                OracleParameter ccc = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);
                cmd.Parameters.Add(ccc);
                OracleParameter ddd = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);
                cmd.Parameters.Add(ddd);
                OracleParameter eee = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);
                cmd.Parameters.Add(eee);

                cmd.ExecuteNonQuery();
              
                if (aaa.Value.ToString() == "1")
                {
                   
                    if (con.State != ConnectionState.Open)
                        con.Open();

                    OracleCommand cmd1 = con.CreateCommand();

                    cmd1.CommandText = "begin  p_update_data('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + Session["id"].ToString() + "'); end;";
                  
                  
                    
                    cmd1.ExecuteNonQuery();
                } else if(bbb.Value.ToString()=="1")
                {
                    if (TextBox3.Text.ToLower() == "null") { TextBox3.Text = null; }

                    if (con.State != ConnectionState.Open)
                        con.Open();


                    OracleCommand cmd2 = con.CreateCommand();
                    cmd2.CommandText = "insert into activity select '"+TextBox1.Text+ "','" + ddd.Value.ToString() + "','" + ccc.Value.ToString() + "'," + ccc.Value.ToString() + ",'" + TextBox3.Text+ "','"+Session["id"].ToString()+ "',sysdate from " + ddd.Value.ToString() + " where " + eee.Value.ToString() + "='"+TextBox1.Text+"'";
                    cmd2.ExecuteNonQuery();

                    OracleCommand cmd1 = con.CreateCommand();
                   

                    cmd1.CommandText = "update "+ddd.Value.ToString()+ " set " + ccc.Value.ToString() + "= '" + TextBox3.Text+ "' where " + eee.Value.ToString() + "='"+TextBox1.Text+ "' ";
              
                   

                    cmd1.ExecuteNonQuery();

                    
                }
               TextBox1.Text = null;
                TextBox2.Text = null;
                TextBox3.Text = null;
            
        }

       
    }
}