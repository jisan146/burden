<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.WebForm1" %>



<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Login Form</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
     <meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Lucid Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

<!-- //For-Mobile-Apps -->
<!-- Style --> <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body>
    
  <div class="login">
	 <h1>Welcome</h1>
    <form id="form2" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    	
         
                <asp:TextBox ID="TextBox1" runat="server" MaxLength="10" placeholder="Username" required="required" autofocus ></asp:TextBox>
                <asp:TextBox ID="TextBox2" runat="server" MaxLength="10" placeholder="Password" required="required" TextMode="Password"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-block btn-large" OnClick="Button1_Click" Text="Login" />
           
    
    </form>
</div>
  
    

</body>
</html>
