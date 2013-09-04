<%-- 
    Document   : topCart
    Created on : 2013-9-4, 19:44:24
    Author     : wjl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script>
                                window.onload = function()
                        {
                                var strcookie = document.cookie;
                                var cartSize = "0";
                                var arrcookie = strcookie.split("; ");
                                for (var i = 0; i < arrcookie.length; i++) {
                                        var arr = arrcookie[i].split("=");
                                        if ("cartSize" == arr[0])
                                                cartSize = arr[1];
                                }
                                var v = document.getElementById("cartSize");
                                v.innerHTML = cartSize + " 件商品";
                        }
</script>
 <div id="top_shopping_cart">购物车： <strong id="cartSize"></strong> ( <a href="shoppingcart.jsp">进入购物车</a> )</div>