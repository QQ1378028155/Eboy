/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.dao.ItemDao;
import com.eboy.po.Item;
import com.eboy.service.ItemService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author wjl
 */
public class SearchItemsFromStoreAction extends ActionSupport
{
        private ItemService itemService;
        private List<Item> itemList;
        public String execute()
        {
                setItemList(getItemService().getItems());
                ActionContext context = ActionContext.getContext();
                context.put("itemList", getItemList());
                return "success";
        }



        public List<Item> getItemList() {
                return itemList;
        }

        public void setItemList(List<Item> itemList) {
                this.itemList = itemList;
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }
       
}
