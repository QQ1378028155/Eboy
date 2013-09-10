<%-- 
    Document   : ebayApiError
    Created on : 2013-9-6, 21:17:01
    Author     : wjl
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html  xmlns="http://www.w3.org/1999/xhtml">
        <head>
                <title>EboyAdmin - eBay Api 错误</title>
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
                                        <strong><s:action name="getAdmin" executeResult="true"/></strong> | <a href="logOut.action">退出登录</a>
                                </div>
                                <div class="cleaner"></div>
                        </div><!-- END of templatemo_header -->

                        <div id="templatemo_menu">
                                <div id="top_nav" class="ddsmoothmenu">
                                        <script>
                                                function refreshItem()
                                                {
                                                        var xmlHttp;
                                                        var refreshItem = document.getElementById('refreshItem');
                                                        if (window.ActiveXObject) {
                                                                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                                                        } else
                                                                xmlHttp = new XMLHttpRequest();
                                                        xmlHttp.open("get", "refreshItem.action", true);
                                                        xmlHttp.onreadystatechange = function()
                                                        {
                                                                if(xmlHttp.readyState == 4) {
                                                                        if(xmlHttp.status == 200) {
                                                                                refreshItem.innerText = "刷新完成";
                                                                        }
                                                                }
                                                        }
                                                        xmlHttp.send();
                                                        refreshItem.innerText = "正在刷新";
                                                }

                                                
                                        </script>
                                        <ul>
                                                <li><a href="balance.jsp">收支明细</a></li>
                                                <li><a href="storage.jsp">仓库管理</a></li>
                                                <li><a href="category.jsp">类型管理</a></li>
                                                <li><a href="tag.jsp">标签管理</a></li>
                                                <li><a href="comment.jsp">评价管理</a></li>
                                                <li><a href="delivery.jsp">物流管理</a></li>
                                                <li><a href="javascript:void(0)" onclick="refreshItem();" id ="refreshItem">刷新商品</a></li>
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
                                <div id="content">
                                        <s:property value="message"/>
                                </div>
                                <div class="cleaner"></div>
                        </div> <!-- END of templatemo_main -->

                        <div id="templatemo_footer">
                                <p>
                                        <a href="balance.jsp">收支明细</a> | <a href="storage.jsp">仓库管理</a> | <a href="category.jsp">类型管理</a> | <a href="tag.jsp">标签管理</a> | <a href="comment.jsp">评价管理</a> | <a href="delivery.jsp">物流管理</a>
                                </p>
                                Copyright © 2013 <a href="#">Eboy</a>
                        </div> <!-- END of templatemo_footer -->

                </div><!-- END of templatemo_wrapper -->
        </body>
</html>