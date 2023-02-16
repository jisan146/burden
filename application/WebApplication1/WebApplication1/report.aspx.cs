using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace WebApplication1
{
    public partial class report : System.Web.UI.Page
    {
        OracleConnection con = new OracleConnection(Properties.Settings.Default.connection_string);

        protected void Page_Load(object sender, EventArgs e)
        {

            GridView3.Visible = true;
            TextBox5.Text = "Date: "+DateTime.Now.ToString("dd-MMM-yy hh:mm tt");
            GridView2.Visible = false;
             TextBox2.Visible = false;
             TextBox1.Enabled = false;
             if (Session["id"]==null) { Response.Redirect("home.aspx"); }
            if (Session["allow"] == null) { Response.Redirect("home.aspx"); }

            if (Session["allow"].ToString().ToLower() == "y") { TextBox1.Enabled = true; }
            else if (Session["allow"].ToString().ToLower() == "i") { TextBox1.Text = Session["id"].ToString(); GridView1.Visible = false; GridView2.Visible = true; my(); }
            else if (Session["allow"].ToString().ToLower() == "f") { TextBox1.Enabled = true; }
            else if (Session["allow"].ToString().ToLower() == "p") { TextBox1.Enabled = true; }
            else if (Session["allow"].ToString().ToLower() == "d") { TextBox1.Enabled = true; GridView1.Visible = false; GridView2.Visible = true; }
            else if (Session["allow"].ToString().ToLower() == "u") { TextBox1.Enabled = true; GridView1.Visible = false; GridView2.Visible = true; }
            else if (Session["allow"].ToString().ToLower() == "tic")
            {
                TextBox3.Text = "Tickets";
                btnPrint.Visible = false;
                Button1.Visible = false;
                Button2.Visible = false;
                TextBox1.Visible = false; GridView1.Visible = true; GridView2.Visible = false;
                OracleDataAdapter sda1 = new OracleDataAdapter("select s_no Ticket_No,BUS_LICENSE_NO,to_char(TRAVEL_DATE,'dd-MON-rr')TRAVEL_DATE,sfrom Start_From,to_char(stime,'hh:mi am') Start_time,eto Destination,to_char(etime,'hh:mi am') End_Time,km,taka,sit from x_ticket_p where lower(sit)!='exp' and  PESSENGER_ID='"+Session["id"].ToString()+"' order by TRAVEL_DATE", con);

                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);

                GridView1.DataSource = dt1;
                GridView1.DataBind();
            }
            else if (Session["allow"].ToString().ToLower() == "tic1")
            {
                TextBox3.Visible = false;
                btnPrint.Visible = false;
                Button1.Visible = false;
                Button2.Visible = false;
                GridView3.Visible = true;
                TextBox1.Visible = false; GridView1.Visible = false; GridView2.Visible = false;
                OracleDataAdapter sda1 = new OracleDataAdapter("select s_no ,BUS_LICENSE_NO,to_char(TRAVEL_DATE,'dd-MON-rr') as TRAVEL_DATE,sfrom as sfrom,to_char(stime,'hh:mi am') as stime,eto as eto,to_char(etime,'hh:mi am') as etime,km,taka,sit ,substr(pessenger_id,0,instr(pessenger_id,'-')-1) as pessenger_id from x_ticket_p where s_no=(select max(s_no) from x_ticket_p where  PESSENGER_ID='" + Session["id"].ToString()+"'||'-c' and lower(sit)!='exp' and travel_date=to_char(sysdate,'dd-mon-rr'))  ", con);

                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);

                GridView3.DataSource = dt1;
                GridView3.DataBind();
               
                HttpContext.Current.Response.Write("<script>window.print();</script>");
            }
            else
            {
                TextBox1.Text = Session["id"].ToString();
                my();
            }
            
        }
        private void msgbox(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "CallMyFunction", "alert('" + msg + "')", true);
        }
        void my()
        {
            if (con.State != ConnectionState.Open)
                con.Open();
            try { 
            if (Session["que"].ToString() == "1")
            {
                OracleDataAdapter sda1 = new OracleDataAdapter("select ID,NAME_ENG Name ,father Father_ID ,mother Mother_ID,case when male=id then female when female=id then male end married,case lower(gender) when 'm' then 'MALE' when 'f'  then 'FEMALE' when 'o' then 'OTHER' end gender,BLOOD_GROUP,to_char(dob,'dd-Mon-rr')dob,to_char(dead,'dd-Mon-rr') dead from people p left outer join married m on (p.id=m.MALE or p.id=m.female) where  id in ( select id from people where id in(select id from people where id='" + Session["id"].ToString() + "'or father='" + Session["id"].ToString() + "' or id in(select father from people where id='" + Session["id"].ToString() + "') or id in(select id from people where father in(select id from people where father='" + Session["id"].ToString() + "')or father in(select father from people where id='" + Session["id"].ToString() + "')))or id in (select father from people where id in(select id from people where id='" + Session["id"].ToString() + "'or father='" + Session["id"].ToString() + "'or id in(select father from people where id='" + Session["id"].ToString() + "') or id in(select id from people where father in(select id from people where father='" + Session["id"].ToString() + "')or father in(select father from people where id='" + Session["id"].ToString() + "'))))or id in(select id from people where id='" + Session["id"].ToString() + "'or mother='" + Session["id"].ToString() + "'or id in(select mother from people where id='" + Session["id"].ToString() + "') or id in(select id from people where mother in(select id from people where mother='" + Session["id"].ToString() + "')or mother in(select mother from people where id='" + Session["id"].ToString() + "')))or id in (select mother from people where id in(select id from people where id=mother or mother='" + Session["id"].ToString() + "'or id in(select mother from people where id='" + Session["id"].ToString() + "') or id in(select id from people where mother in(select id from people where mother='" + Session["id"].ToString() + "')or mother in(select mother from people where id='" + Session["id"].ToString() + "')))))order by dob ", con);

                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);

                GridView1.DataSource = dt1;
                GridView1.DataBind();

            }
            else if (Session["allow"].ToString().ToLower() == "f")
            {
                OracleDataAdapter sda1 = new OracleDataAdapter("" + TextBox1.Text + "", con);

                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);

                GridView1.DataSource = dt1;
                GridView1.DataBind();
            }
                else if (Session["allow"].ToString().ToLower() == "p")
                {
                    OracleCommand cmd11 = con.CreateCommand();

                    cmd11.CommandText = "begin   c_check_query(q'["+ Session["que"].ToString() + "]',q'["+TextBox1.Text+"]',:po); end;";
                    OracleParameter po = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

                    cmd11.Parameters.Add(po);
                  
                    cmd11.ExecuteNonQuery();

                    if (po.Value.ToString() == "1")

                    {
                        OracleDataAdapter sda1 = new OracleDataAdapter("" + TextBox1.Text + "", con);

                        DataTable dt1 = new DataTable();
                        sda1.Fill(dt1);

                        GridView1.DataSource = dt1;
                        GridView1.DataBind();
                    }
                    else { msgbox("No privilige"); }
                   
                }
                else if (Session["allow"].ToString().ToLower() == "i")
                {
                    GridView1.Visible = false;
                    GridView2.Visible = true;
                    OracleDataAdapter sda1 = new OracleDataAdapter(Session["que"].ToString() + "'" + TextBox1.Text + "'", con);

                    DataTable dt1 = new DataTable();
                    sda1.Fill(dt1);

                    GridView2.DataSource = dt1;
                    GridView2.DataBind();
                }
                else if (Session["allow"].ToString().ToLower() == "d")
                {
                    GridView1.Visible = false;
                    GridView2.Visible = true;
                    OracleDataAdapter sda1 = new OracleDataAdapter(Session["que"].ToString() + "'" + TextBox1.Text + "'", con);

                    DataTable dt1 = new DataTable();
                    sda1.Fill(dt1);

                    GridView2.DataSource = dt1;
                    GridView2.DataBind();
                }
                else if (Session["allow"].ToString().ToLower() == "u")
                {
                    GridView1.Visible = false;
                    GridView2.Visible = true;
                    OracleDataAdapter sda1 = new OracleDataAdapter(Session["que"].ToString() + "'" + TextBox1.Text + Session["id"].ToString() + "'", con);

                    DataTable dt1 = new DataTable();
                    sda1.Fill(dt1);

                    GridView2.DataSource = dt1;
                    GridView2.DataBind();
                }

                else
                {
                OracleDataAdapter sda1 = new OracleDataAdapter(Session["que"].ToString() + "'" + TextBox1.Text + "'", con);

                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);

                GridView1.DataSource = dt1;
                GridView1.DataBind();

            }
            }
            catch {  }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            my();
            if (con.State != ConnectionState.Open)
                con.Open();
            try
            {
                if (TextBox1.Enabled == true)
                {
                    if (Session["allow"].ToString().ToLower() == "p")
                    {
                        OracleCommand cmd2 = con.CreateCommand();
                        cmd2.CommandText = "insert into vactivity values(q'['" + TextBox1.Text + "']','" + Session["id"].ToString() + "',sysdate)";
                        cmd2.ExecuteNonQuery();
                    }
                    else
                    {
                        OracleCommand cmd2 = con.CreateCommand();
                        cmd2.CommandText = "insert into vactivity values(q'['" + Session["que"].ToString() + TextBox1.Text + "']','" + Session["id"].ToString() + "',sysdate)";
                        cmd2.ExecuteNonQuery();
                    }
                }
            }
            catch { }

         


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["que"] = null;
            Response.Redirect("allreport.aspx");
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            TextBox1.Visible = false;
            Button1.Visible = false;
            Button2.Visible = false;
            btnPrint.Visible = false;
            HttpContext.Current.Response.Write("<script>window.print();</script>");
            TextBox2.Visible = true;
            Timer1.Enabled = true;
            TextBox5.Visible = true;


        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            TextBox5.Visible = false;
            TextBox2.Visible = false;
            TextBox1.Visible = true;
            Button1.Visible = true;
            Button2.Visible = true;
            btnPrint.Visible = true;
            Timer1.Enabled = false;
        }
    }
}