<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update_zone.aspx.cs" Inherits="WebApplication1.Update_zone" %>

<!DOCTYPE html>

<!DOCTYPE html>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Update Zone</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
     <meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Lucid Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

<!-- //For-Mobile-Apps -->
<!-- Style --> <link rel="stylesheet" href="css/style1.css" type="text/css" media="all" />

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body >
  <div class="login" style="top:50%">
    
	<h1>Update Zone</h1>
    <form id="form2" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
              <asp:TextBox ID="TextBox1" runat="server" autofocus placeholder="Insert Zone No" required="required" TextMode="Number"></asp:TextBox>
            
    <asp:Button ID="Button1" runat="server" Text="Update" class="btn btn-primary btn-block btn-large" OnClick="Button1_Click"/>
      <div style="margin-top:5px"> <input type="button" id="btnCancel" class="btn btn-primary btn-block btn-large" value="Back" onclick="GoTo();"/></div>
            <script type="text/javascript">
function GoTo() {
    window.location.href = 'Granted_link.aspx';
        }
</script>
        
         
        


    </form>
</div>
  
    

</body>
</html>

