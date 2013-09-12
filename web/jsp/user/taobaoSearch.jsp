<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="most_popular">
    <h4>热门商品</h4>
        <ul>
            <s:iterator value="#hotList" status="hl">
                <li>
                    <a href="<s:url value="fetchFilter.action">
                           <s:param name="method">keyword</s:param>
                           <s:param name="value"><s:property value="#hotList[#hl.index]"/></s:param>
                       </s:url>"><s:property value="#hotList[#hl.index]"/></a>
                </li>
            </s:iterator>
        </ul>
</div>
