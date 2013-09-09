<%-- 
    Document   : ebayItemList
    Created on : 2013-8-28, 20:51:33
    Author     : Tongda
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


        <div>
                <s:iterator value="#items" status="it">
                        <div class="<s:property value="#class[#it.index]"/>">
                                <a href="http://www.ebay.com/itm/<s:property value="itemEbayId"/>"><img src="<s:property value="itemThumbnailImageUrl"/>" alt="Image 01"  height="150" width="200"/></a>
                                <h3 style="overflow: hidden; height: 60px;"><s:property value="itemTitle"/></h3>
                                <p class="product_price">RMB: <s:property value="itemPrice"/></p>
                                <a href="productAddToStorage.jsp?itemEbayId=<s:property value="itemEbayId"/>" class="add_to_card">加入仓库</a>
                                <a href="http://www.ebay.com/itm/<s:property value="itemEbayId"/>" class="detail">详细</a>    
                        </div>
                </s:iterator>
        </div>
