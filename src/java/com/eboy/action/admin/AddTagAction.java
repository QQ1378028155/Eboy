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
 * @author wjl
 */
public class AddTagAction extends ActionSupport{
        
        private TagService tagService;
        private String tagWord;
        @Override
        public String execute()
        {
                tagService.addTag(getTagWord());
                return "success";
        }

        public TagService getTagService() {
                return tagService;
        }

        public void setTagService(TagService tagService) {
                this.tagService = tagService;
        }

        public String getTagWord() {
                return tagWord;
        }

        public void setTagWord(String tagWord) {
                this.tagWord = tagWord;
        }
}
