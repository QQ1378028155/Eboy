<%-- 
    Document   : chargeBackResult
    Created on : 2013-8-18, 21:23:37
    Author     : Tongda
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>chargeBackResult Page</title>
                <script type="text/javascript">
                        function chargeBack()
                        {
                                var status = "<s:property value="#order.orderStatus"/>";
                                if (status === "&#24050;&#21457;&#36135;")
                                {
                                        alert("已经发货，不能退单");
                                }
                                else if (status === "&#30003;&#35831;&#36864;&#21333;")
                                {
                                        alert("已经申请退单");
                                }
                                else
                                {
                                        self.location = "chargeBack.action?orderId=<s:property value="#order.orderId"/>";
                                }
                        }
                        function myFunction()
                        {
                                alert("Hello World!");
                        }
                </script>
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
                <button onclick="chargeBack();">chargeback</button>
        </body>
</html>
