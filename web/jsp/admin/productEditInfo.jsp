<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>EboyAdmin - 修改商品信息</title>
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
    <li><a href="comment.jsp">评价管理</a>
    
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
      <h2>修改商品信息<span></span></h2>
    <s:include value="searchForm.jsp"/>

  </div>
 </div>
 <!-- /top_title -->
  <div id="content" class="wraper">

                    <div align="center">
                        <a  rel="lightbox[portfolio]" href="<s:property value="#item.itemThumbnailImageUrl"/>"><img src="<s:property value="#item.itemThumbnailImageUrl"/>" width="300" /></a>
                        <br></br>
                    </div>
                    <div style="float:left">
                        <h3>eBay商品信息</h3>
                        <table>
                            <tr>
                                <td height="30" width="100">商品名称:</td>
                                <td style="padding:5px 10px;"><s:property value="#item.itemTitle"/></td>
                            </tr>
                            <tr>
                                <td height="30" width="100">商品价格:</td>
                                <td style="padding:5px 10px;"><s:property value="#item.itemPriceCurrency"/>&nbsp<s:property value="#item.itemPrice"/></td>
                            </tr>
                            <tr>
                                <td height="30" width="100">库存数量:</td>
                                <td style="padding:5px 10px;"><s:property value="#item.itemQuantity"/></td>
                            </tr>
                            <tr>
                                <td height="30" width="100">商品描述:</td>
                                <td><textarea disabled="true" style="font:13px 'Microsoft YaHei';background-color:#f6f3f3;color:#626363;border:1px solid #c0bebe;padding:5px 10px;width:300px; resize: none;" id="text" name="itemDescription" rows="8" cols="0" class="required"><s:property value="#itemDescription"/></textarea></td>
                                    
                            </tr>
                        </table>

                    </div>
                    <div style="float:right">
                        <h3>仓库商品信息</h3>
                        <form action="confirmEditItem.action" method="post">     
                            <table>
                                <tr>
                                    <td height="30" width="100">商品名称:</td>
                                    <td><input type="text" name="itemTitle" style="width:300px;background-color: #fff;" value="<s:property value="#item.itemTitle"/>" class="text_field"></input></td>
                                </tr>
                                <tr>
                                    <td height="30" width="100">商品价格:</td>
                                    <td><input disabled="ture" type="text" name="itemPrice" style="width:300px;" class="text_field" value="<s:property value="#item.itemPriceCurrency"/> <s:property value="#item.itemPrice"/>"></input></td>
                                </tr>
                                <tr>
                                    <td height="30" width="100">库存数量:</td>
                                    <td><input disabled="ture" type="text" name="itemQuantity" style="width:300px;" value="<s:property value="#item.itemQuantity"/>" class="text_field"></input></td>
                                </tr>
                                <tr>
                                    <td height="30" width="100">商品描述:
                                    </td><td><textarea style="font:13px 'Microsoft YaHei';color:#626363;border:1px solid #c0bebe;padding:5px 10px;width:300px; resize: none;" id="text" name="itemDescription" rows="8" cols="0" class="required"><s:property value="#itemDescription"/></textarea>
                                    </td>
                                </tr>
                                <input  style="display:none" type="text" name="itemId" value="<s:property value="#item.itemId"/>"></input>
                            </table>
                            <div  class="cleaner h20"></div>
                            <div align="center">
                                <input type="submit" class="btn_m" value="保存修改" />
                            </div>
                        </form>
                    </div>
                </div>
               <br/>
               <br/>
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

