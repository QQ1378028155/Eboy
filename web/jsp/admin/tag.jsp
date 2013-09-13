<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>EboyAdmin - 标签管理</title>
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

<script src="scripts/js_func.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 
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
        
         <script>
            function get_previoussibling(n)
            {
                var x=n.previousSibling;
                while (x.nodeType!=1)
                {
                    x=x.previousSibling;
                }
                return x;
            }
            function get_nextsibling(n)
            {
                var x=n.nextSibling;
                while (x.nodeType!=1)
                {
                    x=x.nextSibling;
                }
                return x;
            }
            function modifyTagName(node, tagId){
                var td=get_previoussibling(node.parentNode);
                var value=td.innerHTML;
                td.innerHTML="";
                var textfield="<input type='text' style='width:200px;' value="+value+"></input>";
                td.insertAdjacentHTML("beforeEnd",textfield);
                node.style.display='none';
                var confirmBtn=get_nextsibling(node);
                confirmBtn.style.display='block';
            };
            function confirmTagName(node, tagId){
                var td=get_previoussibling(node.parentNode);
                var inputfield=td.childNodes[0];
                if (inputfield.nodeType!=1)
                    get_nextsibling(inputfield);
                var value=inputfield.value;
                td.innerHTML=value;
                var xmlHttp;
                if (window.ActiveXObject) {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                } else
                        xmlHttp = new XMLHttpRequest();
                xmlHttp.open("get", "editTag.action?tagId=" + tagId + "&tagWord=" + value, true);
                xmlHttp.send();
                
                
                
                node.style.display='none';
                var modifyBtn=get_previoussibling(node);
                modifyBtn.style.display='block';
            };
        </script>
        
</head>
<body>
<div class="wraper">
 <header class="header">
  <a class="logo" href="login.jsp">EboyAdmin</a>
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
      <div style="float:right; margin-top: 12px;">
      <strong><s:action name="getAdmin" executeResult="true"/></strong> | <a href="logOut.action">退出登录</a>
  </div>
  </nav>
 </header>
</div> 

<div class="content_block">
 <!-- top_title -->
 <div class="top_title">
  <div class="wraper">
   <h2>标签管理<span></span></h2>
    <s:include value="searchForm.jsp"/>

  </div>
 </div>
 <!-- /top_title -->
 <div id="content" class="wraper">

         <table id="tagTable" style="font-size: 13px;">
                 <tr>
                         <th width="200" align="center">序号</th>
                         <th width="400" align="center">标签名称</th>
                         <th width="300" align="center">操作</th>
                 </tr>
                 <s:action name="adminGetTags" executeResult="true"/>
         </table>

 </div>
<br/>
<br/>

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



