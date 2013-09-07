<%-- 
    Document   : taobaoSearch
    Created on : 2013-9-7, 10:46:01
    Author     : game3108
--%>

<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="sidebar_box"><span class="bottom"></span>
        <h3>淘宝热门</h3>   
        <div class="content">

<!--<div class="sidebar_box">-->
<!--        <h3>本地网站的搜索频繁词汇</h3>   -->
<!--        <div class="content"> -->
                <s:iterator value="#hotList" status="hl">
                        <a href="<s:url value="fetchFilter.action">
                                   <s:param name="method">keyword</s:param>
                                   <s:param name="value"><s:property value="#hotList[#hl.index]"/></s:param>
                           </s:url>
                           "><s:property value="#hotList[#hl.index]"/></a>&nbsp;&nbsp;
                </s:iterator>
        </div>
</div>

<!--        </div>-->
<!--</div>-->