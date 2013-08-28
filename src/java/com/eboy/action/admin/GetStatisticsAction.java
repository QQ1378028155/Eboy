/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.po.Statistics;
import com.eboy.service.StatisticsService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
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
                ActionContext context = ActionContext.getContext();
                context.put("statisticsList", statisticsList);
                return "success";
        }
}
