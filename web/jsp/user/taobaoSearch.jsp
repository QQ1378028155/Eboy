<%-- 
    Document   : taobaoSearch
    Created on : 2013-9-7, 10:46:01
    Author     : game3108
--%>

<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="sidebar_box"><span class="bottom"></span>
        <h3>商品热门</h3>   
        <div class="content">

<!--<div class="sidebar_box">-->
<!--        <h3>本地网站的搜索频繁词汇</h3>   -->
<!--        <div class="content"> -->
                <s:iterator value="#itemList" status="hl">
                        <a href="<s:url value="loadItemInfo.action">
                                   <s:param name="itemId"><s:property value="itemId"/></s:param>
                           </s:url>
                           "><s:property value="itemId"/>&nbsp&nbsp<s:property value="itemTitle"/></a>&nbsp;&nbsp;
                </s:iterator>
        </div>
</div>

<!--        </div>-->
<!--</div>-->