/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.po.Order;
import com.eboy.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author Tongda
 */
public class LookUpSingleOrderAction extends ActionSupport {

        private OrderService orderService;
        private Integer orderId;

        @Override
        public String execute() {
                System.out.println("orderID = "+ orderId);
                Order order = orderService.getOrder(orderId);
                ActionContext context = ActionContext.getContext();
                context.put("order", order);
                return "success";
        }

        public OrderService getOrderService() {
                return orderService;
        }

        public void setOrderService(OrderService orderService) {
                this.orderService = orderService;
        }

        public long getOrderId() {
                return orderId;
        }

        public void setOrderId(Integer orderId) {
                this.orderId = orderId;
        }
        
}
