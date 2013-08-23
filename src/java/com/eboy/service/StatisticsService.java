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
public interface StatisticsService {
        
        public Statistics getStatistics();
        public void update(Statistics statistics);

}
