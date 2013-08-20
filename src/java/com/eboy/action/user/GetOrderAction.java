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
public class GetOrderAction extends ActionSupport {

        private OrderService orderService;
        private String orderValidate;
        private Integer orderId;

        @Override
        public String execute() {
                Order order = orderService.getOrder(orderId);
                ActionContext context = ActionContext.getContext();
                if (order.getOrderValidate().equals(orderValidate)) {
                        context.put("order", order);
                        return "success";
                } else {
                        return "fail";
                }
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

        public Integer getOrderId() {
                return orderId;
        }

        public void setOrderId(Integer orderId) {
                this.orderId = orderId;
        }
}
