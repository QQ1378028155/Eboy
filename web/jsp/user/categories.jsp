<%-- 
    Document   : categories
    Created on : 2013-8-23, 14:21:41
    Author     : wjl
--%>


<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
        </head>
        <body>
                <h1>Hello World!</h1>
        </body>
</html>-->

                            <div id="tab-1" style="padding:10px;">

                                <ol>
                                    <s:iterator value="#categoryList">
                                        <li style="height:30px;"><a href="<s:url value="products.jsp"><s:param name="method">category</s:param><s:param name="value"><s:property value="categoryId"/></s:param></s:url>"><s:property value="categoryName"/></a></li>
                                    </s:iterator>
                                </ol>

                            </div>
