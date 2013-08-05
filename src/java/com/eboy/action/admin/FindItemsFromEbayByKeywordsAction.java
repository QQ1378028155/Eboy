/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.api.FindItemsByKeywords;
import com.eboy.po.Item;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author wjl
 */
public class FindItemsFromEbayByKeywordsAction extends ActionSupport
{
        private String keywords;
        private List<Item> itemList;
        
        @Override
        public String execute()
        {
                FindItemsByKeywords find = new FindItemsByKeywords();
                itemList = find.execute(keywords);
                ActionContext context = ActionContext.getContext();
                context.put("itemList", itemList);
                
                return "success";
        }

        public String getKeywords() {
                return keywords;
        }

        public void setKeywords(String keywords) {
                this.keywords = keywords;
        }

        public List<Item> getItemList() {
                return itemList;
        }

        public void setItemList(List<Item> itemList) {
                this.itemList = itemList;
        }
        
}
