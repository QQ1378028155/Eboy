<%-- 
    Document   : checkoutForm
    Created on : 2013-9-10, 17:42:25
    Author     : wjl
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<table width="920px" cellspacing="0" cellpadding="5" style='font-size:13px;'>
        <tr bgcolor="#ddd">
                <th width="220" align="center">商品图片 </th>
                <th width="270" align="center">描述 </th>
                <th width="50" align="center">数量 </th>
        </tr>
        <s:iterator value="#itemList">
                <tr>
                        <td><img height="150" width="200"  id="itemThumbnailImageUrl" src="<s:property value="itemThumbnailImageUrl"/>" /></td>
                        <td id="itemTitle"><s:property value="itemTitle"/></td> 
                        <td align="center" id="orderQuantity" ><s:property value="itemQuantity"/></td>
                </tr>
        </s:iterator>
</table>
<div style=" text-align: center;">
        <input type="button" onclick="window.location.href='deliverOrder.action';" class="btn" value="发货"/></div>