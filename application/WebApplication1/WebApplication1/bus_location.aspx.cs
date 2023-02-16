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
    public partial class WebForm5611 : System.Web.UI.Page
    {
        private void msgbox(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "CallMyFunction", "alert('" + msg + "')", true);
        }

        OracleConnection con = new OracleConnection(Properties.Settings.Default.connection_string);

        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (Session["id"] == null)
            {

                Response.Redirect("home.aspx");
            }
            else
            {

               if(Session["b"].ToString() == "p") { Button2.Visible = false; }
                Session["grant"] = "navigation.aspx";
                con.Open();

                OracleCommand cmd = con.CreateCommand();

                cmd.CommandText = "begin   GRA_L('" + Session["grant"].ToString() + "','" + Session["id"].ToString() + "',:p_region_name); end;";
                OracleParameter p_region_name = new OracleParameter("p_region_name", OracleDbType.Varchar2, 100, "", ParameterDirection.Output);

                cmd.Parameters.Add(p_region_name);

                cmd.ExecuteNonQuery();

                if (p_region_name.Value.ToString() == "1") { } else { Response.Redirect("home.aspx"); }
            }
            con.Close();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
/*
           int a = int.Parse(TextBox7.Text);
            a = a + 1;
            TextBox7.Text = a.ToString();
       
            if (a == 5) { ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "myScript", "myMap()()", true); TextBox7.Text = "0"; }
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "myScript", "getLocation()", true);


          
           if (con.State != ConnectionState.Open)
                con.Open();
            OracleCommand cmd = con.CreateCommand();
            cmd.CommandText = "update x_bus_status set Latitude='" + TextBox1.Text + "',Longitude='" + TextBox2.Text + "'where id=(select bus_license_no from X_BUS_STUFF where   stuff_id='" + Session["id1"].ToString() + "') ";
            cmd.ExecuteNonQuery();

          

           cmd.Connection = con;
            cmd.CommandText = "select case when to_number(description)<0 then 'Time Require(min): '||abs(description) else 'Delay(min): '||description end description from x_bus_status where id=(select bus_license_no from X_BUS_STUFF where   stuff_id='" + Session["id1"].ToString() + "')";
            cmd.CommandType = CommandType.Text;
            OracleDataReader dr = cmd.ExecuteReader();
            dr.Read();
            TextBox4.Text = dr.GetString(0);
            con.Close();*/

        }

       
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["b"].ToString() == "w")
            {
                OracleDataAdapter sda1g = new OracleDataAdapter("select id,substr(LATITUDE,14)LATITUDE ,substr(LONGITUDE,13)LONGITUDE,id||' '||case when to_number(description)<0 then 'Time Require(min): '||abs(description) else 'Delay(min): '||description end description from x_bus_status where  id in(select  license_no from x_bus_infromation where owner_id='" + Session["id"] + "' )", con);
                DataTable dt1g = new DataTable();
                sda1g.Fill(dt1g);
                rptMarkers.DataSource = dt1g;
                rptMarkers.DataBind();
                TextBox7.Visible = false;
            }

            if (Session["b"].ToString() == "c")
            {
                OracleDataAdapter sda1 = new OracleDataAdapter("select id,substr(LATITUDE,14)LATITUDE ,substr(LONGITUDE,13)LONGITUDE,id||' '||case when to_number(description)<0 then 'Time Require(min): '||abs(description) else 'Delay(min): '||description end description from x_bus_status where  id in(select  license_no from x_bus_infromation where owner_id=(select bus_owner from x_appoint where stuff_id='"+Session["id"]+"'))", con);
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);
                rptMarkers.DataSource = dt1;
                rptMarkers.DataBind();
                TextBox7.Visible = false;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          
            OracleDataAdapter sda1g = new OracleDataAdapter("select id,substr(LATITUDE,14)LATITUDE ,substr(LONGITUDE,13)LONGITUDE,id||' '||case when to_number(description)<0 then 'Time Require(min): '||abs(description) else 'Delay(min): '||description end description from x_bus_status  where id in(select  license_no from x_bus_infromation where owner_id='" + Session["id"] + "' and license_no='" + TextBox1.Text+"' )", con);
            DataTable dt1g = new DataTable();
            sda1g.Fill(dt1g);
            rptMarkers.DataSource = dt1g;
            rptMarkers.DataBind();
            try
            {
                if (con.State != ConnectionState.Open)
                    con.Open();
                OracleCommand cmd = con.CreateCommand();
                cmd.Connection = con;
                cmd.CommandText = "select case when to_number(description)<0 then 'Time Require(min): '||abs(description) else 'Delay(min): '||description end description from x_bus_status where id='" + TextBox1.Text + "'";
                cmd.CommandType = CommandType.Text;
                OracleDataReader dr = cmd.ExecuteReader();
                dr.Read();
                TextBox7.Text = dr.GetString(0);
                con.Close();
                TextBox7.Visible = true;
            }
            catch { }

        }
    }
}