/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.po.Order;
import com.eboy.service.OrderService;
import com.eboy.service.DeliveryService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author Tongda
 */
public class AddOrderDeliveryAction extends ActionSupport {

        private OrderService orderService;
        private DeliveryService deliveryService;
        private String deliveryLocation;
        private Integer orderId;
        
        @Override
        public String execute() {
                Order order = orderService.getOrder(orderId);
                deliveryService.addDelivery(deliveryLocation, order);
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
        
        public DeliveryService getDeliveryService() {
                return deliveryService;
        }

        public void setDeliveryService(DeliveryService deliveryService) {
                this.deliveryService = deliveryService;
        }

        public String getDeliveryLocation() {
                return deliveryLocation;
        }

        public void setDeliveryLocation(String deliveryLocation) {
                this.deliveryLocation = deliveryLocation;
        }

        public Integer getOrderId() {
                return orderId;
        }

        public void setOrderId(Integer orderId) {
                this.orderId = orderId;
        }

}
