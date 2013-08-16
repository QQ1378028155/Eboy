<%-- 
    Document   : bindItem
    Created on : 2013-8-16, 22:38:12
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
                <s:form action="bindTagToItem">
                        <input type="text" name="itemId" value="<s:property value="itemId"/>" readonly="true"/>
                        <select name="tagId">
                                <s:iterator value="#tagList">
                                        <option value="<s:property value="tagId"/>"><s:property value="tagWord"/></option>
                                </s:iterator>
                        </select>
                        <s:submit/>
                </s:form>
        </body>
</html>
