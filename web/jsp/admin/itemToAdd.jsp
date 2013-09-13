<%-- 
    Document   : itemToAdd
    Created on : 2013-8-29, 3:42:06
    Author     : wjl
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div>
        <s:form action="addItem">
                <s:token/>
                <img src="<s:property value="#item.itemThumbnailImageUrl"/>"/>
                <input type="hidden" value="<s:property value="#item.itemEbayId"/>" name="itemEbayId"/>
                <table>
                        <tr>
                                <td height="30" width="100">商品名称翻译:</td>
                                <td><input type="text" style="width:250px;" value="<s:property value="#item.itemTitle"/>" name="itemTitle"/></td>
                        </tr>
                        <tr>
                                <td height="30" width="100">价格:</td>
                                <td><s:property value="#item.itemPrice"/>  <s:property value="#item.itemPriceCurrency"/></td>
                        </tr>
                        <tr>
                                <td height="30" width="100">库存数量:</td>
                                <td><s:property value="#item.itemQuantity"/><td>
                        </tr>
                        <tr>
                                <td height="30" width="100">商品描述翻译:</td>
                                <td><textarea style="width:800px; resize: none;" id="text" name="itemDescription" rows="8" cols="0" class="required"><s:property value="itemDescription"/></textarea></td>
                        </tr>
                        <tr>
                                <td height="30" width="100">类别:</td>
                                <td>
                                        <select name="itemCategoryId">
                                                <s:iterator value="#categoryList">
                                                        <option value="<s:property value="categoryId"/>">
                                                                <s:property value="categoryName"/>
                                                        </option>
                                                </s:iterator> 
                                        </select>
                                </td>
                        </tr>

                </table>
                <div  class="cleaner h20"></div>
                <div align="center">
                        <input type="submit" class="btn_m"  value="加入仓库" />
                </div>
        </s:form>
                <br/>
</div>