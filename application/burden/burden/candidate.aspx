<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="candidate.aspx.cs" Inherits="WebApplication1.candidate" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Register Candidate Information</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
     <meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Lucid Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

<!-- //For-Mobile-Apps -->
<!-- Style --> <link rel="stylesheet" href="css/style1.css" type="text/css" media="all" />

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body >
  <div class="login" style="top: 33%;">
    
	<h2>Register Candidate Information</h2>
      <div style="height:400px; overflow:auto">
    <form id="form2" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
              <asp:TextBox ID="TextBox1" runat="server"  placeholder="Candidate ID (auto Insert)" required="required" Enabled="False"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" autofocus placeholder="Symbol Name" required="required" Enabled="False"></asp:TextBox>
               <asp:TextBox ID="TextBox3" runat="server"  placeholder="Post" required="required" Enabled="False"></asp:TextBox>
     <asp:TextBox ID="TextBox5" runat="server"  placeholder="zone" required="required" Enabled="False" TextMode="Number"></asp:TextBox>
       
          <asp:TextBox ID="TextBox4" runat="server"  placeholder="Will notice for(ID)" required="required" Enabled="False" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox6" runat="server" placeholder="Applicant Age" autofocus="" required="required" Enabled="False" ></asp:TextBox>
 
        <asp:FileUpload ID="FileUpload1" runat="server" />
                <div style="margin-bottom:5px">   <asp:Button ID="Button100" runat="server" class="btn btn-primary btn-block btn-large" OnClick="Button100_Click" Text="Search ID" /></div>   
            
    <asp:Button ID="Button1" runat="server" Text="Save" class="btn btn-primary btn-block btn-large" OnClick="Button1_Click" Visible="False"/>
      <div style="margin-top:5px"> <input type="button" id="btnCancel" class="btn btn-primary btn-block btn-large" value="Back" onclick="GoTo();"/></div>
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
