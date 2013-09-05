/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.eboy.po.Order;
import com.eboy.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 *
 * @author Tongda
 */
public class MobileGetOrderAction extends ActionSupport {

        private OrderService orderService;
        private String orderSecret;

        @Override
        public String execute() {
                String orderValidate = orderSecret.substring(0, 8);
                int orderId = Integer.parseInt(orderSecret.substring(8));
                Order order = orderService.getOrder(orderId);
                if(orderValidate.equals(order.getOrderValidate()))
                {
                        ActionContext context = ActionContext.getContext();
                        BigDecimal b = new BigDecimal(order.getOrderPrice());
                        order.setOrderPrice(b.setScale(2, RoundingMode.HALF_UP).doubleValue());
                        context.put("order", order);
                        return "success";
                }
                else
                        return "fail";
        }

        public OrderService getOrderService() {
                return orderService;
        }

        public void setOrderService(OrderService orderService) {
                this.orderService = orderService;
        }

        public String getOrderSecret() {
                return orderSecret;
        }

        public void setOrderSecret(String orderSecret) {
                this.orderSecret = orderSecret;
        }

        
}
