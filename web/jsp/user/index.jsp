<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html  xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Eboy - 首页</title>
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
                        <li><a href="index.jsp" class="selected">首页</a></li>
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
            
            <div id="templatemo_middle" class="carousel">
                <div class="panel">
                    <div class="details_wrapper">
                        <div class="details">
                            <div class="detail">
				<h2><a href="#">Eboy简介</a></h2>
                                <p><a href="#"></a> eboy电子商务系统致力为中国用户屏蔽在其他市场(如英国/美国)购买物品时由语言/文化/海关/运输/税带来的障碍。,使得中国用户也能够自如地在eBay上购买来自全球市场的商品。 </p>
				<a href="#" title="查看更多" class="more">查看更多</a>
			    </div><!-- /detail -->
                            <div class="detail">
                                <h2><a href="#">我们的团队</a></h2>
                                <p>组长：许佳文</p>
                                <p>超级程序员1：王家雷</p>
                                <p>超级程序员2：陈荣峰</p>                     
                                <p>超级程序员3：蔡通达</p>
                                <p>超级程序员4：杜阳</p>
                                <a href="#" title="查看更多" class="more">查看更多</a>
                            </div><!-- /detail -->
                            <div class="detail">
                                <h2><a href="#">我们的宗旨</a></h2>
                                <p>竭尽全力为客户减少中间环节</p>
                                <p>竭尽全力为客户透明化中间费用</p>
                                <a href="#" title="查看更多" class="more">查看更多</a>
                            </div><!-- /detail -->
                        </div><!-- /details -->
                        
                    </div><!-- /details_wrapper -->
                    
                    <div class="paging">
                        <div id="numbers"></div>
                        <a href="javascript:void(0);" class="previous" title="上一个" >上一个</a>
                        <a href="javascript:void(0);" class="next" title="下一个">下一个</a>
                    </div><!-- /paging -->
                    <a href="javascript:void(0);" class="play" title="自动播放">播放</a>
                    <a href="javascript:void(0);" class="pause" title="暂停播放">暂停</a>
                </div><!-- /panel -->
                
                <div class="backgrounds">
                    <div class="item item_1">
                        <img src="images/slider/02.jpg" alt="Slider 01" />
                    </div><!-- /item -->
                    <div class="item item_2">
                        <img src="images/slider/03.jpg" alt="Slider 02" />
                    </div><!-- /item -->
                    <div class="item item_3">
                        <img src="images/slider/01.jpg" alt="Slider 03" />
                    </div><!-- /item -->
                </div><!-- /backgrounds -->
                
            </div><!-- END of templatemo_middle -->
            
            <div id="templatemo_main">
                <div id="sidebar" class="float_l">
                    <s:action name="getCategories" executeResult="true"/>
                    <s:action name="getTags" executeResult="true"/>
                </div>
                <s:action name="getNewItems" executeResult="true"/>
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
