/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.eboy.po.Order;
import com.eboy.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author Tongda
 */
public class GetOrderAction extends ActionSupport{
        private OrderService orderService;
        private String orderValidate;
        private String password;
         @Override
        public String execute() {
                Order order = orderService.getOrderByOrderValidate(orderValidate);
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

        public String getOrderValidate() {
                return orderValidate;
        }

        public void setOrderValidate(String orderValidate) {
                this.orderValidate = orderValidate;
        }

        public String getPassword() {
                return password;
        }

        public void setPassword(String password) {
                this.password = password;
        }
         
         
}
