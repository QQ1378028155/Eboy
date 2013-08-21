<%-- 
    Document   : searchItemResult
    Created on : 2013-8-19, 20:32:20
    Author     : Tongda
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>searchItemResult Page</title>

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
                        </tr>
                        <s:iterator value="#items">
                                <tr>
                                        <td><img src="<s:property value="itemThumbnailImageUrl"/>"/></td>
                                        <td><s:property value="itemTitle"/></td>
                                        <td><s:property value="itemPrice"/></td>
                                        <td><s:property value="orders.size()"/></td>
                                </tr>
                        </s:iterator>
                </table>
        </body>
</html>
