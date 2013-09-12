<%-- 
    Document   : productdetail
    Created on : 2013-9-12, 0:10:43
    Author     : WingFung
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <title>Eboy - 商品详情</title>
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
        <link rel="stylesheet" href="stylesheets/prettyPhoto.css" />
        <script src="scripts/jquery.min.js"></script> 
        <script src="scripts/jquery.bxSlider.min.js"></script>
        <script src="scripts/jquery.faq.js"></script>  
        <script src="scripts/jquery.prettyPhoto.js"></script>
        <script src="scripts/jquery.blackandwhite.min.js"></script>
        <script src="scripts/js_func.js"></script>
        <script>
        $(function(){
                $(".gallery a[rel^='prettyPhoto']").prettyPhoto({theme: 'dark_rounded'});
                $('.clients_slider').bxSlider({
                        auto: false,
                        controls : false,
                        mode: 'fade',
                        pager: true
                });	
                $('.recent_slider').bxSlider({
                        auto: false,
                        displaySlideQty: 1,
                        moveSlideQty: 1,
                speed : 1000
                });
                $('#faq').dltoggle();
                $("#open").click(function(event){
              $('#faq').dltoggle_show();
              return false;
                });
                $("#close").click(function(event){
              $('#faq').dltoggle_hide();
              return false;
                });
            $('.bwWrapper').BlackAndWhite({
                hoverEffect : true,
                webworkerPath : false,
                responsive:true,
                invertHoverEffect:false
            });
        });
        </script>
    </head>
    <body>
        <div class="wraper">
            <header class="header">
                <a class="logo" href="index.jsp">Eboy</a>

                <nav>
                    <!-- top menu -->
                    <ul>
                        <li><a href="index.jsp">首页</a></li>
                        <li><a href="order.jsp">查询订单</a></li>
                        <li><a href="checkout.jsp">账单结算</a></li>
                        <li><a href="faqs.jsp">常见问题</a></li>
                        <li><a href="contact.jsp">关于我们</a></li>
                    </ul>
                    <!-- /top menu -->
                    <s:include value="topcart.jsp"/>
                </nav>
            </header>
        </div>
                
        <div class="content_block">
            <!-- top_title -->
            <div class="top_title">
                <div class="wraper">
                    <h2>商品详情</h2>
                    <s:include value="searchForm.jsp"/>
                </div>
            </div>
            <!-- /top_title -->
            <div class="wraper">
                <!-- sidebar -->
                <div class="sidebar">
                    <!-- acc tabs -->
                    <div class="acc_tabs">
                        <div id="tabs">
                            <ul class="tab_select">
                                <li><a href="#tab-1">类别</a></li>
                                <li><a href="#tab-2">标签</a></li>
                            </ul>
                            <s:action name="getCategories" executeResult="true"/>
                            <s:action name="getTags" executeResult="true"/>
                            
                        </div>
                    </div>
                    <!-- /acc tabs -->
                    <!-- most popular -->
                    <s:action name="userHotList" executeResult="true" />
                    
                    <!-- /most popular -->
                </div>
                <!-- /sidebar -->
                <!-- main -->
                <div style='padding-left: 20px;width:690px;float:right;'>
                    <h2><s:property value="#item.itemTitle"/></h2>
                    <div style='height:20px'></div>
                    <div class="post post_medium" style='float:left;'>
                        <div class="img_wrap" style='float:left;'>
                            <a  rel="lightbox[portfolio]" href="<s:property value="#item.itemThumbnailImageUrl"/>"><img src="<s:property value="#item.itemThumbnailImageUrl"/>" width="400" /></a>
                        </div>
                        <div class="desc" width='310' style='float:left;margin-left: 20px;'>
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
                                    <td align='right'><s:property value="#item.itemPrice"/>元</td>
                                </tr>
                                <tr>
                                    <td height="30">库存数量:</td>
                                    <td align='right'><s:property value="#item.itemQuantity"/></td>
                                </tr>
                                <tr>
                                    <td height="30">评分:</td>
                                    <td align='right'>5.0</td>
                                </tr>
                                <tr>
                                    <td height="30" width="160">运输包装费:</td>
                                    <td align='right'><s:property value="#item.itemPackageCost"/>元</td>
                                </tr>
                                <tr>
                                    <td height="30" width="160">关税:</td>
                                    <td align='right'><s:property value="#item.itemImportCost"/>元</td>
                                </tr>
                                <tr>
                                    <td height="30" width="160">运费:</td>
                                    <td align='right'><s:property value="#item.itemShippingCost"/>元</td>
                                </tr>
                                <tr>
                                    <td height="30" width="160">保费:</td>
                                    <td align='right'><s:property value="#item.itemInsuranceCost"/>元</td>
                                </tr>
                                <tr>
                                    <td height="30" width="160">销售税:</td>
                                    <td align='right'><s:property value="#item.itemTaxCost"/>元</td>
                                </tr>

                                <tr>
                                    <td height="30">数量:</td>
                                    <td align='right'><input id="itemQuantity" type="text" value="1" style="width: 30px; text-align: center" /></td>
                                </tr>
                            </table>
                            <div style='height:20px'></div>
                            <div class="product_box">
                                <a href="#" class="add_to_cart" onclick="addCart(<s:property value="#item.itemId"/>);">加入购物车</a>
                            </div>
                        </div> 
                    </div>

                    <div style='margin-top:10px;float:left;'>
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
                    <div style='width:710px;float:left;margin-top:20px;'>
                        <h3>商品描述</h3>
                        <div style="overflow: auto;max-height:600px;">
                            ${itemDescription}	
                        </div>
                        <div style='height:50px'></div>
                    </div>
                    <div style='width:710px;float:left;margin-top:50px;'>
                        <h3>商品评论</h3>
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
                    <div style='height:30px;float:left;'></div>
                </div>
                <!-- /main -->
            </div>
        </div>

        <!-- social block -->
        <div class="social_block">
            <div class="wraper">
                <p>欢迎关注我们</p>
                <ul>
                    <li class="facebook"><a href="#">Facebook</a></li>
                    <li class="twitter"><a href="#">Twitter</a></li>
                    <li class="linkedin"><a href="#">LinkedIn</a></li>
                    <li class="rss"><a href="#">RSS</a></li>
                    <li class="dribbble"><a href="#">Dribbble</a></li>
                    <li class="google"><a href="#">Google+</a></li>
                </ul>
            </div>
        </div>
        <!-- /social block -->
        
        <!-- copyright -->
        <div class="copyright">
            <div class="wraper">
                <p><span>Copyright 2013 Eboy </span>All Rights Reserved</p>
                <a class="top" href="#">回到顶部</a>
            </div>
        </div>
        <!-- /copyright -->
        
    </body>
</html>

