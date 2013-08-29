<%-- 
    Document   : categories
    Created on : 2013-8-29, 10:24:41
    Author     : Tongda
--%>


<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<s:iterator value="#categoryList" status="u">
        <tr>
                <td align="center"><s:property value="#u.index+1"/></td>
                <td align="center" hidden="ture"><s:property value="categoryId"/></td>
                <td align="center"><s:property value="categoryName"/></td>
                <%--
                <td align="center">
                        <a href="javascript:void(0);" onclick="modifyCategoryName(this);" style="display:block;">修改类型名称</a>
                        <input type="button" class="btn" onclick="confirmCategoryName(this);" style="display:none;width:100px;height:25px;background-color: #0099ff;"value="确认类型名称" />
                </td>
               --%>
        </tr>
</s:iterator>