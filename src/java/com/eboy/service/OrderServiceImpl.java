/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.dao.OrderDao;
import com.eboy.po.Order;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tongda
 */
public class OrderServiceImpl implements OrderService{

        private OrderDao orderDao;

        public OrderDao getOrderDao() {
                return orderDao;
        }

        public void setOrderDao(OrderDao orderDao) {
                this.orderDao = orderDao;
        }

        @Override
        public List<Order> getOrders() {
                return this.orderDao.getOrders();
        }

        @Override
        public Order getOrder(Integer orderId) {
               return orderDao.getOrder(orderId);
        }

        @Override
        public void updateDeliverOrder(Order order) {
                orderDao.updateDeliverOrder(order);
        }

        @Override
        public Order getOrderByOrderValidate(String orderValidate) {
                return orderDao.getOrderByOrderValidate(orderValidate);
        }

        @Override
        public void saveOrder(Order order) {
                try {
                        orderDao.save(order);
                } catch (Exception ex) {
                        Logger.getLogger(OrderServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
        }
        
}
