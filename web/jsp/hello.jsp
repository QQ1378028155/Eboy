<%-- 
    Document   : hello
    Created on : 2013-8-2, 18:40:17
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
                <h1>Hello!</h1>
                <s:property value="tagWord"/>
                <s:property value="tagWordRequest"/>
                <s:iterator value="#tags">
                        <p><s:property value="tagWord"/></p>
                </s:iterator>
        </body>
</html>
