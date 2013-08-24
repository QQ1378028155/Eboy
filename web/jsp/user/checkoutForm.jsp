<%-- 
    Document   : checkoutForm
    Created on : 2013-8-24, 11:53:10
    Author     : wjl
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<s:form action="placeOrder" id="checkoutForm">
        <div id="content" class="float_r">
                <h2>账单结算</h2>
                <h5><strong>收货人信息</strong></h5>
                <div class="content_half float_l checkout">
                        姓名:
                        <input type="text"  style="width:300px;" name="orderReceiver" />
                        地址:
                        <input type="text"  style="width:300px;"  name="orderAddress"/>
                        电子邮箱: 
                        <span style="font-size:10px">因订单确认信息将通过Email传输，请确保你填写的Email正确无误。</span>
                        <input type="text"  style="width:300px;"  name="orderEmail"/>
                        联系电话:<br />
                        <input type="text"  style="width:300px;"  name="orderPhone"/>
                        <h3>购物车</h3>
                        <h4>合计: <strong><s:property value="total"/></strong></h4>         
                </div>

                <div class="content_half float_r checkout">

                </div>

                <div class="cleaner h50"></div>



                <table style="border:1px solid #CCCCCC;" width="100%">

                        <tr>
                                <td height="80px"> <img src="images/Alipay.jpg" alt="Alipay" width="150" height="80"/></td>
                                <td width="400px;" style="padding: 0px 20px;">改成支付宝？Recommended if you have a PayPal account. Fastest delivery time.</td>
                                <td><a href="#" class="more" onclick="document.getElementById('checkoutForm').submit();return false;">支付宝支付</a></td>
                        </tr>
                </table>
        </div>
</s:form>