<%-- 
    Document   : newItems
    Created on : 2013-8-23, 14:55:43
    Author     : wjl
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>






<div id="content" class="float_r">
        <h1>仓库中的货物</h1>
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
                                <p>数量:<span class="product_quantity"><s:property value="itemQuantity"/></span></p>
                                <a href ="#" class="add_to_card">修改信息</a>
                                <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>" class="detail">查看</a>                
                        </div>
                </s:iterator>
        </div>
        <div id="rate" style=" display: none;">
                <s:iterator value="#rateItemList" status="it">
                        <div class="<s:property value="#class[#it.index]"/>">
                                <a href="productdetail.html"><img src="<s:property value="itemThumbnailImageUrl"/>" alt="Image 01"  height="150" width="200"/></a>
                                <h3 style="overflow: hidden; height: 60px;"><s:property value="itemTitle"/></h3>
                                <p class="product_price">RMB: <s:property value="itemPrice"/></p>
                                <p>数量:<span class="product_quantity"><s:property value="itemQuantity"/></span></p>                                
                                <a href ="#"  class="add_to_card">修改信息</a>
                                <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>" class="detail">查看</a>                
                        </div>
                </s:iterator>
        </div>
        <div id="sale" style=" display: none;">
                <s:iterator value="#saleItemList" status="it">
                        <div class="<s:property value="#class[#it.index]"/>">
                                <a href="productdetail.html"><img src="<s:property value="itemThumbnailImageUrl"/>" alt="Image 01"  height="150" width="200"/></a>
                                <h3 style="overflow: hidden; height: 60px;"><s:property value="itemTitle"/></h3>
                                <p class="product_price">RMB: <s:property value="itemPrice"/></p>
                                <p>数量:<span class="product_quantity"><s:property value="itemQuantity"/></span></p>
                                <a href ="#"  class="add_to_card">修改信息</a>
                                <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>" class="detail">查看</a>                
                        </div>
                </s:iterator>
        </div>
        <div id="price" style=" display: none;">
                <s:iterator value="#priceItemList" status="it">
                        <div class="<s:property value="#class[#it.index]"/>">
                                <a href="productdetail.html"><img src="<s:property value="itemThumbnailImageUrl"/>" alt="Image 01"  height="150" width="200"/></a>
                                <h3 style="overflow: hidden; height: 60px;"><s:property value="itemTitle"/></h3>
                                <p class="product_price">RMB: <s:property value="itemPrice"/></p>
                                <p>数量:<span class="product_quantity"><s:property value="itemQuantity"/></span></p>
                                <a href ="#" class="add_to_card">修改信息</a>
                                <a href="loadItemInfo.action?itemId=<s:property value="itemId"/>" class="detail">查看</a>                
                        </div>
                </s:iterator>
        </div>

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