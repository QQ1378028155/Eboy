<%-- 
    Document   : productEditInfo
    Created on : 2013-8-28, 15:21:31
    Author     : WingFung
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html  xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>EboyAdmin - 修改商品信息</title>
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
                    <strong><s:action name="getAdmin" executeResult="true"/></strong> | <a href="#">退出登录</a>
                </div>
                <div class="cleaner"></div>
            </div><!-- END of templatemo_header -->

            <div id="templatemo_menu">
                <div id="top_nav" class="ddsmoothmenu">
                    <ul>
                        <li><a href="balance.jsp">收支明细</a></li>
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
                        <s:include value="searchForm.jsp"/>
                    </div>
                    <div class="cleaner"></div>
                </div>
            </div><!-- END of templatemo_menu -->


            <div id="templatemo_main">
                <div id="content" class="float_r">
                    <h1>修改商品信息</h1>
                    <div align="center">
                        <a  rel="lightbox[portfolio]" href="<s:property value="#item.itemThumbnailImageUrl"/>"><img src="<s:property value="#item.itemThumbnailImageUrl"/>" width="300" /></a>
                        <br></br>
                    </div>
                    <div class="content_half float_l">
                        <h3>eBay商品信息</h3>
                        <table>
                            <tr>
                                <td height="30" width="100">商品名称:<s:property value="#item.itemTitle"/></td>
                            </tr>
                            <tr>
                                <td height="30" width="100">商品价格:<s:property value="#item.itemPriceCurrency"/>&nbsp<s:property value="#item.itemPrice"/></td>
                            </tr>
                            <tr>
                                <td height="30" width="100">库存数量:<s:property value="#item.itemQuantity"/></td>
                            </tr>
                            <tr>
                                <td height="30" width="100">商品描述:
                                    <textarea disabled="true" style="width:300px; resize: none;" id="text" name="itemDescription" rows="8" cols="0" class="required"><s:property value="#itemDescription"/></textarea></td>
                            </tr>
                        </table>

                    </div>
                    <div class="content_half float_r">
                        <h3>仓库商品信息</h3>
                        <form action="confirmEditItem.action" method="post">     
                            <table>
                                <tr>
                                    <td height="30" width="100">商品名称:</td>
                                    <td><input type="text" name="itemTitle" style="width:300px;" value="<s:property value="#item.itemTitle"/>"></input></td>
                                </tr>
                                <tr>
                                    <td height="30" width="100">商品价格:</td>
                                    <td><s:property value="#item.itemPriceCurrency"/><input disabled="ture" type="text" name="itemPrice" style="width:275px;" value="<s:property value="#item.itemPrice"/>"></input></td>
                                </tr>
                                <tr>
                                    <td height="30" width="100">库存数量:</td>
                                    <td><input disabled="ture" type="text" name="itemQuantity" style="width:300px;" value="<s:property value="#item.itemQuantity"/>"></input></td>
                                </tr>
                                <tr>
                                    <td height="30" width="100">商品描述:
                                    </td><td><textarea style="width:300px; resize: none;" id="text" name="itemDescription" rows="8" cols="0" class="required"><s:property value="#itemDescription"/></textarea>
                                    </td>
                                </tr>
                                <input  style="display:none" type="text" name="itemId" value="<s:property value="#item.itemId"/>"></input>
                                <%--
                            <tr>
                                <td height="30" width="100">运输包装费:</td>
                                <td><input type="text" style="width:250px;" value="先把原来的写进框里"></input> RMB</td>
                            </tr>
                            <tr>
                                <td height="30" width="100">关税:</td>
                                <td><input type="text" style="width:250px;" value="先把原来的写进框里"></input> RMB</td>
                            </tr>
                            <tr>
                                <td height="30" width="100">运费:</td>
                                <td><input type="text" style="width:250px;" value="先把原来的写进框里"></input> RMB</td>
                            </tr>
                            <tr>
                                <td height="30" width="100">保费:</td>
                                <td><input type="text" style="width:250px;" value="先把原来的写进框里"></input> RMB</td>
                            </tr>
                            <tr>
                                <td height="30" width="100">销售税:</td>
                                <td><input type="text" style="width:250px;" value="先把原来的写进框里"></input> RMB</td>
                            </tr>
                            <tr>
                                <td height="30" width="100">商品描述翻译:</td>
                                <td><textarea style="width:250px;" id="text" name="text" rows="8" cols="0" class="required">先把原来的写进框里</textarea></td>
                            </tr>
                            <tr>
                                <td height="30" width="100">评价:</td>
                                <td><a href="comment.jsp">评价管理</a></td> 
                            </tr>
                            <tr>
                                <td height="30" width="100">标签:</td>
                                <td>
                                    <input type="text" style="width:170px;"></input>
                                    <input type="submit" class="btn" style="width:80px;background-color: #0099ff;"value="绑定标签" />
                                    <ul>
                                        <li>鞋</li>
                                        <li>女款</li>
                                        <li>填写已有标签</li>
                                    </ul>
                                </td>
                            </tr>
                                --%>
                            </table>
                            <div  class="cleaner h20"></div>
                            <div align="center">
                                <input type="submit" class="btn" style="width:150px;" value="保存修改" />
                            </div>
                        </form>
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
