<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appoint_stuff.aspx.cs" Inherits="WebApplication1.WebForm18" %>

<!DOCTYPE html>

<html >
<head>
  <meta charset="UTF-8">
  <title>Appoint Stuff</title>
  
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
  <div class="login" style="top:45%">
	<h1>Appoint Stuff</h1>
    <form id="form2" runat="server">
    
            <asp:TextBox ID="TextBox2" runat="server" autofocus="" placeholder="Stuff ID" required="required"  TextMode="Number"  MaxLength="10"></asp:TextBox>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="textbox">
                <asp:ListItem>Appoint Type</asp:ListItem>
                <asp:ListItem>Counter Stuff</asp:ListItem>
                <asp:ListItem>Bus Driver</asp:ListItem>
                <asp:ListItem>Helper</asp:ListItem>
            </asp:DropDownList>
          <asp:TextBox ID="TextBox3" runat="server" placeholder="Join Date (dd-mon-yy)" required="required" MaxLength="10"></asp:TextBox>
        
              
         <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-block btn-large" OnClick="Button1_Click" Text="Save" />
        
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
