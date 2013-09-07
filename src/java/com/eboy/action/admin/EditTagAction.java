/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.po.Tag;
import com.eboy.service.TagService;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author wjl
 */
public class EditTagAction extends ActionSupport
{
        private Integer tagId;
        private String tagWord;
        private TagService tagService;
        @Override
        public String execute()
        {
                Tag tag = getTagService().getTag(tagId);
                tag.setTagWord(tagWord);
                tagService.updateTag(tag);
                return "success";
        }

        public Integer getTagId() {
                return tagId;
        }

        public void setTagId(Integer tagId) {
                this.tagId = tagId;
        }

        public String getTagWord() {
                return tagWord;
        }

        public void setTagWord(String tagWord) {
                this.tagWord = tagWord;
        }

        public TagService getTagService() {
                return tagService;
        }

        public void setTagService(TagService tagService) {
                this.tagService = tagService;
        }
}
