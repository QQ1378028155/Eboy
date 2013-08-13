<%-- 
    Document   : addCategory
    Created on : 2013-8-12, 17:03:58
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
                <s:form action="addCategory">
                        <s:textfield name="categoryName"/>
                        <s:submit/>
                </s:form>
        </body>
</html>
