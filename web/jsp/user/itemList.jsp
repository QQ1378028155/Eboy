<%-- 
    Document   : newItems
    Created on : 2013-8-23, 14:55:43
    Author     : wjl
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>






<div id="content" class="float_r">
        <h1>新上架的商品</h1>
        <a href="" onclick="showNew();
                        return false;">按时间排序</a>|<a href="" onclick="showRate();
                        return false;">按得分排序</a>|<a href="" onclick="showSale();
                        return false;">按销售量排序</a>|<a href="" onclick="showPrice();
                        return false;">按价格排序</a>
        <br/>
        <div id="new" style="display: inline;">
                <s:iterator value="#newItemList" status="it">
                        <div class="<s:property value="#class[#it.index]"/>">
                                <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>"><img src="<s:property value="itemThumbnailImageUrl"/>" alt="Image 01"  height="150" width="200"/></a>
                                <h3 style="overflow: hidden; height: 60px;"><s:property value="itemTitle"/></h3>
                                <p class="product_price">RMB: <s:property value="itemPrice"/></p>
                                <a href ="#" onclick="addCart(<s:property value="itemId"/>);" class="add_to_card">加入购物车</a>
                                <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>" class="detail">详情</a>                
                        </div>
                </s:iterator>
        </div>
        <div id="rate" style=" display: none;">
                <s:iterator value="#rateItemList" status="it">
                        <div class="<s:property value="#class[#it.index]"/>">
                                <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>"><img src="<s:property value="itemThumbnailImageUrl"/>" alt="Image 01"  height="150" width="200"/></a>
                                <h3 style="overflow: hidden; height: 60px;"><s:property value="itemTitle"/></h3>
                                <p class="product_price">RMB: <s:property value="itemPrice"/></p>
                                <a href ="#" onclick="addCart(<s:property value="itemId"/>);" class="add_to_card">加入购物车</a>
                                <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>" class="detail">详情</a>                
                        </div>
                </s:iterator>
        </div>
        <div id="sale" style=" display: none;">
                <s:iterator value="#saleItemList" status="it">
                        <div class="<s:property value="#class[#it.index]"/>">
                                <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>"><img src="<s:property value="itemThumbnailImageUrl"/>" alt="Image 01"  height="150" width="200"/></a>
                                <h3 style="overflow: hidden; height: 60px;"><s:property value="itemTitle"/></h3>
                                <p class="product_price">RMB: <s:property value="itemPrice"/></p>
                                <a href ="#" onclick="addCart(<s:property value="itemId"/>);" class="add_to_card">加入购物车</a>
                                <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>" class="detail">详情</a>                
                        </div>
                </s:iterator>
        </div>
        <div id="price" style=" display: none;">
                <s:iterator value="#priceItemList" status="it">
                        <div class="<s:property value="#class[#it.index]"/>">
                                <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>"><img src="<s:property value="itemThumbnailImageUrl"/>" alt="Image 01"  height="150" width="200"/></a>
                                <h3 style="overflow: hidden; height: 60px;"><s:property value="itemTitle"/></h3>
                                <p class="product_price">RMB: <s:property value="itemPrice"/></p>
                                <a href ="#" onclick="addCart(<s:property value="itemId"/>);" class="add_to_card">加入购物车</a>
                                <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>" class="detail">详情</a>                
                        </div>
                </s:iterator>
        </div>

        <script type="text/javascript">
                function addCart(itemId)
                {
                        var cartSize = 0;
                        var cookieArray = document.cookie.split("; ");
                        for (var i = 0; i < cookieArray.length; i++) {
                                var arr = cookieArray[i].split("=");
                                if (arr[0] == "cartSize")
                                        cartSize = parseInt(arr[1]);
                        }
                        var itemArr = Array(cartSize);
                        var itemQuantityArr = Array(cartSize);

                        for (var i = 0; i < cookieArray.length; i++) {
                                var arr = cookieArray[i].split("=");

                                var quantityIndex = arr[0].indexOf("Quantity");
                                if (quantityIndex != -1) {
                                        var index = parseInt(arr[0].slice(4, quantityIndex));
                                        itemQuantityArr[index] = parseInt(arr[1]);
                                }
                                else {
                                        if (arr[0].indexOf("item") != -1) {
                                                var index = parseInt(arr[0].slice(4, arr[0].length));
                                                itemArr[index] = parseInt(arr[1]);
                                        }
                                }
                        }
                        var quantity = 0;
                        var index = cartSize;
                        for (var i = 0; i < cartSize; i++) {
                                if (itemArr[i] == itemId) {
                                        index = i;
                                        quantity = itemQuantityArr[i];
                                        break;
                                }
                        }
                        var date = new Date();
                        date.setTime(date.getTime() + 3600 * 24 * 30);
                        var strItem = "item" + index + "=" + itemId + "; expires=" + date.toGMTString() + "; path=/Eboy/";
                        var strQuantity = "item" + index + "Quantity=" + (quantity + 1) + "; expires=" + date.toGMTString() + "; path=/Eboy/";
                        if (cartSize == index) {
                                cartSize = cartSize + 1;
                                var strCartSize = "cartSize=" + cartSize + "; expires=" + date.toGMTString() + "; path=/Eboy/";
                                document.cookie = strCartSize;
                        }
                        document.cookie = strItem;
                        document.cookie = strQuantity;

                        var v = document.getElementById("cartSize");
                        v.innerHTML = cartSize + " 件商品";
                }
                var nlist = document.getElementById('new');
                var rlist = document.getElementById('rate');
                var slist = document.getElementById('sale');
                var plist = document.getElementById('price');
                function showNew() {
                        nlist.style.display = "inline";
                        rlist.style.display = "none";
                        slist.style.display = "none";
                        plist.style.display = "none";
                }
                function showRate() {
                        nlist.style.display = "none";
                        rlist.style.display = "inline";
                        slist.style.display = "none";
                        plist.style.display = "none";
                }
                function showSale() {
                        nlist.style.display = "none";
                        rlist.style.display = "none";
                        slist.style.display = "inline";
                        plist.style.display = "none";
                }
                function showPrice() {
                        nlist.style.display = "none";
                        rlist.style.display = "none";
                        slist.style.display = "none";
                        plist.style.display = "inline";
                }

        </script>
</div> 
