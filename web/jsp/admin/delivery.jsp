<%-- 
    Document   : delivery
    Created on : 2013-8-28, 22:41:36
    Author     : WingFung
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html  xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>EboyAdmin - 物流管理</title>
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
        <script>
            function removeDelivery(id){
              var deleteTr=document.getElementById(id);
              var table=deleteTr.parentNode;
              table.removeChild(deleteTr);
            };
            function addDelivery(){
                var num=document.getElementById("deliveryNum");
                var time=document.getElementById("deliveryTime");
                var spot=document.getElementById("deliverySpot");
                var info=document.getElementById("deliveryInfo");
                var trid="tr"+num;
                var tr="<tr id='"+trid+"'><td align='center'>"+num.value+"</td><td align='center'>"+time.value+
                        "</td><td align='center'>"+spot.value+"</td><td align='center'>"+info.value+
                        "</td><td align='center'><a href='javascript:void(0);' onclick='removeDelivery(this.parentNode.parentNode.id);'>删除</a></td></tr>";
                document.getElementById("trInput").insertAdjacentHTML("beforeBegin",tr);
                num.value="";
                time.value="";
                spot.value="";
                info.value="";
            };
        </script>
        <script>
            function modifyStatus(){
                document.getElementById("orderStatusList").disabled=false;
                document.getElementById("modifyBtn").style.display="none";
                document.getElementById("confirmBtn").style.display="block";
            }
            function confirmStatus(){
                document.getElementById("orderStatusList").disabled=true;
                document.getElementById("modifyBtn").style.display="block";
                document.getElementById("confirmBtn").style.display="none";
            }
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
                        <li><a href="storage.jsp">仓库管理</a></li>
                        <li><a href="category.jsp">类型管理</a></li>
                        <li><a href="tag.jsp">标签管理</a></li>
                        <li><a href="comment.jsp">评价管理</a></li>
                        <li><a href="delivery.jsp" class="selected">物流管理</a></li>
                    </ul>
                    <br style="clear: left" />
                </div><!-- end of ddsmoothmenu -->
                
                <div id="menu_second_bar">
            
                    <div id="templatemo_search">
                        <form action="#" method="get">
                          <input type="text" value="请输入关键字" name="keyword" id="keyword" title="关键字" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                          <input type="submit" value=" 搜索仓库 " name="Search"  alt="Search" id="searchstoragebutton" title="搜索仓库商品" class="sub_btn"  />
                          <input type="submit" value=" 搜索eBay " name="Search"  alt="Search" id="searchebaybutton" title="搜索eBay商品" class="sub_btn"  />

                        </form>
                    </div>
                    <div class="cleaner"></div>
                </div>
            </div><!-- END of templatemo_menu -->
            
            
            <div id="templatemo_main">
                <div id="content" class="float_r">
                    <h1>物流管理</h1>

                    <form>
                        订单号:
                        <input type="text"  style="width:300px;" id="orderId" name="orderReceiver" />&nbsp;&nbsp;&nbsp;
                        <p style="display: none;" id="authOrderId"></p>
                        密钥:
                        <input type="text"  style="width:300px;" id="orderValidate" name="orderReceiver" />&nbsp;&nbsp;&nbsp;
                        <input type="submit" value=" 查询订单 " name="CheckOrder"  alt="CheckOrder" id="checkorderbutton" title="查询订单" class="btn" style="width:100px;"  />
                    </form>

                    <div class="cleaner h20"></div>
                    <table width="920px" cellspacing="0" cellpadding="5" style='font-size:13px;'>
                        <tr bgcolor="#ddd">
                                <th width="220" align="center">商品图片 </th>
                                <th width="270" align="center">描述 </th>
                                <th width="50" align="center">数量 </th>
                                <th width="80" align="right">总价 </th>
                                <th width="120" align="center">订单状态</th>
                                <th width="180"align="center">操作 </th>
                        </tr>
                        <tr>
                                <td><img  id="itemThumbnailImageUrl" /></td>
                                <td id="itemTitle">iPhone 5S</td> 
                                <td align="center" id="orderQuantity" >20</td>
                                <td align="right" id="orderPrice">90000</td> 
                                <td align="center" id="orderStatus">                                    
                                    <select id="orderStatusList" disabled="true">
                                        <option value ="买家已付款">买家已付款</option>
                                        <option value ="已发货">已发货</option>
                                        <option value="交易完成">交易完成</option>
                                    </select>
                                </td>
                                <td align="center">
                                    <a href="javascript:void(0);" id="modifyBtn" onclick="modifyStatus();" style="display:block;">修改订单状态</a>
                                    <input type="button" id="confirmBtn" class="btn" onclick="confirmStatus();" style="display:none;width:100px;height:25px;background-color: #0099ff;"value="确认订单状态" />
                                </td>
                        </tr>
                    </table>

                    <h4>收货信息</h4>
                    <p>  收货人: <s:property value="#order.orderReceiver"/></p>
                    <p>收货地址: <s:property value="#order.orderAddress"/></p>
                    <p>联系电话: <s:property value="#order.orderPhone"/></p>
                    <div class="cleaner h10"></div>
                    <h4>物流信息</h4>
                    <table id="deliveryTable">
                        <tr>
                            <th width="100" align="center">序号</th>
                            <th width="150" align="center">时间</th>
                            <th width="340" align="center">地点</th>
                            <th width="210" align="center">备注</th>
                            <th width="100" align="center">操作</th>
                        </tr>

                        <tr id="tr1">
                            <td align="center">1</td>
                            <td align="center">2013-08-28 15:33</td>
                            <td align="center">中国上海</td>
                            <td align="center">发往广州中</td>
                            <td align="center"><a href="javascript:void(0);" onclick="removeDelivery(this.parentNode.parentNode.id);">删除</a></td>
                        </tr>

                        <tr id="trInput">
                            <td align="center"><input id="deliveryNum" type="text" style="width:50px;"></input></td>
                            <td align="center"><input id="deliveryTime" type="text" style="width:100px;"></input></td>
                            <td align="center"><input id="deliverySpot" type="text" style="width:200px;"></input></td>
                            <td align="center"><input id="deliveryInfo" type="text" style="width:200px;"></input></td>
                            <td align="center"><a href="javascript:void(0);" onclick="addDelivery();">添加</a></td>
                        </tr>
                    </table>

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
