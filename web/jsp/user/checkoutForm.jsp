<%-- 
    Document   : checkoutForm
    Created on : 2013-8-24, 11:53:10
    Author     : wjl
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div style='padding-left:20px;width:690px;float:right;'>
    <s:form action="placeOrder" id="checkoutForm" theme="simple">
        <s:token/>


                <h2><strong>收货人信息</strong></h2>
                
                <div style="margin-top: 10px;">
                        姓名:<br/>
                        <input type="text"  style="width:200px;margin-bottom: 10px;" name="orderReceiver" class='text_field'/><br/>
                        地址:<br/>
                        <input type="text"  style="width:200px;margin-bottom: 10px;"  name="orderAddress" class='text_field'/><br/>
                        电子邮箱: 
                        <span style="font-size:10px">(因订单确认信息将通过Email传输，请确保你填写的Email正确无误。)</span><br/>
                        <input type="text"  style="width:200px;margin-bottom: 10px;"  name="orderEmail" class='text_field'/><br/>
                        联系电话:<br />
                        <input type="text"  style="width:200px;margin-bottom: 10px;"  name="orderPhone" class='text_field'/><br/>
                        <h3>购物车 合计: <strong><s:property value="total"/>元</strong>&nbsp;&nbsp;(包含佣金:<strong><s:property value="fee"/>元</strong>&nbsp; 慈善:<strong><s:property value="charity"/>元</strong>)</h3>

                </div>
                <table style="margin-top:50px;background-color: #f0f0f0; float: right; border: 2px">
                    <tr>
                        <td height="80px" style="padding: 0px 10px;"> <img src="images/Alipay.jpg" alt="Alipay" width="150" height="80"/></td>
                        <td width="422px;" style="padding: 0px 10px;">我们强烈推荐用户使用支付宝支付货款</td>
                        <td style="padding-right: 10px;"><a href="#" class="btn_m" onclick="document.getElementById('checkoutForm').submit();return false;">支付宝支付</a></td>
                    </tr>
                </table>

</s:form>
</div>