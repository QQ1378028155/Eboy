/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.dao.DeliveryDao;
import com.eboy.po.Delivery;
import com.eboy.po.Order;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wjl
 */
public class DeliveryServiceImpl implements DeliveryService {

        private DeliveryDao deliveryDao;

        @Override
        public void addDelivery(Delivery delivery) {
                try {
                        deliveryDao.save(delivery);
                } catch (Exception ex) {
                        Logger.getLogger(DeliveryServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
        }

        @Override
        public List<Delivery> getDeliveries() {
                return this.deliveryDao.getDeliveries();
        }

        public DeliveryDao getDeliveryDao() {
                return deliveryDao;
        }

        public void setDeliveryDao(DeliveryDao deliveryDao) {
                this.deliveryDao = deliveryDao;
        }

        @Override
        public List<Delivery> getDeliveriesByOrderId(Integer orderId) {
                return this.deliveryDao.getDeliveriesByOrderId(orderId);
        }

        @Override
        public Delivery getDelivery(Integer deliveryId) {
                return this.deliveryDao.getDelivery(deliveryId);
        }

        @Override
        public void deleteDelivery(Delivery delivery) {
                this.deliveryDao.deleteDeliery(delivery);
        }
}
