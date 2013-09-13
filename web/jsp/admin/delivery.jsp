<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<title>EboyAdmin - 物流管理</title>
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
                <script type="text/javascript">
                        function removeDelivery(id) {
                                var deleteTr = document.getElementById("tr" + id);
                                var table = deleteTr.parentNode;
                                table.removeChild(deleteTr);
                                var xmlHttp;
                                if (window.ActiveXObject) {
                                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                                } else
                                        xmlHttp = new XMLHttpRequest();
                                xmlHttp.open("get", "deleteOrderDelivery.action?deliveryId=" + id, true);
                                xmlHttp.onreadystatechange = function() {

                                }
                                xmlHttp.send();
                        }

                        function addDelivery() {

                                var time = document.getElementById("deliveryTime");
                                var spot = document.getElementById("deliverySpot");
                                var info = document.getElementById("deliveryInfo");

                                var xmlHttp;
                                if (window.ActiveXObject) {
                                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                                } else
                                        xmlHttp = new XMLHttpRequest();
                                xmlHttp.open("get", "addOrderDelivery.action?orderId=" + <s:property value="#order.orderId"/> + "&deliveryLocation=" + spot.value + "&deliveryRemark=" + info.value, true);
                                xmlHttp.onreadystatechange = function() {
                                        if (xmlHttp.readyState == 4) {
                                                if (xmlHttp.status == 200) {
                                                        var response = xmlHttp.responseText;
                                                        var tr = "<tr id=\"tr" + response + "\"><td align='center'>" + time.value +
                                                                "</td><td align='center'>" + spot.value + "</td><td align='center'>" + info.value +
                                                                "</td><td align='center'><a href='javascript:void(0);' onclick='removeDelivery(" + response + ");'>删除</a></td></tr>";
                                                        document.getElementById("trInput").insertAdjacentHTML("beforeBegin", tr);
                                                }
                                        }
                                }
                                xmlHttp.send();
                                num.value = "";
                                time.value = "";
                                spot.value = "";
                                info.value = "";
                        }

                </script>
                <script type="text/javascript">
                        function modifyStatus() {
                                document.getElementById("orderStatusList").disabled = false;
                                document.getElementById("modifyBtn").style.display = "none";
                                document.getElementById("confirmBtn").style.display = "block";
                        }
                        function confirmStatus() {
                                document.getElementById("orderStatusList").disabled = true;
                                document.getElementById("modifyBtn").style.display = "block";
                                document.getElementById("confirmBtn").style.display = "none";
                                var xmlHttp;
                                if (window.ActiveXObject) {
                                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                                } else
                                        xmlHttp = new XMLHttpRequest();
                                xmlHttp.open("get", "updateOrderStatus.action?orderId=" + <s:property value="#order.orderId"/> + "&orderStatus=" + document.getElementById("orderStatusList").value, true);
                                xmlHttp.send();
                        }
                </script>
                <script type="text/javascript">
                        function OrderMapSwitch()
                        {
                                var ordermapdiv = document.getElementById("ordermapdiv");
                                var ordermapbutton = document.getElementById("ordermapbutton");
                                if (ordermapdiv.style.display == "none")
                                {
                                        ordermapbutton.value = "隐藏订单地图";
                                        ordermapdiv.style.display = "inline";
                                }
                                else
                                {
                                        ordermapbutton.value = "显示订单地图";
                                        ordermapdiv.style.display = "none";
                                }
                        }
                </script>
               <script type="text/javascript">
                    function AutoResizeImage(maxWidth, maxHeight, objImg) {
                            var img = new Image();
                            img.src = objImg.src;
                            var hRatio;
                            var wRatio;
                            var Ratio = 1;
                            var w = img.width;
                            var h = img.height;
                            wRatio = maxWidth / w;
                            hRatio = maxHeight / h;
                            if (maxWidth == 0 && maxHeight == 0) {
                                    Ratio = 1;
                            } else if (maxWidth == 0) {//
                                    if (hRatio < 1)
                                            Ratio = hRatio;
                            } else if (maxHeight == 0) {
                                    if (wRatio < 1)
                                            Ratio = wRatio;
                            } else if (wRatio < 1 || hRatio < 1) {
                                    Ratio = (wRatio <= hRatio ? wRatio : hRatio);
                            }
                            if (Ratio < 1) {
                                    w = w * Ratio;
                                    h = h * Ratio;
                            }
                            objImg.height = h;
                            objImg.width = w;
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
   <h2>物流管理<span></span></h2> <s:include value="searchForm.jsp"/>

  </div>
 </div>
 <!-- /top_title -->
 <div class="wraper">
     <div align="center">
     <form action="/Eboy/jsp/admin/adminLookUpDelivery.action">
                                                订单号:
                                                <input type="text"  style="width:300px;" id="orderId" name="orderId" class="text_field"/>
                                                <p style="display: none;" id="authOrderId"></p>
                                                <input type="submit" value=" 查询订单 " name="CheckOrder"  alt="CheckOrder" id="checkorderbutton" title="查询订单" class="btn_m"   />
                                                <input type="button" value=" 显示订单地图 " name="ShowOrderMap"  alt="ShowOrderMap" id="ordermapbutton" title="显示订单地图" class="btn_m" onclick="OrderMapSwitch()"/>
                                        </form>
     </div>
<br/>
                                        <div id="ordermapdiv" style="display: none">
                                                <s:action name="orderMap" executeResult="true" />
                                        </div>
                                        <br/>
                                        <table width="920px" cellspacing="0" cellpadding="5" style='font-size:13px;'>
                                                <tr bgcolor="#ddd">
                                                        <th width="256" align="center">商品图片 </th>
                                                        <th width="306" align="center">描述 </th>
                                                        <th width="86" align="center">数量 </th>
                                                        <th width="116" align="right">总价 </th>
                                                        <th width="156" align="center">订单状态</th>
                                                </tr>
                                                <tr>
                                                        <td>
                                                            <div align='center' style="height:192px;width:256px;overflow:hidden;">
                                                                <img id="itemThumbnailImageUrl" src="<s:property value="#order.item.itemThumbnailImageUrl"/>" width="0" height="0" onload="AutoResizeImage(256,192,this)" alt=""/>
                                                            </div> 
                                                        </td>
                                                        <td id="itemTitle"><s:property value="#order.item.itemTitle"/></td> 
                                                        <td align="center" id="orderQuantity" ><s:property value="#order.orderQuantity"/></td>
                                                        <td align="right" id="orderPrice"><s:property value="#order.orderPrice"/></td> 
                                                        <td align="center" id="orderStatus"><s:property value="#order.orderStatus"/></td>
                                                </tr>
                                        </table>
<br/>

                                        <h4>收货信息</h4>
                                        <div style='padding:10px;border:1px solid #ccc;color: #333;font-size:15px;'>
                                            <p>  收货人: <s:property value="#order.orderReceiver"/></p>
                                            <p>收货地址: <s:property value="#order.orderAddress"/></p>
                                            <p>联系电话: <s:property value="#order.orderPhone"/></p>
                                        </div>
 
   <br/>
  
                                        <h4>物流信息</h4>
                                        <table id="deliveryTable" >
                                            <tr bgcolor="#ccc">
                                                        <th width="100" align="center" style=" display: none;">序号</th>
                                                        <th width="175" align="center">时间</th>
                                                        <th width="365" align="center">地点</th>
                                                        <th width="235" align="center">备注</th>
                                                        <th width="125" align="center">操作</th>
                                                </tr>
                                                <s:iterator value="#deliveries" status="u">
                                                        <tr id="tr<s:property value="deliveryId"/>">
                                                                <td align="center" style=" display: none;"><s:property value="deliveryId"/></td>
                                                                <td align="center" style="padding:5px 10px;"><s:property value="deliveryTime"/></td>
                                                                <td align="center" style="padding:5px 10px;"><s:property value="deliveryLocation"/></td>
                                                                <td align="center" style="padding:5px 10px;"><s:property value="deliveryRemark"/></td>
                                                                <td align="center" style="padding:5px 10px;"><a  class="btn_col" href="javascript:void(0);" onclick="removeDelivery(<s:property value="deliveryId"/>);">删除</a></td>
                                                        </tr>
                                                </s:iterator>
                                                <tr id="trInput">
                                                        <td align="center"><input id="deliveryTime" type="text" style="width:150px;text-align:center;" class="text_field" disabled></input></td>
                                                        <td align="center"><input id="deliverySpot" type="text" style="width:200px;text-align:center;" class="text_field"></input></td>
                                                        <td align="center"><input id="deliveryInfo" type="text" style="width:200px;text-align:center;" class="text_field"></input></td>
                                                        <td align="center"><a  class="btn_col" href="javascript:void(0);" onclick="addDelivery();
                                return false;">添加</a></td>
                                                </tr>
                                                <script>
                        var mydate = new Date();
                        var datetime = mydate.getFullYear() + "-" + mydate.getMonth() + "-" + mydate.getDay() + " " + mydate.getHours() + ":" + mydate.getMinutes() + ":" + mydate.getSeconds();
                        document.getElementById("deliveryTime").value = datetime;
                                                </script>
                                        </table>
                                   

<br/>
<br/>
</div></div>
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
