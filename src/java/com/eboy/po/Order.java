package com.eboy.po;
// Generated 2013-9-11 8:02:44 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Order generated by hbm2java
 */
public class Order  implements java.io.Serializable {


     private Integer orderId;
     private Item item;
     private int orderQuantity;
     private String orderValidate;
     private double orderPrice;
     private String orderAddress;
     private String orderStatus;
     private String orderPhone;
     private String orderReceiver;
     private String orderEmail;
     private Set deliveries = new HashSet(0);

    public Order() {
    }

	
    public Order(Item item, int orderQuantity, String orderValidate, double orderPrice, String orderAddress, String orderStatus, String orderPhone, String orderReceiver, String orderEmail) {
        this.item = item;
        this.orderQuantity = orderQuantity;
        this.orderValidate = orderValidate;
        this.orderPrice = orderPrice;
        this.orderAddress = orderAddress;
        this.orderStatus = orderStatus;
        this.orderPhone = orderPhone;
        this.orderReceiver = orderReceiver;
        this.orderEmail = orderEmail;
    }
    public Order(Item item, int orderQuantity, String orderValidate, double orderPrice, String orderAddress, String orderStatus, String orderPhone, String orderReceiver, String orderEmail, Set deliveries) {
       this.item = item;
       this.orderQuantity = orderQuantity;
       this.orderValidate = orderValidate;
       this.orderPrice = orderPrice;
       this.orderAddress = orderAddress;
       this.orderStatus = orderStatus;
       this.orderPhone = orderPhone;
       this.orderReceiver = orderReceiver;
       this.orderEmail = orderEmail;
       this.deliveries = deliveries;
    }
   
    public Integer getOrderId() {
        return this.orderId;
    }
    
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }
    public Item getItem() {
        return this.item;
    }
    
    public void setItem(Item item) {
        this.item = item;
    }
    public int getOrderQuantity() {
        return this.orderQuantity;
    }
    
    public void setOrderQuantity(int orderQuantity) {
        this.orderQuantity = orderQuantity;
    }
    public String getOrderValidate() {
        return this.orderValidate;
    }
    
    public void setOrderValidate(String orderValidate) {
        this.orderValidate = orderValidate;
    }
    public double getOrderPrice() {
        return this.orderPrice;
    }
    
    public void setOrderPrice(double orderPrice) {
        this.orderPrice = orderPrice;
    }
    public String getOrderAddress() {
        return this.orderAddress;
    }
    
    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }
    public String getOrderStatus() {
        return this.orderStatus;
    }
    
    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }
    public String getOrderPhone() {
        return this.orderPhone;
    }
    
    public void setOrderPhone(String orderPhone) {
        this.orderPhone = orderPhone;
    }
    public String getOrderReceiver() {
        return this.orderReceiver;
    }
    
    public void setOrderReceiver(String orderReceiver) {
        this.orderReceiver = orderReceiver;
    }
    public String getOrderEmail() {
        return this.orderEmail;
    }
    
    public void setOrderEmail(String orderEmail) {
        this.orderEmail = orderEmail;
    }
    public Set getDeliveries() {
        return this.deliveries;
    }
    
    public void setDeliveries(Set deliveries) {
        this.deliveries = deliveries;
    }




}


