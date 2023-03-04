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
using System.Globalization;
using System.Net.NetworkInformation;
using System.Net.Mail;
using System.Net;
using System.IO.Ports;

using System.Threading;

namespace WebApplication1
{
    public partial class foreigner : System.Web.UI.Page
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
        private SerialPort _serialPort;
        OracleConnection con = new OracleConnection(Properties.Settings.Default.connection_string);
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["f"] == null)
            {

                Response.Redirect("finger_print.aspx");

            }
            if (Session["id"] == null)
            {
                l();
                Response.Redirect("home.aspx");
            }
            else
            {
                Session["grant"] = "Add_foreigner.aspx";
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

                cmd.CommandText = "begin  P_foreigner('" + Session["id"].ToString() + "','open','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox7.Text + "','" + TextBox8.Text + "',:ms,:v_data,'" + Session["f"].ToString() + "'); end;";
                OracleParameter ms = new OracleParameter("ms",
                                                          OracleDbType.Varchar2,
                                                          500,
                                                          "",
                                                          ParameterDirection.Output);
                OracleParameter v_date = new OracleParameter("ms",
                                                          OracleDbType.Varchar2,
                                                          500,
                                                          "",
                                                          ParameterDirection.Output);

                cmd.Parameters.Add(ms);
                cmd.Parameters.Add(v_date);

                cmd.ExecuteNonQuery();
                if (ms.Value.ToString().ToLower() == "save")
                {

                    string number = TextBox8.Text;
                    string message = v_date.Value.ToString();
                    _serialPort = new SerialPort("COM7", 115200);
                    Thread.Sleep(1000);
                    _serialPort.Open();
                    Thread.Sleep(1000);
                    _serialPort.Write("AT+CMGF=1\r");
                    Thread.Sleep(1000);
                    _serialPort.Write("AT+CMGS=\"" + number + "\"\r\n");
                    Thread.Sleep(1000);
                    _serialPort.Write(message + "\x1A");
                    Thread.Sleep(1000);
                    _serialPort.Close();


                    TextBox2.Text = null;
                    TextBox3.Text = null;
                    TextBox4.Text = null;
                    TextBox5.Text = null;

                    TextBox7.Text = null;
                    TextBox8.Text = null;
                    c = null;
                    m = null;
                    f = null;
                    Session["f"] = null;
                    Response.Redirect("finger_print.aspx");


                }
                else {  }

              

            }
            catch {  }
           
        }
    }
}