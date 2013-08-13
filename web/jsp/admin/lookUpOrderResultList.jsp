<%-- 
    Document   : findItemsByKeywords
    Created on : 2013-8-6, 13:36:48
    Author     : Tongda
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>LookUpOrderResultList Page</title>
        </head>
        <body>
                <table>
                        <tr>
                                <th>
                                        orderId
                                </th>
                                <th>
                                        item.itemId
                                </th>
                                <th>
                                        orderQuantity
                                </th>
                                <th>
                                        orderValidate
                                </th>
                                <th>
                                        orderPrice
                                </th>
                                <th>
                                        orderAddress
                                </th>
                                <th>
                                        orderStatus
                                </th>
                                <th>
                                        orderPhone
                                </th>
                                <th>
                                        orderReciver
                                </th>
                                <th>
                                        orderEmail
                                </th>
                                DeliverOrderAction
                                </th>
                                </th>
                                DeliverOrderAction
                                </th>
                        </tr>
                </tr>
                <s:iterator value="#orders">
                        <tr>
                                <td>
                                        <s:property value="orderId"/>
                                </td>
                                <td>
                                        <s:property value="item.itemId"/>
                                </td>
                                <td>
                                        <s:property value="orderQuantity"/>
                                </td>
                                <td>
                                        <s:property value="orderValidate"/>
                                </td>
                                <td>
                                        <s:property value="orderPrice"/>
                                </td>
                                <td>
                                        <s:property value="orderAddress"/>
                                </td>
                                <td>
                                        <s:property value="orderStatus"/>
                                </td>
                                <td>
                                        <s:property value="orderPhone"/>
                                </td>
                                <td>
                                        <s:property value="orderReciver"/>
                                </td>
                                <td>
                                        <s:property value="orderEmail"/>
                                </td>
                                <td>
                                        <s:a href="DeliverOrderAction.action?orderId=%{orderId}">DeliverOrderAction</s:a>
                                        </td>
                                        <td>
                                        <s:a href="AddOrderDeliveryAction.action?orderId=%{orderId}">AddOrderDeliveryAction</s:a>
                                        </td>
                                </tr>
                </s:iterator>
        </table>
</body>
</html>
