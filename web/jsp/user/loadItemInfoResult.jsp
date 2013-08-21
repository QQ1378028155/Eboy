<%-- 
    Document   : loadItemInfoResult
    Created on : 2013-8-20, 20:32:20
    Author     : game3108
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>loadItemInfoResult Page</title>

        </head>
        <body>
                <table>
                        <tr>
                                <th>
                                        itemThumbnailImageUrl
                                </th>
                                <th>
                                        itemTitle
                                </th>
                                <th>
                                        itemPrice
                                </th>
                                <th>
                                        sales
                                </th>
                                <th>
                                        itemId
                                </th>
                        </tr>
                        <tr>
                                <td><img src="<s:property value="#item.itemThumbnailImageUrl"/>"/></td>
                                <td><s:property value="#item.itemTitle"/></td>
                                <td><s:property value="#item.itemPrice"/></td>
                                <td><s:property value="#item.orders.size()"/></td>
                                <td><s:property value="#item.itemId"/></td>
                        </tr>
                </table>           


                <h2>Add Comment</h2>
                <s:form action="addComment">
                        <input type="text" name="itemId" value="<s:property value="#item.itemId"/>" readonly="true"/>
                        <br/>
                        <input type="text" name="commentUserName"/>
                        <br/>
                        <input type="text" name="commentContent"/>
                        <br/>
                        <input type="text" name="commentRate"/>

                        <s:submit/>
                </s:form>

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
