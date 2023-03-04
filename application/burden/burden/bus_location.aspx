<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bus_location.aspx.cs" Inherits="WebApplication1.WebForm5611" %>

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

<body >
  <div class="login" style="top:32%">
	<h2>Bus's Location</h2>
      <div style=" height:400px;overflow:auto">
   <script type="text/javascript">
       var ga,gb;
    function myMap() {
        var a = ga;
        var b =gb;
        var c = "";


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

      var markers = [ 
<asp:Repeater ID="rptMarkers" runat="server">
<ItemTemplate>
            {
            "title": '<%# Eval("id") %>',
            "lat": '<%# Eval("Latitude") %>',
            "lng": '<%# Eval("Longitude") %>',
            "description": '<%# Eval("Description") %>'
        }
</ItemTemplate>
<SeparatorTemplate>
    ,
</SeparatorTemplate>
</asp:Repeater> 

];
</script> 
<script type="text/javascript">
    window.onload = function () {
        var mapOptions = {
            center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
            zoom: 16,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var infoWindow = new google.maps.InfoWindow();
        var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
        for (i = 0; i < markers.length; i++) {
            var data = markers[i]
            var myLatlng = new google.maps.LatLng(data.lat, data.lng);
            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: data.title
            });
            (function (marker, data) {
                google.maps.event.addListener(marker, "click", function (e) {
                    infoWindow.setContent(data.description);
                    infoWindow.open(map, marker);
                });
            })(marker, data);
        }
    }
</script>  
       

  
<asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick" Enabled="False" >
 </asp:Timer>
        <asp:TextBox ID="TextBox1"  placeholder="Bus ID" autofocus="" runat="server"  ></asp:TextBox>
    <asp:TextBox ID="TextBox7" Enabled="false" Visible="false" runat="server" 
 ></asp:TextBox>
      <div style="margin-top:5px;margin-bottom:5px;">  <asp:Button ID="Button1" class="btn btn-primary btn-block btn-large" runat="server" Text="Search" OnClick="Button1_Click" /></div>
   
   <div style="margin-top:5px;margin-bottom:5px;">  <asp:Button ID="Button2" class="btn btn-primary btn-block btn-large" runat="server" Text="View All" OnClick="Button2_Click" /></div>
     
      



     
      
</form>
</div></div>
  
    

</body>
</html>
