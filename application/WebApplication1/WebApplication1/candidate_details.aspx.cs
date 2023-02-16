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


namespace WebApplication1
{
    public partial class candidate_details : System.Web.UI.Page
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
                if (Session["candi"] == null) { Response.Redirect("vote.aspx"); }
                Session["grant"] = "candidate_details.aspx";
                if (con.State != ConnectionState.Open)
                    con.Open();

                //
                OracleCommand cmd11 = con.CreateCommand();

                cmd11.CommandText = "begin   P_vote_on(:po); end;";
                OracleParameter po = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

                cmd11.Parameters.Add(po);

                cmd11.ExecuteNonQuery();

                if (po.Value.ToString() == "1") { Button3.Visible = true; Button1.Visible = false; Button2.Visible = false; } else { Button3.Visible = false; Button1.Visible = true; Button2.Visible = true; }
                //
                OracleCommand cmd = con.CreateCommand();

                cmd.CommandText = "begin   GRA_L('" + Session["grant"].ToString() + "','" + Session["id"].ToString() + "',:p_region_name); end;";
                OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

                cmd.Parameters.Add(p_region_name);

                cmd.ExecuteNonQuery();

                if (p_region_name.Value.ToString() == "1") { } else { Response.Redirect("home.aspx"); }

                OracleCommand cmd1 = con.CreateCommand();

                cmd1.CommandText = "begin   P_O_CANDIDATE('" + Session["candi"].ToString() + "',:pa); end;";
            OracleParameter pa = new OracleParameter("pa", OracleDbType.Varchar2, 100000, "", ParameterDirection.Output);





            cmd1.Parameters.Add(pa);



            cmd1.ExecuteNonQuery();
            string s = pa.Value.ToString();
            TextBox1.Text = s.Replace("***", "\r\n\r\n");
            cmd1.CommandText = "select image  from image where id='" + Session["candi"].ToString() + "' and i_date=(select max(i_date) from image where id='" + Session["candi"].ToString() + "')";
            cmd1.CommandType = CommandType.Text;
            OracleDataReader dr = cmd1.ExecuteReader();
            dr.Read();
            Image1.ImageUrl = String.Format(@"data:image/jpeg;base64,{0}", dr.GetString(0));
        }
         

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (con.State != ConnectionState.Open)
                con.Open();

            OracleCommand cmd = con.CreateCommand();

            cmd.CommandText = "begin   PG_REP('"+Session["id"].ToString()+ "','" + Session["candi"].ToString() + "','1','0'); end;";
           

            

            cmd.ExecuteNonQuery();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (con.State != ConnectionState.Open)
                con.Open();

            OracleCommand cmd = con.CreateCommand();

            cmd.CommandText = "begin   PG_REP('" + Session["id"].ToString() + "','" + Session["candi"].ToString() + "','0','1'); end;";




            cmd.ExecuteNonQuery();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (con.State != ConnectionState.Open)
                con.Open();

            OracleCommand cmd = con.CreateCommand();

            cmd.CommandText = "begin   P_vote_count('" + Session["id"].ToString() + "','"+Session["post"].ToString()+ "','" + Session["candi"].ToString() + "'); end;";




            cmd.ExecuteNonQuery();
        }
    }
}
