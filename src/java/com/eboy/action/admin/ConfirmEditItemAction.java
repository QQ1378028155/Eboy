/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.po.Item;
import com.eboy.service.ItemService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author Tongda
 */
public class ConfirmEditItemAction extends ActionSupport{
        
        private ItemService itemService;
        private Integer itemId;
        private String itemTitle;
        private double itemPrice;
        private int itemQuantity;
        private String itemDescription;
        @Override
        public String execute()
        {
                Item item = itemService.getItem(itemId);
                item.setItemTitle(itemTitle);
                item.setItemPrice(itemPrice);
                item.setItemQuantity(itemQuantity);
                item.setItemDescription(itemDescription.getBytes());
                itemService.updateItem(item);
                return "success";
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }

        public Integer getItemId() {
                return itemId;
        }

        public void setItemId(Integer itemId) {
                this.itemId = itemId;
        }

    public String getItemTitle() {
        return itemTitle;
    }

    public void setItemTitle(String itemTitle) {
        this.itemTitle = itemTitle;
    }

    public double getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(double itemPrice) {
        this.itemPrice = itemPrice;
    }

    public int getItemQuantity() {
        return itemQuantity;
    }

    public void setItemQuantity(int itemQuantity) {
        this.itemQuantity = itemQuantity;
    }

    public String getItemDescription() {
        return itemDescription;
    }

    public void setItemDescription(String itemDescription) {
        this.itemDescription = itemDescription;
    }
}
