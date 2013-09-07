<%-- 
    Document   : storage
    Created on : 2013-8-27, 21:49:16
    Author     : WingFung
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html  xmlns="http://www.w3.org/1999/xhtml">
        <head>
                <title>EboyAdmin - 仓库管理</title>
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
                                if (field.defaultValue == field.value)
                                        field.value = '';
                                else if (field.value == '')
                                        field.value = field.defaultValue;
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
                </script>
        </head>

        <body>
                <div id="templatemo_wrapper">

                        <div id="templatemo_header">
                                <div id="site_title">
                                        <h1><a href="">eboyadmin</a></h1>
                                </div>
                                <div id="header_right">
                                        <strong>管理员账号名</strong> | <a href="#">退出登录</a>
                                </div>
                                <div class="cleaner"></div>
                        </div><!-- END of templatemo_header -->

                        <div id="templatemo_menu">
                                <div id="top_nav" class="ddsmoothmenu">
                                        <ul>
                                                <li><a href="balance.jsp">收支明细</a></li>
                                                <li><a href="storage.jsp?method=all&keyword=all"  class="selected">仓库管理</a></li>
                                                <li><a href="category.jsp">类型管理</a></li>
                                                <li><a href="tag.jsp">标签管理</a></li>
                                                <li><a href="comment.jsp">评价管理</a></li>
                                                <li><a href="delivery.jsp">物流管理</a></li>
                                        </ul>
                                        <br style="clear: left" />
                                </div><!-- end of ddsmoothmenu -->

                                <div id="menu_second_bar">

                                        <div id="templatemo_search">
                                                <s:include value="searchForm.jsp"/>
                                        </div>

                                        <div class="cleaner"></div>
                                        
                                </div>
                        </div><!-- END of templatemo_menu -->


                        <div id="templatemo_main">
                                <!--                <div id="content" class="float_r">
                                                    <h1>仓库管理</h1>
                                                    <div class="product_box">
                                                        <a href="productdetail.html"><img src="images/product/01.jpg" alt="Image 01" /></a>
                                                        <h3>商品名占的行数不同会导致同一排的三个商品难以对齐</h3>
                                                        <p>定价:<span class="product_price">$100</span></p>
                                                        <p>数量:<span class="product_quantity">999</span></p>
                                                        <a href="shoppingcart.html" class="add_to_card">修改信息</a>
                                                        <a href="productdetail.html" class="detail">查看</a>
                                                    </div>        	
                                                    <div class="product_box">
                                                        <a href="productdetail.html"><img src="images/product/02.jpg" alt="Image 02" /></a>
                                                        <h3>中间商品的商品名只有一行</h3>
                                                        <p>定价:<span class="product_price">$200</span></p>
                                                        <p>数量:<span class="product_quantity">3</span></p>
                                                        <a href="shoppingcart.html" class="add_to_card">修改信息</a>
                                                        <a href="productdetail.html" class="detail">查看</a>
                                                    </div>        	
                                                   <div class="product_box">
                                                        <a href="productdetail.html"><img src="images/product/02.jpg" alt="Image 02" /></a>
                                                        <h3>中间商品的商品名只有一行</h3>
                                                        <p>定价:<span class="product_price">$200</span></p>
                                                        <p>数量:<span class="product_quantity">888</span></p>
                                                        <a href="shoppingcart.html" class="add_to_card">修改信息</a>
                                                        <a href="productdetail.html" class="detail">查看</a>
                                                    </div>        
                                                    <div class="product_box no_margin_right">
                                                        <a href="productdetail.html"><img src="images/product/03.jpg" alt="Image 03" /></a>
                                                        <h3>右边的商品的div class有个no_margin_right</h3>
                                                        <p>定价:<span class="product_price">$120</span></p>
                                                        <p>数量:<span class="product_quantity">5</span></p>
                                                        <a href="shoppingcart.html" class="add_to_card">修改信息</a>
                                                        <a href="productdetail.html" class="detail">查看</a>
                                                    </div>        	
                                
                                                </div>-->

                                <s:action name="searchItemsFromStore" executeResult="true">
                                        <s:param name="method"><s:property value="#parameters.method"/></s:param>
                                        <s:param name="value"><s:property value="#parameters.value"/></s:param>
                                </s:action>
                                <div class="cleaner"></div>
                        </div> <!-- END of templatemo_main -->

                        <div id="templatemo_footer">
                                <p>
                                        <a href="balance.jsp">收支明细</a> | <a href="storage.jsp">仓库管理</a> | <a href="category.jsp">类型管理</a> | <a href="tag.jsp">标签管理</a> | <a href="comment.jsp">评价管理</a> | <a href="delivery.jsp">物流管理</a>
                                </p>
                                Copyright © 2048 <a href="#">Eboy</a>
                        </div> <!-- END of templatemo_footer -->

                </div><!-- END of templatemo_wrapper -->
        </body>
</html>

