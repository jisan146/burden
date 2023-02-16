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
    public partial class WebForm15 : System.Web.UI.Page
    {
        private void msgbox(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "CallMyFunction", "alert('" + msg + "')", true);
        }

        OracleConnection con = new OracleConnection(Properties.Settings.Default.connection_string);
        string path; string base64String, id;
        Class1 d = new Class1();
        void l()
        {
           
            string log_out = d.my(Session["id"].ToString(), Session["pass"].ToString());
            if (log_out != "1") { Session.RemoveAll(); Response.Redirect("home.aspx"); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["f1"].ToString()=="f") { Button2.Text = "Search ID"; }


            if (Session["id"] == null)
                 Response.Redirect("home.aspx");
             else
             {
                l();

                Session["grant"] = "finger_print.aspx";
                 con.Open();

                 OracleCommand cmd = con.CreateCommand();

                 cmd.CommandText = "begin   GRA_L('" + Session["grant"].ToString() + "','" + Session["id"].ToString() + "',:p_region_name); end;";
                 OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

                 cmd.Parameters.Add(p_region_name);

                 cmd.ExecuteNonQuery();

                 if (p_region_name.Value.ToString() == "1") { } else { Response.Redirect("home.aspx"); }
             }
        }

       

        protected void Button2_Click(object sender, EventArgs e)
        {
            string id,age;
            l();
            TextBox1.Text = null;
            TextBox2.Text = null;
            Session["f"] = null;
            string t;
            string f = System.IO.Path.GetExtension(hpf.FileName);
            if (f.ToLower() != ".jpg") { msgbox("Scan Finger First"); }
            else
            {


                /// hpf.SaveAs(Server.MapPath("~/uploads/") + System.IO.Path.GetFileName(hpf.FileName));


                // 
                hpf.SaveAs(Server.MapPath("~/upload/" + hpf.FileName));
                Image1.ImageUrl = "~/upload/" + hpf.FileName;
                using (Image image = Image.FromFile(Server.MapPath("~/upload/" + hpf.FileName)))
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
                cmd.Parameters.Add(p_region_name);
                OracleParameter aaa = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

                cmd.Parameters.Add(aaa);
                cmd.ExecuteNonQuery();
                TextBox2.Text = null;
                TextBox2.Text = "Applicant Age: " + aaa.Value.ToString();
                age = "Applicant Age:" + aaa.Value.ToString();
                int a = int.Parse(p_region_name.Value.ToString().Length.ToString());

                TextBox1.Text = " Applicant ID: "+p_region_name.Value.ToString();
                id= p_region_name.Value.ToString();
                if (id.Length < 5) { TextBox1.Text = null; Session["f"] = d.fun_md5(base64String); } else { Session["f"] = null; }
                Image1.ImageUrl = String.Format(@"data:image/jpeg;base64,{0}", base64String);
                File.Delete(Server.MapPath("~/upload/" + hpf.FileName));

              
                   if (Session["f1"].ToString() == "f") {  }
                    else if (Session["f1"].ToString() == "af") { Response.Redirect("add_foreigner.aspx");  }
                    else if (Session["f1"].ToString() == "ap") { Response.Redirect("register.aspx"); }


            }
           
          

           

        }



    }
}