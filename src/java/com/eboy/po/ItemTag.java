package com.eboy.po;
// Generated 2013-9-9 16:00:35 by Hibernate Tools 3.2.1.GA



/**
 * ItemTag generated by hbm2java
 */
public class ItemTag  implements java.io.Serializable {


     private Integer itemTagId;
     private Tag tag;
     private Item item;

    public ItemTag() {
    }

    public ItemTag(Tag tag, Item item) {
       this.tag = tag;
       this.item = item;
    }
   
    public Integer getItemTagId() {
        return this.itemTagId;
    }
    
    public void setItemTagId(Integer itemTagId) {
        this.itemTagId = itemTagId;
    }
    public Tag getTag() {
        return this.tag;
    }
    
    public void setTag(Tag tag) {
        this.tag = tag;
    }
    public Item getItem() {
        return this.item;
    }
    
    public void setItem(Item item) {
        this.item = item;
    }




}


