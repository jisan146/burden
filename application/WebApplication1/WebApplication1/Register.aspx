<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.WebForm2" %>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Register People</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
     <meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Lucid Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

<!-- //For-Mobile-Apps -->
<!-- Style --> <link rel="stylesheet" href="css/style1.css" type="text/css" media="all" />

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body >
  <div class="login" style="top:30%" >
      <h1>Register Form</h1>
    <div style="overflow:auto; height:400px">
	
    <form id="form2" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
               <asp:TextBox ID="TextBox1" runat="server" placeholder="নাম" required="required" autofocus ></asp:TextBox>
               <asp:TextBox ID="TextBox2" runat="server" placeholder="Name" required="required"></asp:TextBox>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="textbox">
            <asp:ListItem>Gender</asp:ListItem>
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
            <asp:ListItem>Other</asp:ListItem>
        </asp:DropDownList>
       
         <asp:TextBox ID="TextBox4" runat="server" placeholder="Father's ID" MaxLength="10" TextMode="Number" ></asp:TextBox>
         <asp:TextBox ID="TextBox5" runat="server" placeholder="Mother's ID" MaxLength="10" TextMode="Number" ></asp:TextBox>
         <asp:TextBox ID="TextBox6" runat="server" placeholder="Date of birth (dd-MON-yy)" required="required"></asp:TextBox>
       
         <asp:TextBox ID="TextBox7" runat="server" placeholder="Blood group" required="required"></asp:TextBox>
              <asp:TextBox ID="TextBox8" runat="server" placeholder="Contact (user get sensitive data by this)" required="required" TextMode="Number"></asp:TextBox>
       
    <asp:Button ID="Button1" runat="server" Text="Save" class="btn btn-primary btn-block btn-large" OnClick="Button1_Click"/>
         <div style="margin-top:5px; margin-bottom:15px"> <input type="button" id="btnCancel" class="btn btn-primary btn-block btn-large" value="Back" onclick="GoTo();"/></div>
            <script type="text/javascript">
function GoTo() {
    window.location.href = 'Granted_link.aspx';
        }
</script>
        <script type="text/javascript">
function GoTo1() {
    window.location.href = 'add_foreigner.aspx';
        }
</script>
        
         
        


    </form>
        </div>
</div>
  
    

</body>
</html>
