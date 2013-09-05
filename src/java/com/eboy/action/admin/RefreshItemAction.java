/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.ebay.soap.eBLBaseComponents.ItemType;
import com.eboy.api.GetItem;
import com.eboy.po.Item;
import com.eboy.service.ItemService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author wjl
 */
public class RefreshItemAction extends ActionSupport{
        
        private ItemService itemService;
        
        @Override
        public String execute()
        {
                List<Item> itemList = itemService.getItems();
                for(int i = 0;i < itemList.size();i ++)
                {
                        Item item = itemList.get(i);
                        ItemType itemType = GetItem.execute(item.getItemSandboxId(), false);
                        
                        item.setItemQuantity(itemType.getQuantity());
                        item.setItemSoldQuantity(itemType.getSellingStatus().getQuantitySold());
                        
                        itemService.updateItem(item);
                }
                return null;
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }
}
