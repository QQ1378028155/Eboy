<%-- 
    Document   : lookUpSingleOrder
    Created on : 2013-8-15, 12:53:12
    Author     : Tongda
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>LookUpDelivery Page</title>
        </head>
        <body>
                <s:form action="lookUpDelivery">
                        <h2>please input the orderValidate</h2>
                        <input type="text" name="orderValidate"/>
                        <s:submit/>
                </s:form>
        </body>
</html>
