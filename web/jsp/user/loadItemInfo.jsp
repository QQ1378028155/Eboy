<%-- 
    Document   : LoadItemInfo
    Created on : 2013-8-20, 20:24:17
    Author     : game3108
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>LoadItemInfo Page</title>

        </head>
        <body>
                <s:form action="loadItemInfo.action" >
                        <s:textfield name="itemId"/>
                        <s:submit/>
                </s:form>
        </body>
</html>
