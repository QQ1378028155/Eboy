<%-- 
    Document   : orderMapFrame
    Created on : 2013-9-8, 10:54:31
    Author     : Tongda
--%>


<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<input type="text" hidden="true"  id="fuckyou" value="<s:property value="orderinfo"/>">
<iframe width="680" height="340" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="orderMap.jsp" id="myframe"></iframe>