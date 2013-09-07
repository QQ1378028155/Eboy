<%-- 
    Document   : productdetail
    Created on : 2013-8-24, 23:42:51
    Author     : WingFung game3108
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html  xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Eboy - 商品详情</title>
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
                        <li><a href="faqs.jsp">常见问题</a></li>
                        <li><a href="contact.jsp">联系我们</a></li>
                    </ul>
                    <br style="clear: left" />
                </div><!-- end of ddsmoothmenu -->

                <div id="menu_second_bar">
                    <s:include value="topcart.jsp"/>
                    <s:include value="searchForm.jsp"/>
                    <div class="cleaner"></div>
                </div>
            </div><!-- END of templatemo_menu -->

            <div id="templatemo_main">
                <div id="sidebar" class="float_l">
                    <s:action name="getCategories" executeResult="true"/>
                    <s:action name="getTags" executeResult="true"/>
                    <s:action name="userHotList" executeResult="true" />
                </div>
                <div id="content" class="float_r">
                    <h2><s:property value="#item.itemTitle"/></h2>
                    <div class="content_half float_l">
                        <a  rel="lightbox[portfolio]" href="<s:property value="#item.itemThumbnailImageUrl"/>"><img src="<s:property value="#item.itemThumbnailImageUrl"/>" width="300" /></a>
                    </div>
                    <div class="content_half float_r">
                        <script type="text/javascript">
                            function addCart(itemId)
                            {
                                var cartSize = 0;
                                var itemQuantity = parseInt(document.getElementById('itemQuantity').value);
                                var cookieArray = document.cookie.split("; ");
                                
                                for (var i = 0; i < cookieArray.length; i++) {
                                    var arr = cookieArray[i].split("=");
                                    if (arr[0] == "cartSize")
                                        cartSize = parseInt(arr[1]);
                                }
                                var itemArr = Array(cartSize);
                                var itemQuantityArr = Array(cartSize);
                                
                                for(var i = 0;i < cookieArray.length;i ++) {
                                        var arr = cookieArray[i].split("=");
                                        
                                        var quantityIndex = arr[0].indexOf("Quantity");
                                        if(quantityIndex != -1) {
                                                var index = parseInt(arr[0].slice(4,quantityIndex));
                                                itemQuantityArr[index] = parseInt(arr[1]);
                                        }
                                        else {
                                                if(arr[0].indexOf("item") != -1) {
                                                        var index = parseInt(arr[0].slice(4,arr[0].length));
                                                        itemArr[index] = parseInt(arr[1]);
                                                }
                                        }
                                }
                                var quantity = 0;
                                var index = cartSize;
                                for(var i = 0;i < cartSize;i ++) {
                                        if(itemArr[i] == itemId) {
                                                index = i;
                                                quantity = itemQuantityArr[i];
                                                break;
                                        }
                                }
                                var date = new Date();
                                date.setTime(date.getTime() + 3600 * 24 * 30);
                                var strItem = "item" +  index + "=" + itemId + "; expires=" + date.toGMTString() + "; path=/Eboy/";
                                var strQuantity = "item" + index + "Quantity=" + (quantity + itemQuantity) + "; expires=" + date.toGMTString() + "; path=/Eboy/";
                                if(cartSize == index) {
                                        cartSize = cartSize + 1;
                                        var strCartSize = "cartSize=" + cartSize + "; expires=" + date.toGMTString() + "; path=/Eboy/";
                                        document.cookie = strCartSize;
                                }

                                document.cookie = strItem;
                                document.cookie = strQuantity;

                                var v = document.getElementById("cartSize");
                                v.innerHTML = cartSize + " 件商品";
                            }
                        </script>
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

                            <tr>
                                <td height="30">数量:</td>
                                <td><input id="itemQuantity" type="text" value="1" style="width: 60px; text-align: right" /></td>
                            </tr>
                        </table>
                        <div class="cleaner h20"></div>
                        <div class="product_box">
                                <a href="#" class="add_to_card" onclick="addCart(<s:property value="#item.itemId"/>);">加入购物车</a>
                        </div>
                    </div>
                    <div>
                        <script type="text/javascript">
                            bShareOpt = {
                                uuid: "",
                                url: "http://localhost:8080/Eboy/jsp/user/loadItemInfo.action?itemId=<s:property value="#item.itemId"/>", //商品的永久链接
                                summary: "Eboy为您极力推荐", //商品描述
                                pic: "<s:property value="#item.itemThumbnailImageUrl"/>", //商品图片链接
                                vUid: "",
                                product: "<s:property value="#item.itemTitle"/>", //商品名称
                                price: "RMB <s:property value="#item.itemPrice"/>", //商品价格
                                brand: "", //商品品牌
                                tag: "", //商品标签
                                category: "<s:property value="#item.category.categoryName"/>", //商品分类
                                template: "1"
                            };
                        </script>
                        <a class="bsLikeDiv" href="http://static.bshare.cn"></a>
                        <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareLike.js"></script><div class="bshare-custom icon" style="float:left;"><a title="分享到QQ空间" class="bshare-qzone"></a><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到人人网" class="bshare-renren"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a><a title="分享到搜狐微博" class="bshare-sohuminiblog"></a></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/button.js#style=-1&amp;ssc=false&amp;mdiv=-1&amp;type=15"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC1.js"></script>
                    </div>
                    <div class="cleaner h30"></div>
                    <h5>商品描述</h5>
                    <div style="overflow-x: scroll; overflow-y: scroll;height:700px">
                        ${itemDescription}	
                    </div>
                    <div class="cleaner h50"></div>
                    <h5>商品评论</h5>
                    <table>
                        <s:iterator value="#item.comments">
                            <tr>
                                <td><strong><s:property value="commentUserName"/></strong></td>
                                <td><s:property value="commentContent"/></td>
                                <td><s:property value="commentRate"/></td>
                            </tr>
                        </s:iterator> 
                    </table>

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

