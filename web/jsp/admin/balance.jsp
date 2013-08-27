<%-- 
    Document   : balance
    Created on : 2013-8-27, 16:00:25
    Author     : WingFung
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html  xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>EboyAdmin - 收支明细</title>
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
                        <li><a href="balance.jsp" class="selected">收支明细</a></li>
                        <li><a href="storage.jsp">仓库管理</a></li>
                        <li><a href="category.jsp">类型管理</a></li>
                        <li><a href="tag.jsp">标签管理</a></li>
                        <li><a href="comment.jsp">评价管理</a></li>
                        <li><a href="delivery.jsp">物流管理</a></li>
                    </ul>
                    <br style="clear: left" />
                </div><!-- end of ddsmoothmenu -->
                
                <div id="menu_second_bar">
            
                    <div id="templatemo_search">
                        <form action="#" method="get">
                          <input type="text" value="请输入关键字" name="keyword" id="keyword" title="关键字" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                          <input type="submit" value=" 搜索仓库 " name="Search"  alt="Search" id="searchstoragebutton" title="搜索仓库商品" class="sub_btn"  />
                          <input type="submit" value=" 搜索eBay " name="Search"  alt="Search" id="searchebaybutton" title="搜索eBay商品" class="sub_btn"  />

                        </form>
                    </div>
                    <div class="cleaner"></div>
                </div>
            </div><!-- END of templatemo_menu -->
            
            
            <div id="templatemo_main">
                <div id="content">
                    <h1>收支明细</h1>
                    <div align="center">
                        <table >
                            <tr>
                                <th width="150">日期</th>
                                <th width="400">摘要</th>
                                <th width="100">类型</th>
                                <th width="120">金额(CNY)</th>
                                <th width="120">结余(CNY)</th>
                            </tr>
                            <tr>
                                <td align="center">2013-08-27 15:22</td>
                                <td align="center">本金</td>
                                <td align="center">收入</td>
                                <td align="center">100000</td>
                                <td align="center">100000</td>
                            </tr>
                            <tr>
                                <td align="center">2013-08-27 15:36</td>
                                <td align="center">为客户下单20台iphone5S，订单号：abcdefgh</td>
                                <td align="center">支出</td>
                                <td align="center">90000</td>
                                <td align="center">10000</td>
                            </tr>
                        </table>
                    </div>

                </div>
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
