/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.po.Item;
import com.eboy.po.ItemTag;
import com.eboy.po.Tag;
import com.eboy.service.ItemService;
import com.eboy.service.ItemTagService;
import com.eboy.service.TagService;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author wjl
 */
public class BindTagToItemAction extends ActionSupport
{       
        private ItemTagService itemTagService;
        private ItemService itemService;
        private TagService tagService;
        private String itemId;
        private String tagId;
        @Override
        public String execute()
        {
                Tag tag = getTagService().getTag(Integer.parseInt(getTagId()));
                Item item = getItemService().getItem(Integer.parseInt(getItemId()));
                ItemTag itemTag = new ItemTag();
                itemTag.setItem(item);
                itemTag.setTag(tag);
                getItemTagService().addItemTag(itemTag);
                return "success";
        }

        public ItemTagService getItemTagService() {
                return itemTagService;
        }

        public void setItemTagService(ItemTagService itemTagService) {
                this.itemTagService = itemTagService;
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }

        public TagService getTagService() {
                return tagService;
        }

        public void setTagService(TagService tagService) {
                this.tagService = tagService;
        }

        public String getItemId() {
                return itemId;
        }

        public void setItemId(String itemId) {
                this.itemId = itemId;
        }

        public String getTagId() {
                return tagId;
        }

        public void setTagId(String tagId) {
                this.tagId = tagId;
        }
}
