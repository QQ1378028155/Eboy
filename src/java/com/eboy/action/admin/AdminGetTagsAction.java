/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.po.Tag;
import com.eboy.service.TagService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author Tongda
 */
public class AdminGetTagsAction extends ActionSupport {

        private TagService tagService;

        @Override
        public String execute() {
                List<Tag> tags = getTagService().getTags();
                ActionContext context = ActionContext.getContext();
                context.put("tags", tags);
                return "success";
        }

        public TagService getTagService() {
                return tagService;
        }

        public void setTagService(TagService tagService) {
                this.tagService = tagService;
        }
}
