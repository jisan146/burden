<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bank.aspx.cs" Inherits="WebApplication1.bank" %>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Register Bank Account</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
     <meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Lucid Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

<!-- //For-Mobile-Apps -->
<!-- Style --> <link rel="stylesheet" href="css/style1.css" type="text/css" media="all" />

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

   

</head>

<body >
  <div class="login" style="top:30%;">
      	<h2>Register People Bank Account</h2>
      <div style="overflow:auto;height:400px">

    <form id="form2" runat="server">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
            <asp:TextBox ID="TextBox1" runat="server"  placeholder="Account Holder ID (Auto Insert)" required="required" MaxLength="10" TextMode="Number" Enabled="False"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server"  placeholder="Account ID" autofocus="" required="required" Enabled="False"  ></asp:TextBox>
             <asp:TextBox ID="TextBox3" runat="server"  placeholder="Bank Name" required="required" Enabled="False"  ></asp:TextBox>
             <asp:TextBox ID="TextBox4" runat="server"  placeholder="References (Auto Insert)" required="required" Enabled="False"  ></asp:TextBox>
             <asp:TextBox ID="TextBox5" runat="server"  placeholder="Nominee (Auto Insert)" required="required" Enabled="False"  ></asp:TextBox>
        <asp:TextBox ID="TextBox6" runat="server"  placeholder="Applicant Age" required="required" Enabled="False"  ></asp:TextBox>
    <asp:FileUpload ID="FileUpload1" runat="server" />
                <div style="margin-bottom:5px">   <asp:Button ID="Button100" runat="server" class="btn btn-primary btn-block btn-large" OnClick="Button100_Click" Text="Search Account Holder ID" /></div>   
            <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-block btn-large" OnClick="Button1_Click" Text="Save" Visible="False" />
          
            <div style="margin-top:5px; margin-bottom:25px"> <input type="button" id="btnCancel" class="btn btn-primary btn-block btn-large" value="Back" onclick="GoTo();"/></div>
            <script type="text/javascript">
function GoTo() {
    window.location.href = 'Granted_link.aspx';
        }
</script>
         




    </form>
           </div>
</div>
  
    

</body>
</html>
