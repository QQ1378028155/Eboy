<%-- 
    Document   : itemsInStore
    Created on : 2013-8-16, 15:48:46
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
                        <tr>
                                <td></td>
                                <td>商品名</td>
                                <td>数量</td>
                                <td></td>
                                <td></td>
                        </tr>
                        <s:iterator value="#itemList">
                                <tr>
                                        <td>
                                                <img src="<s:property value="itemThumbnailImageUrl"/>"/>
                                        </td>
                                        <td>
                                                <s:property value="itemTitle"/>
                                        </td>
                                        <td>
                                                <s:property value="itemQuantity"/>
                                        </td>
                                        <td>
                                                <a href="goToTranslationItem.action?itemId=<s:property value="itemId"/>">设置翻译</a>
                                        </td>
                                        <td>
                                                <a href="goToTagBinding.action?itemId=<s:property value="itemId"/>">设置标签</a>
                                        </td>
                                </tr>
                        </s:iterator>
                </table>

        </body>
</html>
