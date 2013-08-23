<%-- 
    Document   : getCart
    Created on : 2013-8-21, 19:00:58
    Author     : wjl
--%>
<%@taglib prefix="s"  uri="/struts-tags"%>
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
                        <s:iterator value="#cartList">
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
                                                <s:property value="itemPrice"/>
                                        </td>
                                        <td>
                                                <s:property value="itemPackageCost"/>
                                        </td>
                                        <td>
                                                <s:property value="itemImportCost"/>
                                        </td>
                                        <td>
                                                <s:property value="itemShippingCost"/>
                                        </td>
                                        <td>
                                                <s:property value="itemTaxCost"/>
                                        </td>
                                        <td>
                                                <s:property value="itemInsuranceCost"/>
                                        </td>
                                        
                                </tr>
                        </s:iterator>
                </table>
                <s:form action="placeOrder">
                        address:<s:textfield name="orderAddress"/>
                        phone:<s:textfield name="orderPhone"/>
                        receiver:<s:textfield name="orderReceiver"/>
                        Email:<s:textfield name="orderEmail"/>
                        <s:submit/>
                </s:form>
        </body>
</html>
