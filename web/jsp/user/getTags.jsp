<%-- 
    Document   : getTags
    Created on : 2013-8-23, 18:29:05
    Author     : wjl
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="tab-2" style="padding:10px;">
    <s:iterator value="#tagList">
            <a href="<s:url value="products.jsp"><s:param name="method">tag</s:param><s:param name="value"><s:property value="tagId"/></s:param></s:url>"><s:property value="tagWord"/></a>&nbsp;&nbsp;
    </s:iterator>
</div>
