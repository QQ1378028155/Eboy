<%-- 
    Document   : categories
    Created on : 2013-9-4, 10:54:31
    Author     : Tongda
--%>


<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<s:iterator value="#comments" status="u">
        <div>
                <table width='920px'>
                        <tr>
                                <td>
                                        <h4>商品名称</h4>
                                        <h5><strong><s:property value="item.itemTitle"/></strong></h5>
                                        <div class="cleaner h10"></div>
                                        <h4>商品评价</h4>
                                        <p><strong>昵称 :&nbsp</strong><s:property value="commentUserName"/><span style="float: right;"><s:property value="commentTime.toString()"/></span></p>
                                        <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<s:property value="commentContent"/></p>
                                        <p><strong>评分 :&nbsp<s:property value="commentRate"/></strong></p>
                                        <a href="javascript:void(0);" onclick='removeComment(this.parentNode.parentNode.parentNode.parentNode,<s:property value="commentId"/>);'>删除</a>
                                        <hr/>
                                </td>
                        </tr>

                </table>
                <div>
                </s:iterator>

