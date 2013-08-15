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

        public Order getOrder(Integer orderID) {
                return (Order) (this.getHibernateTemplate().get(Order.class, orderID));
        }

        public void updateDeliverOrder(Order order) {
                this.getHibernateTemplate().update(order);
        }

        public List<Order> getOrders() {
                return (List<Order>) (getHibernateTemplate().find("from Order"));
        }
}