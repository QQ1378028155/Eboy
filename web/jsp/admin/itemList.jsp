<%-- 
    Document   : newItems
    Created on : 2013-8-23, 14:55:43
    Author     : wjl game3108
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
<script>
        function refreshItem()
        {
                var xmlHttp;
                var refreshItem = document.getElementById('refreshItem');
                if (window.ActiveXObject) {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                } else
                        xmlHttp = new XMLHttpRequest();
                xmlHttp.open("get", "refreshItem.action", true);
                xmlHttp.onreadystatechange = function()
                {
                        if (xmlHttp.readyState == 4) {
                                if (xmlHttp.status == 200) {
                                        refreshItem.innerText = "刷新完成";
                                }
                        }
                }
                xmlHttp.send();
                refreshItem.innerText = "正在刷新";
        }
        
        function train()
        {
                var xmlHttp;
                var train = document.getElementById('train');
                if (window.ActiveXObject) {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                } else
                        xmlHttp = new XMLHttpRequest();
                xmlHttp.open("get", "train.action", true);
                xmlHttp.send();
                
        }
</script>



<div class="portfolio_sidebar portfolio_sidebar_right">
    
    <div style="margin-bottom:40px;">
        <input type="button" value="刷新商品"id="refrshitem" class="btn_m" style="width:120px; float: right" onclick="refreshItem();"/>
                <input type="button" value="更新排名"id="train" class="btn_m" style="width:120px; float: right" onclick="train();"/>
  

        <a href="" onclick="showNew();
                                                        return false;">按时间排序</a> | <a href="" onclick="showRate();
                                                        return false;">按得分排序</a> | <a href="" onclick="showSale();
                                                        return false;">按销售量排序</a> | <a href="" onclick="showPrice();
                                                        return false;">按价格排序</a>
        <br/>
         </div>
        <script>
                                               function spreadEmail(itemId) {
                                                       alert("推广邮件已发送");
                                                       var xmlHttp;
                                                       if (window.ActiveXObject) {
                                                               xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                                                       } else
                                                               xmlHttp = new XMLHttpRequest();
                                                       xmlHttp.open("get", "spreadEmail.action?itemId=" + itemId, true);
                                                       xmlHttp.send();
                                               }
                                               ;
        </script>

	<ul  id="new" style="display: inline;" class="four_columns gallery">
                <s:iterator value="#newItemList" status="it">
                        <li>
                                <div class="img" >                    
                                        <a href="http://cgi.sandbox.ebay.com/<s:property value="itemSandboxId"/>">
                                                <div align='center' style="height:150px;width:200px;overflow:hidden;">
                                                        <img src="<s:property value="itemThumbnailImageUrl"/>" width="0" height="0" onload="AutoResizeImage(200,150,this)" alt=""/>
                                                </div> 
                                        </a>
                                </div>
                                <div class="desc">
                                        <h5 style="overflow: hidden;"><s:property value="itemTitle"/></h5>
                                        <p class="product_price">价格: <s:property value="itemPrice"/>元</p>
					<p class="product_quantity">数量: <s:property value="itemQuantity"/></p>
                                        <a href ="editItem.action?itemId=<s:property value="itemId"/>" class="add_to_cart">修改信息</a>
                                        <a href="javascript:void(0);" onclick="spreadEmail(<s:property value="itemId"/>);" class="detail">推广</a>
                                </div>
                        </li>
                </s:iterator>
        </ul>
	<ul  id="rate" style="display: none;" class="four_columns gallery">
                <s:iterator value="#rateItemList" status="it">
                        <li>
                                <div class="img" >                    
                                        <a href="http://cgi.sandbox.ebay.com/<s:property value="itemSandboxId"/>">
                                                <div align='center' style="height:150px;width:200px;overflow:hidden;">
                                                        <img src="<s:property value="itemThumbnailImageUrl"/>" width="0" height="0" onload="AutoResizeImage(200,150,this)" alt=""/>
                                                </div> 
                                        </a>
                                </div>
                                <div class="desc">
                                        <h5 style="overflow: hidden;"><s:property value="itemTitle"/></h5>
                                        <p class="product_price">价格: <s:property value="itemPrice"/>元</p>
					<p class="product_quantity">数量: <s:property value="itemQuantity"/></p>
                                        <a href ="editItem.action?itemId=<s:property value="itemId"/>" class="add_to_cart">修改信息</a>
                                        <a href="javascript:void(0);" onclick="spreadEmail(<s:property value="itemId"/>);" class="detail">推广</a>
                                </div>
                        </li>
                </s:iterator>
        </ul>
	<ul  id="sale" style="display: none;" class="four_columns gallery">
                <s:iterator value="#saleItemList" status="it">
                        <li>
                                <div class="img" >                    
                                        <a href="http://cgi.sandbox.ebay.com/<s:property value="itemSandboxId"/>">
                                                <div align='center' style="height:150px;width:200px;overflow:hidden;">
                                                        <img src="<s:property value="itemThumbnailImageUrl"/>" width="0" height="0" onload="AutoResizeImage(200,150,this)" alt=""/>
                                                </div> 
                                        </a>
                                </div>
                                <div class="desc">
                                        <h5 style="overflow: hidden;"><s:property value="itemTitle"/></h5>
                                        <p class="product_price">价格: <s:property value="itemPrice"/>元</p>
					<p class="product_quantity">数量: <s:property value="itemQuantity"/></p>
                                        <a href ="editItem.action?itemId=<s:property value="itemId"/>" class="add_to_cart">修改信息</a>
                                        <a href="javascript:void(0);" onclick="spreadEmail(<s:property value="itemId"/>);" class="detail">推广</a>
                                </div>
                        </li>
                </s:iterator>
        </ul>
	<ul  id="price" style="display: none;" class="four_columns gallery">
                <s:iterator value="#priceItemList" status="it">
                        <li>
                                <div class="img" >                    
                                        <a href="http://cgi.sandbox.ebay.com/<s:property value="itemSandboxId"/>">
                                                <div align='center' style="height:150px;width:200px;overflow:hidden;">
                                                        <img src="<s:property value="itemThumbnailImageUrl"/>" width="0" height="0" onload="AutoResizeImage(200,150,this)" alt=""/>
                                                </div> 
                                        </a>
                                </div>
                                <div class="desc">
                                        <h5 style="overflow: hidden;"><s:property value="itemTitle"/></h5>
                                        <p class="product_price">价格: <s:property value="itemPrice"/>元</p>
					<p class="product_quantity">数量: <s:property value="itemQuantity"/></p>
                                        <a href ="editItem.action?itemId=<s:property value="itemId"/>" class="add_to_cart">修改信息</a>
                                        <a href="javascript:void(0);" onclick="spreadEmail(<s:property value="itemId"/>);" class="detail">推广</a>
                                </div>
                        </li>
                </s:iterator>
        </ul>

        <script type="text/javascript">
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