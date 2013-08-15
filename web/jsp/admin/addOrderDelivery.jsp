<%-- 
    Document   : findItemsByKeywords
    Created on : 2013-8-15, 10:16:20
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
                <s:form action="addItem">
                        <input type="text" name="itemEbayId" value="<s:property value="itemEbayId"/>" readonly="true"/>
                        <br/>
                        <input type="text" name="itemTitle" value="<s:property value="itemTitle"/>"/>
                        <br/>
                        <s:submit/>
                </s:form>
        </body>
</html>
