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
public class AdminLoadItemInfoAction extends ActionSupport{
        
        private ItemService itemService;
        private Integer itemId;
        @Override
        public String execute()
        {
                Item item = itemService.getItem(itemId);
                ActionContext context = ActionContext.getContext();
                context.put("item", item);
                String itemDescription = new String(item.getItemDescription());
                context.put("itemDescription", itemDescription);
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

}
