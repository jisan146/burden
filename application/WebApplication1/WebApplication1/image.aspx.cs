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
    public partial class WebForm3 : System.Web.UI.Page
    {
        private void msgbox(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "CallMyFunction", "alert('" + msg + "')", true);
        }

        OracleConnection con = new OracleConnection(Properties.Settings.Default.connection_string);
        string path; string base64String,id;
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


                Session["grant"] = "image.aspx";
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
            l();
            string t;
            string f = System.IO.Path.GetExtension(hpf.FileName);
            if (f.ToLower() != ".jpg") { msgbox("Select .jpg file first"); }
            else
            {
                if (hpf.FileName == "") { }
                else
                {
                    if (hpf.FileContent.Length < 2147483640)
                    {

                        if (hpf.FileContent.Length < 2147483640)
                    {
                       

                            HttpFileCollection hfc = Request.Files;


                            for (int i = 0; i < hfc.Count; i++)
                            {

                                HttpPostedFile hpf = hfc[i];
                                t = System.IO.Path.GetExtension(hpf.FileName);
                                if (hpf.ContentLength > 0 && t.ToLower() == ".jpg")
                                {
                                    /// hpf.SaveAs(Server.MapPath("~/uploads/") + System.IO.Path.GetFileName(hpf.FileName));
                                    path = System.IO.Path.GetFullPath(hpf.FileName);
                                        id = System.IO.Path.GetFileNameWithoutExtension(hpf.FileName);
                                     
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
                                        if(con.State!=ConnectionState.Open)
                                        con.Open();

                                        
                                        OracleCommand cmd = con.CreateCommand();
                                    //  OracleTransaction trans = con.BeginTransaction();
                                    cmd.CommandText = "begin insert_image ('"+id+"',:p_country_id,'" + Session["id"].ToString() + "',sysdate,'" + Session["pass"].ToString() + "',:p_region_name); end;";
                                    OracleParameter p_country_id = new OracleParameter("p_country_id",
                                                                   OracleDbType.Clob, base64String,

                                                                   ParameterDirection.Input);
                                    OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 4, "", ParameterDirection.Output);
                                    cmd.Parameters.Add(p_country_id);
                                    cmd.Parameters.Add(p_region_name);
                                    cmd.ExecuteNonQuery();
                                     
                                    if (p_region_name.Value.ToString().ToLower() == "1")
                                    { }
                                    else
                                    { Session.RemoveAll();
                                      Response.Redirect("home.aspx");
                                       
                                    }
                                     
                                        Image1.ImageUrl = String.Format(@"data:image/jpeg;base64,{0}", base64String);
                                    File.Delete(Server.MapPath("~/upload/" + hpf.FileName));

                                }
                            }
                        
                       

                    }


                    }
                    else { msgbox("Total file size should below 2GB"); }
                   

                }
        }
           
        }

      

        
    }
}