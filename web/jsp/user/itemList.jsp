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

        <a href="" onclick="showNew();
                return false;">按时间排序</a>|
        <a href="" onclick="showRate();
                return false;">按得分排序</a>|
        <a href="" onclick="showSale();
                return false;">按销售量排序</a>|
        <a href="" onclick="showPrice();
                return false;">按价格排序</a><br/><br/>

        <ul  id="new" style="display: inline;" class="three_columns gallery">
                <s:iterator value="#newItemList" status="it">
                        <li>
                                <div class="img" >                    
                                        <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>">
                                                <div align='center' >
                                                        <img src="<s:property value="itemThumbnailImageUrl"/>" width="0" height="0" onload="AutoResizeImage(200,150,this)" alt=""/>
                                                </div> 
                                        </a>
                                </div>
                                <div class="desc">
                                        <h5 style="overflow: hidden;"><s:property value="itemTitle"/></h5>
                                        <p class="product_price">价格: <s:property value="itemPrice"/>元</p>
                                        <a href ="#" onclick="addCart(<s:property value="itemId"/>);" class="add_to_cart">加入购物车</a>
                                        <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>" class="detail">详细</a>
                                </div>
                        </li>
                </s:iterator>
        </ul>

        <ul  id="rate" style="display: none;" class="three_columns gallery">
                <s:iterator value="#rateItemList" status="it">
                        <li>
                                <div class="img" >                    
                                        <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>">
                                                <div align='center'>
                                                        <img src="<s:property value="itemThumbnailImageUrl"/>" width="0" height="0" onload="AutoResizeImage(200,150,this)" alt=""/>
                                                </div> 
                                        </a>
                                </div>
                                <div class="desc">
                                        <h5 style="overflow: hidden;"><s:property value="itemTitle"/></h5>
                                        <p class="product_price">价格: <s:property value="itemPrice"/>元</p>
                                        <a href ="#" onclick="addCart(<s:property value="itemId"/>);" class="add_to_cart">加入购物车</a>
                                        <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>" class="detail">详细</a>
                                </div>
                        </li>
                </s:iterator>
        </ul>

        <ul  id="sale" style="display: none;" class="three_columns gallery">
                <s:iterator value="#saleItemList" status="it">
                        <li>
                                <div class="img" >                    
                                        <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>">
                                                <div align='center'>
                                                        <img src="<s:property value="itemThumbnailImageUrl"/>" width="0" height="0" onload="AutoResizeImage(200,150,this)" alt=""/>
                                                </div> 
                                        </a>
                                </div>
                                <div class="desc">
                                        <h5 style="overflow: hidden;"><s:property value="itemTitle"/></h5>
                                        <p class="product_price">价格: <s:property value="itemPrice"/>元</p>
                                        <a href ="#" onclick="addCart(<s:property value="itemId"/>);" class="add_to_cart">加入购物车</a>
                                        <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>" class="detail">详细</a>
                                </div>
                        </li>
                </s:iterator>
        </ul>

        <ul  id="price" style="display: none;" class="three_columns gallery">
                <s:iterator value="#priceItemList" status="it">
                        <li>
                                <div class="img" >                    
                                        <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>">
                                                <div align='center'>
                                                        <img src="<s:property value="itemThumbnailImageUrl"/>" width="0" height="0" onload="AutoResizeImage(200,150,this)" alt=""/>
                                                </div> 
                                        </a>
                                </div>
                                <div class="desc">
                                        <h5 style="overflow: hidden;"><s:property value="itemTitle"/></h5>
                                        <p class="product_price">价格: <s:property value="itemPrice"/>元</p>
                                        <a href ="#" onclick="addCart(<s:property value="itemId"/>);" class="add_to_cart">加入购物车</a>
                                        <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>" class="detail">详细</a>
                                </div>
                        </li>
                </s:iterator>
        </ul>

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
