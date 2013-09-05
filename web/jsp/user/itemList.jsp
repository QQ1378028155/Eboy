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
                                <a href="productdetail.html"><img src="<s:property value="itemThumbnailImageUrl"/>" alt="Image 01"  height="150" width="200"/></a>
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
                                <a href="productdetail.html"><img src="<s:property value="itemThumbnailImageUrl"/>" alt="Image 01"  height="150" width="200"/></a>
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
                                <a href="productdetail.html"><img src="<s:property value="itemThumbnailImageUrl"/>" alt="Image 01"  height="150" width="200"/></a>
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
                                <a href="productdetail.html"><img src="<s:property value="itemThumbnailImageUrl"/>" alt="Image 01"  height="150" width="200"/></a>
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
                        var date = new Date();
                        date.setTime(date.getTime() + 3600 * 24 * 30);
                        var strItem = "item" + cartSize + "=" + itemId + "; expires=" + date.toGMTString() + "; path=/Eboy/";
                        var strQuantity = "item" + cartSize + "Quantity=1; expires=" + date.toGMTString() + "; path=/Eboy/";
                        cartSize = cartSize + 1;
                        var strCartSize = "cartSize=" + cartSize + "; expires=" + date.toGMTString() + "; path=/Eboy/";
                        document.cookie = strItem;
                        document.cookie = strQuantity;
                        document.cookie = strCartSize;
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
        <!--        <div class="product_box">
                        <a href="productdetail.html"><img src="images/product/01.jpg" alt="Image 01" /></a>
                        <h3>Integer eleifend sed</h3>
                        <p class="product_price">$ 100</p>
                        <a href="shoppingcart.html" class="add_to_card">加入购物车</a>
                        <a href="productdetail.html" class="detail">详情</a>
                </div>        	
                <div class="product_box">
                        <a href="productdetail.html"><img src="images/product/02.jpg" alt="Image 02" /></a>
                        <h3>Nam cursus facilisis</h3>
                        <p class="product_price">$ 200</p>
                        <a href="shoppingcart.html" class="add_to_card">加入购物车</a>
                        <a href="productdetail.html" class="detail">详情</a>
                </div>        	
                <div class="product_box no_margin_right">
                        <a href="productdetail.html"><img src="images/product/03.jpg" alt="Image 03" /></a>
                        <h3>Mauris consectetur</h3>
                        <p class="product_price">$ 120</p>
                        <a href="shoppingcart.html" class="add_to_card">加入购物车</a>
                        <a href="productdetail.html" class="detail">详情</a>
                </div>        	
                <div class="product_box">
                        <a href="productdetail.html"><img src="images/product/04.jpg" alt="Image 04" /></a>
                        <h3>Proin volutpat</h3>
                        <p class="product_price">$ 260</p>
                        <a href="shoppingcart.html" class="add_to_card">加入购物车</a>
                        <a href="productdetail.html" class="detail">详情</a>
                </div>        	
                <div class="product_box">
                        <a href="productdetail.html"><img src="images/product/05.jpg" alt="Image 05" /></a>
                        <h3>Aenean tempus</h3>
                        <p class="product_price">$ 80</p>
                        <a href="shoppingcart.html" class="add_to_card">加入购物车</a>
                        <a href="productdetail.html" class="detail">详情</a>
                </div>        	
                <div class="product_box no_margin_right">
                        <a href="productdetail.html"><img src="images/product/06.jpg" alt="Image 06" /></a>
                        <h3>Nulla, Validate <a href="http://validator.w3.org/check?uri=referer" rel="nofollow"><strong>XHTML</strong></a> &amp; <a href="http://jigsaw.w3.org/css-validator/check/referer" rel="nofollow"><strong>CSS</strong></a>.</h3>
                        <p class="product_price">$ 193</p>
                        <a href="shoppingcart.html" class="add_to_card">加入购物车</a>
                        <a href="productdetail.html" class="detail">详情</a>
                </div>        	
                <div class="product_box">
                        <a href="productdetail.html"><img src="images/product/07.jpg" alt="Image 07" /></a>
                        <h3>Pellentesque egestas</h3>
                        <p class="product_price">$ 30</p>
                        <a href="shoppingcart.html" class="add_to_card">加入购物车</a>
                        <a href="productdetail.html" class="detail">详情</a>
                </div>        	
                <div class="product_box">
                        <a href="productdetail.html"><img src="images/product/08.jpg" alt="Image 08" /></a>
                        <h3>Suspendisse fermentum</h3>
                        <p class="product_price">$ 220</p>
                        <a href="shoppingcart.html" class="add_to_card">加入购物车</a>
                        <a href="productdetail.html" class="detail">详情</a>
                </div>        	
                <div class="product_box no_margin_right">
                        <a href="productdetail.html"><img src="images/product/09.jpg" alt="Image 09" /></a>
                        <h3>Donec laoreet velit</h3>
                        <p class="product_price">$ 65</p>
                        <a href="shoppingcart.html" class="add_to_card">加入购物车</a>
                        <a href="productdetail.html" class="detail">详情</a>
                </div>  -->
</div> 