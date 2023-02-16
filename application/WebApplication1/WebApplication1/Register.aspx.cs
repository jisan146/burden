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
    public partial class WebForm2 : System.Web.UI.Page
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
                Session["grant"] = "register.aspx";
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
            if (DropDownList1.SelectedIndex != 0)
            {
                try
                {
                    if (DropDownList1.SelectedItem.Text.ToLower() == "f" || DropDownList1.SelectedItem.Text.ToLower() == "female")
                        c = "F";
                    else if (DropDownList1.SelectedItem.Text.ToLower() == "m" || DropDownList1.SelectedItem.Text.ToLower() == "male")
                        c = "M";
                    else if (DropDownList1.SelectedItem.Text.ToLower() == "o" || DropDownList1.SelectedItem.Text.ToLower() == "other")
                        c = "O";
                    else
                        msgbox("input correct gender");

                    if (TextBox4.Text != null)
                        f = TextBox4.Text;
                    if (TextBox5.Text != null)
                        m = TextBox5.Text;

                    if (con.State != ConnectionState.Open)
                        con.Open();

                    OracleCommand cmd = con.CreateCommand();

                    cmd.CommandText = "begin  p_new_user('" + Session["id"].ToString() + "','open','" + TextBox2.Text + "','" + TextBox1.Text + "','" + c + "','" + f + "','" + m + "','" + TextBox6.Text + "',null,'" + TextBox7.Text + "','" + TextBox8.Text + "',:ms,:v_data,'" + Session["f"].ToString() + "'); end;";
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
                        try
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
                           
                        }
                        catch { }

                        /*  using (MailMessage mm = new MailMessage("jisanrahman1996@gmail.com", TextBox8.Text))
                          {
                              mm.Subject = "Project AGAMI";
                              mm.Body = v_date.Value.ToString();

                              mm.IsBodyHtml = false;
                              SmtpClient smtp = new SmtpClient();
                              smtp.Host = "smtp.gmail.com";
                              smtp.EnableSsl = true;
                              NetworkCredential NetworkCred = new NetworkCredential("jisanrahman1996@gmail.com", "199601687602005");
                              smtp.UseDefaultCredentials = true;
                              smtp.Credentials = NetworkCred;
                              smtp.Port = 587;
                              smtp.Send(mm);
                          }*/
                        TextBox1.Text = null;
                        TextBox2.Text = null;
                        DropDownList1.SelectedIndex = 0;
                        TextBox4.Text = null;
                        TextBox5.Text = null;
                        TextBox6.Text = null;
                        TextBox7.Text = null;
                        TextBox8.Text = null;
                        c = null;
                        m = null;
                        f = null;
                        Session["f"] = null;
                        Response.Redirect("finger_print.aspx");
                    }
                    else
                        msgbox(ms.Value.ToString());


                }
                catch { msgbox("check date format, Father or Mother ID. IF they have not user id blank those field"); }
            }
            else { msgbox("Gender is Require"); }
        }

        
    }
}