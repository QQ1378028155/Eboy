<%-- 
    Document   : searchForm
    Created on : 2013-9-11, 15:54:53
    Author     : WingFung
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
                
                    <div style="float:right;">
                        <s:form action="fetchFilter" method="get">
                            <input type="hidden" name="method" value="keyword"/>
                            <input type="text" value="请输入关键字" name="value" id="keyword" title="关键字" onfocus="clearText(this);" onblur="clearText(this);" class="text_field"  x-webkit-speech/>
                            <input type="submit" value=" 搜索商品 " name="Search"  id="searchbutton" title="搜索商品" class="btn_m"/>
                        </s:form>
                    </div>
