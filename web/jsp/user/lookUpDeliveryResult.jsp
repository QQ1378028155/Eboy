<%-- 
    Document   : lookUpDeliveryResult
    Created on : 2013-8-16, 20:37:17
    Author     : Tongda
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>LookUpDeliveryResultList Page</title>
        </head>
        <body>
                <s:debug></s:debug>
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
                                </tr>
                        </tr>
                        <tr>
                                <td>
                                <s:property value="#order.orderId"/>
                        </td>
                        <td>
                                <s:property value="#order.item.itemId"/>
                        </td>
                        <td>
                                <s:property value="#order.orderQuantity"/>
                        </td>
                        <td>
                                <s:property value="#order.orderValidate"/>
                        </td>
                        <td>
                                <s:property value="#order.orderPrice"/>
                        </td>
                        <td>
                                <s:property value="#order.orderAddress"/>
                        </td>
                        <td>
                                <s:property value="#order.orderStatus"/>
                        </td>
                        <td>
                                <s:property value="#order.orderPhone"/>
                        </td>
                        <td>
                                <s:property value="#order.orderReciver"/>
                        </td>
                        <td>
                                <s:property value="#order.orderEmail"/>
                        </td>
                </tr>
        </table>
        <h2>Delivery Detail</h2>
        <table>
                <tr>
                        <th>
                                Index
                        </th>
                        <th>
                                OrderId
                        </th>
                        <th>
                                DeliveryLocation
                        </th>
                </tr>
                <s:iterator value="#deliveries" status="u">
                        <tr>
                                <td>
                                        <s:property value="#u.index+1"/></td><td>
                                        <s:property value="order.orderId"/></td><td>
                                        <s:property value="deliveryLocation"/></td>
                        </tr>
                </s:iterator> 
        </table>
</body>
</html>
