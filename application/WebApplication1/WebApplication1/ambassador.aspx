<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ambassador.aspx.cs" Inherits="WebApplication1.ambassador" %>


<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Register Ambassador Information</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
     <meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Lucid Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

<!-- //For-Mobile-Apps -->
<!-- Style --> <link rel="stylesheet" href="css/style1.css" type="text/css" media="all" />

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body >
  <div class="login" style="top:32%">
  
	<h2>Register Ambassador Information</h2>
        <div style="overflow:auto; height:400px">
    <form id="form2" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
              <asp:TextBox ID="TextBox1" runat="server" autofocus placeholder="ID" required="required"></asp:TextBox>
             <asp:TextBox ID="TextBox2" runat="server" placeholder="Country (Current)" required="required" ></asp:TextBox>
       
         <asp:TextBox ID="TextBox3" runat="server" placeholder="Current Address" required="required"   ></asp:TextBox>
         <asp:TextBox ID="TextBox4" runat="server" placeholder="Phone (Current)" required="required"  TextMode="Number" ></asp:TextBox>
      
       
           <asp:TextBox ID="TextBox8" runat="server" placeholder="Email (user get sensitive data by this)" required="required" Visible="false" TextMode="Email">jisan146@gmail.com</asp:TextBox>
       
    <asp:Button ID="Button1" runat="server" Text="Save" class="btn btn-primary btn-block btn-large" OnClick="Button1_Click"/>
      <div style="margin-top:5px;margin-bottom:30px"> <input type="button" id="btnCancel" class="btn btn-primary btn-block btn-large" value="Back" onclick="GoTo();"/></div>
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


