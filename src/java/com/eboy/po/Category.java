package com.eboy.po;
// Generated 2013-9-4 12:34:11 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Category generated by hbm2java
 */
public class Category  implements java.io.Serializable {


     private Integer categoryId;
     private String categoryName;
     private Set items = new HashSet(0);

    public Category() {
    }

	
    public Category(String categoryName) {
        this.categoryName = categoryName;
    }
    public Category(String categoryName, Set items) {
       this.categoryName = categoryName;
       this.items = items;
    }
   
    public Integer getCategoryId() {
        return this.categoryId;
    }
    
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
    public String getCategoryName() {
        return this.categoryName;
    }
    
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    public Set getItems() {
        return this.items;
    }
    
    public void setItems(Set items) {
        this.items = items;
    }




}


