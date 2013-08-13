/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.dao.OrderDao;
import com.eboy.po.Order;
import java.util.List;

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
        
}
