<%-- 
    Document   : setTranslation
    Created on : 2013-8-16, 17:25:36
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
                <s:form action="setTranslation">
                        商品Id:<input type="text" name="itemId" value="<s:property value="itemId"/>" readonly="true"/>
                        <br/>
                        商品名称:<input type="text" name="itemTitle" value="<s:property value="itemTitle"/>"/>
                        <br/>
                        商品描述:<textarea name="itemDescription"><s:property value="itemDescription"/></textarea>
                        <br/>
                        <s:submit/>
                </s:form>
                
                
                
        </body>
</html>
