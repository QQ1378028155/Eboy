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
public interface StatisticsService {
        
        public List<Statistics> getStatistics();
        public void addStatistics(Statistics statistics);

}
