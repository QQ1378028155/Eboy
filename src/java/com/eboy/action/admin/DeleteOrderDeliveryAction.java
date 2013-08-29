/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.po.Delivery;
import com.eboy.service.DeliveryService;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Tongda
 */
public class DeleteOrderDeliveryAction extends ActionSupport {

        private DeliveryService deliveryService;

        
        @Override
        public String execute() {
                int deliveryId = Integer.parseInt(ServletActionContext.getRequest().getParameter("deliveryId"));
                System.out.println(deliveryId);
                Delivery delivery = deliveryService.getDelivery(deliveryId);
                deliveryService.deleteDelivery(delivery);
                return null;
        }


        
        public DeliveryService getDeliveryService() {
                return deliveryService;
        }

        public void setDeliveryService(DeliveryService deliveryService) {
                this.deliveryService = deliveryService;
        }

}
