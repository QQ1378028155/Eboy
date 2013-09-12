<%-- 
    Document   : contact
    Created on : 2013-9-12, 14:57:01
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
                <title>Eboy - 关于我们</title>
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
                        $(function() {
                                $(".gallery a[rel^='prettyPhoto']").prettyPhoto({theme: 'dark_rounded'});
                                $('.clients_slider').bxSlider({
                                        auto: false,
                                        controls: false,
                                        mode: 'fade',
                                        pager: true
                                });
                                $('.recent_slider').bxSlider({
                                        auto: false,
                                        displaySlideQty: 1,
                                        moveSlideQty: 1,
                                        speed: 1000
                                });
                                $('#faq').dltoggle();
                                $("#open").click(function(event) {
                                        $('#faq').dltoggle_show();
                                        return false;
                                });
                                $("#close").click(function(event) {
                                        $('#faq').dltoggle_hide();
                                        return false;
                                });
                                $('.bwWrapper').BlackAndWhite({
                                        hoverEffect: true,
                                        webworkerPath: false,
                                        responsive: true,
                                        invertHoverEffect: false
                                });
                        });
                </script>

                <script type="text/javascript">
                        function lianxiwomen()
                        {
                                document.getElementById('content').innerHTML = "<h1>联系我们</h1><strong>地址:</strong>上海市闵行区东川路800号<br /><strong>邮编:</strong>200240<br /><strong>电话:</strong>54749999<br /><strong>邮箱:</strong> <a href='mailto:Eboy@sjtu.edu.cn'>Eboy@sjtu.edu.cn</a><br /><div class='cleaner h20'></div>";
                        }
                </script>
                <script type="text/javascript">
                        function guanfangwuliu()
                        {
                                document.getElementById('content').innerHTML = "<h1>官方物流</h1><img src='images/eyoubaologo.png'></img><br></br><h4>E邮宝</h4><p><strong> 国际e邮宝是中国邮政为适应国际电子商务寄递市场的需要，为中国寄件人推出全新国际邮递产品。该业务将致力于为eBay中国寄件人提供发向美国、澳洲等国家的包裹寄递服务。</strong></p><img src='images/eyoubao.png'></img><br></br><br></br><img src='images/shunfenglogo.png'></img><br></br><h4>顺丰速运</h4><p><strong>顺丰速运（集团）有限公司作为一家主要经营国际、国内快递业务的港资快递企业，为广大客户提供快速、准确、安全、经济、优质的专业快递服务。</strong></p><li>顺丰以“成就客户，推动经济，发展民族速递业”为自己的使命，积极探索客户需求，不断推出新的服务项目，为客户的产品提供快速、安全的流通渠道。</li><li>为了向客户提供更便捷、更安全的服务，顺丰速运网络全部采用自建、自营的方式。经过十几年的发展，顺丰已经拥有6万多名员工和4000多台自有营运车辆,30多家一级分公司，2000多个自建的营业网点，服务网络覆盖20多个省、直辖市和香港、台湾地区，100多个地级市。</li><div class='cleaner h20'></div>";
                        }
                </script>
                <script type="text/javascript">
                        function cishanbangzhu()
                        {
                                document.getElementById('content').innerHTML = "<h1>慈善帮助</h1><div style='background:url(images/charity_bg.jpg)'><object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0' width='900' height='300'><param name='movie' value='images/index.swf'><param name='quality' value='high'><param name='wmode' value='transparent'><embed src='images/index.swf' width='700' height='150' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' wmode='transparent'></object></div><br></br><h3>慈善计划</h3><h4>我们将营业的1%拿出来作为eboy慈善基金</h4><p><strong>当遇到重大自然灾害的时候第一时间进行物资援助</strong></p><p><strong>援建落后地区的希望小学</strong></p><p><strong>每年结对10名贫困地区的儿童，帮助他们完成学业</strong></p><div class='cleaner h20'></div>";
                        }
                </script>
                <script type="text/javascript">
                        function yuanjing()
                        {
                                document.getElementById('content').innerHTML = "<h1>关于我们</h1><p><strong>eboy电子商务系统致力为中国用户屏蔽在其他市场(如英国/美国)购买物品时由语言/文化/海关/运输/税带来的障碍。,使得中国用户也能够自如地在eBay上购买来自全球市场的商品。</strong></p><p><strong>我们的目标是：</strong></p><li>让海外购物变得简单又放心。</li><p><strong>我们的愿景是:</strong></p><li>通过整合优化低效率运作的国际物流资源和全球零售供应链来促进在线零售的全球化进程</li><li>改造中间环节多，库存过高，市场门槛高的传统代理制跨国零售模式。</li><br></br><img src='images/yuanjing.png'>";
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
                                                <li><a href="contact.jsp">关于我们</a>
                                                        <ul>
                                                                <li><a href="javascript:void(0)" onclick="lianxiwomen()">联系我们</a></li>
                                                                <li><a href="javascript:void(0)" onclick="cishanbangzhu()">慈善帮助</a></li>
                                                                <li><a href="javascript:void(0)" onclick="guanfangwuliu()">官方物流</a></li>
                                                                <li><a href="javascript:void(0)" onclick="yuanjing()">愿景</a></li>
                                                        </ul>
                                                </li>
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
                                        <h2>关于我们</h2>
                                        <s:include value="searchForm.jsp"/>
                                </div>
                        </div>
<<<<<<< HEAD
                        <!-- /top_title -->
                        <div class="wraper">
                                <!-- main -->
                                <div id="content">
                                        <div class="faq_list">
                                                <ul id="faq">
                                                        <li class="all technical">
                                                                <p class="question">eboy做什么？</p>
                                                                <div class="answer">
                                                                        <p>中国客户通过eBay网站从其他市场(如英国/美国)购买物品时,往往会受到由语言/文化/海关/运输/税带来的障碍。eboy电子商务系统就是用来为中国用户屏蔽这些障碍,使中国用户也能够自如地在eBay上购买来自全球市场的商品。</p>

                                                                        <p>eboy是一家专注于ebay代购的网络平台，卖家均为经人工甄选的高端大气的eBay海外卖家，全都经过身份及信用的严格认证，确保所有商品的来源，正品有保障。</p>
                                                                        <p>
                                                                                您只需轻点鼠标，甚至无需注册，在eboy挑选商品并付款后，卖家将货物通过国际空运运抵中国，足不出户淘遍全世界。
                                                                        </p>
                                                                        <div style="text-align: center">
                                                                                <img src ="images/faq.png" width="670" height="300"></img>
                                                                        </div>
                                                                </div>
                                                        </li>
                                                </ul>
                                        </div>
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

