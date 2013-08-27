<%-- 
  Document   : faqs
  Created on : 2013-8-25, 18:14:03
  Author   : WingFung
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html  xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Eboy - 常见问题</title>
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

            window.onload = function()
            {
                var strcookie = document.cookie;
                var cartSize = "0";
                var arrcookie = strcookie.split("; ");
                for (var i = 0; i < arrcookie.length; i++) {
                    var arr = arrcookie[i].split("=");
                    if (arr[0] == "cartSize")
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
                        <li><a href="faqs.jsp"  class="selected">常见问题</a></li>
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
                    <h1>EMS服务区属查询</h1>
                    <div>
                        <strong>了解EMS服务</strong>
                        <p>EMS是中国邮政提供的国际快递服务，也是中国跨国交易卖家在发送快递和比较贵重的物品时通常采用的方式。</p>
                        <p>EMS区属介绍：</p>>
                        <div style="text-align: center">
                        <table cellspacing="0" cellpadding="0" width="90%" border="0" style="width: 90%; border-collapse: collapse;">
                            <tbody>
                                <tr>
                                    <td width="5%" rowspan="2" style="border-right: silver 1pt solid; padding-right: 0cm; border-top: silver 1pt solid; padding-left: 0cm; background: #e0e0e0; padding-bottom: 0cm; border-left: silver 1pt solid; width: 5.16%; padding-top: 0cm; border-bottom: silver 1pt solid">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><b><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">资费</span></b><span lang="EN-US" style="font-size: 7pt; color: #5f5f5f; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="24%" rowspan="2" style="border-right: silver 1pt solid; padding-right: 0cm; border-top: silver 1pt solid; padding-left: 0cm; background: #e0e0e0; padding-bottom: 0cm; border-left: #e0dfe3; width: 24.08%; padding-top: 0cm; border-bottom: silver 1pt solid">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><b><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">国际及港澳台特快专递邮件通达国家地区</span></b><span lang="EN-US" style="font-size: 7pt; color: #5f5f5f; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="21%" colspan="2" style="border-right: silver 1pt solid; padding-right: 0cm; border-top: silver 1pt solid; padding-left: 0cm; background: #e0e0e0; padding-bottom: 0cm; border-left: #e0dfe3; width: 21.12%; padding-top: 0cm; border-bottom: #e0dfe3">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><b><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">*</span></b><b><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">起重</span></b><b><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:"> <st1:chmetcnv w:st="on" tcsc="0" numbertype="1" negative="False" hasspace="False" sourcevalue="500" unitname="克">500<span lang="EN-US" style="font-family:"><span lang="EN-US">克</span></span></st1:chmetcnv></span></b><span lang="EN-US" style="font-size: 7pt; color: #5f5f5f; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="12%" rowspan="2" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: silver 1pt solid; padding-left: 5.4pt; background: #e0e0e0; padding-bottom: 0cm; border-left: #e0dfe3; width: 12.06%; padding-top: 0cm; border-bottom: silver 1pt solid">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><b><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">续重</span></b><st1:chmetcnv w:st="on" tcsc="0" numbertype="1" negative="False" hasspace="False" sourcevalue="500" unitname="克"><b><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">500</span></b><b><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">克</span></b></st1:chmetcnv><b><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">或其零数</span></b><span lang="EN-US" style="font-size: 7pt; color: #5f5f5f; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="37%" rowspan="2" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: silver 1pt solid; padding-left: 5.4pt; background: #e0e0e0; padding-bottom: 0cm; border-left: #e0dfe3; width: 37.56%; padding-top: 0cm; border-bottom: silver 1pt solid">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><b><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">中速快件通达国家地区</span></b><span lang="EN-US" style="font-size: 7pt; color: #5f5f5f; font-family:"><o:p></o:p></span></p>
                                    </td>
                                </tr>
                                <tr style="height: 29.55pt">
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; background: #e0e0e0; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; height: 29.55pt">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><b><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">文件</span></b><span lang="EN-US" style="font-size: 7pt; color: #5f5f5f; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; background: #e0e0e0; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; height: 29.55pt">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><b><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">物品</span></b><span lang="EN-US" style="font-size: 7pt; color: #5f5f5f; font-family:"><o:p></o:p></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="5%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: silver 1pt solid; width: 5.16%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">一区</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="24%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 24.08%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">香港、澳门</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">90</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">150</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="12%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 12.06%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">30</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="37%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 37.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:">&nbsp;<o:p></o:p></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="5%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: silver 1pt solid; width: 5.16%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">二区</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="24%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 24.08%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">日本、韩国、蒙古、</span><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">*</span><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">台湾</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">115</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">180</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="12%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 12.06%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">40</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="37%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 37.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:">&nbsp;<o:p></o:p></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="5%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: silver 1pt solid; width: 5.16%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">三区</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="24%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 24.08%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">马来西亚、新加坡、泰国、越南、柬埔寨</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">130</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">190</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="12%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 12.06%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">45</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="37%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 37.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">印度尼西亚、菲律宾</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="5%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: silver 1pt solid; width: 5.16%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">四区</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="24%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 24.08%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">澳大利亚、新西兰、巴布亚新几内亚</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">160</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">210</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="12%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 12.06%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">55</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="37%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 37.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">文莱、新喀里多尼亚</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="5%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: silver 1pt solid; width: 5.16%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">五区</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="24%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 24.08%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">比利时、英国、丹麦、芬兰、希腊、爱尔兰、意大利、卢森堡、马耳他、挪威、瑞士、葡萄牙、德国、瑞典</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">220</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">280</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="12%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 12.06%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">75</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="37%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 37.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">法国、荷兰、西班牙、奥地利、斐济、瓦努阿图</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="5%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: silver 1pt solid; width: 5.16%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">六区</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="24%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 24.08%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">美国</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">180</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">240</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="12%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 12.06%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">75</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="37%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 37.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">加拿大</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="5%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: silver 1pt solid; width: 5.16%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">七区</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="24%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 24.08%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">巴基斯坦、斯里兰卡、老挝、土耳其、尼泊尔</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">250</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">325</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="12%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 12.06%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">90</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="37%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 37.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">印度、孟加拉、直布罗陀、缅甸</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="5%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: silver 1pt solid; width: 5.16%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">八区</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="24%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 24.08%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">巴西、古巴、圭亚那</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">260</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">335</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="12%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 12.06%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">100</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="37%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 37.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">阿根廷、哥伦比亚、墨西哥、秘鲁、巴拿马、巴哈马、巴巴多斯、智利、玻利维亚、哥斯达黎加、厄瓜多尔、多米尼加联邦、特立尼达和多巴哥、多米尼加共和国、萨尔瓦多、海地、格林纳达、危地马拉、洪都拉斯、牙买加、巴拉圭、乌拉圭、委内瑞拉</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="5%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: silver 1pt solid; width: 5.16%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">九区</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="24%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 24.08%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">伊拉克、乌干达、约旦、以色列、阿曼、科威特、伊朗、马达加斯加、叙利亚、肯尼亚、突尼斯、阿联酋、</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">370</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">445</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="12%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 12.06%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">120</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="37%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 37.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">刚果（金）、刚果（布）、埃及、埃塞俄比亚、也门、摩洛哥、莫桑比克、尼加拉瓜、马尔代夫、尼日利亚、沙特阿拉伯、利比里亚、阿尔及利亚、黎巴嫩、纳米比亚、南非、苏丹、</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="5%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: silver 1pt solid; width: 5.16%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">十区</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="24%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 24.08%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">开曼群岛、白俄罗斯、捷克、哈萨克斯坦、俄罗斯、拉脱维亚</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">380</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="10%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 10.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">455</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="12%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 12.06%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="center" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: center;"><span lang="EN-US" style="font-size: 9pt; color: #5f5f5f; font-family:">120</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                    <td width="37%" style="border-right: silver 1pt solid; padding-right: 5.4pt; border-top: #e0dfe3; padding-left: 5.4pt; padding-bottom: 0cm; border-left: #e0dfe3; width: 37.56%; padding-top: 0cm; border-bottom: silver 1pt solid; background-color: transparent">
                                        <p align="left" style="margin: 0cm 0cm 0pt; line-height: 18pt; text-align: left;"><span style="font-size: 9pt; color: #5f5f5f; font-family: 宋体;">匈牙利、波兰、罗马尼亚、乌克兰、阿尔巴尼亚、保加利亚、亚美尼亚、阿塞拜疆、格鲁吉亚、立陶宛、马其顿、塞尔维亚、黑山共和国、斯洛伐克、斯洛文尼亚、塔吉克斯坦、吉尔吉斯斯坦、乌兹别克斯坦、朝鲜、冰岛、所罗门群岛、波多黎各、英属维尔京群岛、美属维尔京群岛、</span><span lang="EN-US" style="font-size: 7pt; color: #333333; font-family:"><o:p></o:p></span></p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
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
