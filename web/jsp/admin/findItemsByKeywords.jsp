<%-- 
    Document   : findItemsByKeywords
    Created on : 2013-8-5, 18:49:08
    Author     : wjl
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
        </head>
        <body>
                <h1>Hello World!</h1>
                
                <s:form action="findItemsFromEbayByKeywords.action" >
                        <s:textfield name="keywords"/>
                        <s:submit/>
                </s:form>
                
        </body>
</html>
