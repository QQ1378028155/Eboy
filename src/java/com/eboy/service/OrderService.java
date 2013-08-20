/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.po.Order;
import java.util.List;

/**
 *
 * @author Tongda
 */
public interface OrderService {    
        List<Order> getOrders();
        Order getOrder(Integer orderId);
        void updateDeliverOrder(Order order);
        Order getOrderByOrderValidate(String orderValidate);
        void saveOrder(Order order);
}
