<%-- 
    Document   : searchForm
    Created on : 2013-8-29, 5:34:48
    Author     : wjl
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript">
        function searchstorage()
        {
                var value = document.getElementById('keywords').value;
                window.location.href = "/Eboy/jsp/admin/storage.jsp?method=keyword&value=" + value;
        }
</script>

<script type="text/javascript">
        function searchebay()
        {
                document.getElementById("method").value = "ebaykeyword";
                document.getElementById("searchform").action = "/Eboy/jsp/admin/adminFetchFilter.action";
                document.getElementById("searchform").method = "get";
                document.getElementById("searchform").submit();
        }
</script>

<form id="searchform" action="#" method="get">
        <input type="text" value="请输入关键字" name="value" id="keywords" title="关键字" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
        <input type="hidden" id="method" name="method" value=""/>
        <input type="button" onclick="searchstorage();" value=" 搜索仓库 " name="Search"  alt="Search" id="searchstoragebutton" title="搜索仓库商品" class="sub_btn"  />
        <input type="button" onclick="searchebay();" value=" 搜索eBay " name="Search"  alt="Search" id="searchebaybutton" title="搜索eBay商品" class="sub_btn"  />
</form>