/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.eboy.po.Delivery;
import com.eboy.po.Order;
import com.eboy.service.DeliveryService;
import com.eboy.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author Tongda
 */
public class LookUpDeliveryAction extends ActionSupport {

        private OrderService orderService;
        private DeliveryService deliveryService;
        private Integer orderId;
        private String orderValidate;

        @Override
        public String execute() {
                Order order = orderService.getOrder(orderId);
                ActionContext context = ActionContext.getContext();
                if (order.getOrderValidate().equals(orderValidate)) {
                        List<Delivery> deliveries = deliveryService.getDeliveriesByOrderId(order.getOrderId());
                        context.put("order", order);
                        context.put("deliveries", deliveries);
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

        public DeliveryService getDeliveryService() {
                return deliveryService;
        }

        public void setDeliveryService(DeliveryService deliveryService) {
                this.deliveryService = deliveryService;
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
