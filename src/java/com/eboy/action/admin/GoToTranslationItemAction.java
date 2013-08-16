/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.dao.ItemDao;
import com.eboy.po.Item;
import com.eboy.service.ItemService;
import com.opensymphony.xwork2.ActionSupport;
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author wjl
 */
public class GoToTranslationItemAction extends ActionSupport{
        
        private ItemService itemService;
        private String itemId;
        private String itemTitle;
        private String itemDescription;
        @Override
        public String execute()
        {
                HttpServletRequest request = ServletActionContext.getRequest();
                setItemId(request.getParameter("itemId"));
                Item item = getItemService().getItem(Integer.parseInt(getItemId()));
                setItemTitle(item.getItemTitle());
                try {
                        setItemDescription(new String(item.getItemDescription(),"utf8"));
                } catch (UnsupportedEncodingException ex) {
                        Logger.getLogger(GoToTranslationItemAction.class.getName()).log(Level.SEVERE, null, ex);
                }
                return "success";
                
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }

        public String getItemId() {
                return itemId;
        }

        public void setItemId(String itemId) {
                this.itemId = itemId;
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
