<%-- 
    Document   : shoppingcart
    Created on : 2013-8-24, 4:56:08
    Author     : WingFung
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html  xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Eboy - 我的购物车</title>
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

        <script language="javascript" type="text/javascript">
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
            
            window.onload= function()
            {
                var strcookie = document.cookie;
                var cartSize = "0";
                var arrcookie = strcookie.split(";");
                for(var i = 0;i < arrcookie.length;i ++) {
                    var arr = arrcookie[i].split("=");
                    if("cartSize" == arr[0])
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
                    <a href="shoppingcart.jsp">我的购物车</a> | <a href="#">结账</a>
		</div>
                <div class="cleaner"></div>
            </div><!-- END of templatemo_header -->
            
            <div id="templatemo_menu">
                <div id="top_nav" class="ddsmoothmenu">
                    <ul>
                        <li><a href="index.jsp" >首页</a></li>
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
                    <h1>我的购物车</h1>
                    <table width="680px" cellspacing="0" cellpadding="5">
                        <tr bgcolor="#ddd">
                            <th width="220" align="center">商品图片 </th>
                            <th width="180" align="center">描述 </th>
                            <th width="100" align="center">数量 </th>
                            <th width="60" align="right">单价 </th>
                            <th width="60" align="right">总价 </th>
                            <th width="90"align="center">操作 </th>
                      	</tr>
                    	<tr>
                            <td><img src="images/product/01.jpg" alt="Image 01" /></td>
                            <td>Etiam in tellus</td> 
                            <td align="center"><input type="text" value="1" style="width: 20px; text-align: right" /> </td>
                            <td align="right">$100 </td> 
                            <td align="right">$100 </td>
                            <td align="center"> <a href="#">删除</a> </td>
                        </tr>
                        <tr>
                            <td><img src="images/product/02.jpg" alt="Image 02" /> </td>
                            <td>Hendrerit justo</td>
                            <td align="center"><input type="text" value="1" style="width: 20px; text-align: right" />  </td>
                            <td align="right">$40  </td>
                            <td align="right">$40 </td>
                            <td align="center"> <a href="#">删除</a>  </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="right"  height="30px">
                                若修改了购物车中的商品，请点击<a href="shoppingcart.html"><strong>刷新</strong></a>&nbsp;&nbsp; <br /> </td>
                            <td align="right" style="background:#ddd; font-weight:bold"> 合计 </td>
                            <td align="right" style="background:#ddd; font-weight:bold">$140 </td>
                            <td style="background:#ddd; font-weight:bold"> </td>
			</tr>
                    </table>
                    <div style="float:right; width: 215px; margin-top: 20px;">
                        <p><a href="checkout.jsp">确认结算</a></p>
                        <p><a href="javascript:history.back()">继续购物</a></p>
                    	
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
