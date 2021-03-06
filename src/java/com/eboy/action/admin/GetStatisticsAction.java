/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.po.Statistics;
import com.eboy.service.StatisticsService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author wjl
 */
public class GetStatisticsAction extends ActionSupport
{

        public StatisticsService getStatisticsService() {
                return statisticsService;
        }

        public void setStatisticsService(StatisticsService statisticsService) {
                this.statisticsService = statisticsService;
        }
        private StatisticsService statisticsService;
        @Override
        public String execute() {
                List<Statistics> statisticsList = statisticsService.getStatistics();
                String chartUrl = "http://chart.apis.google.com/chart?cht=bvg"
                        + "&chco=ff0000,00ff00&chf=c,s,f0f0f0&chtt=近+五+日+收+支+明+细&chs=600x500&chbh=40,0";
                String chda="&chd=t:";
                String chdb="|";
                String chxla="&chxt=x,y&chxl=0:|";
                String chxlb="|1:|0|";
                
                List<Statistics> resultList=new ArrayList<Statistics>();
                int countNum=0;
                int countDate=0;
                int countDateNum=0;
                for (int i = statisticsList.size()-1;i>=0;i--){
                        
                        for (int j=0;j<resultList.size();j++){
                                if (resultList.get(j).getStatisticsTime().equals(statisticsList.get(i).getStatisticsTime())){
                                        countDate++;
                                        if (resultList.get(j).getStatisticsMoney() > 0 && statisticsList.get(i).getStatisticsMoney() > 0) {
                                                resultList.get(j).setStatisticsMoney(resultList.get(j).getStatisticsMoney() + statisticsList.get(i).getStatisticsMoney());
                                                countNum++;
                                        } else if (resultList.get(j).getStatisticsMoney() <= 0 && statisticsList.get(i).getStatisticsMoney() <= 0) {
                                                resultList.get(j).setStatisticsMoney(resultList.get(j).getStatisticsMoney() + statisticsList.get(i).getStatisticsMoney());
                                                countNum++;
                                        }
                                }
                        }
                        if (countNum == 0) {
                                if (countDate != 0) {
                                        countDate = 0;
                                } else {
                                        countDateNum++;
                                        if (countDateNum >4) {
                                                break;
                                        }
                                }

                                Statistics tempt = new Statistics();
                                tempt.setStatisticsMoney(statisticsList.get(i).getStatisticsMoney());
                                tempt.setStatisticsTime(statisticsList.get(i).getStatisticsTime());
                                resultList.add(tempt);

                        } else {
                                countNum = 0;
                        }
                }
                double MaxMoney=0;
                String [] resultDate=new String [5];
                Double [] resultMoneyP=new Double [5];
                Double [] resultMoneyM=new Double [5];
                int dateExit=0;
                DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
                for (int i =0 ;i<5;i++){
                        resultDate[i]=null;
                        resultMoneyP[i]=null;
                        resultMoneyM[i]=null;
                }
                for (int i =resultList.size()-1 ; i >=0 ;i--){
                        //System.out.println(resultList.get(i).getStatisticsTime()+"     "+resultList.get(i).getStatisticsMoney());
                        if (resultList.get(i).getStatisticsMoney()>0){
                                if (resultList.get(i).getStatisticsMoney()>MaxMoney)
                                        MaxMoney=resultList.get(i).getStatisticsMoney();
                        }else{
                                if (-resultList.get(i).getStatisticsMoney()>MaxMoney)
                                        MaxMoney=-resultList.get(i).getStatisticsMoney();
                        }
                        Date date = resultList.get(i).getStatisticsTime();
                        String dateStr = format1.format(date);
                        for ( int j=0 ; j<5;j++){
                                if (resultDate[j]!=null&&resultDate[j].equals(dateStr)){
                                        if (resultList.get(i).getStatisticsMoney()>0){
                                                resultMoneyP[j]=resultList.get(i).getStatisticsMoney();
                                        }else{
                                                resultMoneyM[j]=resultList.get(i).getStatisticsMoney();
                                        }
                                        dateExit++;
                                }
                                
                        }
                        if (dateExit==0){
                                for (int j = 0; j < 5; j++) {
                                        if (resultDate[j]==null) {
                                                resultDate[j]=dateStr;
                                                if (resultList.get(i).getStatisticsMoney() > 0) {
                                                        resultMoneyP[j] = resultList.get(i).getStatisticsMoney();
                                                } else {
                                                        resultMoneyM[j] = resultList.get(i).getStatisticsMoney();
                                                }
                                                break;
                                        }
                        } 
                        }else{
                                dateExit=0;
                        }
                }
                
               ActionContext context = ActionContext.getContext();
                
                for (int i = 0; i < 5; i++) {
                        if (resultDate[i] != null) {
                                
                                context.put("year" + i, resultDate[i]);
                                System.out.println("contextresult:"+resultDate[i]);
                                if (resultMoneyP[i] != null) {
                                        BigDecimal b = new BigDecimal(resultMoneyP[i]);
                                        double c=b.setScale(2, RoundingMode.HALF_UP).doubleValue();
                                        context.put("num1" + i, c);
                                } else {
                                        context.put("num1" + i, 0);
                                }

                                if (resultMoneyM[i] != null) {
                                        BigDecimal b = new BigDecimal(-resultMoneyM[i]);
                                        double c=b.setScale(2, RoundingMode.HALF_UP).doubleValue();
                                        context.put("num2" + i, c);
                                } else {
                                        context.put("num2" + i, 0);
                                }

                        } else {
                                context.put("year" + i, 0);
                                context.put("num1" + i, 0);
                                context.put("num2" + i, 0);
                        }
                }
                context.put("num1",2000);
        
                return "success";
        }
}
