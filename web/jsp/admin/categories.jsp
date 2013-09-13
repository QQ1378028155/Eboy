<%-- 
    Document   : categories
    Created on : 2013-8-29, 10:24:41
    Author     : Tongda
--%>


<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
        google.load("visualization", "1", {packages: ["corechart"]});
        google.setOnLoadCallback(drawChart);
        function drawChart() {


                var data = google.visualization.arrayToDataTable([
        ${storageinfo}
                ]
                        );

                var options = {
                        title: '仓库类别比例表',
                        legend: 'none',
                        pieSliceText: 'label',
                        is3D: true,
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                chart.draw(data, options);
        }
</script>

<script type="text/javascript">
        function categoryInfoSwitch()
        {
                var ordermapdiv = document.getElementById("piechart");
                var categoryinfobutton = document.getElementById("categoryinfobutton");
                if (piechart.style.display == "none")
                {
                        categoryinfobutton.value = "隐藏表格";
                        piechart.style.display = "inline";
                }
                else
                {
                        categoryinfobutton.value = "显示表格";
                        piechart.style.display = "none";
                }
        }
</script>

<input type="button" value=" 显示表格 " id="categoryinfobutton" class="btn_m" style="width:120px;float:right;" onclick="categoryInfoSwitch()"/>
<br/><br/>
<div id="piechart" style="width: 900px; height: 500px; display: none"></div>
<s:iterator value="#categoryList" status="u">
        <tr>
                <td align="center"><s:property value="#u.index+1"/></td>
                <td align="center" hidden="ture"><s:property value="categoryId"/></td>
                <td align="center"><s:property value="categoryName"/></td>
        </tr>
</s:iterator>