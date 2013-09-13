<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>EboyAdmin - 管理员登录</title>
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
</head>
<body>
<div class="wraper">
 <header class="header">
  <a class="logo" href="login.jsp">EboyAdmin</a>
  <nav>
  <!-- top menu -->
   <ul>
   
   </ul>
  <!-- /top menu -->
  </nav>
 </header>
</div> 

<div class="content_block">
 <!-- top_title -->
 <div class="top_title">
  <div class="wraper">
   <h2>管理员登录<span></span></h2> 
  
  </div>
 </div>
 <!-- /top_title -->
 <div class="wraper">     

     <div class="alert_icons_block c_after" align="center" style="padding-bottom:30px;">
         <div class="box"><strong>管理员登录</strong>
             <table>
                 <td>
                     <div class="medium_icons c_after">
                         <ul>
                             <li class="support">
                                 <a class="circle_link" href="#"></a>
                             </li> 
                         </ul>
                     </div>
                 </td>
                 <td>
                     <form action="/Eboy/jsp/admin/login.action" method="post" id="login">        
                         <p>账号: <input type="text" name="adminName" /></p><p>&nbsp;</p>
                         <p>密码: <input type="password" name="adminPassword" /></p>
                     </form><p>&nbsp;</p>
                     <a class="btn_col btn_grey" href="javascript:document.getElementById('login').submit()">登录</a>
                 </td></table>
             <a href="#" class="close">关闭</a>
         </div>
     </div>    

</div>
</div>

<!-- copyright -->
        <div class="copyright">
            <div class="wraper">
                <p><span>Copyright 2013 Eboy </span>All Rights Reserved</p>
                <a class="top" href="#">返回顶部</a>
            </div>
        </div>
<!-- /copyright -->
<!-- /footer -->
</body>
</html> 
