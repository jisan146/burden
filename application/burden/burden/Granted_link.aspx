<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Granted_link.aspx.cs" Inherits="WebApplication1.WebForm12" %>

<html >
<head>
  <meta charset="UTF-8">
  <title>Granted Link</title>
  
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
	<h2>All Accessible Link</h2>
  
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
           
          <div style="margin: auto; overflow:auto; height: 400px;  "> 
             
              <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                 
                   <ItemTemplate>
                      
                      <div style="margin-top:2px">
                      
                          <asp:TextBox ID="TextBox1" runat="server" Text=<%# Eval("link") %> Visible="False"></asp:TextBox>
                           <div style="  margin-left:4px; margin-right:auto">  <asp:Button ID="Button2" class="btn btn-primary btn-block btn-large" runat="server"  CausesValidation="True"    UseSubmitBehavior="False" Text=<%# Eval("alias") %> />    </div> 
                            
                      
                          
                           </ItemTemplate>
            </asp:Repeater>
           
         
          </div>      <div style="margin-top:2px; margin-left:4px;"> <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-block btn-large" Text="Sign Out" OnClick="Button1_Click" /></div>
                           <div style="margin-top:2px;margin-bottom:5px; margin-left:4px;"> <input type="button" id="btnCancel" class="btn btn-primary btn-block btn-large" value="Back" onclick="GoTo();"/></div>
            <script type="text/javascript">
function GoTo() {
    window.location.href = 'profile.aspx';
        }
</script>         
          
           </ContentTemplate>
        </asp:UpdatePanel>  




   
</div>
  
     </form>

</body>
</html>
