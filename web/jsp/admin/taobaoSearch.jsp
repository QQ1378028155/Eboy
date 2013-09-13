<%-- 
    Document   : taobaoSearch
    Created on : 2013-9-3, 21:46:01
    Author     : wjl
--%>

<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style type="text/css">

#taobaoSearch a:link {
        color: #fff;
}
#taobaoSearch a:visited {
        color: #00ff99;
}
#taobaoSearch a:hover {
        color: #FF0099;
}
#taobaoSearch a:active {
        color: #99ff00;
}
</style>
<div id="taobaoSearch">
     <s:iterator value="#hotList" status="hl">
         <a href="<s:url value="adminFetchFilter.action"><s:param name="method">ebaykeyword</s:param><s:param name="value"><s:property value="#engHotList[#hl.index]"/></s:param></s:url>"><s:property value="#hotList[#hl.index]"/></a>&nbsp;&nbsp;
     </s:iterator>
</div>