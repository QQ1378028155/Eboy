<%-- 
    Document   : faqs
    Created on : 2013-8-25, 18:14:03
    Author     : WingFung
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html  xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Eboy - 常见问题</title>
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
            
            window.onload= function()
            {
                var strcookie = document.cookie;
                var cartSize = "0";
                var arrcookie = strcookie.split("; ");
                for(var i = 0;i < arrcookie.length;i ++) {
                    var arr = arrcookie[i].split("=");
                    if(arr[0] == "cartSize")
                        cartSize = arr[1];
                }
                var v = document.getElementById("cartSize");
                v.innerHTML = cartSize + " 件商品";
            }
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
                        <li><a href="faqs.jsp"  class="selected">常见问题</a></li>
                        <li><a href="contact.jsp">联系我们</a></li>
                    </ul>
                    <br style="clear: left" />
                </div><!-- end of ddsmoothmenu -->
                
                <div id="menu_second_bar">
                    <div id="top_shopping_cart">购物车： <strong id="cartSize"></strong> ( <a href="shoppingcart.jsp">进入购物车</a> )</div>
                    <div id="templatemo_search">
                        <form action="#" method="get">
                          <input type="text" value="请输入关键字" name="keyword" id="keyword" title="关键字" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                          <input type="submit" value=" 搜索 " name="Search"  alt="Search" id="searchbutton" title="搜索" class="sub_btn"  />
                        </form>
                    </div>
                    <div class="cleaner"></div>
                </div>
            </div><!-- END of templatemo_menu -->
            
             <div id="templatemo_main">
                <div id="sidebar" class="float_l">
                    <s:action name="getCategories" executeResult="true"/>
                    <s:action name="getTags" executeResult="true"/>
                </div>
                <div id="content" class="float_r">
                    <h1>常见问题</h1>
                    <h4>1.运费问题</h4>
                    <div>
                        <p>中国邮政国际资费计算器</p>
                        <p>只需选择目的地，输入包裹重量，自动计算中国邮政国际快件或航空小包邮费。</p>
                        <script type="text/javascript">
                            function charging(){
                                var wupin_logic = new Array(150,180,190,210,280,240,325,335,445,445);//物品资费
                                var file_logic = new Array(90,115,130,160,220,180,250,260,370,380);//文件资费
                                var xuzhong_logic = new Array(30,40,45,55,75,90,100,120,120);//超过500克或其零数资费
                                var weight=document.getElementById("weight").value; //重量
                                var discount = document.getElementById('discount').value;//折扣
                                var region_emst = document.getElementById('region_ems').value;//地区

                                var result; 
                                if(!weight){
                                    document.getElementById("weight").innerHTML="请正确输入重量";
                                    return false;
                                }else{
                                    document.getElementById("weight").innerHTML='';
                                }
                                if(!discount){
                                    document.getElementById("discount").innerHTML="请正确输入折扣率";
                                    return false;
                                }else{
                                    document.getElementById("discount").innerHTML='';	 
                                }
                                var leixing='wupin';
                                var typeAry=file_logic;
                                if(document.getElementById("type2").checked){
                                    leixing='file';
                                }

                                //选择物品类型进行计费
                                switch(leixing){
                                    case 'wupin':
                                        typeAry = wupin_logic;
                                        break;
                                    case 'file':
                                        typeAry = file_logic;
                                        break;
                                }

                                //计算费用
                                if(weight>500){
                                    var price = typeAry[region_emst];
                                    price=Math.ceil((weight-500)/500)*xuzhong_logic[region_emst]+typeAry[region_emst];
                                    result = price-(price*(discount/100));
                                }else{
                                        result = typeAry[region_emst]-(typeAry[region_emst]*(discount/100));
                                }

                                //得出计算结果并显示
                                document.getElementById('results').value=result;
                                return false;
                            }
                        </script>
                        <table>
                            <tr>
                                <td>接收国家所属区：</td>
                                <td>
                                    <select id="region_ems" name="region">
                                        <option selected="selected" value="0">一区</option>
                                        <option value="1">二区</option>
                                        <option value="2">三区</option>
                                        <option value="3">四区</option>
                                        <option value="4">五区</option>
                                        <option value="5">六区</option>
                                        <option value="6">七区</option>
                                        <option value="7">八区</option>
                                        <option value="8">九区</option>
                                        <option value="9">十区</option>
                                    </select>
                                    <a href="faqs_EMS.jsp">属区查询</a>
                                </td>
                            </tr>
                            <tr>
                                <td>文件类型：</td>
                                <td>
                                    <input type="radio" id="type1" value="materials" name="type" checked="checked" />物品
                                    <input type="radio" id="type2" value="file" name="type" /> 文件
                                </td>
                            </tr>
                            <tr>
                                <td>重量/件：</td>
                                <td>
                                    <input type="text" name="weight" id="weight" size="35" maxlength="10" title="请正确输入重量" />克/件
                                </td>
                            </tr>
                            <tr>
                                <td>折扣率：</td>
                                <td>
                                    <input type="text" value="0" id="discount" name="discount" size="35" maxlength="5" title="请正确输入折扣率" />%
                                </td>
                            </tr>
                            <tr>
                                <td>计算结果：</td>
                                <td>
                                    <input type="text" id="results" name="result" size="35" disabled="disabled" />元
                                </td>
                            </tr>
                        </table>
                        <input type="button" onclick="charging()" value="计算" name="Submit" />
                    </div>
                    <h4>2.关税问题</h4>
                    <h4>3.退货问题</h4>
                    <p>关税怎么算，运费怎么算，一般不支持退货</p>
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
