<%-- 
    Document   : lookUpSingleOrder
    Created on : 2013-8-15, 12:53:12
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
        <s:a href="deliverOrder.action?orderId=%{orderId}">DeliverOrderAction</s:a>
        
        <h2>Add Order Delivery</h2>
                        <s:form action="addOrderDelivery">
                        <input type="text" name="orderId" value="<s:property value="#order.orderId"/>" readonly="true"/>
                        <br/>
                        <input type="text" name="deliveryLocation"/>
                        <s:submit/>
                </s:form>
        <s:a href="addOrderDelivery.action?orderId=%{orderId}">AddOrderDeliveryAction</s:a>
        <h2>Delivery Detail</h2>
        
</body>
</html>
