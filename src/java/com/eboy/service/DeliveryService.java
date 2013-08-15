/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.po.Delivery;
import com.eboy.po.Order;
import java.util.List;

/**
 *
 * @author Tongda
 */
public interface DeliveryService {
        void addDelivery(String deliveryLocation, Order order);
        List<Delivery> getDeliveries();
        List<Delivery> getDeliveriesByOrderId(Integer orderId);
}
