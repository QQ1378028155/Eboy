<%-- 
    Document   : OrderMap
    Created on : 2013-9-8, 10:12:34
    Author     : Tongda
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
              var orderinfovar = parent.document.getElementById("fuckyou").value;
              //alert(orderinfovar);
              displayOrderMaps(orderinfovar);
      </script>
      <div id="map-canvas"></div>
  </body>
</html>