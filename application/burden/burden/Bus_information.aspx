<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bus_information.aspx.cs" Inherits="WebApplication1.WebForm19" %>

<!DOCTYPE html>

<html >
<head>
  <meta charset="UTF-8">
  <title>Bus Information</title>
  
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
  <div class="login" style="top:30%">
	<h1>Register Bus</h1>
      <div style="height:400px;overflow:auto">
    <form id="form2" runat="server">
    
            <asp:TextBox ID="TextBox1" runat="server" autofocus="" placeholder="Owner ID" required="required"  TextMode="Number"  MaxLength="10"></asp:TextBox>
             <asp:TextBox ID="TextBox2" runat="server" placeholder="Bus License No" required="required" ></asp:TextBox>
         <asp:TextBox ID="TextBox3" runat="server" placeholder="Service Name" required="required" ></asp:TextBox>
          <asp:TextBox ID="TextBox6" runat="server" placeholder="Total Sit" TextMode="Number" required="required" ></asp:TextBox>
           <asp:TextBox ID="TextBox7" runat="server" placeholder="Total Stand Capacity" TextMode="Number" required="required" ></asp:TextBox>
         
          <asp:TextBox ID="TextBox5" runat="server" placeholder="Hire Charge Per KM" TextMode="Number" step="any" required="required" ></asp:TextBox>
        <asp:DropDownList ID="DropDownList4" runat="server" CssClass="textbox">
                <asp:ListItem>Service Type</asp:ListItem>
                <asp:ListItem>A/C</asp:ListItem>
                <asp:ListItem>NON A/C</asp:ListItem>
                
            </asp:DropDownList>
         
        
              
         <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-block btn-large" OnClick="Button1_Click" Text="Save" />
        
            <div style="margin-top:5px;margin-bottom:12px"> <input type="button" id="btnCancel" class="btn btn-primary btn-block btn-large" value="Back" onclick="GoTo();"/></div>
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
