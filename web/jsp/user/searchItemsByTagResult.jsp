<%-- 
    Document   : searchItemsByTagResult
    Created on : 2013-8-19, 21:25:20
    Author     : Tongda
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>searchItemsByTagResult Page</title>

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
                                        tag
                                </th>
                        </tr>
                        <s:iterator value="#itemTags">
                                <tr>
                                        <td><img src="<s:property value="item.itemThumbnailImageUrl"/>"/></td>
                                        <td><s:property value="item.itemTitle"/></td>
                                        <td><s:property value="item.itemPrice"/></td>
                                        <td><s:property value="tag.tagWord"/></td>
                                </tr>
                        </s:iterator>
                </table>
        </body>
</html>
