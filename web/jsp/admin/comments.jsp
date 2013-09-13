<%-- 
    Document   : categories
    Created on : 2013-9-4, 10:54:31
    Author     : Tongda
--%>


<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
                ${rateinfo}
        ]);

        var options = {
          title: '评分比例表',
          legend: 'none',
          pieSliceText: 'label',
		  is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
      }
    </script>
                <script type="text/javascript">
                        function rateInfoSwitch()
                        {
                                var ordermapdiv = document.getElementById("piechart");
                                var ordermapbutton = document.getElementById("rateinfobutton");
                                if (piechart.style.display == "none")
                                {
                                        rateinfobutton.value = "隐藏表格";
                                        piechart.style.display = "inline";
                                }
                                else
                                {
                                        rateinfobutton.value = "显示表格";
                                        piechart.style.display = "none";
                                }
                        }
                </script>


<input type="button" value=" 显示表格 " id="rateinfobutton" class="btn_m" style="width:120px;" onclick="rateInfoSwitch()"/>
<div id="piechart" style="width: 900px; height: 500px; display: none"></div>


<div style="margin-top:20px;">
                <table width='920px'>
                    <s:iterator value="#comments" status="u">
                        <tr>
                                <td>
                                    <div style='padding:10px;border:1px solid #ccc;color: #333;font-size:15px;'>
                                        <p><strong>商品: </strong><s:property value="item.itemTitle"/></p>
                                        <p><strong>昵称: </strong><s:property value="commentUserName"/></p>
                                        <p><strong>评价: </strong><s:property value="commentContent"/></p>
                                        <p><strong>评分: </strong><s:property value="commentRate"/></p>
                                        <p><strong>时间: </strong><s:property value="commentTime.toString()"/></p>
                                        <a href="javascript:void(0);" onclick='removeComment(this.parentNode.parentNode.parentNode.parentNode,<s:property value="commentId"/>);'>删除</a>
                                        
                                    </div>
                                    <br/><hr/><br/>
                                </td>
                        </tr>
                    </s:iterator>
                </table>
    <div>

                  

