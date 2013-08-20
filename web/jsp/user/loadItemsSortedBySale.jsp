<%-- 
    Document   : LoadItemsSortedBySale
    Created on : 2013-8-19, 20:24:17
    Author     : Tongda
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>LoadItemsSortedBySale Page</title>

        </head>
        <body>
                <s:form action="loadItemsSortedBySale.action" >
                        <s:textfield name="keywords"/>
                        <s:submit/>
                </s:form>
        </body>
</html>
