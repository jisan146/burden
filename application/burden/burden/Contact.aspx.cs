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
    public partial class WebForm6 : System.Web.UI.Page
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
                Session["grant"] = "contact.aspx";
                if (con.State != ConnectionState.Open)
                    con.Open();

                OracleCommand cmd = con.CreateCommand();

                cmd.CommandText = "begin   GRA_L('"+Session["grant"].ToString()+"','"+Session["id"].ToString()+ "',:p_region_name); end;";
                OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

                cmd.Parameters.Add(p_region_name);
                
                cmd.ExecuteNonQuery();

                if (p_region_name.Value.ToString() == "1") {  } else { Response.Redirect("home.aspx"); }
            }
        }
        OracleConnection con = new OracleConnection(Properties.Settings.Default.connection_string);
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text.Length == 11) { 
            l();
            if (TextBox1.Text != TextBox3.Text)
            {
                if (con.State != ConnectionState.Open)
                    con.Open();

                OracleCommand cmd = con.CreateCommand();

                cmd.CommandText = "begin   p_contacts('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + Session["id"].ToString() + "','" + Session["pass"].ToString() + "',:p_region_name); end;";
                OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

                cmd.Parameters.Add(p_region_name);
                cmd.ExecuteNonQuery();
                if (p_region_name.Value.ToString().ToLower() == "open")
                { }
                else if (p_region_name.Value.ToString().ToLower() == "no") { msgbox("iligel age"); }
                else
                {
                    Session.RemoveAll();
                    Response.Redirect("home.aspx");
                    // msgbox(p_region_name.Value.ToString());
                }
               

            }
            else { msgbox("id and references can not be same"); TextBox1.Text = null;
                    
                }
               
        }
            else { msgbox("Contact Number Length Should 11"); }
            TextBox1.Text = null;
            TextBox2.Text = null;
            TextBox3.Text = null;
            TextBox4.Text = null;
            TextBox2.Enabled = false;
            Button100.Visible = true;
            Button1.Visible = false;
            FileUpload1.Visible = true;
        }

        protected void Button100_Click(object sender, EventArgs e)
        {
            string base64String;
            Class1 d = new Class1();
            string f = System.IO.Path.GetExtension(FileUpload1.FileName);

            if (f.ToLower() != ".jpg") { msgbox("Scan finger First"); }
            else
            {

                if (FileUpload1.FileName == "") { }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("~/upload/" + FileUpload1.FileName));

                    using (Image image = Image.FromFile(Server.MapPath("~/upload/" + FileUpload1.FileName)))
                    {
                        using (MemoryStream m = new MemoryStream())
                        {
                            image.Save(m, image.RawFormat);
                            byte[] imageBytes = m.ToArray();

                            // Convert byte[] to Base64 String
                            base64String = Convert.ToBase64String(imageBytes);


                        }
                    }

                    if (con.State != ConnectionState.Open)
                        con.Open();



                    OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);
                    OracleCommand cmd = con.CreateCommand();
                    cmd.CommandText = "begin  FPF('" + TextBox1.Text + "','" + d.fun_md5(base64String) + "','" + Session["id"].ToString() + "',:p_region_name,'" + Session["grant"].ToString() + "',:aaa); end;";
                    OracleParameter aaa = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);
                    cmd.Parameters.Add(p_region_name);
                    cmd.Parameters.Add(aaa);
                    cmd.ExecuteNonQuery();
                    TextBox4.Text = "Applicant Age: " + aaa.Value.ToString();
                    int a = int.Parse(p_region_name.Value.ToString().Length.ToString());
                    // TextBox1.Text = p_region_name.Value.ToString();
                    if (TextBox1.Text == "" && a > 4) { TextBox1.Text = p_region_name.Value.ToString();Button100.Text = "Search References ID"; }
                    else if (TextBox3.Text == "" && a > 4) { TextBox3.Text = p_region_name.Value.ToString(); TextBox2.Enabled = true;Button1.Visible = true;Button100.Visible = false; Button100.Text = "Search Applicant ID"; FileUpload1.Visible = false; }
                 


                    File.Delete(Server.MapPath("~/upload/" + FileUpload1.FileName));


                }

            }
        }
    }
}