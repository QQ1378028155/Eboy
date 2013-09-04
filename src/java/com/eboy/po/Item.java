package com.eboy.po;
// Generated 2013-9-4 12:34:11 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Item generated by hbm2java
 */
public class Item  implements java.io.Serializable {


     private Integer itemId;
     private Category category;
     private String itemEbayId;
     private String itemTitle;
     private byte[] itemDescription;
     private int itemQuantity;
     private double itemSortScore;
     private double itemDiscount;
     private String itemThumbnailImageUrl;
     private String itemSandboxId;
     private double itemPrice;
     private String itemPriceCurrency;
     private Double itemPackageCost;
     private String itemPackageCostCurrency;
     private Double itemImportCost;
     private String itemImportCostCurrency;
     private Double itemShippingCost;
     private String itemShippingCostCurrency;
     private Double itemInsuranceCost;
     private String itemInsuranceCostCurrency;
     private Double itemTaxCost;
     private String itemTaxCostCurrency;
     private int itemSoldQuantity;
     private Set comments = new HashSet(0);
     private Set orders = new HashSet(0);
     private Set itemTags = new HashSet(0);
     private Set galleries = new HashSet(0);

    public Item() {
    }

	
    public Item(Category category, String itemEbayId, String itemTitle, byte[] itemDescription, int itemQuantity, double itemSortScore, double itemDiscount, String itemThumbnailImageUrl, String itemSandboxId, double itemPrice, String itemPriceCurrency, int itemSoldQuantity) {
        this.category = category;
        this.itemEbayId = itemEbayId;
        this.itemTitle = itemTitle;
        this.itemDescription = itemDescription;
        this.itemQuantity = itemQuantity;
        this.itemSortScore = itemSortScore;
        this.itemDiscount = itemDiscount;
        this.itemThumbnailImageUrl = itemThumbnailImageUrl;
        this.itemSandboxId = itemSandboxId;
        this.itemPrice = itemPrice;
        this.itemPriceCurrency = itemPriceCurrency;
        this.itemSoldQuantity = itemSoldQuantity;
    }
    public Item(Category category, String itemEbayId, String itemTitle, byte[] itemDescription, int itemQuantity, double itemSortScore, double itemDiscount, String itemThumbnailImageUrl, String itemSandboxId, double itemPrice, String itemPriceCurrency, Double itemPackageCost, String itemPackageCostCurrency, Double itemImportCost, String itemImportCostCurrency, Double itemShippingCost, String itemShippingCostCurrency, Double itemInsuranceCost, String itemInsuranceCostCurrency, Double itemTaxCost, String itemTaxCostCurrency, int itemSoldQuantity, Set comments, Set orders, Set itemTags, Set galleries) {
       this.category = category;
       this.itemEbayId = itemEbayId;
       this.itemTitle = itemTitle;
       this.itemDescription = itemDescription;
       this.itemQuantity = itemQuantity;
       this.itemSortScore = itemSortScore;
       this.itemDiscount = itemDiscount;
       this.itemThumbnailImageUrl = itemThumbnailImageUrl;
       this.itemSandboxId = itemSandboxId;
       this.itemPrice = itemPrice;
       this.itemPriceCurrency = itemPriceCurrency;
       this.itemPackageCost = itemPackageCost;
       this.itemPackageCostCurrency = itemPackageCostCurrency;
       this.itemImportCost = itemImportCost;
       this.itemImportCostCurrency = itemImportCostCurrency;
       this.itemShippingCost = itemShippingCost;
       this.itemShippingCostCurrency = itemShippingCostCurrency;
       this.itemInsuranceCost = itemInsuranceCost;
       this.itemInsuranceCostCurrency = itemInsuranceCostCurrency;
       this.itemTaxCost = itemTaxCost;
       this.itemTaxCostCurrency = itemTaxCostCurrency;
       this.itemSoldQuantity = itemSoldQuantity;
       this.comments = comments;
       this.orders = orders;
       this.itemTags = itemTags;
       this.galleries = galleries;
    }
   
    public Integer getItemId() {
        return this.itemId;
    }
    
    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }
    public Category getCategory() {
        return this.category;
    }
    
    public void setCategory(Category category) {
        this.category = category;
    }
    public String getItemEbayId() {
        return this.itemEbayId;
    }
    
    public void setItemEbayId(String itemEbayId) {
        this.itemEbayId = itemEbayId;
    }
    public String getItemTitle() {
        return this.itemTitle;
    }
    
    public void setItemTitle(String itemTitle) {
        this.itemTitle = itemTitle;
    }
    public byte[] getItemDescription() {
        return this.itemDescription;
    }
    
    public void setItemDescription(byte[] itemDescription) {
        this.itemDescription = itemDescription;
    }
    public int getItemQuantity() {
        return this.itemQuantity;
    }
    
    public void setItemQuantity(int itemQuantity) {
        this.itemQuantity = itemQuantity;
    }
    public double getItemSortScore() {
        return this.itemSortScore;
    }
    
    public void setItemSortScore(double itemSortScore) {
        this.itemSortScore = itemSortScore;
    }
    public double getItemDiscount() {
        return this.itemDiscount;
    }
    
    public void setItemDiscount(double itemDiscount) {
        this.itemDiscount = itemDiscount;
    }
    public String getItemThumbnailImageUrl() {
        return this.itemThumbnailImageUrl;
    }
    
    public void setItemThumbnailImageUrl(String itemThumbnailImageUrl) {
        this.itemThumbnailImageUrl = itemThumbnailImageUrl;
    }
    public String getItemSandboxId() {
        return this.itemSandboxId;
    }
    
    public void setItemSandboxId(String itemSandboxId) {
        this.itemSandboxId = itemSandboxId;
    }
    public double getItemPrice() {
        return this.itemPrice;
    }
    
    public void setItemPrice(double itemPrice) {
        this.itemPrice = itemPrice;
    }
    public String getItemPriceCurrency() {
        return this.itemPriceCurrency;
    }
    
    public void setItemPriceCurrency(String itemPriceCurrency) {
        this.itemPriceCurrency = itemPriceCurrency;
    }
    public Double getItemPackageCost() {
        return this.itemPackageCost;
    }
    
    public void setItemPackageCost(Double itemPackageCost) {
        this.itemPackageCost = itemPackageCost;
    }
    public String getItemPackageCostCurrency() {
        return this.itemPackageCostCurrency;
    }
    
    public void setItemPackageCostCurrency(String itemPackageCostCurrency) {
        this.itemPackageCostCurrency = itemPackageCostCurrency;
    }
    public Double getItemImportCost() {
        return this.itemImportCost;
    }
    
    public void setItemImportCost(Double itemImportCost) {
        this.itemImportCost = itemImportCost;
    }
    public String getItemImportCostCurrency() {
        return this.itemImportCostCurrency;
    }
    
    public void setItemImportCostCurrency(String itemImportCostCurrency) {
        this.itemImportCostCurrency = itemImportCostCurrency;
    }
    public Double getItemShippingCost() {
        return this.itemShippingCost;
    }
    
    public void setItemShippingCost(Double itemShippingCost) {
        this.itemShippingCost = itemShippingCost;
    }
    public String getItemShippingCostCurrency() {
        return this.itemShippingCostCurrency;
    }
    
    public void setItemShippingCostCurrency(String itemShippingCostCurrency) {
        this.itemShippingCostCurrency = itemShippingCostCurrency;
    }
    public Double getItemInsuranceCost() {
        return this.itemInsuranceCost;
    }
    
    public void setItemInsuranceCost(Double itemInsuranceCost) {
        this.itemInsuranceCost = itemInsuranceCost;
    }
    public String getItemInsuranceCostCurrency() {
        return this.itemInsuranceCostCurrency;
    }
    
    public void setItemInsuranceCostCurrency(String itemInsuranceCostCurrency) {
        this.itemInsuranceCostCurrency = itemInsuranceCostCurrency;
    }
    public Double getItemTaxCost() {
        return this.itemTaxCost;
    }
    
    public void setItemTaxCost(Double itemTaxCost) {
        this.itemTaxCost = itemTaxCost;
    }
    public String getItemTaxCostCurrency() {
        return this.itemTaxCostCurrency;
    }
    
    public void setItemTaxCostCurrency(String itemTaxCostCurrency) {
        this.itemTaxCostCurrency = itemTaxCostCurrency;
    }
    public int getItemSoldQuantity() {
        return this.itemSoldQuantity;
    }
    
    public void setItemSoldQuantity(int itemSoldQuantity) {
        this.itemSoldQuantity = itemSoldQuantity;
    }
    public Set getComments() {
        return this.comments;
    }
    
    public void setComments(Set comments) {
        this.comments = comments;
    }
    public Set getOrders() {
        return this.orders;
    }
    
    public void setOrders(Set orders) {
        this.orders = orders;
    }
    public Set getItemTags() {
        return this.itemTags;
    }
    
    public void setItemTags(Set itemTags) {
        this.itemTags = itemTags;
    }
    public Set getGalleries() {
        return this.galleries;
    }
    
    public void setGalleries(Set galleries) {
        this.galleries = galleries;
    }




}


