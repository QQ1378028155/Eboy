/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.po.Item;
import com.eboy.service.ItemService;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author wjl
 */
public class SetTranslationAction extends ActionSupport
{
        private String itemId;
        private ItemService itemService;
        private String itemTitle;
        private String itemDescription;
        
        @Override
        public String execute()
        {
                Item item = getItemService().getItem(Integer.parseInt(getItemId()));
                item.setItemTitle(getItemTitle());
                item.setItemDescription(getItemDescription().getBytes());
                getItemService().updateItem(item);
                return "success";
        }

        public String getItemId() {
                return itemId;
        }

        public void setItemId(String itemId) {
                this.itemId = itemId;
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }

        public String getItemTitle() {
                return itemTitle;
        }

        public void setItemTitle(String itemTitle) {
                this.itemTitle = itemTitle;
        }

        public String getItemDescription() {
                return itemDescription;
        }

        public void setItemDescription(String itemDescription) {
                this.itemDescription = itemDescription;
        }
}
