<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WebApplication1.WebForm9" %>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Profile</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
     <meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Lucid Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

<!-- //For-Mobile-Apps -->
<!-- Style --> <link rel="stylesheet" href="css/style2.css" type="text/css" media="all" />

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

    <style type="text/css">
        #form2 {
            text-align: center;
        }
    </style>

</head>

<body style="overflow:auto">
      <form id="form2" runat="server">
  <div class="login"  >
	<h1>Profile</h1>
  
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
         
          <div style="margin: auto; overflow:auto; height: 400px; width:100%;">   
              <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                 
                   <ItemTemplate>
                      
                      <div style="margin-top:2px">
                       <div style="margin-bottom:5px"> <asp:Image ID="Image1" runat="server" ImageUrl=  <%# String.Format(@"data:image/jpeg;base64,{0}", Eval("image"))%> Width="100%" Height="250px" /></div>
                          <asp:TextBox ID="TextBox1" runat="server"  Text=<%# Eval("id") %> Enabled="False" ></asp:TextBox>
                       <asp:TextBox ID="TextBox2" runat="server"  Text=<%# Eval("name_ban") %> Enabled="False" ></asp:TextBox>
                               <asp:TextBox ID="TextBox3" runat="server"  Text=<%# Eval("name_eng") %> Enabled="False" ></asp:TextBox>
                               <asp:TextBox ID="TextBox4" runat="server"  Text=<%# Eval("gender") %> Enabled="False" ></asp:TextBox>
                                <asp:TextBox ID="TextBox5" runat="server"  Text=<%# Eval("father") %> Enabled="False" ></asp:TextBox>
                                 <asp:TextBox ID="TextBox6" runat="server"  Text=<%# Eval("mother") %> Enabled="False" ></asp:TextBox>
                                 <asp:TextBox ID="TextBox7" runat="server"  Text=<%# Eval("dob") %> Enabled="False" ></asp:TextBox>
                              <asp:TextBox ID="TextBox8" runat="server"  Text=<%# Eval("blood_group") %> Enabled="False" ></asp:TextBox>
                           
                           <div style="  ">  <asp:Button ID="Button2" class="btn btn-primary btn-block btn-large" runat="server"  CausesValidation="True" CommandName="5"   UseSubmitBehavior="False" Text="Menu" Width="100%" />    </div> 
                               <div style="margin-top:5px; margin-bottom:15px;">  <asp:Button ID="Button1" class="btn btn-primary btn-block btn-large" runat="server"  CausesValidation="True" CommandName="6"  UseSubmitBehavior="False" Text="Sign out" Width="100%" /></div> 
                      
                          
                           </ItemTemplate>
            </asp:Repeater></div>      
                       
          
         




   
</div>
  
     </form>

</body>
</html>
