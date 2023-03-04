using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.IO.Ports;
using System.Threading;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Globalization;
using System.Net.NetworkInformation;



namespace WebApplication1
{
    public partial class Home : System.Web.UI.Page
    {
        
      

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Session["welcome"] == null)
                    Response.Redirect(Session["grant"].ToString());
            }
            catch { Session["grant"].ToString(); }
           

        }
        private void msgbox(string msg) { ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "CallMyFunction", "alert('" + msg + "')", true); }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            int a;
            a = int.Parse(TextBox1.Text);
            a = a + 1;
            if (a == 7) { a = 1; }
            TextBox1.Text = a.ToString();
           Image1.ImageUrl = "~/image/" + a.ToString() + ".jpg";
            int b=0;
            if (a == 1) { b = 11; }
            if (a == 2) { b = 11; }
            if (a == 3) { b = 11; }
            if (a == 4) { b = 22; }
            if (a == 5) { b = 22; }
            if (a == 6) { b = 22; } 
          
          
         
           
        }

       
      
        protected void Button1_Click(object sender, EventArgs e)
        {

            Session["welcome"] = null;
            Response.Redirect(Session["grant"].ToString());
         
        }

        
        

        
    }
}