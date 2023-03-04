<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="navigation.aspx.cs" Inherits="WebApplication1.WebForm561" %>

<!DOCTYPE html>

<html >
<head>
  <meta charset="UTF-8">
  <title>Navigation</title>
  
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

<body style="" >
<div class="login" style="top:32%">
	<h2>Navigation</h2>
      <div style=" height:400px;overflow:auto">
   <script type="text/javascript">
       var ga,gb;
    function myMap() {
        var a = ga;
        var b =gb;
        var c = document.getElementById('<%= TextBox4.ClientID %>').value;


        var myCenter = new google.maps.LatLng(a, b);
        var mapCanvas = document.getElementById("dvMap");
        var mapOptions = { center: myCenter, zoom: 18 };
        var map = new google.maps.Map(mapCanvas, mapOptions);
        var marker = new google.maps.Marker({ position: myCenter });
        marker.setMap(map);

        var infowindow = new google.maps.InfoWindow({
            content: c
        });
        infowindow.open(map, marker);
        google.maps.event.addListener(marker, 'click', function () {
            var infowindow = new google.maps.InfoWindow({
                content: c
            });
            infowindow.open(map, marker);
        });
    }
</script>
   <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">

       </asp:ScriptManager>
       <div id="dvMap" 
            style="border: 2px solid #CCCCCC; margin: auto; width: 100%; height: 300px"></div>
 <script  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7ahws4ZDxBimvHaaihnIH12BPK7ysyCM&callback=initMap"
  type="text/javascript"></script>
      
<script type="text/javascript">
    
     var x = document.getElementById("demo");

        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition); 
                startTime();
            } else {
                x.innerHTML = "Geolocation is not supported by this browser.";
            }
        }
      
        function showPosition(position) {
            // x.innerHTML = "Latitude: " + position.coords.latitude +
            // "<br>Longitude: " + position.coords.longitude; window.location = "WebForm1.aspx";
            var latlondata = position.coords.latitude + "," + position.coords.longitude;
          
           
          
            document.getElementById('<%=TextBox1.ClientID %>').value = " latitude  : " + position.coords.latitude;
            document.getElementById('<%=TextBox2.ClientID %>').value = " longitude: " + position.coords.longitude; 
            
            ga = position.coords.latitude;
            gb = position.coords.longitude;
        
          
        }

</script>
       
 <asp:UpdatePanel ID="UpdatePanel5" runat="server">
 <ContentTemplate>
  
<asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick" >
 </asp:Timer>
   <div style="margin-top:5px;margin-bottom:5px;">  <asp:Button ID="Button2" class="btn btn-primary btn-block btn-large" runat="server" Text="Sign Out" OnClick="Button2_Click" /></div>
      <asp:TextBox ID="TextBox1"  placeholder="latitude" required="required" Enabled="false" runat="server"  ></asp:TextBox>
      <asp:TextBox ID="TextBox2" runat="server" placeholder="longitude" required="required" Enabled="false"></asp:TextBox>
     <asp:TextBox ID="TextBox4" runat="server"  
Enabled="False"  >My Location</asp:TextBox>
<asp:TextBox ID="TextBox7" runat="server" 
Enabled="False" Visible="False" >0</asp:TextBox>
</ContentTemplate>
</asp:UpdatePanel>

     
      
</form>
</div></div>
  
    

</body>
</html>
