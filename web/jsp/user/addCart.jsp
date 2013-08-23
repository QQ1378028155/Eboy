<%-- 
    Document   : addCart
    Created on : 2013-8-21, 16:19:59
    Author     : wjl
--%>
<%@taglib prefix="s"  uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
        </head>
        <body>
                <s:form action="addCart">
                        <s:textfield name="itemId"/>
                        <s:textfield name="itemQuantity"/>
                        <s:submit/>
                </s:form>
        </body>
</html>
