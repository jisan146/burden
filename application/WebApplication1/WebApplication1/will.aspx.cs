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
    public partial class will : System.Web.UI.Page
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
                l();
                Response.Redirect("home.aspx");
            }
            else
            {
                Session["grant"] = "will.aspx";
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



                if (TextBox3.Text=="") { TextBox3.Text = "d"; }
                if (con.State != ConnectionState.Open)
                    con.Open();

                OracleCommand cmd = con.CreateCommand();

                cmd.CommandText = "begin  p_notice('" + Session["id"].ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "',:p_country_id); end;";

                OracleParameter p_country_id = new OracleParameter("p_country_id",
                                                                   OracleDbType.Clob, TextBox4.Text,

                                                                   ParameterDirection.Input);
               cmd.Parameters.Add(p_country_id);
          
                cmd.ExecuteNonQuery();




                Button100.Visible = true; Button1.Visible = false; TextBox1.Enabled = false; TextBox2.Enabled = false; TextBox3.Enabled = false;

                TextBox1.Text = null;
                TextBox2.Text = null;
                TextBox3.Text = null;
                TextBox4.Text = null; FileUpload1.Visible = true;


                c = null;
                m = null;
                f = null;
                Session["f"] = null;


              


            }
            catch (Exception ex) { msgbox(ex.ToString()); }

        }

        protected void Button100_Click(object sender, EventArgs e)
        {
            string base64String;
            Class1 d = new Class1();
            string f = System.IO.Path.GetExtension(FileUpload1.FileName);
            
            if (f.ToLower() != ".jpg") { msgbox("Add Document First"); }
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


                    TextBox4.Text = base64String;
                    if (TextBox4.Text != "") { Button100.Visible = false;Button1.Visible = true;TextBox1.Enabled = true; TextBox2.Enabled = true; TextBox3.Enabled = true; FileUpload1.Visible = false; }
                   

                    File.Delete(Server.MapPath("~/upload/" + FileUpload1.FileName));


                }

            }
        }
    }
}