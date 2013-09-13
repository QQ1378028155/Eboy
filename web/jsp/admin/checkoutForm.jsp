<%-- 
    Document   : checkoutForm
    Created on : 2013-9-10, 17:42:25
    Author     : wjl
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<table width="920px" cellspacing="0" cellpadding="5" style='font-size:13px;'>
        <tr bgcolor="#ddd">
                <th width="220" align="center">商品图片 </th>
                <th width="270" align="center">描述 </th>
                <th width="50" align="center">数量 </th>
        </tr>
        <s:iterator value="#itemList">
                <tr>
                        <td>
                            <div align='center' style="height:150px;width:200px;overflow:hidden;">
                                <img id="itemThumbnailImageUrl" src="<s:property value="itemThumbnailImageUrl"/>" width="0" height="0" onload="AutoResizeImage(200,150,this)" alt=""/>
                            </div> 
                        </td>
                        <td id="itemTitle"><s:property value="itemTitle"/></td> 
                        <td align="center" id="orderQuantity" ><s:property value="itemQuantity"/></td>
                </tr>
        </s:iterator>
</table>
<div style=" text-align: center;">
        <input type="button" onclick="window.location.href='deliverOrder.action';" class="btn_m" value="发货"/></div>
        <br/>