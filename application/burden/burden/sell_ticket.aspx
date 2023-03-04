<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sell_ticket.aspx.cs" Inherits="WebApplication1.WebForm100" %>

<!DOCTYPE html>

<html >
<head>
  <meta charset="UTF-8">
  <title>Buy Ticket</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
     <meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Lucid Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

<!-- //For-Mobile-Apps -->
<!-- Style --> <link rel="stylesheet" href="css/style1.css" type="text/css" media="all" />

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

    <style type="text/css">
        #form2 {
            text-align: center;
        }
    </style>

</head>

<body >
 <div class="login" style="top:30%; ">
	<h2>Sell Ticket</h2>
      <div style="height:400px;overflow:auto">
    <form id="form2" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
                
            <asp:TextBox ID="TextBox11" runat="server" Enabled="false" Visible="false"></asp:TextBox>
        <asp:TextBox ID="TextBox12" runat="server" Visible="false"></asp:TextBox>  
            <asp:TextBox ID="TextBox1" list="browsers" runat="server" autofocus="" placeholder="Journey From" aufoucus="" required="required"   ></asp:TextBox>
          <asp:TextBox ID="TextBox2" list="browsers" runat="server" placeholder="Journey To" required="required" ></asp:TextBox>
        <asp:TextBox ID="TextBox3" list="date" runat="server" placeholder="Date (dd-mm-yy)" required="required" Enabled="false" Visible="false" ></asp:TextBox>

         <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-block btn-large" OnClick="Button1_Click" Text="Search" />
        
            <div style="margin-top:5px"> <input type="button" id="btnCancel" class="btn btn-primary btn-block btn-large" value="Back" onclick="GoTo();"/>

          
            </div>
       <div style="margin-top:10px;margin-bottom:10px">
            <asp:Label runat="server" Text="Result" ID="label1" Font-Size="20pt" ForeColor="White" Visible="False">

            </asp:Label>
           
            <asp:Button ID="Button3" runat="server" class="btn btn-primary btn-block btn-large" OnClick="Button3_Click"  Text="" Visible="false" />
          
       </div>
       <div style="height:auto;width:290px;">
            <div style="height:auto;width:280px;overflow:auto">
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            
              <ItemTemplate>
               <div style="margin-bottom:5px">   <asp:Button ID="Button2" class="btn btn-primary btn-block btn-large" runat="server" Text='<%# "From: "+Eval("location_name")+" ( "+Eval("start_time")+" ) To: "+Eval("location_name1")+" ( "+Eval("end_time")+" ) Distance: "+Eval("km")+" (km)"+" Cost: "+Eval("tk")+" (tk)" %>' Width="700px" /></div>
                  <asp:TextBox ID="TextBox4" Visible="false"  runat="server" Text='<%# Eval("l") %>'></asp:TextBox>
                   <asp:TextBox ID="TextBox5" Visible="false" runat="server" Text='<%# Eval("location_name") %>'></asp:TextBox>
                   <asp:TextBox ID="TextBox6"  Visible="false" runat="server" Text='<%# Eval("start_time") %>'></asp:TextBox>
                   <asp:TextBox ID="TextBox7"  Visible="false" runat="server" Text='<%# Eval("location_name1") %>'></asp:TextBox>
                   <asp:TextBox ID="TextBox8"  Visible="false" runat="server" Text='<%# Eval("end_time") %>'></asp:TextBox>
                   <asp:TextBox ID="TextBox9"  Visible="false" runat="server" Text='<%# Eval("km") %>'></asp:TextBox>
                   <asp:TextBox ID="TextBox10"  Visible="false" runat="server" Text='<%# Eval("tk") %>'></asp:TextBox>
                    </ItemTemplate>
        </asp:Repeater></div></div>


            <script type="text/javascript">
function GoTo() {
    window.location.href = 'Granted_link.aspx';
        }
</script> 
       
               
       

    </form>
</div></div>
       <datalist id="browsers">

   

    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>                             
    <option value="<%# Eval("location_name") %>">
        </ItemTemplate>
    </asp:DataList>

  

     </datalist>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebApplication1.Properties.Settings.connection_string %>" ProviderName="<%$ ConnectionStrings:WebApplication1.Properties.Settings.connection_string.ProviderName %>" SelectCommand="SELECT location_name  from x_stop_office"></asp:SqlDataSource>

</body>
</html>
