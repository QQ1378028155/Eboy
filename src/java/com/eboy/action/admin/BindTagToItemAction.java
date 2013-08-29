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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author wjl
 */
public class BindTagToItemAction extends ActionSupport
{       
        private ItemTagService itemTagService;
        private ItemService itemService;
        private TagService tagService;

        @Override
        public String execute()
        {
                HttpServletRequest request = ServletActionContext.getRequest();
                int itemId = Integer.parseInt(request.getParameter("itemId"));
                String tagWord = request.getParameter("tagWord");
                
                Tag tag = tagService.getTag(tagWord);
                if(tag == null)
                {
                        tagService.addTag(tagWord);
                        tag = tagService.getTag(tagWord);
                }
                Item item = itemService.getItem(itemId);
                ItemTag itemTag = new ItemTag();
                itemTag.setItem(item);
                itemTag.setTag(tag);
                itemTagService.addItemTag(itemTag);
                
                HttpServletResponse response = ServletActionContext.getResponse();
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/plain");
                PrintWriter out = null;
                try {
                        out = response.getWriter();
                } catch (IOException ex) {
                        Logger.getLogger(BindTagToItemAction.class.getName()).log(Level.SEVERE, null, ex);
                }
                out.print("success");
                out.flush();
                out.close();
                return null;
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

}
