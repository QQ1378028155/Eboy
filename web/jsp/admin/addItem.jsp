<%-- 
    Document   : addItem
    Created on : 2013-8-12, 19:36:37
    Author     : wjl
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
        </head>
        <body>
                <s:form action="addItem">
                        EbayId:<input type="text" name="itemEbayId" value="<s:property value="itemEbayId"/>" readonly="true"/>
                        <br/>
                        商品标题:<input type="text" name="itemTitle" value="<s:property value="itemTitle"/>"/>
                        <br/>
                        商品描述:<textarea name="itemDescription"><s:property value="itemDescription"/></textarea>
                        <br/>
                        <select name="itemCategoryId">
                                <s:iterator value="#categoryList">
                                        <option value="<s:property value="categoryId"/>">
                                                <s:property value="categoryName"/>
                                        </option>
                                </s:iterator> 
                        </select>
                        <s:submit/>
                </s:form>
        </body>
</html>
