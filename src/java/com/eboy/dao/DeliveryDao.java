/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.dao;

import com.eboy.po.Delivery;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author Tongda
 */
public class DeliveryDao extends HibernateDaoSupport{
        public void save(Delivery delivery) throws Exception
        {
                this.getHibernateTemplate().save(delivery);
        }
        public Delivery getDelivery(Integer deliveryId)
        {
                return (Delivery)(this.getHibernateTemplate().get(Delivery.class, deliveryId));
        }
        public List<Delivery> getDeliveries()
        {
                return (List<Delivery>)(getHibernateTemplate().find("from Delivery"));
        }
        public List<Delivery> getDeliveriesByOrderId(Integer orderId)
        {
                return (List<Delivery>)(getHibernateTemplate().find("from Delivery where order.orderId=?", orderId));
        }
        public void deleteDeliery(Delivery delivery)
        {
                this.getHibernateTemplate().delete(delivery);
        }
}
