<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="disable_people.aspx.cs" Inherits="WebApplication1.disable_people" %>

<html >
<head>
  <meta charset="UTF-8">
  <title>Register Disable People</title>
  
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
  <div class="login" style="overflow:auto;top:32%">
	<h2>Register Disable People</h2>
    <form id="form2" runat="server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  
            <asp:TextBox ID="TextBox1" runat="server"  placeholder="ID (Auto Insert)" required="required" MaxLength="10" TextMode="Number" Enabled="False"></asp:TextBox>
               <asp:TextBox ID="TextBox3" runat="server" autofocus="" placeholder="Details" Height="150px" required="required" CssClass="textbox" TextMode="MultiLine" Enabled="False"></asp:TextBox>
         <asp:TextBox ID="TextBox2" runat="server" autofocus="" placeholder="Applicant Age"  required="required"  Enabled="False"></asp:TextBox>
          <asp:FileUpload ID="FileUpload1" runat="server" />
              
        <div style="margin-bottom:5px">   <asp:Button ID="Button100" runat="server" class="btn btn-primary btn-block btn-large" OnClick="Button100_Click" Text="Search ID" /></div>   
        
            <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-block btn-large" OnClick="Button1_Click" Text="Save" Visible="False" />
        
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
</html>
