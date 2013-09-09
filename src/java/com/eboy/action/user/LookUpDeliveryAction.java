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

        @Override
        public String execute() {
                Order order = orderService.getOrder(orderId);
                String waypoints = "";
                String destination = "";
                ActionContext context = ActionContext.getContext();
                List<Delivery> deliveries = deliveryService.getDeliveriesByOrderId(order.getOrderId());
                context.put("order", order);
                context.put("deliveries", deliveries);
                for (int i = 0; i < deliveries.size(); i++) {
                        waypoints = waypoints + deliveries.get(i).getDeliveryLocation();
                        if (i != deliveries.size() - 1) {
                                waypoints = waypoints + "|";
                        }
                }
                destination = order.getOrderAddress();
                context.put("destination", destination);
                context.put("waypoints", waypoints);
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

        public Integer getOrderId() {
                return orderId;
        }

        public void setOrderId(Integer orderId) {
                this.orderId = orderId;
        }
}
