<%-- 
    Document   : carts
    Created on : 2013-8-24, 8:42:36
    Author     : wjl
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript">
        function removeCart(cartIndex)
        {
                var arrStr = document.cookie.split("; ");
                var cartSize = 0;
                for (var i = 0; i < arrStr.length; i++) {
                        var temp = arrStr[i].split("=");
                        if (temp[0] == "cartSize")
                        {
                                cartSize = parseInt(temp[1]);
                                break;
                        }
                }
                cartSize = cartSize - 1;
                for(i = cartIndex;i < cartSize;i ++) {
                        for(var j = 0;j < arrStr.length;j ++) {
                                var temp = arrStr[j].split("=");
                                if(temp[0] == "item" + (i + 1)) {
                                        var date = new Date();
                                        date.setTime(date.getTime() + 3600 *24 * 30);
                                        var str = "item" + i + "=" + temp[1] + ";expires=" + date.toGMTString() + ";path=/Eboy/";
                                        document.cookie = str;
                                }
                                if(temp[0] == "item" + (i + 1) + "Quantity") {
                                        var date = new Date();
                                        date.setTime(date.getTime() + 3600 *24 * 30);
                                        var str = "item" + i + "Quantity=" + temp[1] + ";expires=" + date.toGMTString() + ";path=/Eboy/";
                                        document.cookie = str;
                                }
                        }
                }
                var date = new Date();
                date.setTime(date.getTime() + 3600 *24 * 30);
                var str = "cartSize=" + cartSize + ";expires="  + date.toGMTString() +  ";path=/Eboy/";  
                document.cookie = str;
        }
</script>





<div id="content" class="float_r">
        <h1>我的购物车</h1>
        <table width="680px" cellspacing="0" cellpadding="5">
                <tr bgcolor="#ddd">
                        <th width="220" align="center">商品图片 </th>
                        <th width="180" align="center">描述 </th>
                        <th width="100" align="center">数量 </th>
                        <th width="60" align="right">单价(包含运费，保费，关税等费用)</th>
                        <th width="60" align="right">总价 </th>
                        <th width="90" align="center">操作 </th>
                </tr>
                <s:iterator value="#cartList" status="ca">
                        <tr>
                                <td><img src="<s:property value="itemThumbnailImageUrl"/>" alt="Image 01" width="200" height="150"/></td>
                                <td><s:property value="itemTitle"/></td> 
                                <td align="center"><input type="text" value="<s:property value="itemQuantity"/>" style="width: 20px; text-align: right" /> </td>
                                <td align="right">RMB &nbsp;<s:property value="itemPrice"/></td> 
                                <td align="right">RMB  &nbsp; ${itemQuantity * itemPrice}</td>
                                <td align="center"> <a href="shoppingcart.jsp" onclick="removeCart(<s:property value="#ca.index"/>)">删除</a> </td>
                        </tr>  
                </s:iterator>

                <tr>
                        <td colspan="3" align="right"  height="30px">
                                若修改了购物车中的商品，请点击<a href="shoppingcart.html"><strong>刷新</strong></a>&nbsp;&nbsp; <br /> </td>
                        <td align="right" style="background:#ddd; font-weight:bold"> 合计 </td>
                        <td align="right" style="background:#ddd; font-weight:bold">RMB <s:property value="total"/></td>
                        <td style="background:#ddd; font-weight:bold"> </td>
                </tr>
        </table>
        <div style="float:right; width: 215px; margin-top: 20px;">
                <p><a href="checkout.jsp">确认结算</a></p>
                <p><a href="javascript:history.back()">继续购物</a></p>

        </div>
</div>