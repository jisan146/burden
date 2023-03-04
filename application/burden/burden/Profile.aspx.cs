using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Data;
//using System.Drawing;
using System.Text;
using System.Threading.Tasks;

using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using System.Globalization;
using System.Net.NetworkInformation;
using System.Net.Mail;
using System.Net;
using System.IO.Ports;

namespace WebApplication1
{
    public partial class WebForm9 : System.Web.UI.Page
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
                Session["grant"] = "profile.aspx";
              
                if (con.State != ConnectionState.Open)
                    con.Open();
            

                OracleCommand cmd = con.CreateCommand();

                cmd.CommandText = "begin   GRA_L('" + Session["grant"].ToString() + "','" + Session["id"].ToString() + "',:p_region_name); end;";
                OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

                cmd.Parameters.Add(p_region_name);

                cmd.ExecuteNonQuery();

                if (p_region_name.Value.ToString() == "1") { } else {  Response.Redirect("granted_link.aspx"); }
            }
            
            OracleDataAdapter sda1 = new OracleDataAdapter("select nvl(case  when father is not null then  'Father: ' || nvl((select name_eng from people where id=(select father from people where id='" + Session["id"].ToString() + "'))||' (ID: '||father||' )', 'Father ID: Not Register')end,'Father ID: Not Register') father,nvl(case  when mother is not null then  'Mother: ' || nvl((select name_eng from people where id=(select mother from people where id='" + Session["id"].ToString() + "'))||' (ID: '||mother||' )', 'Not Register')end,'Mother ID: Not Register') mother , 'ID: '||p.id  id, 'নাম: '||NAME_BAN name_ban,'Name: '||NAME_ENG name_eng,case lower(gender) when 'm' then 'Gender: Male' when 'f' then'Gender: Female' when 'o' then 'Gender: Other' end Gender, 'Birth Date: ' || to_char(dob, 'dd-MON-rr')||'  Age: '||trunc((sysdate-dob)/365)   DOB, 'Blood Group: ' || BLOOD_GROUP blood_group, i.IMAGE from people p , IMAGE i where i.id = '" + Session["id"].ToString() + "' and I_DATE = (select max(I_DATE) from image where id = '" + Session["id"].ToString()+"') and p.id = i.id ", con);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);
         
            Repeater1.DataSource = dt1;
            Repeater1.DataBind();
          
        }
        OracleConnection con = new OracleConnection(Properties.Settings.Default.connection_string);
        protected void Button1_Click(object sender, EventArgs e)
        {
            l();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            l();
           int rowid = (e.Item.ItemIndex);
            //  Image t = (Image)Repeater1.Items[rowid].FindControl("Image1") as Image;
            // TextBox t = (TextBox)Repeater1.Items[rowid].FindControl("TextBox1") as TextBox;
         if(e.CommandName=="5")
                Response.Redirect("granted_link.aspx");
            if (e.CommandName == "6")
            {
                if (con.State != ConnectionState.Open)
                    con.Open();
                OracleCommand cmd1 = con.CreateCommand();
                cmd1.CommandText = "begin log_act_time('" + Session["id"].ToString() + "','Log Out'); end;";
                cmd1.ExecuteNonQuery();
                Session.RemoveAll();
                Response.Redirect("home.aspx");
            }

        }
    }
}