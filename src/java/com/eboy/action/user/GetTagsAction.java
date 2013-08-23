/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.eboy.po.Tag;
import com.eboy.service.TagService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wjl
 */
public class GetTagsAction extends ActionSupport
{
        private TagService tagService;
        @Override
        public String execute()
        {
                List<Tag> tags = getTagService().getTags();
                List<Tag> tagList = new ArrayList<Tag>();
                
                int size = 20;
                if(tags.size() < 20)
                        size = tags.size();
                for(int i = 0;i < size;i ++)
                {
                        int index = (int) (Math.random() * tags.size());
                        tagList.add(tags.get(index));
                        tags.remove(index);
                }
                ActionContext context = ActionContext.getContext();
                context.put("tagList", tagList);
                return "success";
        }

        public TagService getTagService() {
                return tagService;
        }

        public void setTagService(TagService tagService) {
                this.tagService = tagService;
        }
}
