/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.po.ItemTag;
import com.eboy.po.Tag;
import com.eboy.service.ItemTagService;
import com.eboy.service.TagService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author wjl
 */
public class GoToTagBindingAction extends ActionSupport
{
        private ItemTagService itemTagService;
        private TagService tagService;
        private String itemId;
        @Override
        public String execute()
        {
                HttpServletRequest request = ServletActionContext.getRequest();
                setItemId(request.getParameter("itemId"));
               List<ItemTag> itemTagList = getItemTagService().getItemTagsByItemId(Integer.parseInt(getItemId()));
               List<Tag> tagList = getTagService().getTags();
               for(int i = 0;i < itemTagList.size();i ++)
               {
                       for(int j = 0;j < tagList.size();j ++)
                       {
                               if(tagList.get(j).getTagId().equals(itemTagList.get(i).getTag().getTagId()))
                               {
                                       tagList.remove(j);
                                       break;
                               }
                       }
               }
               ActionContext.getContext().put("tagList", tagList);
               return "success";
        }

        public ItemTagService getItemTagService() {
                return itemTagService;
        }

        public void setItemTagService(ItemTagService itemTagService) {
                this.itemTagService = itemTagService;
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
}
