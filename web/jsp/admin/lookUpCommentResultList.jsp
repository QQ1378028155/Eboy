<%-- 
    Document   : lookUpCommentResultList
    Created on : 2013-8-16, 16:43:12
    Author     : Tongda
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>LookUpCommentResultList Page</title>
        </head>
        <body>
                <table>
                        <tr>
                                <th>
                                        commentId
                                </th>
                                <th>
                                        item.itemId
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
                                <th>
                                        DeleteCommentActionr
                                </th>
                        </tr>
                        <s:iterator value="#comments">
                                <tr>
                                        <td>
                                                <s:property value="commentId"/>
                                        </td>
                                        <td>
                                                <s:property value="item.itemId"/>
                                        </td>
                                        <td>
                                                <s:property value="commentUserName"/>
                                        </td>
                                        <td>
                                                <s:property value="commentContent"/>
                                        </td>
                                        <td>
                                                <s:property value="commentRate"/>
                                        </td>
                                        <td>
                                                <s:a href="deleteComment.action?commentId=%{commentId}">deleteCommentAction</s:a>
                                                </td>
                                        </tr>
                        </s:iterator>
                </table>
        </body>
</html>
