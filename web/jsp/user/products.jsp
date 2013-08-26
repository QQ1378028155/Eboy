<%-- 
    Document   : products
    Created on : 2013-8-25, 1:51:47
    Author     : WingFung
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html  xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Eboy - 商品列表</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
        <link href="css/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
        <link href="css/jquery.dualSlider.0.2.css" rel="stylesheet" type="text/css" media="all" />
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/ddsmoothmenu.js" type="text/javascript"></script>
        <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
        <script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
        <script src="js/jquery.timers-1.2.js" type="text/javascript"></script>
        <script src="js/jquery.dualSlider.0.3.min.js" type="text/javascript"></script>
        
        <script type="text/javascript">
            function clearText(field)
            {
                if (field.defaultValue == field.value) field.value = '';
                else if (field.value == '') field.value = field.defaultValue;
            }
        </script>

        <script type="text/javascript">

            ddsmoothmenu.init({
                mainmenuid: "top_nav", //menu DIV id
                orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
                classname: 'ddsmoothmenu', //class added to menu's outer DIV
                //customtheme: ["#1c5a80", "#18374a"],
                contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
            });

        </script>
        
        <script type="text/javascript">
            $(document).ready(function() {
                $(".carousel").dualSlider({
                    auto: true,
                    autoDelay: 6000,
                    easingCarousel: "swing",
                    easingDetails: "easeOutBack",
                    durationCarousel: 1000,
                    durationDetails: 600
                });
            });
            
            window.onload= function()
            {
                var strcookie = document.cookie;
                var cartSize = "0";
                var arrcookie = strcookie.split("; ");
                for(var i = 0;i < arrcookie.length;i ++) {
                    var arr = arrcookie[i].split("=");
                    if(arr[0] == "cartSize")
                        cartSize = arr[1];
                }
                var v = document.getElementById("cartSize");
                v.innerHTML = cartSize + " 件商品";
            }
        </script>
        
    </head>
    
    <body>
        <div id="templatemo_wrapper">
            
            <div id="templatemo_header">
                <div id="site_title">
                    <h1><a href="">eboy</a></h1>
                </div>
                <div id="header_right">
                    <a href="shoppingcart.jsp">我的购物车</a> | <a href="checkout.jsp">账单结算</a>
		</div>
                <div class="cleaner"></div>
            </div><!-- END of templatemo_header -->
            
            <div id="templatemo_menu">
                <div id="top_nav" class="ddsmoothmenu">
                    <ul>
                        <li><a href="index.jsp">首页</a></li>
                        <li><a href="order.jsp">查询订单</a></li>
                        <li><a href="checkout.jsp">账单结算</a></li>
                        <li><a href="faqs.jsp">常见问题</a></li>
                        <li><a href="contact.jsp">联系我们</a></li>
                    </ul>
                    <br style="clear: left" />
                </div><!-- end of ddsmoothmenu -->
                
                <div id="menu_second_bar">
                    <div id="top_shopping_cart">购物车： <strong id="cartSize"></strong> ( <a href="shoppingcart.jsp">进入购物车</a> )</div>
                    <div id="templatemo_search">
                        <form action="#" method="get">
                          <input type="text" value="请输入关键字" name="keyword" id="keyword" title="关键字" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                          <input type="submit" value=" 搜索 " name="Search"  alt="Search" id="searchbutton" title="搜索" class="sub_btn"  />
                        </form>
                    </div>
                    <div class="cleaner"></div>
                </div>
            </div><!-- END of templatemo_menu -->
            
             <div id="templatemo_main">
                <div id="sidebar" class="float_l">
                    <s:action name="getCategories" executeResult="true"/>
                    <s:action name="getTags" executeResult="true"/>
                </div>
                <div id="content" class="float_r">
                    <h1>商品列表</h1>
                    <p>商品排序: <a href="#">按加入库存时间</a> | <a href="#">按销量从高到低</a> | <a href="#">按评分从高到低</a> | <a href="#">按价格从低到高</a></p>
                    <div class="product_box">
                        <a href="productdetail.html"><img src="images/product/01.jpg" alt="Image 01" /></a>
                        <h3>商品名占的行数不同会导致同一排的三个商品难以对齐</h3>
                        <p class="product_price">$ 100</p>
                        <a href="shoppingcart.html" class="add_to_card">加入购物车</a>
                        <a href="productdetail.html" class="detail">详细</a>
                    </div>        	
                    <div class="product_box">
                        <a href="productdetail.html"><img src="images/product/02.jpg" alt="Image 02" /></a>
                        <h3>中间商品的商品名只有一行</h3>
                        <p class="product_price">$ 200</p>
                        <a href="shoppingcart.html" class="add_to_card">加入购物车</a>
                        <a href="productdetail.html" class="detail">详细</a>
                    </div>        	
                    <div class="product_box no_margin_right">
                        <a href="productdetail.html"><img src="images/product/03.jpg" alt="Image 03" /></a>
                        <h3>右边的商品的div class有个no_margin_right</h3>
                        <p class="product_price">$ 120</p>
                        <a href="shoppingcart.html" class="add_to_card">加入购物车</a>
                        <a href="productdetail.html" class="detail">详细</a>
                    </div>        	
                </div>
                <div class="cleaner"></div>
            </div> <!-- END of templatemo_main -->
            
            <div id="templatemo_footer">
                <p>
                    <a href="index.jsp">首页</a> | <a href="order.jsp">查询订单</a> | <a href="checkout.jsp">账单结算</a> | <a href="faqs.jsp">常见问题</a> | <a href="contact.jsp">联系我们</a>
                </p>
                Copyright © 2048 <a href="#">Eboy</a>
            </div> <!-- END of templatemo_footer -->
            
        </div><!-- END of templatemo_wrapper -->
    </body>
</html>

