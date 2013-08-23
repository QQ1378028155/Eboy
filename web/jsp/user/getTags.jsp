<%-- 
    Document   : getTags
    Created on : 2013-8-23, 18:29:05
    Author     : wjl
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="sidebar_box"><span class="bottom"></span>
        <h3>标签</h3>   
        <div class="content"> 
                <!--                <div class="bs_box">
                                        <a href="#"><img src="images/templatemo_image_01.jpg" alt="Image 01" /></a>
                                        <h4><a href="#">Donec nunc nisl</a></h4>
                                        <p class="price">$10</p>
                                        <div class="cleaner"></div>
                                </div>
                                <div class="bs_box">
                                        <a href="#"><img src="images/templatemo_image_01.jpg" alt="Image 02" /></a>
                                        <h4><a href="#">Aenean eu tellus</a></h4>
                                        <p class="price">$12</p>
                                        <div class="cleaner"></div>
                                </div>
                                <div class="bs_box">
                                        <a href="#"><img src="images/templatemo_image_01.jpg" alt="Image 03" /></a>
                                        <h4><a href="#">Phasellus ut dui</a></h4>
                                        <p class="price">$20</p>
                                        <div class="cleaner"></div>
                                </div>
                                <div class="bs_box">
                                        <a href="#"><img src="images/templatemo_image_01.jpg" alt="Image 04" /></a>
                                        <h4><a href="#">Vestibulum ante</a></h4>
                                        <p class="price">$16</p>
                                        <div class="cleaner"></div>
                                </div>-->

                <s:iterator value="#tagList">
                        <a href="#"><s:property value="tagWord"/></a>&nbsp;&nbsp;
                </s:iterator>

        </div>
</div>