<%-- 
    Document   : findItemsByKeywords
    Created on : 2013-8-15, 10:14:40
    Author     : Tongda
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>AddOrderDelivery Page</title>
        </head>
        <body>
                <s:form action="addOrderDelivery">
                        <s:textfield name="orderDelivery"/>
                        <s:submit/>
                </s:form>
        </body>
</html>
