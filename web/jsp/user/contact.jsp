<%-- 
    Document   : contactus
    Created on : 2013-8-25, 16:37:14
    Author     : WingFung
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html  xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Eboy - 联系我们</title>
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
        <script type="text/javascript">
            function lianxiwomen()
            {
                document.getElementById('content').innerHTML="<h1>联系我们</h1><strong>地址:</strong>上海市闵行区东川路800号<br /><strong>邮编:</strong>200240<br /><strong>电话:</strong>54749999<br /><strong>邮箱:</strong> <a href='mailto:Eboy@sjtu.edu.cn'>Eboy@sjtu.edu.cn</a><br /><div class='cleaner h20'></div>";    
            }
        </script>
        <script type="text/javascript">
            function guanfangwuliu()
            {
                document.getElementById('content').innerHTML="<h1>官方物流</h1><img src='images/eyoubaologo.png'></img><br></br><h4>E邮宝</h4><p><strong> 国际e邮宝是中国邮政为适应国际电子商务寄递市场的需要，为中国寄件人推出全新国际邮递产品。该业务将致力于为eBay中国寄件人提供发向美国、澳洲等国家的包裹寄递服务。</strong></p><img src='images/eyoubao.png'></img><br></br><br></br><img src='images/shunfenglogo.png'></img><br></br><h4>顺丰速运</h4><p><strong>顺丰速运（集团）有限公司作为一家主要经营国际、国内快递业务的港资快递企业，为广大客户提供快速、准确、安全、经济、优质的专业快递服务。</strong></p><li>顺丰以“成就客户，推动经济，发展民族速递业”为自己的使命，积极探索客户需求，不断推出新的服务项目，为客户的产品提供快速、安全的流通渠道。</li><li>为了向客户提供更便捷、更安全的服务，顺丰速运网络全部采用自建、自营的方式。经过十几年的发展，顺丰已经拥有6万多名员工和4000多台自有营运车辆,30多家一级分公司，2000多个自建的营业网点，服务网络覆盖20多个省、直辖市和香港、台湾地区，100多个地级市。</li><div class='cleaner h20'></div>";  
            }
        </script>
        <script type="text/javascript">
            function cishanbangzhu()
            {
                document.getElementById('content').innerHTML="<h1>慈善帮助</h1><div style='background:url(images/charity_bg.jpg)'><object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0' width='900' height='300'><param name='movie' value='images/index.swf'><param name='quality' value='high'><param name='wmode' value='transparent'><embed src='images/index.swf' width='700' height='150' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' wmode='transparent'></object></div><br></br><h3>慈善计划</h3><h4>我们将营业的1%拿出来作为eboy慈善基金</h4><p><strong>当遇到重大自然灾害的时候第一时间进行物资援助</strong></p><p><strong>援建落后地区的希望小学</strong></p><p><strong>每年结对10名贫困地区的儿童，帮助他们完成学业</strong></p><div class='cleaner h20'></div>";  
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
                        <li><a href="faqs.jsp">常见问题</a></li>
                        <li><a href="contact.jsp" class="selected">联系我们</a></li>
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
                     <div class="sidebar_box"><span class="bottom"></span>
                        <h3>关于我们</h3>
                        <div class="content">
                            <ul class="sidebar_list">
                                <li class="first"><a href="javascript:void(0)" onclick="lianxiwomen()">联系我们</a></li>
                                <li><a href="javascript:void(0)" onclick="cishanbangzhu()">慈善帮助</a></li>
                                <li class="last"><a href="javascript:void(0)" onclick="guanfangwuliu()">官方物流</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="content" class="float_r">
                    <h1>关于我们</h1>
                    <p><strong>eboy电子商务系统致力为中国用户屏蔽在其他市场(如英国/美国)购买物品时由语言/文化/海关/运输/税带来的障碍。,使得中国用户也能够自如地在eBay上购买来自全球市场的商品。 </strong></p>
                    <p><strong>我们的目标是：</strong></p>
                    <li>让海外购物变得简单又放心。</li>
                    <p><strong>我们的愿景是:</strong></p>
                    <li>通过整合优化低效率运作的国际物流资源和全球零售供应链来促进在线零售的全球化进程</li>
                    <li>改造中间环节多，库存过高，市场门槛高的传统代理制跨国零售模式。</li>
                    <br></br>
                    <img src="images/yuanjing.png">
                    <div class='cleaner h20'></div>
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
