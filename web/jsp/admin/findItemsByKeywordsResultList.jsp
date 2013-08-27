<%-- 
    Document   : findItemsByKeywordsResultList
    Created on : 2013-8-5, 19:00:47
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
                <table>
                        <s:iterator value="#itemList">
                                <tr>
                                        <td><img src="<s:property value="itemThumbnailImageUrl"/>"/></td>
                                        <td><s:property value="itemTitle"/></td>
                                        <td><a href="translate.action?itemEbayId=<s:property value="itemEbayId"/>">加入仓库</a></td>                                                
                                </tr>
                        </s:iterator>
                </table>
        </body>
</html>
