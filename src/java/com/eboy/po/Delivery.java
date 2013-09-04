package com.eboy.po;
// Generated 2013-9-4 12:34:11 by Hibernate Tools 3.2.1.GA



/**
 * Delivery generated by hbm2java
 */
public class Delivery  implements java.io.Serializable {


     private Integer deliveryId;
     private Order order;
     private String deliveryLocation;
     private String deliveryRemark;

    public Delivery() {
    }

	
    public Delivery(Order order, String deliveryLocation) {
        this.order = order;
        this.deliveryLocation = deliveryLocation;
    }
    public Delivery(Order order, String deliveryLocation, String deliveryRemark) {
       this.order = order;
       this.deliveryLocation = deliveryLocation;
       this.deliveryRemark = deliveryRemark;
    }
   
    public Integer getDeliveryId() {
        return this.deliveryId;
    }
    
    public void setDeliveryId(Integer deliveryId) {
        this.deliveryId = deliveryId;
    }
    public Order getOrder() {
        return this.order;
    }
    
    public void setOrder(Order order) {
        this.order = order;
    }
    public String getDeliveryLocation() {
        return this.deliveryLocation;
    }
    
    public void setDeliveryLocation(String deliveryLocation) {
        this.deliveryLocation = deliveryLocation;
    }
    public String getDeliveryRemark() {
        return this.deliveryRemark;
    }
    
    public void setDeliveryRemark(String deliveryRemark) {
        this.deliveryRemark = deliveryRemark;
    }




}


