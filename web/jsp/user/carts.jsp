<%-- 
    Document   : carts
    Created on : 2013-9-12, 2:05:32
    Author     : WingFung
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
<script type="text/javascript">
        function AutoResizeImage(maxWidth, maxHeight, objImg) {
                var img = new Image();
                img.src = objImg.src;
                var hRatio;
                var wRatio;
                var Ratio = 1;
                var w = img.width;
                var h = img.height;
                wRatio = maxWidth / w;
                hRatio = maxHeight / h;
                if (maxWidth == 0 && maxHeight == 0) {
                        Ratio = 1;
                } else if (maxWidth == 0) {//
                        if (hRatio < 1)
                                Ratio = hRatio;
                } else if (maxHeight == 0) {
                        if (wRatio < 1)
                                Ratio = wRatio;
                } else if (wRatio < 1 || hRatio < 1) {
                        Ratio = (wRatio <= hRatio ? wRatio : hRatio);
                }
                if (Ratio < 1) {
                        w = w * Ratio;
                        h = h * Ratio;
                }
                objImg.height = h;
                objImg.width = w;
        }
</script>
<div style='padding-left:20px;float:right;'>
            <table width="680px" cellspacing="10" cellpadding="5">
                <tr bgcolor="#ddd">
                        <th width="220" align="center">商品图片 </th>
                        <th width="150" align="center">描述 </th>
                        <th width="60" align="center">数量 </th>
                        <th width="90" align="right">单价</th>
                        <th width="90" align="right">总价 </th>
                        <th width="90" align="center">操作 </th>
                </tr>
                <s:iterator value="#cartList" status="ca">
                        <tr>
                                <td>
                                    <div align='center' style="height:150px;width:200px;overflow:hidden;">
                                        <img src="<s:property value="itemThumbnailImageUrl"/>" width="0" height="0" onload="AutoResizeImage(200,150,this);" alt=""/>
                                    </div>
                                </td>
                                <td><s:property value="itemTitle"/></td> 
                                <td align="center"><s:property value="itemQuantity"/></td>
                                <td align="right"><s:property value="itemPrice"/> 元</td> 
                                <td align="right">${itemQuantity * itemPrice} 元</td>
                                <td align="center"> <a href="shoppingcart.jsp" onclick="removeCart(<s:property value="#ca.index"/>);">删除</a> </td>
                        </tr>  
                </s:iterator>

                <tr>
                        <td colspan="3" align="right"  height="30px">
                            <strong>注：单价已包含运费/保费/关税等费用</strong>&nbsp;&nbsp; <br/>
                                若修改了购物车中的商品，请点击<a href="shoppingcart.html"><strong>刷新</strong></a>&nbsp;&nbsp; <br /> </td>
                        <td align="right" style="background:#ddd; font-weight:bold"> 合计 </td>
                        <td align="right" style="background:#ddd; font-weight:bold"><s:property value="total"/> 元</td>
                        <td style="background:#ddd; font-weight:bold"> </td>

                </tr>
        </table>
        <div style="float:right; margin-top: 20px;text-align: center;">
                <a href="checkout.jsp" class='btn_m' style="float:right;">确认结算</a>
                <a href="javascript:history.back()" style="margin:10px 20px 0 0; float:right;">继续购物</a>

        </div>
</div>
