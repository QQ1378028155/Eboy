<%-- 
    Document   : delivery
    Created on : 2013-9-12, 2:39:08
    Author     : WingFung
--%>
<%-- 
    Document   : comment
    Created on : 2013-9-12, 2:35:42
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
        <title>Eboy - 查看物流</title>
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
        <script src="scripts/jquery.min.js"></script> 
        <script src="scripts/jquery.bxSlider.min.js"></script>
        <script src="scripts/jquery.blackandwhite.min.js"></script>
        <script src="scripts/js_func.js"></script>
        
        <script type="text/javascript">
        var waypoints = "<s:property value="#waypoints"/>";
        var destination = "<s:property value="#destination"/>";
        </script>
        
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
                    <h2>查看物流</h2>
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
                <div style='padding-left:20px;width:690px;float:right;'>
                    <h4>你购买的商品</h4>
                    <div style="padding:10px;border:1px solid #ccc;">
                        <p><strong><s:property value="#order.item.itemTitle"/></strong> <s:property value="#order.orderQuantity"/>件</p>
                    </div>
                    <br/>
                    <h4>收货信息</h4>
                    <div style="padding:10px;border:1px solid #ccc;">
                        <p>　收货人: <s:property value="#order.orderReceiver"/></p>
                        <p>收货地址: <s:property value="#order.orderAddress"/></p>
                        <p>联系电话: <s:property value="#order.orderPhone"/></p>
                    </div>
                    <br/>
                    <h4>物流信息</h4>
                    <table border="1px">
                        <tr bgcolor="#ddd">
                            <th width="50" align="center">序号</th>
                            <th width="200" align="center">时间</th>
                            <th width="360" align="center">地点</th>
                            <th width="200" align="center">备注</th>
                        </tr>
                        <s:iterator value="#deliveries" status="u">
                        <tr>
                            <td align="center"><s:property value="#u.index+1"/></td>
                            <td  align="center"><s:property value="deliveryTime"/></td>
                            <td  align="center"><s:property value="deliveryLocation"/></td>
                            <td  align="center"><s:property value="deliveryRemark"/></td>
                        </tr>
                        </s:iterator>
                    </table>
                    <br/>
                    <h4>物流地图</h4>
                    <div class="google_map c_after">
                        <iframe width="680" height="340" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="deliveryMap.jsp" id="myframe"></iframe>
                    </div>
                    <div style="height:30px;"></div>
                </div>
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


