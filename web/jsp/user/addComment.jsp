<%-- 
    Document   : addComment
    Created on : 2013-8-19, 16:16:20
    Author     : game3108
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>AddComment Page</title>
        </head>
        <body>
                <s:form action="addComment">
                        <input type="text" name="itemId" value="<s:property value="itemId"/>" readonly="true"/>
                        <br/>
                        <input type="text" name="commentUserName" value="<s:property value="commentUserName"/>"/>
                        <br/>
                        <input type="text" name="commentContent" value="<s:property value="commentContent"/>"/>
                        <br/>
                        <input type="text" name="commentRate" value="<s:property value="commentRate"/>"/>
                        <br/>
                        <s:submit/>
                </s:form>
        </body>
</html>
