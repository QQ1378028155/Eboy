/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.eboy.po.Order;
import com.eboy.po.Statistics;
import com.eboy.service.OrderService;
import com.eboy.service.StatisticsService;
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author wjl
 */
public class ConfirmOrderAction extends ActionSupport {

        private OrderService orderService;
        private StatisticsService statisticsService;

        @Override
        public String execute() {
                HttpServletResponse response = ServletActionContext.getResponse();
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/plain");
                PrintWriter out = null;
                try {
                        out = response.getWriter();
                        HttpServletRequest request = ServletActionContext.getRequest();
                        String orderId = request.getParameter("orderId");
                        String orderValidate = request.getParameter("orderValidate");
                        Order order = getOrderService().getOrder(Integer.parseInt(orderId));

                        if (order.getOrderValidate().equals(orderValidate)) {

                                if (order.getOrderStatus().equals("已发货")) {
                                        out.print("success");
                                        order.setOrderStatus("已收到");
                                        orderService.updateDeliverOrder(order);
                                        Statistics s = new Statistics();
                                        s.setStatisticsMoney(order.getOrderPrice());
                                        Date date = new Date();
                                        s.setStatisticsTime(date);
                                        statisticsService.addStatistics(s);
                                } else {
                                        out.print("订单已经确认过了");
                                }
                        } else {
                                out.print("订单验证失败");
                        }
                } catch (IndexOutOfBoundsException e) {
                        out.print("订单不存在");
                } catch (IOException ex) {
                        Logger.getLogger(ConfirmOrderAction.class.getName()).log(Level.SEVERE, null, ex);
                }
                out.flush();
                out.close();
                return null;
        }

        public OrderService getOrderService() {
                return orderService;
        }

        public void setOrderService(OrderService orderService) {
                this.orderService = orderService;
        }

        public StatisticsService getStatisticsService() {
                return statisticsService;
        }

        public void setStatisticsService(StatisticsService statisticsService) {
                this.statisticsService = statisticsService;
        }
}
