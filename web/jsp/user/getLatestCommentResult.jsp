<%-- 
    Document   : getLatetCommentResult
    Created on : 2013-8-20, 20:32:20
    Author     : game3108
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>getLatestCommentResult Page</title>

        </head>
        <body>
                <table>
                        <tr>
                                <th>
                                        commentId
                                </th>
                                <th>
                                        commentUserName
                                </th>
                                <th>
                                        commentContent
                                </th>
                                <th>
                                        commentRate
                                </th>
                        </tr>
                        <s:iterator value="#comments">
                                <tr>
                                        <td><s:property value="commentId"/></td>
                                        <td><s:property value="commentUserName"/></td>
                                        <td><s:property value="commentContent"/></td>
                                        <td><s:property value="commentRate"/></td>
                                </tr>
                        </s:iterator>
                </table>
        </body>
</html>
