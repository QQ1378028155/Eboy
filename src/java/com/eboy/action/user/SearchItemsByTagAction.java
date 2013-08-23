/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.eboy.po.ItemTag;
import com.eboy.service.ItemTagService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author Tongda
 */
public class SearchItemsByTagAction extends ActionSupport {

        private ItemTagService itemTagService;
        private String keywords;

        @Override
        public String execute() {
                List<ItemTag> itemTags = itemTagService.getItemTagsByTagWordKeywords(keywords);
                ActionContext context = ActionContext.getContext();
                context.put("itemTags", itemTags);
                return "success";
        }

        public ItemTagService getItemTagService() {
                return itemTagService;
        }

        public void setItemTagService(ItemTagService itemTagService) {
                this.itemTagService = itemTagService;
        }

        public String getKeywords() {
                return keywords;
        }

        public void setKeywords(String keywords) {
                this.keywords = keywords;
        }
}
