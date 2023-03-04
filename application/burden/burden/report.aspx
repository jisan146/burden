<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="WebApplication1.report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report</title>
    <link rel="stylesheet" href="css/style3.css" type="text/css" media="all" />
</head>
<body>
    <form id="form1" runat="server">


         <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
                  
                            <table align="center">
            
               
               
          <tr><td style="text-align: center;">
                                     <asp:TextBox ID="TextBox3" runat="server"  BorderStyle="None"  style="text-align: center" Font-Bold="True" Font-Size="50px" Font-Underline="True" Enabled="False" BackColor="White" ForeColor="Black"> Report </asp:TextBox>
               </td></tr>
                                 <tr><td style="text-align: center;">
                                    <asp:TextBox ID="TextBox1" placeholder="Insert Query Here" autofocus runat="server" CssClass="textbox" Width="80%" ></asp:TextBox></br>
                                     <asp:Button ID="Button1" runat="server" Text="Result" OnClick="Button1_Click" Width="82px" class="btn btn-primary btn-large " />&nbsp;<asp:Button ID="Button2" class="btn btn-primary btn-large " runat="server" Text="Back" OnClick="Button2_Click" Width="82px" />         

               <asp:Button ID="btnPrint" runat="server" Text="Print " class="btn btn-primary btn-large "  OnClick="btnPrint_Click" Width="82px" />
                 
               </td></tr>
                             
               <tr><td style="text-align: center" >
               
                         </td></tr>
                                 <tr><td style="text-align: right;">
                                     <asp:TextBox ID="TextBox5" runat="server" BorderStyle="None"  style="text-align: center" Font-Underline="True" Enabled="false" ForeColor="Black"   BackColor="White" Font-Names="arial" Visible="False"></asp:TextBox>
               </td></tr>
          <tr><td align="center">

                  <asp:GridView ID="GridView1" runat="server"  style="text-align: left" CellPadding="4" BorderStyle="None" BackColor="White" BorderColor="#d8d4d0" BorderWidth="1px" >
                   <AlternatingRowStyle BackColor="White" />
                   <EditRowStyle BackColor="#7C6F57" />
                   <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                   <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                   <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                   <RowStyle BackColor="#E3EAEB" BorderStyle="None" />
                   <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                   <SortedAscendingCellStyle BackColor="#F8FAFA" />
                   <SortedAscendingHeaderStyle BackColor="#246B61" />
                   <SortedDescendingCellStyle BackColor="#D4DFE1" />
                   <SortedDescendingHeaderStyle BackColor="#15524A" />



                    </asp:GridView>
              <!--           -->
               <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False">
                       <Columns>
                           <asp:TemplateField HeaderText="Pessenger Ticket">
                               <ItemTemplate>
                                   <div style="width:300px">
                                
                                   <asp:TextBox ID="TextBox4" runat="server" Text= <%# "Ticket No: "+Eval("s_no")+"\r\n"+"Sell By: "+Eval("pessenger_id")+"\r\n"+"Bus ID: "+Eval("bus_license_no")+"\r\n"+"Travel Date: "+Eval("TRAVEL_DATE")+"\r\n"+"Journey From: "+Eval("sfrom")+"\r\n"+"Start Time: "+Eval("stime")+"\r\n"+"Destination: "+Eval("eto")+"\r\n"+"End Time: "+Eval("etime")+"\r\n"+"KM: "+Eval("km")+"\r\n"+"Taka: "+Eval("taka")+"\r\n"+"Sit: "+Eval("sit") %> Width="98%" BackColor="White" BorderStyle="None" TextMode="MultiLine" Enabled="False" Height="200px" ForeColor="Black" Font-Bold="True" Font-Size="15px" Font-Names="arial"></asp:TextBox>
                                  
                               </div></ItemTemplate>
                           </asp:TemplateField>
                       </Columns>
                       <AlternatingRowStyle BackColor="White" />
                  
                   <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                   
                   </asp:GridView>


                 <!--           -->
                 </td></tr>
               <tr><td align="center">

                   <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False">
                       <Columns>
                           <asp:TemplateField HeaderText="Details">
                               <ItemTemplate>
                                   <div style="width:300px">
                                 <asp:Image ID="Image1" runat="server" ImageUrl=  <%# String.Format(@"data:image/jpeg;base64,{0}", Eval("image"))%> Width="293" Height="400px" BorderStyle="Solid" BorderColor="Black" />
                                   <asp:TextBox ID="TextBox4" runat="server" Text= <%# Eval("id")  %> Width="98%" BackColor="White" BorderStyle="None" TextMode="MultiLine" Enabled="False" Height="55" ForeColor="Black" Font-Bold="True" Font-Size="15px" Font-Names="arial"></asp:TextBox>
                                  
                               </div></ItemTemplate>
                           </asp:TemplateField>
                       </Columns>
                       <AlternatingRowStyle BackColor="White" />
                  
                   <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                   
                   </asp:GridView>
                </td></tr>
                                 <tr><td style="text-align: right;height:100px">
                                     <asp:TextBox ID="TextBox2" runat="server" BorderStyle="None" Font-Overline="True" style="text-align: center">       Signature      </asp:TextBox>
               </td></tr>
        </table>
                           <asp:Timer ID="Timer1" runat="server" Interval="100" OnTick="Timer1_Tick" Enabled="False">
                           </asp:Timer>
                       

    
               
            

    </form>
</body>
</html>
