<%-- 
    Document   : order
    Created on : 2013-9-11, 22:10:19
    Author     : WingFung
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>

                <meta name="description" content="" />
                <meta name="keywords" content="" />
                <meta name="owner" content="" />
                <meta name="robots" content="index, follow" />
                <meta name="googlebot" content="index, follow" />
                <style type="text/css">
                        <!--
                        body {background:#fff;margin:0 auto;padding: 0;font:12px Arial;color:#000;line-height:1.2em}
                        div,form,img,ul,ol,li,dl,dt,dd {margin: 0; padding: 0; border: 0;}
                        h1,h2,h3,h4,h5,h6 { margin:0; padding:0;}
                        table,td,tr,th{font-size:12px;}


                        /* 星级评分 */
                        .shop-rating {
                                height: 25px;
                                overflow: hidden;
                                zoom: 1;
                                padding: 2px 0px;
                                position: relative;
                                z-index: 999;
                        }

                        .shop-rating span {
                                height: 23px;
                                display: block;
                                line-height: 23px;
                                float: left;
                        }

                        .shop-rating span.title {
                                width: 125px;
                                text-align: right;
                                margin-right: 5px;
                        }

                        .shop-rating ul {
                                float: left;
                                margin:0;padding:0
                        }

                        .shop-rating .result {
                                margin-left: 20px;
                                padding-top: 2px;
                        }

                        .shop-rating .result span {
                                color: #ff6d02;
                        }
                        .shop-rating .result em {
                                color: #f60;
                                font-family: arial;
                                font-weight: bold;
                        }
                        .shop-rating .result strong {
                                color: #666666;
                                font-weight: normal;
                        }
                        .rating-level,
                        .rating-level a {
                                background: url(http://a.tbcdn.cn/app/rc/img/star_v2.png) no-repeat scroll 1000px 1000px;
                        }
                        .rating-level {
                                background-position: 0px 0px;
                                width: 120px;
                                height: 23px;
                                position: relative;
                                z-index: 1000;
                        }
                        .rating-level li {
                                display: inline;
                        }

                        .rating-level a {
                                line-height: 23px;
                                height: 23px;
                                position: absolute;
                                top: 0px;
                                left: 0px;
                                text-indent: -999em;
                                *zoom: 1;
                                outline: none;
                        }


                        .rating-level a.one-star {
                                width: 20%;
                                z-index: 6;
                        }

                        .rating-level a.two-stars {
                                width: 40%;
                                z-index: 5;
                        }

                        .rating-level a.three-stars {
                                width: 60%;
                                z-index: 4;
                        }

                        .rating-level a.four-stars {
                                width: 80%;
                                z-index: 3;
                        }

                        .rating-level a.five-stars {
                                width: 100%;
                                z-index: 2;
                        }

                        .rating-level .current-rating,.rating-level a:hover{background-position:0 -28px;}
                        .rating-level a.one-star:hover,.rating-level a.two-stars:hover,.rating-level a.one-star.current-rating,.rating-level a.two-stars.current-rating{background-position:0 -116px;}
                        .rating-level .three-stars .current-rating,.rating-level .four-stars .current-rating,.rating-level .five-stars .current-rating{background-position:0 -28px;}

                        -->
                </style>
        
        <meta charset="utf-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <title>Eboy - 查询订单</title>
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
                                        <script type="text/javascript">
                        function getOrder()
                        {
                                var xmlHttp;
                                var orderId = document.getElementById('orderId').value;
                                var orderValidate = document.getElementById('orderValidate').value;

                                var itemThumbnailImageUrlImg = document.getElementById('itemThumbnailImageUrl');
                                var itemTitleTd = document.getElementById('itemTitle');
                                var orderQuantityTd = document.getElementById('orderQuantity');
                                var orderPriceTd = document.getElementById('orderPrice');
                                var orderStatusTd = document.getElementById('orderStatus');
                                var itemId = document.getElementById('itemId');
                                if (window.ActiveXObject) {
                                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                                } else
                                        xmlHttp = new XMLHttpRequest();
                                xmlHttp.open("get", "getOrder.action?orderId=" + orderId + "&orderValidate=" + orderValidate, true);
                                xmlHttp.onreadystatechange = function() {
                                        if (xmlHttp.readyState == 4) {
                                                if (xmlHttp.status == 200) {
                                                        var response = xmlHttp.responseText;
                                                        var responseArr = response.split(' ');
                                                        if (responseArr[0] == "failure")
                                                                alert(responseArr[1]);
                                                        else {
                                                                var itemThumbnailImageUrlLength = parseInt(responseArr[1]);
                                                                var itemTitleLength = parseInt(responseArr[2]);

                                                                var l = responseArr[0].length + responseArr[1].length + responseArr[2].length + 3;
                                                                var itemThumbnailImageUrl = response.substring(l, l + itemThumbnailImageUrlLength);
                                                                var itemTitle = response.substring(l + itemThumbnailImageUrlLength, l + itemThumbnailImageUrlLength + itemTitleLength);
                                                                var restResponse = response.substring(l + itemThumbnailImageUrlLength + itemTitleLength + 1);
                                                                var restResponseArr = restResponse.split(' ');
                                                                var orderQuantity = restResponseArr[0];
                                                                var orderPrice = restResponseArr[1];
                                                                var orderStatus = restResponseArr[2];
                                                                itemId.value = restResponseArr[3];
                                                                var authOrderIdP = document.getElementById('authOrderId');
                                                                authOrderIdP.innerText = document.getElementById('orderId').value;
                                                                itemThumbnailImageUrlImg.src = itemThumbnailImageUrl;
                                                                itemThumbnailImageUrlImg.width = 220;
                                                                itemThumbnailImageUrlImg.height = 150;
                                                                itemTitleTd.innerText = itemTitle;
                                                                orderQuantityTd.innerText = orderQuantity;
                                                                orderPriceTd.innerText = "RMB " + orderPrice;
                                                                orderStatusTd.innerText = orderStatus;

                                                                var confirmOrder = document.getElementById('confirmOrder');
                                                                var findGoogleMap = document.getElementById('findGoogleMap');
                                                                if (orderStatus == '已发货')
                                                                        confirmOrder.innerText = '确认收货';
                                                                if (orderStatus != '未发货')
                                                                {
                                                                        findGoogleMap.innerText = '查看物流';
                                                                        var realhref = 'lookUpDelivery.action?orderId=' + orderId;
                                                                        document.getElementById('findGoogleMap').setAttribute('href',realhref);
                                                                }
                                                        }
                                                }
                                        }
                                }
                                xmlHttp.send();
                        }
                        function confirmOrder()
                        {
                                var xmlHttp;
                                var orderId = document.getElementById('orderId').value;
                                var orderValidate = document.getElementById('orderValidate').value;

                                var commentUserNameTr = document.getElementById('commentUserNameTr');
                                var commentRateTr = document.getElementById('commentRateTr');
                                var commentContentTr = document.getElementById('commentContentTr');
                                var commentSubmitTr = document.getElementById('commentSubmitTr');

                                if (window.ActiveXObject) {
                                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                                } else
                                        xmlHttp = new XMLHttpRequest();
                                xmlHttp.open("get", "confirmOrder.action?orderId=" + orderId + "&orderValidate=" + orderValidate, true);
                                xmlHttp.onreadystatechange = function() {
                                        if (xmlHttp.readyState == 4) {
                                                if (xmlHttp.status == 200) {
                                                        var response = xmlHttp.responseText;
                                                        if (response == "success") {
                                                                commentUserNameTr.style.display = "inline";
                                                                commentRateTr.style.display = "inline";
                                                                commentContentTr.style.display = "inline";
                                                                commentSubmitTr.style.display = "inline";

                                                        }
                                                        else
                                                                alert(response);
                                                }
                                        }
                                }
                                xmlHttp.send();
                        }
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
                    <h2>查询订单</h2>
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
                <div style='padding: 0 0 0 20px;width:690px;float:right;'>
                    <div align='center'>

                        <table width="680px" cellspacing="0" cellpadding="5">
                            <tr bgcolor="#ddd">
                                    <th width="220" align="center">商品图片 </th>
                                    <th width="150" align="center">描述 </th>
                                    <th width="50" align="center">数量 </th>
                                    <th width="140" align="right">总价 </th>
                                    <th width="60" align="center">订单状态</th>
                                    <th width="90"align="center">操作 </th>
                            </tr>
                            <tr>
                                    <td><img  id="itemThumbnailImageUrl" /></td>
                                    <td id="itemTitle"></td> 
                                    <td align="center" id="orderQuantity" ></td>
                                    <td align="right" id="orderPrice"></td> 
                                    <td align="right" id="orderStatus"></td>
                                    <td align="center"> <a href="#" onclick="confirmOrder();return false;" id="confirmOrder"></a><br/><a id="findGoogleMap"></a></td>
                            </tr>
                        </table>
                    </div>
                    <form action="addComment.action" >
                            <s:token/>
                            <table>
                                    <tr style="display: none;">
                                        <td><input type="text" id="itemId" name="itemId"/></td>
                                        <td></td>
                                    </tr>
                                    <tr style="display: none;" id="commentUserNameTr" >
                                        <td>　用户名:　</td>
                                        <td><input type="text" name="commentUserName" class="text_field"/></td>
                                    </tr>
                                    <tr style="display: none;" id="commentRateTr">
                                        <td>　　评分:　</td>
                                            <td>
                                                <div class="shop-rating">
                                                    <ul class="rating-level" id="stars2">
                                                        <li><a class="one-star" star:value="1" href="#">1</a></li>
                                                        <li><a class="two-stars" star:value="2" href="#">2</a></li>
                                                        <li><a class="three-stars" star:value="3" href="#">3</a></li>
                                                        <li><a class="four-stars" star:value="4" href="#">4</a></li>
                                                        <li><a class="five-stars" star:value="5" href="#">5</a></li>
                                                    </ul>
                                                    <span class="result" id="stars2-tips"></span>
                                                    <input type="hidden" id="stars2-input" name="b" value="" size="2" />
                                                </div>
                                                
                                                <script type="text/javascript">
                                                            var Class = {
                                                                    create: function() {
                                                                            return function() { this.initialize.apply(this, arguments); }
                                                                    }
                                                            }
                                                            var Extend = function(destination, source) {
                                                                    for (var property in source) {
                                                                            destination[property] = source[property];
                                                                    }
                                                            }
                                                            function stopDefault( e ) {
                                                                     if ( e && e.preventDefault ){
                                                                            e.preventDefault();
                                                                    }else{
                                                                            window.event.returnValue = false;
                                                                    }
                                                                    return false;
                                                            } 
                                                            /**
                                                             * 星星打分组件
                                                             *
                                                             * @author	Yunsd
                                                             * @date		2010-7-5
                                                             */
                                                            var Stars = Class.create();
                                                            Stars.prototype = {
                                                                    initialize: function(star,options) {
                                                                            this.SetOptions(options); //默认属性
                                                                            var flag = 999; //定义全局指针
                                                                            var isIE = (document.all) ? true : false; //IE?
                                                                            var starlist = document.getElementById(star).getElementsByTagName('a'); //星星列表
                                                                            var input = document.getElementById(this.options.Input) || document.getElementById(star+"-input"); // 输出结果
                                                                            var tips = document.getElementById(this.options.Tips) || document.getElementById(star+"-tips"); // 打印提示
                                                                            var nowClass = " " + this.options.nowClass; // 定义选中星星样式名
                                                                            var tipsTxt = this.options.tipsTxt; // 定义提示文案
                                                                            var len = starlist.length; //星星数量


                                                                            for(i=0;i<len;i++){ // 绑定事件 点击 鼠标滑过
                                                                                    starlist[i].value = i;
                                                                                    starlist[i].onclick = function(e){
                                                                                            stopDefault(e);
                                                                                            this.className = this.className + nowClass;
                                                                                            flag = this.value;
                                                                                            input.value = this.getAttribute("star:value");
                                                                                            tips.innerHTML = tipsTxt[this.value]
                                                                                    }
                                                                                    starlist[i].onmouseover = function(){
                                                                                            if (flag< 999){
                                                                                                    var reg = RegExp(nowClass,"g");
                                                                                                    starlist[flag].className = starlist[flag].className.replace(reg,"")
                                                                                            }
                                                                                    }
                                                                                    starlist[i].onmouseout = function(){
                                                                                            if (flag< 999){
                                                                                                    starlist[flag].className = starlist[flag].className + nowClass;
                                                                                            }
                                                                                    }
                                                                            };
                                                                            if (isIE){ //FIX IE下样式错误
                                                                                    var li = document.getElementById(star).getElementsByTagName('li');
                                                                                    for (var i = 0, len = li.length; i < len; i++) {
                                                                                            var c = li[i];
                                                                                            if (c) {
                                                                                                    c.className = c.getElementsByTagName('a')[0].className;
                                                                                            }
                                                                                    }
                                                                            }
                                                                    },
                                                                    //设置默认属性
                                                                    SetOptions: function(options) {
                                                                            this.options = {//默认值
                                                                                    Input:			"",//设置触保存分数的INPUT
                                                                                    Tips:			"",//设置提示文案容器
                                                                                    nowClass:	"current-rating",//选中的样式名
                                                                                    tipsTxt:		["1分-严重不合格","2分-不合格","3分-合格","4分-优秀","5分-完美"]//提示文案
                                                                            };
                                                                            Extend(this.options, options || {});
                                                                    }
                                                            }

                                                            var Stars2 = new Stars("stars2");
                                                    </script>
                                            </td>
                                    </tr>
                                    <tr style="display: none;" id="commentContentTr">
                                            <td valign="top">评论内容:　</td>
                                            <td><textarea name="commentContent"　rows="10" cols="50" style="font:13px 'Microsoft YaHei';background:#f6f3f3;color:#626363;border:1px solid #c0bebe;padding:5px 10px;"></textarea></td>
                                    </tr>

                                    <tr style="display: none;margin-top:10px;" id="commentSubmitTr">
                                        <td>　　　　　 </td>
                                        <td><input type="submit" value="确认评论" class="btn_m"/></td>
                                    </tr>
                            </table>
                    </form>
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
