<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>EbayApiErorr</title>
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
<script src="scripts/js_func.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  <script src="js/ddsmoothmenu.js" type="text/javascript"></script>
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

                                                
                                        </script></head>
<body>
<div class="wraper">
 <header class="header">
  <a class="logo" href="index.html">construct</a>
  <nav>
  <!-- top menu -->
   <ul>
    <li><a href="balance.jsp">收支明细</a>
    
    </li>
    
    <li><a href="storage.jsp">仓库管理</a>
    
    </li>
    <li><a href="category.jsp">类型管理</a>
      
    </li>
    <li><a href="tag.jsp">标签管理</a>

    </li>
    <li><a href="comment.jsp">评论管理</a>
    
    </li>
     <li><a href="order.jsp">订单管理</a>
    </li>
      <li><a href="delivery.jsp">物流管理</a>
   </ul>
  <!-- /top menu -->
  </nav>
 </header>
</div> 

<div class="content_block">
 <!-- top_title -->
 <div class="top_title">
  <div class="wraper">
   <h2>Ebay Admin<span></span></h2> <s:include value="searchForm.jsp"/>
   <ul>
    <li><s:action name="getAdmin" executeResult="true"/> | <a href="logOut.action">退出登录</a></li>

   </ul>
  </div>
 </div>
 <!-- /top_title -->
 <div class="wraper">
 <h4 class="bord">EbayApiError</h4>
 <div id="templatemo_search">
<s:include value="searchForm.jsp"/>
</div>
</div></div>

<!-- copyright -->
<div class="copyright">
 <div class="wraper">
  <p><span>Copyright 2014 Eboy Project.</span>保留所有权利<a href="#"></p>
  <a class="top" href="#">返回顶部</a>
 </div>
</div>
<!-- /copyright -->
<!-- /footer -->
</body>
</html> 
