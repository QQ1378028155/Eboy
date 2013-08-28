/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.dao.StatisticsDao;
import com.eboy.po.Statistics;
import java.util.List;

/**
 *
 * @author wjl
 */
public class StatisticsServiceImpl implements StatisticsService {

        private StatisticsDao statisticsDao;



        public StatisticsDao getStatisticsDao() {
                return statisticsDao;
        }

        public void setStatisticsDao(StatisticsDao statisticsDao) {
                this.statisticsDao = statisticsDao;
        }

        @Override
        public List<Statistics> getStatistics() {
                return statisticsDao.getStatistics();
        }

        @Override
        public void addStatistics(Statistics statistics) {
                statisticsDao.addStatistics(statistics);
        }

}
