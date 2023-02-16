<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update_data.aspx.cs" Inherits="WebApplication1.WebForm13" %>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Update Information</title>
  
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
  <div class="login" style="top:32%">
	<h2>Update Information</h2>
    <form id="form2" runat="server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
            <asp:TextBox ID="TextBox1" runat="server" autofocus="" placeholder="Search Using (ID or SNO)" required="required" ></asp:TextBox>
         <asp:TextBox ID="TextBox2" runat="server" autofocus="" placeholder="Update Code" required="required" ></asp:TextBox>
              
         <asp:TextBox ID="TextBox3" runat="server" placeholder="New Data" required="required" CssClass="textbox" Height="146px" TextMode="MultiLine"></asp:TextBox>
        
              
         <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-block btn-large" OnClick="Button1_Click" Text="Update" />
        
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
