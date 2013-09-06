<%-- 
    Document   : productdetail
    Created on : 2013-9-6, 20:13:17
    Author     : Tongda
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
                
                <script>
                       function spreadEmail(itemId){
                       alert("推广邮件已发送");
                       var xmlHttp;
                       if (window.ActiveXObject) {
                               xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                       } else
                               xmlHttp = new XMLHttpRequest();
                               xmlHttp.open("get", "spreadEmail.action?itemId="+itemId, true);
                               xmlHttp.send();
                       };
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
                                                <li><a href="balance.jsp">收支明细</a></li>
                                                <li><a href="storage.jsp" class="selected">仓库管理</a></li>
                                                <li><a href="category.jsp">类型管理</a></li>
                                                <li><a href="tag.jsp">标签管理</a></li>
                                                <li><a href="comment.jsp">评价管理</a></li>
                                                <li><a href="delivery.jsp">物流管理</a></li>
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
                                <div id="content" class="float_r">
                                        <h2><s:property value="#item.itemTitle"/></h2>
                                        <div class="content_half float_l">
                                                <a  rel="lightbox[portfolio]" href="<s:property value="#item.itemThumbnailImageUrl"/>"><img src="<s:property value="#item.itemThumbnailImageUrl"/>" width="300" /></a>
                                        </div>
                                        <div class="content_half float_r">
                                                <table>
                                                        <tr>
                                                                <td height="30" width="160">价格:</td>
                                                                <td>RMB <s:property value="#item.itemPrice"/></td>
                                                        </tr>
                                                        <tr>
                                                                <td height="30">库存数量:</td>
                                                                <td><s:property value="#item.itemQuantity"/></td>
                                                        </tr>
                                                        <tr>
                                                                <td height="30">评分:</td>
                                                                <td>5.0</td>
                                                        </tr>
                                                        <tr>
                                                                <td height="30" width="160">运输包装费:</td>
                                                                <td>RMB <s:property value="#item.itemPackageCost"/></td>
                                                        </tr>
                                                        <tr>
                                                                <td height="30" width="160">关税:</td>
                                                                <td>RMB <s:property value="#item.itemImportCost"/></td>
                                                        </tr>
                                                        <tr>
                                                                <td height="30" width="160">运费:</td>
                                                                <td>RMB <s:property value="#item.itemShippingCost"/></td>
                                                        </tr>
                                                        <tr>
                                                                <td height="30" width="160">保费:</td>
                                                                <td>RMB <s:property value="#item.itemInsuranceCost"/></td>
                                                        </tr>
                                                        <tr>
                                                                <td height="30" width="160">销售税:</td>
                                                                <td>RMB <s:property value="#item.itemTaxCost"/></td>
                                                        </tr>
                                                </table>
                                                <div class="cleaner h20"></div>
                                                <div class="product_box">
                                                        <a href="#" class="add_to_card" onclick="spreadEmail(<s:property value="#item.itemId"/>);">推广</a>
                                                </div>
                                        </div>
                                        <div class="cleaner h30"></div>
                                        <h5>商品描述</h5>
                                        <div style="overflow-x: scroll; overflow-y: scroll;height:700px">
                                                ${itemDescription}	
                                        </div>
                                        <div class="cleaner h50"></div>
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

