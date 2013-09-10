<%-- 
    Document   : getStatistics
    Created on : 2013-8-28, 18:29:05
    Author     : game3108
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      var year0="<s:property value="#year0"/>";
      var num10=<s:property value="#num10"/>;
      var num20=<s:property value="#num20"/>;
      
      
      var year1="<s:property value="#year1"/>";
      var num11=<s:property value="#num11"/>;
      var num21=<s:property value="#num21"/>
      
      var year2="<s:property value="#year2"/>";
      var num12=<s:property value="#num12"/>;
      var num22=<s:property value="#num22"/>
      
      var year3="<s:property value="#year3"/>";
      var num13=<s:property value="#num13"/>;
      var num23=<s:property value="#num23"/>
      
      var year4="<s:property value="#year4"/>";
      var num14=<s:property value="#num14"/>;
      var num24=<s:property value="#num24"/>
      
      var result;
      var tempt0=['日期', '收入', '支出'];
      var tempt1;
      var tempt2;
      var tempt3;
      var tempt4;
      var tempt5;
      
      if (year0=="0"){
              result=[tempt0];
      }else{
              tempt1=[year0,num10,num20];
              if (year1=="0"){
                      result=[tempt0,tempt1];
              }else{
                      tempt2=[year1,num11,num21];
                      if (year2=="0"){
                              result=[tempt0,tempt1,tempt2];
                      }
                      else{
                              tempt3=[year2,num12,num22];
                              if (year3=="0"){
                                      result=[tempt0,tempt1,tempt2,tempt3];
                              }else{
                                      tempt4=[year3,num13,num23];
                                      if (year4=="0"){
                                              result=[tempt0,tempt1,tempt2,tempt3,tempt4]
                                      }else{
                                              tempt5=[year4,num14,num24];
                                              result=[tempt0,tempt1,tempt2,tempt3,tempt4,tempt5];
                                      }
                              }
                      }
              }
       }



      function drawChart() {
        var data = google.visualization.arrayToDataTable(result);

        var options = {
          title: '近5日收支明细',
          vAxis: {title: '日期',  titleTextStyle: {color: 'red'}}
        };
        

        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                var formatter = new google.visualization.ColorFormat();
        formatter.addRange(-20000,20000,'#0f0f0f','#0f0f0f');
        formatter.format(data,0);
        chart.draw(data, options);
      }
    </script>
</head>


        <div id="chart_div" style="width: 900px; height: 500px;"></div>


