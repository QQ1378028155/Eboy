<%-- 
    Document   : taobaoSearch
    Created on : 2013-9-3, 21:46:01
    Author     : wjl
--%>

<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div>
     <s:iterator value="#hotList" status="hl">
         <a href="<s:url value="adminFetchFilter.action">
            <s:param name="method">ebaykeyword</s:param>
            <s:param name="value"><s:property value="#engHotList[#hl.index]"/></s:param>
        </s:url>
        "><s:property value="#hotList[#hl.index]"/></a>&nbsp;&nbsp;
     </s:iterator>
</div>