/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

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
public class LookUpSingleOrderAction extends ActionSupport {

        private OrderService orderService;
        private DeliveryService deliveryService;
        private Integer orderId;

        @Override
        public String execute() {
                System.out.println("orderID = "+ orderId);
                Order order = orderService.getOrder(orderId);
                List<Delivery> deliveries = deliveryService.getDeliveriesByOrderId(orderId);
                ActionContext context = ActionContext.getContext();
                context.put("order", order);
                context.put("deliveries", deliveries);
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

        public long getOrderId() {
                return orderId;
        }

        public void setOrderId(Integer orderId) {
                this.orderId = orderId;
        }
        
}
