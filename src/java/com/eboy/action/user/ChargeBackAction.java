/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.eboy.po.Order;
import com.eboy.service.OrderService;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author Tongda
 */
public class ChargeBackAction extends ActionSupport{
        private OrderService orderService;
        private Integer orderId;
                
        @Override
        public String execute() {
                Order order = orderService.getOrder(orderId);
                order.setOrderStatus("申请退单");
                orderService.updateDeliverOrder(order);
                return "success";
        }

        public OrderService getOrderService() {
                return orderService;
        }

        public void setOrderService(OrderService orderService) {
                this.orderService = orderService;
        }

        public Integer getOrderId() {
                return orderId;
        }

        public void setOrderId(Integer orderId) {
                this.orderId = orderId;
        }
        
}
