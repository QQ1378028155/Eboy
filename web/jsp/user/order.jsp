<%-- 
    Document   : order
    Created on : 2013-8-24, 18:12:15
    Author     : WingFung
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html  xmlns="http://www.w3.org/1999/xhtml">
        <head>
                <title>Eboy - 查询订单</title>


                <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
                <meta name="description" content="" />
                <meta name="keywords" content="" />
                <meta name="owner" content="" />
                <meta name="robots" content="index, follow" />
                <meta name="googlebot" content="index, follow" />
                <style type="text/css">
                        <!--
                        body {background:#fff;text-align:center;margin:0 auto;padding: 0;font:12px Arial;color:#000;line-height:1.2em}
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
                <script src="js/json.js" type="text/javascript"></script>

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
                                                <li><a href="index.jsp" >首页</a></li>
                                                <li><a href="order.jsp" class="selected">查询订单</a></li>
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

                                        <h1>查询订单</h1>
                                        <form>
                                                订单号:
                                                <input type="text"  style="width:250px;" id="orderId" name="orderReceiver" />&nbsp;&nbsp;&nbsp;
                                                <p style="display: none;" id="authOrderId"></p>
                                                密钥:
                                                <input type="text"  style="width:250px;" id="orderValidate" name="orderReceiver" />
                                                <input type="submit" value=" 查询 " onclick="getOrder();
                                return false;" name="CheckOrder"  alt="CheckOrder" id="checkorderbutton" title="查询订单" class="checkorder_btn"  />
                                        </form>
                                        <div class="cleaner h20"></div>

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
                                                        <td align="center"> <a href="#" onclick="confirmOrder();
                                return false;" id="confirmOrder"></a><br/><a id="findGoogleMap"></a></td>
                                                </tr>
                                        </table>
                                        <form action="addComment.action" >
                                                <table>
                                                        <tr style="display: none;">
                                                                <td><input type="text" id="itemId" name="itemId"/></td>
                                                        </tr>
                                                        <tr style="display: none;" id="commentUserNameTr" >
                                                                <td>用户名:<input type="text" name="commentUserName"/></td>
                                                        </tr>
                                                        <tr style="display: none;" id="commentRateTr">
                                                                <td>






                                                                        <div class="shop-rating">
                                                                                评分:
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
                                                                <td>评论内容:<textarea name="commentContent"></textarea></td>
                                                        </tr>
                                                        <tr style="display: none;" id="commentSubmitTr">
                                                                <td><input type="submit" value="确认评论"/></td>
                                                        </tr>
                                                </table>
                                        </form>
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
