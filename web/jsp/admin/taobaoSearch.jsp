<%-- 
    Document   : taobaoSearch
    Created on : 2013-9-3, 21:46:01
    Author     : wjl
--%>

<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style type="text/css">

a:link {
        color: #000000;
}
a:visited {
        color: #66CCFF;
}
a:hover {
        color: #FF0000;
}
a:active {
        color: #0033FF;
}
</style>
<div>
     <s:iterator value="#hotList" status="hl">
         <a href="<s:url value="adminFetchFilter.action">
            <s:param name="method">ebaykeyword</s:param>
            <s:param name="value"><s:property value="#engHotList[#hl.index]"/></s:param>
        </s:url>
        "><s:property value="#hotList[#hl.index]"/></a>&nbsp;&nbsp;
     </s:iterator>
</div>