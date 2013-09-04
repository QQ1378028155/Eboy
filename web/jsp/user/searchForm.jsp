<%-- 
    Document   : searchFrom
    Created on : 2013-9-4, 19:48:50
    Author     : wjl
--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

                <script language="javascript" type="text/javascript">
                        function clearText(field)
                        {
                                if (field.defaultValue == field.value)
                                        field.value = '';
                                else if (field.value == '')
                                        field.value = field.defaultValue;
                        }
                </script>

<div id="templatemo_search">
        <s:form action="fetchFilter" method="get">
                <input type="hidden" name="method" value="keyword"/>
                <input type="text" value="请输入关键字" name="value" id="keyword" title="关键字" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                <input type="submit" value=" 搜索 " name="Search"  alt="Search" id="searchbutton" title="搜索" class="sub_btn"  />
        </s:form>
</div>