<%-- 
    Document   : ebayItemList
    Created on : 2013-8-28, 20:51:33
    Author     : Tongda
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

<div class="portfolio_sidebar portfolio_sidebar_right">
        <ul class="four_columns gallery">
                <s:iterator value="#items" status="it">
                        <li>
                                <div class="img" >                    
                                        <a href="http://www.ebay.com/itm/<s:property value="itemEbayId"/>">
                                                <div align='center' style="height:150px;width:200px;overflow:hidden;">
                                                        <img src="<s:property value="itemThumbnailImageUrl"/>" width="0" height="0" onload="AutoResizeImage(200,150,this)" alt=""/>
                                                </div> 
                                        </a>
                                </div>
                                <div class="desc">
                                        <h5 style="overflow: hidden;"><s:property value="itemTitle"/></h5>
                                        <p class="product_price">价格: <s:property value="itemPrice"/>元</p>
                                        <a href="productAddToStorage.jsp?itemEbayId=<s:property value="itemEbayId"/>" class="add_to_cart">加入仓库</a>
                                        <a href="http://www.ebay.com/itm/<s:property value="itemEbayId"/>" class="detail">详细</a>
                                </div>
                        </li>
                </s:iterator>
        </ul>
</div>
