package com.eboy.po;
// Generated 2013-9-11 8:02:44 by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Statistics generated by hbm2java
 */
public class Statistics  implements java.io.Serializable {


     private Integer statisticsId;
     private double statisticsMoney;
     private Date statisticsTime;

    public Statistics() {
    }

    public Statistics(double statisticsMoney, Date statisticsTime) {
       this.statisticsMoney = statisticsMoney;
       this.statisticsTime = statisticsTime;
    }
   
    public Integer getStatisticsId() {
        return this.statisticsId;
    }
    
    public void setStatisticsId(Integer statisticsId) {
        this.statisticsId = statisticsId;
    }
    public double getStatisticsMoney() {
        return this.statisticsMoney;
    }
    
    public void setStatisticsMoney(double statisticsMoney) {
        this.statisticsMoney = statisticsMoney;
    }
    public Date getStatisticsTime() {
        return this.statisticsTime;
    }
    
    public void setStatisticsTime(Date statisticsTime) {
        this.statisticsTime = statisticsTime;
    }




}


