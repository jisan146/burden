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

namespace WebApplication1
{
    public partial class WebForm85 : System.Web.UI.Page
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

        void tk()
        {
            if (con.State != ConnectionState.Open)
                con.Open();

            OracleCommand cmd = con.CreateCommand();

            cmd.CommandText = "begin   x_p_balance('" + Session["id"].ToString() + "',:p_region_name); end;";
            OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

            cmd.Parameters.Add(p_region_name);

            cmd.ExecuteNonQuery();
            TextBox12.Text = p_region_name.Value.ToString();
            TextBox11.Text = "Current Balance (tk): " + p_region_name.Value.ToString();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["id"] == null)
                Response.Redirect("home.aspx");
            else
            {
                l();
                tk();
                Session["grant"] = "ticket.aspx";
                if (con.State != ConnectionState.Open)
                    con.Open();

                OracleCommand cmd = con.CreateCommand();

                cmd.CommandText = "begin   GRA_L('" + Session["grant"].ToString() + "','" + Session["id"].ToString() + "',:p_region_name); end;";
                OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

                cmd.Parameters.Add(p_region_name);

                cmd.ExecuteNonQuery();

                if (p_region_name.Value.ToString() == "1") { } else { Response.Redirect("home.aspx"); }
            }


        }
        void fun1()
        {
            l();
            OracleDataAdapter sda1 = new OracleDataAdapter("select b.km-a.km km,a.tk*(b.km-a.km) tk, a.l, to_char(a.time,'hh:mi am') start_time,a.location_name,to_char(b.time,'hh:mi am')end_Time,b.location_name  from ( select b.rent tk,k.km km,b.license_no l,time,location_name,t.BUS_STOP_POINT b from  x_time_schedule t,x_stop_office s,x_bus_infromation b,x_bus_has_stop_office k where s.stop_point=t.bus_stop_point and k.bus_stop_point=s.stop_point and lower(location_name)=lower('" + TextBox1.Text + "') and b.license_no=t.bus_license_no and license='a' ) a,(select b.rent tk,k.km km,b.license_no l,time,location_name,t.BUS_STOP_POINT b from  x_time_schedule t,x_stop_office s,x_bus_infromation b,x_bus_has_stop_office k where s.stop_point=t.bus_stop_point and k.bus_stop_point=s.stop_point and lower(location_name)=lower('" + TextBox2.Text + "')and b.license_no=t.bus_license_no and license='a' ) b where a.time<b.time and to_number(24*(b.time-a.time))<=12  and a.time>=to_date(to_char(sysdate,'hh:mi am'),'hh:mi am') order by start_time", con);
            
             DataTable dt1 = new DataTable();
            sda1.Fill(dt1);

            Repeater1.DataSource = dt1;
            Repeater1.DataBind();
        }
        void fun2()
        {
            l();
            OracleDataAdapter sda1 = new OracleDataAdapter("select b.km-a.km km,a.tk*(b.km-a.km) tk, a.l, to_char(a.time,'hh:mi am') start_time,a.location_name,to_char(b.time,'hh:mi am')end_Time,b.location_name from ( select b.rent tk,k.km km,b.license_no l,time,location_name,t.BUS_STOP_POINT b from  x_time_schedule t,x_stop_office s,x_bus_infromation b,x_bus_has_stop_office k where s.stop_point=t.bus_stop_point and k.bus_stop_point=s.stop_point  and lower(location_name)=lower('" + TextBox1.Text + "') and b.license_no=t.bus_license_no and license='a' ) a,(select b.rent tk,k.km km,b.license_no l,time,location_name,t.BUS_STOP_POINT b from  x_time_schedule t,x_stop_office s,x_bus_infromation b,x_bus_has_stop_office k where s.stop_point=t.bus_stop_point and k.bus_stop_point=s.stop_point and lower(location_name)=lower('" + TextBox2.Text + "')and b.license_no=t.bus_license_no and license='a' ) b where a.time<b.time and to_number(24*(b.time-a.time))<=12  order by start_time", con);

            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);

            Repeater1.DataSource = dt1;
            Repeater1.DataBind();
        }
        void fun3()
        {
            l();
            OracleDataAdapter sda1 = new OracleDataAdapter("select a.km-b.km km,a.tk*(a.km-b.km) tk, a.l, to_char(a.time,'hh:mi am') start_time,a.location_name,to_char(b.time,'hh:mi am')end_Time,b.location_name   from ( select b.rent tk,k.km km,b.license_no l,time,location_name,t.BUS_STOP_POINT b from  x_time_schedule_1 t,x_stop_office s,x_bus_infromation b,x_bus_has_stop_office k where s.stop_point=t.bus_stop_point and k.bus_stop_point=s.stop_point  and lower(location_name)=lower('" + TextBox1.Text + "') and b.license_no=t.bus_license_no and license='a' ) a,(select b.rent tk,k.km km,b.license_no l,time,location_name,t.BUS_STOP_POINT b from  x_time_schedule_1 t,x_stop_office s,x_bus_infromation b,x_bus_has_stop_office k where s.stop_point=t.bus_stop_point and k.bus_stop_point=s.stop_point and lower(location_name)=lower('" + TextBox2.Text + "')and b.license_no=t.bus_license_no and license='a' ) b where a.time<b.time and to_number(24*(b.time-a.time))<=12  and a.time>=to_date(to_char(sysdate,'hh:mi am'),'hh:mi am') order by start_time", con);

            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);

            Repeater1.DataSource = dt1;
            Repeater1.DataBind();
        }
        void fun4()
        {
            l();
            OracleDataAdapter sda1 = new OracleDataAdapter("select a.km-b.km km,a.tk*(a.km-b.km) tk, a.l, to_char(a.time,'hh:mi am') start_time,a.location_name,to_char(b.time,'hh:mi am')end_Time,b.location_name   from ( select b.rent tk,k.km km,b.license_no l,time,location_name,t.BUS_STOP_POINT b from  x_time_schedule_1 t,x_stop_office s,x_bus_infromation b,x_bus_has_stop_office k where s.stop_point=t.bus_stop_point and k.bus_stop_point=s.stop_point  and lower(location_name)=lower('" + TextBox1.Text + "') and b.license_no=t.bus_license_no and license='a' ) a,(select b.rent tk,k.km km,b.license_no l,time,location_name,t.BUS_STOP_POINT b from  x_time_schedule_1 t,x_stop_office s,x_bus_infromation b,x_bus_has_stop_office k where s.stop_point=t.bus_stop_point and k.bus_stop_point=s.stop_point and lower(location_name)=lower('" + TextBox2.Text + "')and b.license_no=t.bus_license_no and license='a' ) b where a.time<b.time and to_number(24*(b.time-a.time))<=12   order by start_time", con);

            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);

            Repeater1.DataSource = dt1;
            Repeater1.DataBind();
        }
        void fun5()
        {
            l();
            OracleDataAdapter sda1 = new OracleDataAdapter("select * from people where id=''", con);

            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);

            Repeater1.DataSource = dt1;
            Repeater1.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            l();
            Button3.Visible = false;
           label1.Visible = false;
            if (con.State != ConnectionState.Open)
                con.Open();
            fun5();
            label1.Visible = true;
             OracleCommand cmd = con.CreateCommand();
             cmd.CommandText = "begin  x_return('"+TextBox1.Text+ "','" + TextBox2.Text + "','" + TextBox3.Text + "',:aaa); end;";

             OracleParameter aaa = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

             cmd.Parameters.Add(aaa);
             cmd.ExecuteNonQuery();
          
                  if (aaa.Value.ToString() == "1") { fun1(); }
             else if (aaa.Value.ToString() == "2") { fun2(); }
             else if (aaa.Value.ToString() == "3") { fun3(); }
             else if (aaa.Value.ToString() == "4") { fun4(); }
            if (Repeater1.Items.Count < 1) { label1.Text = "No Bus Found"; } else { label1.Text = "Result"; };
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            l();
            int rowid = (e.Item.ItemIndex);
            //  Image t = (Image)Repeater1.Items[rowid].FindControl("Image1") as Image;
            TextBox t4 = (TextBox)Repeater1.Items[rowid].FindControl("Textbox4") as TextBox;
            TextBox t5 = (TextBox)Repeater1.Items[rowid].FindControl("Textbox5") as TextBox;
            TextBox t6 = (TextBox)Repeater1.Items[rowid].FindControl("Textbox6") as TextBox;
            TextBox t7 = (TextBox)Repeater1.Items[rowid].FindControl("Textbox7") as TextBox;
            TextBox t8 = (TextBox)Repeater1.Items[rowid].FindControl("Textbox8") as TextBox;
            TextBox t9 = (TextBox)Repeater1.Items[rowid].FindControl("Textbox9") as TextBox;
            TextBox t10 = (TextBox)Repeater1.Items[rowid].FindControl("Textbox10") as TextBox;
            Session["t-t4"] = t4.Text;
            Session["t-t5"] = t5.Text;
            Session["t-t6"] = t6.Text;
            Session["t-t7"] = t7.Text;
            Session["t-t8"] = t8.Text;
            Session["t-t9"] = t9.Text;
            Session["t-t10"] = t10.Text;
            Button3.Visible = true;
            if (con.State != ConnectionState.Open)
                con.Open();
            OracleCommand cmd = con.CreateCommand();
            cmd.CommandText = "begin  x__check_ticket('" + Session["t-t4"].ToString() + "','" + Session["t-t5"].ToString() + "','" + Session["t-t6"].ToString() + "','" + Session["t-t7"].ToString() + "','" + Session["t-t8"].ToString() + "','" + Session["t-t9"].ToString() + "','" + Session["t-t10"].ToString() + "','" + Session["id"].ToString() + "','" + TextBox3.Text + "',:p_region_name,:p_region_name1); end;";
        
            OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);
            cmd.Parameters.Add(p_region_name);
            OracleParameter p_region_name1 = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);
            cmd.Parameters.Add(p_region_name1);
            cmd.ExecuteNonQuery();
            Button3.Text = p_region_name.Value.ToString();
            if (p_region_name1.Value.ToString() == "0")
                Button3.Enabled = false;
            else
                Button3.Enabled = true;

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (con.State != ConnectionState.Open)
                con.Open();
            OracleCommand cmd = con.CreateCommand();
            cmd.CommandText = "begin  x__ticket('" + Session["t-t4"].ToString() + "','" + Session["t-t5"].ToString() + "','" + Session["t-t6"].ToString() + "','" + Session["t-t7"].ToString() + "','" + Session["t-t8"].ToString() + "','" + Session["t-t9"].ToString() + "','" + Session["t-t10"].ToString() + "','" + Session["id"].ToString() + "','" + TextBox3.Text + "'); end;";
            cmd.ExecuteNonQuery();
            tk();
            Button3.Visible = false;
            Session["t-t4"] = null;
            Session["t-t5"] = null;
            Session["t-t6"] = null;
            Session["t-t7"] = null;
            Session["t-t8"] = null;
            Session["t-t9"] = null;
            Session["t-t10"] = null;
        }
    }
}