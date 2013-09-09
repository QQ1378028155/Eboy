<%-- 
    Document   : delivery
    Created on : 2013-8-25, 20:20:30
    Author     : WingFung
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html  xmlns="http://www.w3.org/1999/xhtml">
        <head>
                <title>Eboy - 查看物流</title>
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
                <script type="text/javascript">
                var waypoints = "<s:property value="#waypoints"/>";
                var destination = "<s:property value="#destination"/>";
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
                                        <h1>查看物流</h1>
                                        <h4>你购买的商品</h4>
                                        <p><strong><s:property value="#order.item.itemTitle"/></strong><s:property value="#order.orderQuantity"/>件</p>
                                        <div class="cleaner h10"></div>
                                        <h4>收货信息</h4>
                                        <p>  收货人: <s:property value="#order.orderReceiver"/></p>
                                        <p>收货地址: <s:property value="#order.orderAddress"/></p>
                                        <p>联系电话: <s:property value="#order.orderPhone"/></p>
                                        <div class="cleaner h10"></div>
                                        <h4>物流信息</h4>
                                        <table>
                                                <tr>
                                                        <th width="150" align="center">序号</th>
                                                        <th width="150" align="center">时间</th>
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
                                        <div class="cleaner h10"></div>
                                        <h4>物流地图</h4>
                                        <iframe width="680" height="340" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="deliveryMap.jsp" id="myframe"></iframe>
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
