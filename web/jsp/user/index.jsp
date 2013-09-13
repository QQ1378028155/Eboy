<%-- 
    Document   : index
    Created on : 2013-9-11, 15:21:05
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
        <title>Eboy - 首页</title>
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
        <link rel="stylesheet" href="stylesheets/nivoslider.css" />
        <script src="scripts/jquery.min.js"></script> 
        <script src="scripts/jquery.bxSlider.min.js"></script>
        <script src="scripts/jquery.nivo.slider.js"></script>
        <script src="scripts/jquery.blackandwhite.min.js"></script>
        <script src="scripts/js_func.js"></script>

        
        <script>
            $(function(){
                    $('#slider').nivoSlider({
                            controlNav: false
                    });
                    $('.post_slider').bxSlider({
                            auto: false,
                            speed : 1000
                    });
                    $('.clients_slider').bxSlider({
                            auto: false,
                            controls : false,
                            mode: 'fade',
                            pager: true
                    });	
                $('.bwWrapper').BlackAndWhite({
                    hoverEffect : true,
                    webworkerPath : false,
                    responsive:true,
                    invertHoverEffect:false
                });
            })
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
                
<!-- nivo slider -->
<div class="nivo-wrap">
<div class="wraper">
<!--<div class="fallback"><img src="images/sliders/home_page_4/fallback.png" alt="" /></div>-->
        <div class="slider-wrapper theme-default">
            <div id="slider" class="nivoSlider">
            	<img src="images/sliders/home_page_4/home4_slide_1.jpg" width="933" height="377" data-thumb="images/features/img.png" alt="" title="#htmlcaption" />
            	<img src="images/sliders/home_page_4/home4_slide_2.jpg" width="933" height="377" data-thumb="images/features/img.png" alt="" title="#htmlcaption2" />
            	<img src="images/sliders/home_page_4/home4_slide_3.jpg" width="933" height="377" data-thumb="images/features/img.png" alt="" title="#htmlcaption3" />
                <img src="images/sliders/home_page_4/home4_slide_4.jpg" width="933" height="377" data-thumb="images/features/img.png" alt="" title="#htmlcaption4" />
            </div>
            <div id="htmlcaption" class="dd nivo-html-caption">
                <span class="tit">电子商务网站</span><strong class="tit2">Eboy</strong>致力为中国用户屏蔽在其他市场(如英国/美国)购买物品时由语言/文化/运输/关税带来的障碍，使得中国用户也能够方便地购买来自全球市场的商品。
            </div>
            <div id="htmlcaption2" class="dd nivo-html-caption">
                <span class="tit">我们的宗旨</span><strong class="tit2">诚心为客户服务</strong>作为中国的eBay代购站点，我们将竭尽全力为客户减少中间环节，为客户透明化中间费用。
            </div>
            <div id="htmlcaption3" class="dd nivo-html-caption">
                <span class="tit">我们的团队</span><strong class="tit2">小伙伴们都惊呆了</strong>许佳文  王家雷  蔡通达 陈荣峰  杜阳<br/>我们来自上海交通大学软件学院F10
            </div>
            <div id="htmlcaption4" class="dd nivo-html-caption">
                <span class="tit">我们的责任</span><strong class="tit2">慈善项目</strong>我们会从每份订单中提取一定的金额用作慈善，让你和我一起为社会作出贡献。
            </div>
        </div>
</div>
</div>
<!-- /nivo slider -->
                
        <div class="content_block">
            <!-- top_title -->
            <div class="top_title">
                <div class="wraper">
                    <h2>Eboy<span>你的eBay代购助手</span></h2>
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
                    <s:param name="method">all</s:param>
                    <s:param name="value">all</s:param>
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
