<%-- 
    Document   : deliveryMap
    Created on : 2013-8-25, 20:52:14
    Author     : WingFung
--%>

<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map-canvas { height: 100% }
    </style>
    <script type="text/javascript"
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_T0ersce5oEvPQ-YLfGfTm-uzl6XO37A&sensor=false&language=cn">
    </script>
    <script type="text/javascript" src="GoogleMaps.js" charset="UTF-8" ></script>

  </head>
  <body>
      <script>
              <%-- displayGoogleMaps("${waypoints}","${destination}");--%>
              displayGoogleMaps(parent.waypoints, parent.destination);
      </script>
      <div id="map-canvas"></div>
  </body>
</html>