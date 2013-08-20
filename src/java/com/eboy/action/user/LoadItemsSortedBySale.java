/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.eboy.po.Item;
import com.eboy.service.ItemService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author Tongda
 */
public class LoadItemsSortedBySale extends ActionSupport{
        private ItemService itemService;
        private String keywords;
        @Override
        public String execute()
        {
                List<Item> items = itemService.getItemsOrderBySale(keywords);
                ActionContext context = ActionContext.getContext();
                context.put("items", items);
                return "success";
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }

        public String getKeywords() {
                return keywords;
        }

        public void setKeywords(String keywords) {
                this.keywords = keywords;
        }
}
