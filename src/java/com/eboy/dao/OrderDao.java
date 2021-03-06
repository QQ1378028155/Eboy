/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.dao;

import com.eboy.po.Order;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author Tongda
 */
public class OrderDao extends HibernateDaoSupport {

        public void save(Order order) throws Exception {
                this.getHibernateTemplate().save(order);
        }

        public Order getOrder(Integer orderId) {
                return (Order) (this.getHibernateTemplate().get(Order.class, orderId));
        }

        public void updateDeliverOrder(Order order) {
                this.getHibernateTemplate().update(order);
        }

        public List<Order> getOrders() {
                return (List<Order>) (getHibernateTemplate().find("from Order"));
        }

        public Order getOrderByOrderValidate(String orderValidate) {
                return ((List<Order>) (this.getHibernateTemplate().find("from Order where orderValidate=?", orderValidate))).get(0);
        }
        public List<Order> getUndeliveredOrders() {
                return (List<Order>)(getHibernateTemplate().find("from Order where orderStatus=?","未发货"));
        }
}