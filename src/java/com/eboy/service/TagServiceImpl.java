/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.dao.TagDao;
import com.eboy.po.Tag;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wjl
 */
public class TagServiceImpl implements TagService{

        private TagDao tagDao;
        @Override
        public void addTag(String tagWord) {
                Tag tag = new Tag();
                tag.setTagWord(tagWord);
                try {
                        tagDao.save(tag);
                } catch (Exception ex) {
                        Logger.getLogger(TagServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
        }

        public TagDao getTagDao() {
                return tagDao;
        }

        public void setTagDao(TagDao tagDao) {
                this.tagDao = tagDao;
        }

        @Override
        public List<Tag> getTags() {
                return this.tagDao.getTags();
        }
        
}
