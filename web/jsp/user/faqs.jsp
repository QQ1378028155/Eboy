<%-- 
    Document   : faqs
    Created on : 2013-9-12, 14:57:10
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
        <title>Eboy - 常见问题</title>
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
        <script type="text/javascript">
            function changjianwenti()
            {
               document.getElementById("content").innerHTML="<h1>常见问题</h1><h4>Q：eboy上买到的都是正品吗？</h4><li>A：首先商品均采购自美国，商品来源正宗，品质有保障；其次买手都是长期居住在美国，并且经过身份、居住地址和个人信用信息的严格认证。美国完善的个人信用体系、严谨的法治环境，以及洋码头美国分公司背后强大的律师团队，任何售假、欺诈行为都要承担触犯美国法律的严厉后果。</li><br></br><h4>Q：eboy上销售的商品为什么这么便宜？</h4><li>A：码头上的商品均采购自eBay高信用的卖家，商品来源正宗；且国外的商业竞争充分，税费都较低所以商品售价低于国内。比如说，飞利浦7340剃须刀美国网站采购价少于60美元,同款商品在中国商场销售的市场价为700元；倩碧黄油美国专柜价格少于30美元,同款商品国内专柜售价为460元。</li><br></br><h4>Q：代购商品怎么计费？</h4><li>A：代购商品除商品售价外通常还包含服务费、消费税、官网运费、国际运费、运输保险、关税等。通常情况关税需要您自理，但是在eboy，我们会将这些问题一并为您解决，所有费用包含在到手价和运费里。关税和代购费率我们会在价格清单上详细标明。</li><br></br><h4>Q：关税怎么算？</h4><li>A：通常在店铺中会说明关于关税的相关事宜，如果没有可以参考我们提供的相关资料。</li><br></br><h4>Q：我能退货吗？</h4><li>A： 签收包裹前，若您发现收到的物品受损、丢失、数量不够、物品不相符的情况，务必拒签并立即和买手联系要求退货退款。（详情请查看“退货规则”）</li><br></br><h4>Q： 我付的货款安全吗？</h4><li>A：您所支付的所有货款在m我们发货后21天内在没得到您的确认/同意放款之前，我们是无法收到货款的。21天后您还没确认/同意放款系统会自动放款给我们eboy。如果遇包裹寄送延迟和商品与描述不符时请提前联系eboy客服继续冻结货款，以免造成损失。如果符合退货规则，您也可以申请退货，退款或者取消交易，在获得卖家同意的情况下，您的货款会退还给您。</li><br></br><h4>Q：我付人民币还是美金？</h4><li>A：您支付时用人民币即可。eboy和国内领先的支付平台—支付宝合作，提供安全快捷的支付体验,所以您需要先申请支付宝账号。</li><br></br><h4>Q：运费怎么算？</h4><li>A：物流运费一般是基于购买件数或重量收取。（详情请查看“物流运费”）</li><br></br><h4>Q：尺寸怎么看？</h4><li>A：海外尺寸跟国内尺寸有很大差异，请下单前务必对照我们提供的尺码换算表，或联系买手确定。（查看尺码换算表）</li><div class='cleaner h20'></div>";
            }
        </script>
        <script type="text/javascript">
            function gouwuliucheng()
            {
                document.getElementById("content").innerHTML="<h1>购买商品流程</h1><li>eboy的购物过程非常简单，和京东、淘宝等电商网站基本相同，同时还提供担保交易功能，货物抵达您的手中并确认收货后，资金才会放款至卖家账户，安全交易有保障。</li><br></br><img src ='images/processtobuy.png' width='670' height='160'></img><div class='cleaner h20'></div>";
            }
        </script>
        <script type="text/javascript">
            function anquanfukuan()
            {
                document.getElementById("content").innerHTML="<h1>安全支付</h1><img src='images/anquanzhifu.png'></img><br></br><strong>您所支付的所有货款会先冻结在eboy担保账户上，只有在您确认收货、或卖家发货21天且未接到投诉维权的情况下货款才会解冻支付给卖家。我们力求消费者买的放心、省心。</strong><br></br><li>您所支付的货款只有在您确认收货后才会放款给卖家。对于可接受退货的交易，在用户确认收货之后再要求退货退款，买手将有权利拒绝你的退货要求。在买手确认发货后21天之内，用户一直不同意放款，系统将默认同意放款。</li><br></br><li>我们委托国内最专业的第三方支付平台，支付宝作为我们的支付服务商。您在确认付款后会指引去支付宝，按照支付宝的提示完成付款操作。 洋码头无法获得和保存您的任何银行卡和信用卡信息。</li><br></br><h3> 使用支付宝您可以选择以下方式进行付款：</h3><h4>--信用卡付款</h4><li>信用卡支付无需您开通网上银行功能，支付金额也没有限制。</li><br></br><h4>--普通银行卡付款</h4><li>普通银行卡支付需要您开通了网上银行功能，支付金额也没有限制。</li><br></br><h4>--支付宝余额付款</h4><br></br><h4>--支付宝快捷支付</h4><br></br><h3>如果您遇到无法付款的情况，请查看以下解决方法：</h3><br></br><h4>--支付宝付款成功，但是订单长时间未更新为已付款状态,</h3><li>因网络超时等原因洋码头未收到支付宝的付款通知，通常出现这种情况时支付宝会在半小时内再次向eboy发送付款通知，您只需在半小时后重新查看订单状态即可。如果长时间未更新订单状态，请求eboy助理。</li><br></br><h4>  --支付宝付款成功，订单状态已更新为已付款状态，但洋码头余额账户任显示余额</h4><li>因为您对一笔订单重复付款，洋码头余额账户显示的是您多支付的货款。您可用此余额购买其他商品。</li><br></br><h4>--支付宝付款失败</h4><li>可能是支付平台出现异常或支付宝系统升级，建议您稍后再进行付款。如果长时间不能付款，请求助码头助理。 </li><div class='cleaner h20'></div>";
            }
        </script>
        <script type="text/javascript">
            function peisongfangshi()
            {
                document.getElementById("content").innerHTML="<h1>配送方式</h1><li>全部商品中陈列了由eboy团队甄选后发布的商品，您可直接购买。商品均采购自eBay高端大气卖家，商品来源正宗，品质有保障。</li><br><li>我们采用的配送方式是护航直邮--卖家通过eboy指定的官方物流进行国际运输，到达国内后转运并直邮到您手，包裹运输状态全程可查，物流配送时间通常1周至几周。</li></br><img src='images/peisongfangshi.png'></img><div class='cleaner h20'></div>";
            }
        </script>
        <script type="text/javascript">
            function huaiguantongguanfuwu()
            {
                document.getElementById("content").innerHTML="<h1>海关通关服务</h1><li>在eboy购买的商品即个人自用物品，通过eboy官方国际物流-E邮宝发往国内仓库、再从国内仓库由我们通过顺风快递为您发货。通过eboy官方国际物流配送的国际快件提供代理报关、通关服务，您只需要在eboy按提示购买商品并填写相关信息即可。</li><br></br><h3>海关及税项</h3><li> 个人自用的海外邮寄物品按中国海关规定按入境个人邮递物品通关。入境个人邮递物品应以自用、合理数量为限，并如实进行申报。海关对入境个人邮递物品的管理原则是：既方便正常往来，照顾个人合理需要，又要限制走私违法活动。据此原则，海关规定了个人每次邮寄物品的限值、免税额和禁止、限制邮寄物品的品种。对邮寄入境的物品，海关依法进行查验，并按章征税或免税放行。因此要以合理自用数量为限，即自用指本人使用、馈赠亲友而非为出售或出租。合理数量指海关根据具体情况所确定的正常数量。通关流程如下图示：</li><img src='images/tongguanliucheng.png'></img><br></br><li>个人自用的海外邮寄物品总值在1000元人民币以内（若不不可分割的产品可以超出1000元人民币：例如一台笔记本电脑）。每个包裹将根据海关指定的完税价格表进行关税计算，若关税低于50元人民币的，可予以免税放行，如果税额高于50元人民币，则需要征税放行。若海关认定该包裹不属于个人包裹的规范要求，会将该包裹转为快件报关；海关还会对某些禁止进关的货物做退货处理，并要求发件人支付退运费。</li><br></br><li>通常在国际转运过程中除关税外的清关费、报关费等相关费用由国际物流公司直接承担。如产生关税需买家和买手协商解决关税付款事宜，通过洋码头官方国际物流配送的包裹提供代缴关税服务。</li><li>另据中华人民共和国海关总署《中华人民共和国海关对进出境快件监管办法》（第147号令）第二十二条规定：个人物品类进出境快件报关时，运营人应当向海关提交《中华人民共和国海关进出境快件个人物品申报单》、每一进出境快件的分运单、进境快件收件人或出境快件发件人身份证件影印件和海关需要的其它单证。</li><li> 根据以上规定，快件寄送个人物品入境时应提供收件人身份证影印件和其他通关所需文件给快递公司，由快递公司负责代为办理个人物品的通关手续，并完成派送工作。您通过洋码头官方国际物流发货的包裹，在物流及清关过程中需要您提供出示身份证复印件以使货物运输流畅。</li><li>洋码头承诺：提供身份证影印件是根据海关总署相关规定，仅用于清关检查。</li><li>您可登陆<a href='http://www.customs.gov.cn/'>中华人民共和国海关总署官方网站</a>查询相关规定</li><li>或致电中华人民共和国海关总署 总机：+86-10-6519-4114</li><br></br><li> 您也可以下载《<a href='images/tax.doc'>中华人民共和国进境物品完税价格及税率表.doc</a>》了解纳税详情</li><div class='cleaner h20'></div>";
            }
        </script>
        <script type="text/javascript">
            function zifeijisuanqi()
            {
                document.getElementById('content').innerHTML="<h1>中国邮政国际资费计算器</h1><p>只需选择目的地，输入包裹重量，自动计算中国邮政国际快件或航空小包邮费。</p><table><tr><td>接收国家所属区：</td><td><select id='region_ems'name='region'><option selected='selected' value='0'>一区</option><option value='1'>二区</option><option value='2'>三区</option><option value='3'>四区</option><option value='4'>五区</option><option value='5'>六区</option><option value='6'>七区</option><option value='7'>八区</option><option value='8'>九区</option><option value='9'>十区</option></select><a href='javascript:void(0)' onclick='qushuchaxun()'>属区查询</a></td></tr><tr><td>文件类型：</td><td><input type='radio' id='type1' value='materials' name='type' checked='checked'/>物品<input type='radio' id='type2' value='file' name='type'/>文件</td></tr><tr><td>重量/件：</td><td><input type='text' name='weight' id='weight' size='35' maxlength='10' title='请正确输入重量'/>克/件</td></tr><tr><td>折扣率：</td><td><input type='text' value='0' id='discount' name='discount' size='35' maxlength='5' title='请正确输入折扣率'/>%</td></tr><tr><td>计算结果：</td><td><input type='text' id='results' name='result' size='35' disabled='disabled'/>元</td></tr></table><input type='button' onclick='charging()' value='计算' name='Submit'/><div class='cleaner h20'></div>";
            }
        </script>
        <script type="text/javascript">
            function qushuchaxun()
            {
                document.getElementById("content").innerHTML="<h1>区属查询</h1><strong>了解EMS服务</strong><p>EMS是中国邮政提供的国际快递服务，也是中国跨国交易卖家在发送快递和比较贵重的物品时通常采用的方式。</p><p>EMS区属介绍：</p><img src='images/qushuchaxun.png'><div class='cleaner h20'></div>";
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
                    <h2>常见问题</h2>
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
                                <li><a href="#tab-1">购物指南</a></li>
                                <li><a href="#tab-2">付款与配送</a></li>
                                <li><a href="#tab-3">贴心资料</a></li>
                            </ul>
                            <div id="tab-1" style="padding:10px;">
                                <ol>
                                    <li><a href="javascript:void(0)" onclick="changjianwenti()">常见问题</a></li>
                                    <li><a href="javascript:void(0)" onclick="gouwuliucheng()">购物流程</a></li>
                                </ol>
                            </div>
                            <div id="tab-2" style="padding:10px;">
                                <ol>
                                    <li><a href="javascript:void(0)" onclick="anquanfukuan()">安全付款</a></li>
                                    <li><a href="javascript:void(0)" onclick="peisongfangshi()()">配送方式</a></li>
                                    <li><a href="javascript:void(0)" onclick="huaiguantongguanfuwu()">海关通关服务</a></li>
                                </ol>
                            </div>
                            <div id="tab-3" style="padding:10px;">
                                <ol>
                                    <li><a href="javascript:void(0)" onclick="zifeijisuanqi()">中国邮政国际资费计算器</a></li>
                                    <li><a href="javascript:void(0)" onclick="qushuchaxun()">中国邮政区属查询</a></li>
                                </ol>
                            </div>
                            
                        </div>
                    </div>
                    <!-- /acc tabs -->

                </div>
                <!-- /sidebar -->
                <!-- main -->
                <div id="content" style='padding-left:20px;width:690px;float:right;'>
                    <h1>eboy做什么？</h1>
                    <li>中国客户通过eBay网站从其他市场(如英国/美国)购买物品时,往往会受到由语言/文化/海关/运输/税带来的障碍。eboy电子商务系统就是用来为中国用户屏蔽这些障碍,使中国用户也能够自如地在eBay上购买来自全球市场的商品。</li>
                    <br></br>
                    <li>eboy是一家专注于ebay代购的网络平台，卖家均为经人工甄选的高端大气的eBay海外卖家，全都经过身份及信用的严格认证，确保所有商品的来源，正品有保障。</li>
                    <br></br>
                    <li>您只需轻点鼠标，甚至无需注册，在eboy挑选商品并付款后，卖家将货物通过国际空运运抵中国，足不出户淘遍全世界。</li>
                    <br></br>
                    <img src ="images/faq.png" width="670" height="300"></img>
                    <br></br>
                </div>
                
                <!-- /main -->
            </div>
            <div style="height:30px"></div>
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

