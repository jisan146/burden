<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Finger_print.aspx.cs" Inherits="WebApplication1.WebForm15" %>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Scan Finger Print</title>
  
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
  <div class="login" style="overflow:auto">
	<h1>Scan Finger Print</h1>
    <form id="form2" runat="server">
   
            <asp:Image ID="Image1" runat="server" Height="250px" Width="100%" Visible="False" BackColor="White" />
              <asp:FileUpload ID="hpf" runat="server"  Width="100%"  />
    <asp:TextBox ID="TextBox1" runat="server" placeholder="Applicant ID" Enabled="False"></asp:TextBox>
         <asp:TextBox ID="TextBox2" placeholder="Applicant Age" runat="server" Enabled="False"></asp:TextBox>
    <asp:Button ID="Button2" runat="server" Text="Save" OnClick="Button2_Click"  class="btn btn-primary btn-block btn-large"/>
        
        <div style="margin-top:5px;margin-bottom:15px"> <input type="button" id="btnCancel" class="btn btn-primary btn-block btn-large" value="Back" onclick="GoTo();"/></div>
      
      
              
            <script type="text/javascript">
function GoTo() {
    window.location.href = 'Granted_link.aspx';
        }
</script>
   
    </form>
</div>
  
    

</body>
