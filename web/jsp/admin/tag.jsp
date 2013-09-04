<%-- 
    Document   : tag
    Created on : 2013-9-4, 14:52:22
    Author     : Tongda
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html  xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>EboyAdmin - 标签管理</title>
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
            function get_previoussibling(n)
            {
                var x=n.previousSibling;
                while (x.nodeType!=1)
                {
                    x=x.previousSibling;
                }
                return x;
            }
            function get_nextsibling(n)
            {
                var x=n.nextSibling;
                while (x.nodeType!=1)
                {
                    x=x.nextSibling;
                }
                return x;
            }
            function modifyTagName(node){
                var td=get_previoussibling(node.parentNode);
                var value=td.innerHTML;
                td.innerHTML="";
                var textfield="<input type='text' style='width:200px;' value="+value+"></input>";
                td.insertAdjacentHTML("beforeEnd",textfield);
                node.style.display='none';
                var confirmBtn=get_nextsibling(node);
                confirmBtn.style.display='block';
            };
            function confirmTagName(node){
                var td=get_previoussibling(node.parentNode);
                var inputfield=td.childNodes[0];
                if (inputfield.nodeType!=1)
                    get_nextsibling(inputfield);
                var value=inputfield.value;
                td.innerHTML=value;
                node.style.display='none';
                var modifyBtn=get_previoussibling(node);
                modifyBtn.style.display='block';
            };
            function addTag(){
                var num=document.getElementById("categoryNum");
                var name=document.getElementById("categoryName");
                var tr="<tr><td align='center'>"+num.value+"</td><td align='center'>"+name.value+"</td><td align=center>"+
                        "<a href='javascript:void(0);' onclick='modifyTagName(this);' style='display:block;'>修改类型名称</a>"+
                        "<input type='button' class='btn' onclick='confirmTagName(this);' style='display:none;width:100px;height:25px;background-color: #0099ff;'value='确认标签名称' />"+
                        "</td></tr>";
                document.getElementById("trInput").insertAdjacentHTML("beforeBegin",tr);
                num.value="";
                name.value="";
            };
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
                        <li><a href="tag.jsp" class="selected">标签管理</a></li>
                        <li><a href="comment.jsp">评价管理</a></li>
                        <li><a href="delivery.jsp">物流管理</a></li>
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
                    <h1>标签管理</h1>
                    <table id="tagTable" style="font-size: 13px;">
                        <tr>
                            <th width="200" align="center">序号</th>
                            <th width="400" align="center">标签名称</th>
                            <th width="300" align="center">操作</th>
                        </tr>
                            <s:action name="adminGetTags" executeResult="true"/>
                        <tr id="trInput">
                            <td align="center"><input id="categoryNum" type="text" style="width:100px;"></input></td>
                            <td align="center"><input id="categoryName" type="text" style="width:200px;"></input></td>
                            <td align="center"><a href="javascript:void(0);" onclick="addTag();">添加</a></td>
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

