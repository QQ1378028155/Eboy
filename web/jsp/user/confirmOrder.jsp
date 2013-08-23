<%-- 
    Document   : confirmOrder
    Created on : 2013-8-22, 18:39:55
    Author     : wjl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>


<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
        </head>
        <body>

                <script type="text/javascript">
                        function confirmOrder()
                        {
                                var xmlHttp;
                                var orderId = document.getElementById('orderId').value;
                                var orderValidate = document.getElementById('orderValidate').value;
                                var result;
                                if (window.ActiveXObject) {
                                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                                } else
                                        xmlHttp = new XMLHttpRequest();
                                xmlHttp.open("get", "confirmOrder.action?orderId=" + orderId + "&orderValidate=" + orderValidate, true);
                                xmlHttp.onreadystatechange = function() {
                                        if (xmlHttp.readyState == 4) {
                                                if (xmlHttp.status == 200) {
                                                        var result = xmlHttp.responseText;
                                                        if (result == "success") {
                                                                alert("操作成功");
                                                                return false;
                                                        }
                                                        else {
                                                                alert(result);
                                                        }
                                                }
                                        }
                                };
                                xmlHttp.send();
                        }
                </script>


                <form>
                        <input type="text" id="orderId"/>
                        <input type="password" id="orderValidate"/>
                        <p onclick="confirmOrder();">confirm</p>
                </form>
                <div id="comment">
                        
                </div>
        </body>
</html>
