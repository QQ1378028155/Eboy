<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="most_popular">
    <h4>热门商品</h4>
        <ul>
            <s:iterator value="#itemList" status="hl">
                <li>
                    <a href="<s:url value="loadItemInfo.action"><s:param name="itemId"><s:property value="itemId"/></s:param></s:url>"><s:property value="itemTitle"/></a>
                </li>
            </s:iterator>
        </ul>
</div>
