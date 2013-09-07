<%-- 
    Document   : tags
    Created on : 2013-9-4, 14:59:50
    Author     : Tongda
--%>


<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<s:iterator value="#tags" status="u">
        <tr>
                <td align="center"><s:property value="#u.index+1"/></td>
                <td align="center"><s:property value="tagWord"/></td>
                <td align="center">
                        <a href="javascript:void(0);" onclick="modifyTagName(this,<s:property value="tagId"/>);" style="display:block;">修改标签名称</a>
                        <input type="button" class="btn" onclick="confirmTagName(this,<s:property value="tagId"/>);" style="display:none;width:100px;height:25px;background-color: #0099ff;" value="确认标签名称" />
                </td>
        </tr>
</s:iterator>

