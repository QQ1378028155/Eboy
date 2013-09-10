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


<input type="button" value=" 显示表格 " id="rateinfobutton" class="btn" style="width:120px;" onclick="rateInfoSwitch()"/>
<div id="piechart" style="width: 900px; height: 500px; display: none"></div>

<s:iterator value="#comments" status="u">
        <div>
                <table width='920px'>
                        <tr>
                                <td>
                                        <h4>商品名称</h4>
                                        <h5><strong><s:property value="item.itemTitle"/></strong></h5>
                                        <div class="cleaner h10"></div>
                                        <h4>商品评价</h4>
                                        <p><strong>昵称 :&nbsp</strong><s:property value="commentUserName"/><span style="float: right;"><s:property value="commentTime.toString()"/></span></p>
                                        <p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<s:property value="commentContent"/></p>
                                        <p><strong>评分 :&nbsp<s:property value="commentRate"/></strong></p>
                                        <a href="javascript:void(0);" onclick='removeComment(this.parentNode.parentNode.parentNode.parentNode,<s:property value="commentId"/>);'>删除</a>
                                        <hr/>
                                </td>
                        </tr>

                </table>
                <div>
                </s:iterator>

