<%-- 
    Document   : getStatistics
    Created on : 2013-8-28, 18:29:05
    Author     : game3108
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="sidebar_box"><span class="bottom"></span>
        <h3>支出</h3>   
        <div class="content"> 
                <s:iterator value="#statisticsList">
                        <td><s:property value="statisticsMoney"/></td>
                        <td><s:property value="statisticsTime"/></td>
                </s:iterator>
                        <img src="<s:property value="chartUrl"/>" alt="Sample chart" />

        </div>
</div>