<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="candidate_details.aspx.cs" Inherits="WebApplication1.candidate_details" %>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Candidate Details</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
     <meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Lucid Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

<!-- //For-Mobile-Apps -->
<!-- Style --> <link rel="stylesheet" href="css/style1.css" type="text/css" media="all" />

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body >
  <div class="login" style="top:32%;">
    
	<h2>Candidate Details</h2>
      <div style="overflow:auto;height:400px">
    <form id="form2" runat="server">
    
            <script type="text/javascript">
function GoTo() {
    window.location.href = 'Granted_link.aspx';
        }
</script>
        <asp:Image ID="Image1" runat="server" Width="100%" Height="300px" />

<asp:TextBox ID="TextBox1" runat="server" CssClass="textbox" Height="169px" TextMode="MultiLine" Enabled="false"></asp:TextBox>
    <div style="margin-top:5px">    <asp:Button ID="Button1" runat="server" Text="Vote Good" class="btn btn-primary btn-block btn-large" OnClick="Button1_Click"  /></div>
    <div style="margin-top:5px">    <asp:Button ID="Button2" runat="server" Text="Vote Bad" class="btn btn-primary btn-block btn-large" OnClick="Button2_Click" /></div>
     <div style="margin-top:5px">   <asp:Button ID="Button3" runat="server" Text="Vote" class="btn btn-primary btn-block btn-large" OnClick="Button3_Click" /></div>
  <div style="margin-top:5px;margin-bottom:10px"> <input type="button" id="btnCancel" class="btn btn-primary btn-block btn-large" value="Back" onclick="GoTo();"/></div>
    </form>
</div></div>
  
   <script type="text/javascript">
function GoTo() {
    window.location.href = 'vote.aspx';
        }
</script>
         

</body>
</html>


