/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.dao;

import com.eboy.po.Statistics;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author wjl
 */
public class StatisticsDao extends HibernateDaoSupport{
        public void addStatistics(Statistics statistics)
        {
                this.getHibernateTemplate().save(statistics);
        }
        public List<Statistics> getStatistics()
        {
                return ((List<Statistics>)(this.getHibernateTemplate().find("from Statistics")));
        }
}
