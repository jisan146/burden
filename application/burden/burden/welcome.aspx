<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="welcome.aspx.cs" Inherits="WebApplication1.Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
   
<head runat="server">
     <meta charset="UTF-8">
  <title>Home</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
     <meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Lucid Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

<!-- //For-Mobile-Apps -->
<!-- Style --> <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

     <style type="text/css">
         .auto-style1 {
             text-align: center;
         }
     </style>

    </head>
<body>
   

   
    <div style=" margin-bottom: auto; margin-top: auto;  margin-top:10px">
     <form id="form1" runat="server" style="">
          <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
    <table align="center" style=" width:800px" border="1" >
        <tr >
            <td style="    text-align: center; font-family: 'times New Roman', Times, serif; font-size: 24px; font-weight: bold; font-style: normal;" 
                colspan="2">
                Welcome 
                To 
                Our Online Bus counter<br />
            </td>
        </tr>
        <tr >
            <td style="    text-align: center; font-family: 'times New Roman', Times, serif; font-size: 24px; font-weight: bold; font-style: normal;" 
                colspan="2">
                <strong>Now 
                Time is our.</strong></td>
        </tr>
        <tr>
            <td style="text-align: center; vertical-align: top;   " rowspan="10">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                       
                        
                        <asp:Image ID="Image1" runat="server" Height="380px" Width="510px" 
                            ImageUrl="~/image/1.jpg"  />
                           
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td style="   " class="auto-style1">
                No more waiting for bus</td>
        </tr>
        <tr>
            <td style="    " class="auto-style1">
                No More wasting Time</td>
        </tr>
        <tr>
            <td style="   " class="auto-style1">
                No more fight for bus</td>
        </tr>
        <tr>
            <td style="  text-align: center;    ">
                No more create Traffic Jam</td>
        </tr>
        <tr>
            <td style="  text-align: center;    ">
                No more travel on bus with risk</td>
        </tr>
        <tr>
            <td style="  text-align: center;    font-size: 15px;">
                Help Govt. to make Digital Bangladesh</td>
        </tr>
        <tr>
            <td style="  text-align: center;    ">
                Be Digital Make Digital </td>
        </tr>
         <tr>
            <td style="  text-align: center; font-size: 16px; ">
                 You are Already Our Client</td>
        </tr>
         <tr>
            <td style="  text-align: center; font-size: 16px; ">
                 No Need Extra Password For Login</td>
        </tr>
        
         <tr>
            <td style="  text-align: center; font-family: 'times New Roman', Times, serif; font-size: 16px; font-weight: bold; ">
                <asp:Button ID="Button1" runat="server" Text="Buy Ticket" 
                               class="btn btn-primary btn-block btn-large" onclick="Button1_Click"  />
                 </td>
        </tr>
         
     
                       
      
       
        </table>
             <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                 <ContentTemplate>
                     <asp:TextBox ID="TextBox1" runat="server" Visible="False">0</asp:TextBox>
                     <asp:Timer ID="Timer1" runat="server" Interval="2000" ontick="Timer1_Tick">
                     </asp:Timer>
                 </ContentTemplate>
          </asp:UpdatePanel>
    </form>
    </div>
    </body>
</html>
