<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication1.WebForm6" %>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Register Contact Number</title>
  
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
  <div class="login" style="overflow:auto; top:32%">
	<h1>Register Contact Number</h1>
    <form id="form2" runat="server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
            <asp:TextBox ID="TextBox1" Enabled="False" runat="server"  placeholder="ID (Auto Insert)" required="required" MaxLength="10" TextMode="Number"></asp:TextBox>
            <asp:TextBox ID="TextBox2"  runat="server" placeholder="Contact number (+880 only)" autofocus="" required="required" TextMode="Number" Enabled="False" MaxLength="11"></asp:TextBox>
            <asp:TextBox ID="TextBox3" Enabled="False" runat="server" placeholder="Reference (Auto Insert)" required="required" MaxLength="10" TextMode="Number"></asp:TextBox>
             <asp:TextBox ID="TextBox4" Enabled="False" runat="server" placeholder="Applicant Age" required="required" ></asp:TextBox>
            <asp:FileUpload ID="FileUpload1" runat="server" />
             <div style="margin-bottom:5px">   <asp:Button ID="Button100" runat="server" class="btn btn-primary btn-block btn-large" OnClick="Button100_Click" Text="Search Applicant ID" /></div>
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
