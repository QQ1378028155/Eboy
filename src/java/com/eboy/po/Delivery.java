package com.eboy.po;
// Generated 2013-9-9 16:00:35 by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Delivery generated by hbm2java
 */
public class Delivery  implements java.io.Serializable {


     private Integer deliveryId;
     private Order order;
     private String deliveryLocation;
     private String deliveryRemark;
     private Date deliveryTime;

    public Delivery() {
    }

	
    public Delivery(Order order, String deliveryLocation, Date deliveryTime) {
        this.order = order;
        this.deliveryLocation = deliveryLocation;
        this.deliveryTime = deliveryTime;
    }
    public Delivery(Order order, String deliveryLocation, String deliveryRemark, Date deliveryTime) {
       this.order = order;
       this.deliveryLocation = deliveryLocation;
       this.deliveryRemark = deliveryRemark;
       this.deliveryTime = deliveryTime;
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
    public Date getDeliveryTime() {
        return this.deliveryTime;
    }
    
    public void setDeliveryTime(Date deliveryTime) {
        this.deliveryTime = deliveryTime;
    }




}


