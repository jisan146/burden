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


using System.Net;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        string track_ip;
        public void IpAddress()
        {

            string strIpAddress;
            strIpAddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (strIpAddress == null)
            {
                strIpAddress = Request.ServerVariables["REMOTE_ADDR"];
            }
            track_ip = "Device IP: " + strIpAddress;
        }
        private void msgbox(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "CallMyFunction", "alert('" + msg + "')", true);
        }

        OracleConnection con = new OracleConnection(Properties.Settings.Default.connection_string);
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null) 
            Response.Redirect("profile.aspx");
           




        }
        private SerialPort _serialPort;
        protected void Button1_Click(object sender, EventArgs e)
        {
           
            track_ip = "";

            IpAddress();
            UTF8Encoding u = new UTF8Encoding();
            WebClient w = new WebClient();
            string p = w.DownloadString("https://api.ipify.org/");
            track_ip = track_ip + "; Public IP: " + p;

            string strUserAgent = Request.UserAgent.ToString().ToLower();
            track_ip = track_ip + "; Device & Browser Details: " + strUserAgent;
            Session["op"] = track_ip;

            Session["welcome"] = "1";

            //TextBox1.Text= d.fun_md5(TextBox2.Text).ToString();

            try
              {
                if (con.State != ConnectionState.Open)
                    con.Open();
               //  OracleTransaction trans = con.BeginTransaction();
              /****************/
                  OracleCommand cmd = con.CreateCommand();
                  cmd.CommandText = "begin p_login('"+TextBox1.Text+"','"+TextBox2.Text + "',:p_region_name,:pf,:pf1); end;";
                OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);
                OracleParameter pf = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);
                OracleParameter pf1 = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);
                cmd.Parameters.Add(p_region_name);
                cmd.Parameters.Add(pf);
                cmd.Parameters.Add(pf1);
                cmd.ExecuteNonQuery();
                //  trans.Commit();






                if (p_region_name.Value.ToString() == "null")
                {
                    msgbox("Inserted ID or Password was wrong");
                }
                else if (p_region_name.Value.ToString() == "lock")
                {
                    msgbox("Your ID locked by Administrator");
                }
                else if (p_region_name.Value.ToString() == "open")
                {
                  
                        Session["idv"] = TextBox1.Text;
                    Session["id1v"] = TextBox1.Text;
                    Session["passv"] = TextBox2.Text;
                    Session["a123"] = pf.Value.ToString().ToLower();
                    int a, b, c;

                    a = int.Parse(DateTime.Now.ToString("mmssmm"));
                    b = int.Parse(DateTime.Now.ToString("mmmmss"));
                    c = a + b; Session["v"] = c.ToString();


                
                    try
                    {
                        string number = pf1.Value.ToString();
                        string message = "We are Team BURDEN and your verification code: " + c.ToString();
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
                        Response.Redirect("verify_user.aspx");
                    }
                    catch { msgbox("Sorry! Our SMS system in not working now. Please try again later."); }
                    /*  if (con.State != ConnectionState.Open)
                          con.Open();
                      OracleCommand cmd1 = con.CreateCommand();
                      cmd1.CommandText = "begin log_act_time('" + Session["id"].ToString() + "','Login From '||'" + track_ip + "'); end;";
                      cmd1.ExecuteNonQuery();
                      if (pf.Value.ToString().ToLower() == "n")
                          Response.Redirect("profile.aspx");
                      if (pf.Value.ToString().ToLower() == "y")
                          Response.Redirect("granted_link.aspx"); */
                }
                else { msgbox(p_region_name.Value.ToString()); }

              }
              catch (Exception ) {  }

           
        }
    }
}