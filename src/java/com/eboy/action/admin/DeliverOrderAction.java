/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.ebay.services.finding.Amount;
import com.eboy.api.BuyItem;
import com.eboy.api.ExchangeConversion;
import com.eboy.po.Item;
import com.eboy.po.Order;
import com.eboy.service.DeliveryService;
import com.eboy.service.ItemService;
import com.eboy.service.OrderService;
import com.eboy.service.StatisticsService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Tongda
 */
public class DeliverOrderAction extends ActionSupport {
        private OrderService orderService;
        private DeliveryService deliveryService;
        private ItemService itemService;
        private StatisticsService statisticsService;
        
        
        
        @Override
        public String execute() {
                HttpServletRequest request = ServletActionContext.getRequest();
                
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                Order order = orderService.getOrder(orderId);
                order.setOrderStatus("已发货");
                orderService.updateDeliverOrder(order);
                
                Item item =order.getItem();
                item.setItemSoldQuantity(item.getItemSoldQuantity() + order.getOrderQuantity());
                item.setItemQuantity(item.getItemQuantity() - order.getOrderQuantity());
                
                BuyItem.execute(item.getItemSandboxId(), order.getOrderQuantity(), item.getItemPrice(), item.getItemPriceCurrency());

                

                return null;
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
        
        
}
