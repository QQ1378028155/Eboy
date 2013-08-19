<%-- 
    Document   : chargeBack
    Created on : 2013-8-18, 21:21:17
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
                <s:form action="getOrder">
                        <h2>please input the orderValidate</h2>
                        <input type="text" name="orderValidate"/>
                        <h2>please input the password</h2>
                        <input type="password" name="password"/>
                        <s:submit/>
                </s:form>
        </body>
</html>
