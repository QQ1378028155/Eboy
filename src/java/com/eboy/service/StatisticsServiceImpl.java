/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.dao.StatisticsDao;
import com.eboy.po.Statistics;

/**
 *
 * @author wjl
 */
public class StatisticsServiceImpl implements StatisticsService {

        private StatisticsDao statisticsDao;

        @Override
        public Statistics getStatistics() {
                return getStatisticsDao().getStatistics();
        }

        @Override
        public void update(Statistics statistics) {
                getStatisticsDao().update(statistics);
        }

        public StatisticsDao getStatisticsDao() {
                return statisticsDao;
        }

        public void setStatisticsDao(StatisticsDao statisticsDao) {
                this.statisticsDao = statisticsDao;
        }
}
