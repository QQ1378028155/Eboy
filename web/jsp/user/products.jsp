<%-- 
    Document   : products
    Created on : 2013-9-11, 23:24:00
    Author     : WingFung
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <title>Eboy - 商品列表</title>
        <link rel="icon" type="image/png" href="images/favicon.ico" />
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png" />
        <link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png" />
        <link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png" />
        <!--[if lt IE 9]>
        <script src="scripts/ie9.js">IE7_PNG_SUFFIX=".png";</script>
        <![endif]-->
        <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css' />
        <link rel="stylesheet" href="stylesheets/style.css" /> 
        <link rel="stylesheet" href="stylesheets/responsive.css" /> 
        <link rel="stylesheet" href="stylesheets/prettyPhoto.css" />
        <script src="scripts/jquery.min.js"></script> 
        <script src="scripts/jquery.bxSlider.min.js"></script>
        <script src="scripts/jquery.faq.js"></script>  
        <script src="scripts/jquery.prettyPhoto.js"></script>
        <script src="scripts/jquery.blackandwhite.min.js"></script>
        <script src="scripts/js_func.js"></script>
        <script>
        $(function(){
                $(".gallery a[rel^='prettyPhoto']").prettyPhoto({theme: 'dark_rounded'});
                $('.clients_slider').bxSlider({
                        auto: false,
                        controls : false,
                        mode: 'fade',
                        pager: true
                });	
                $('.recent_slider').bxSlider({
                        auto: false,
                        displaySlideQty: 1,
                        moveSlideQty: 1,
                speed : 1000
                });
                $('#faq').dltoggle();
                $("#open").click(function(event){
              $('#faq').dltoggle_show();
              return false;
                });
                $("#close").click(function(event){
              $('#faq').dltoggle_hide();
              return false;
                });
            $('.bwWrapper').BlackAndWhite({
                hoverEffect : true,
                webworkerPath : false,
                responsive:true,
                invertHoverEffect:false
            });
        });
        </script>
    </head>
    <body>
        <div class="wraper">
            <header class="header">
                <a class="logo" href="index.jsp">Eboy</a>

                <nav>
                    <!-- top menu -->
                    <ul>
                        <li><a href="index.jsp">首页</a></li>
                        <li><a href="order.jsp">查询订单</a></li>
                        <li><a href="checkout.jsp">账单结算</a></li>
                        <li><a href="faqs.jsp">常见问题</a></li>
                        <li><a href="contact.jsp">关于我们</a></li>
                    </ul>
                    <!-- /top menu -->
                    <s:include value="topcart.jsp"/>
                </nav>
            </header>
        </div>
                
        <div class="content_block">
            <!-- top_title -->
            <div class="top_title">
                <div class="wraper">
                    <h2>商品列表</h2>
                    <s:include value="searchForm.jsp"/>
                </div>
            </div>
            <!-- /top_title -->
            <div class="wraper">
                <!-- sidebar -->
                <div class="sidebar">
                    <!-- acc tabs -->
                    <div class="acc_tabs">
                        <div id="tabs">
                            <ul class="tab_select">
                                <li><a href="#tab-1">类别</a></li>
                                <li><a href="#tab-2">标签</a></li>
                            </ul>
                            <s:action name="getCategories" executeResult="true"/>
                            <s:action name="getTags" executeResult="true"/>
                            
                        </div>
                    </div>
                    <!-- /acc tabs -->
                    <!-- most popular -->
                    <s:action name="userHotList" executeResult="true" />
                    
                    <!-- /most popular -->
                </div>
                <!-- /sidebar -->
                <!-- main -->
                <s:action name="getItems" executeResult="true">
                    <s:param name="method"><s:property value="#parameters.method"/></s:param>
                    <s:param name="value"><s:property value="#parameters.value"/></s:param>
                </s:action>
                <!-- /main -->
            </div>
        </div>

        <!-- social block -->
        <div class="social_block">
            <div class="wraper">
                <p>欢迎关注我们</p>
                <ul>
                    <li class="facebook"><a href="#">Facebook</a></li>
                    <li class="twitter"><a href="#">Twitter</a></li>
                    <li class="linkedin"><a href="#">LinkedIn</a></li>
                    <li class="rss"><a href="#">RSS</a></li>
                    <li class="dribbble"><a href="#">Dribbble</a></li>
                    <li class="google"><a href="#">Google+</a></li>
                </ul>
            </div>
        </div>
        <!-- /social block -->
        
        <!-- copyright -->
        <div class="copyright">
            <div class="wraper">
                <p><span>Copyright 2013 Eboy </span>All Rights Reserved</p>
                <a class="top" href="#">返回顶部</a>
            </div>
        </div>
        <!-- /copyright -->
        
    </body>
</html>

