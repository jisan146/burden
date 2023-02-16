<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="delete_link.aspx.cs" Inherits="WebApplication1.WebForm11" %>

<html >
<head>
  <meta charset="UTF-8">
  <title>User Granted link</title>
  
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

<body >
      <form id="form2" runat="server">
  <div class="login" style="overflow:auto;height:450px" >
	<h1>All link</h1>
  
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
           
          <div style="margin-bottom:15px; overflow:auto; height: 400px;  "> 
                 <asp:TextBox ID="TextBox3" runat="server" placeholder="User ID" required="required" autofocus ></asp:TextBox>  
               <div style=" margin-top:4px; ">  <asp:Button ID="Button3" runat="server" Text="View all" class="btn btn-primary btn-block btn-large"  OnClick="Button1_Click" />  </div> 
              
            <div style="margin-top:5px; "> <input type="button" id="btnCancel" class="btn btn-primary btn-block btn-large" value="Back" onclick="GoTo();"/></div>
            <script type="text/javascript">
function GoTo() {
    window.location.href = 'Granted_link.aspx';
        }
</script> 
               <h3>Click for delete</h3>
              <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                 
                   <ItemTemplate>
                      
                      <div style="margin-top:2px">
                      
                      <asp:TextBox ID="TextBox1" runat="server" Text=<%# Eval("l_id") %> Visible="False"></asp:TextBox>
                           <div style="  ">  <asp:Button ID="Button2" class="btn btn-primary btn-block btn-large" runat="server"  CausesValidation="True"    UseSubmitBehavior="False" Text=<%# Eval("link") %> />    </div> 
                            
                      
                          
                           </ItemTemplate>
            </asp:Repeater>
           
         
          </div>      
                        
          
           </ContentTemplate>
        </asp:UpdatePanel>  




   
</div>
  
     </form>

</body>
</html>
