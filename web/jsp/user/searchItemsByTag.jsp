<%-- 
    Document   : searchItemsByTag
    Created on : 2013-8-20, 21:09:17
    Author     : Tongda
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>searchItemsByTag Page</title>

        </head>
        <body>
                <s:form action="searchItemsByTag.action" >
                        <h2>please input the ItemTag keywords that you want to search</h2>
                        <s:textfield name="keywords"/>
                        <s:submit/>
                </s:form>
        </body>
</html>
