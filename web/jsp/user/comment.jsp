<%-- 
    Document   : comment
    Created on : 2013-8-25, 19:58:19
    Author     : WingFung game3108
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html  xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Eboy - 评价商品</title>
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
                                                            <s:include value="topcart.jsp"/>
                                        <s:include value="searchForm.jsp"/>
                    <div class="cleaner"></div>
                </div>
            </div><!-- END of templatemo_menu -->
            
             <div id="templatemo_main">
                <div id="sidebar" class="float_l">
                    <s:action name="getCategories" executeResult="true"/>
                    <s:action name="getTags" executeResult="true"/>
                    <s:action name="userHotList" executeResult="true" />
                </div>
                <div id="content" class="float_r">
                    <h1>评价商品</h1>
                    <h4>你购买了</h4>
                    <h4><strong>iphone5S</strong> 20件</h4>
                    <div class="cleaner h20"></div>
                    <h4>请填写以下表格对商品进行评价</h4>
                    <div id="comment_form">
                        <form method="post" name="contact" action="addComment">
                            <input type="text" name="itemId" value="<s:property value="#item.itemId"/>" readonly="true" style="display:none;"/>
                            <label for="author">昵称:</label> <input type="text" id="author" name="commentRate" class="required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="rate">评分</label> <input type="text" id="rate" name="commentRate" class="required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="content">评价内容:</label> <textarea id="content" name="CommentContent" rows="0" cols="0" class="required"></textarea>
                            <div class="cleaner h10"></div>
                            <input type="submit" value="提交" id="submit" name="submit" class="submit_btn float_l" />
                    </div>
                </div>
                <div class="cleaner"></div>
            </div> <!-- END of templatemo_main -->
            
            <div id="templatemo_footer">
                <p>
                    <a href="index.jsp">首页</a> | <a href="order.jsp">查询订单</a> | <a href="checkout.jsp">账单结算</a> | <a href="faqs.jsp">常见问题</a> | <a href="contact.jsp">联系我们</a>
                </p>
                Copyright © 2013 <a href="#">Eboy</a>
            </div> <!-- END of templatemo_footer -->
            
        </div><!-- END of templatemo_wrapper -->
    </body>
</html>

