/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.dao.ItemTagDao;
import com.eboy.po.ItemTag;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wjl
 */
public class ItemTagServiceImpl implements ItemTagService{
        private ItemTagDao itemTagDao;
        @Override
        public void addItemTag(ItemTag itemTag) {
                try {
                        getItemTagDao().save(itemTag);
                } catch (Exception ex) {
                        Logger.getLogger(ItemTagServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
        }

        @Override
        public List<ItemTag> getItemTagsByItemId(int itemId) {
                return getItemTagDao().getItemTagsByItemId(itemId);
        }

        @Override
        public List<ItemTag> getItemTagsByTagWord(String tagWord) {
                return getItemTagDao().getItemTagsByTagWord(tagWord);
        }

        public ItemTagDao getItemTagDao() {
                return itemTagDao;
        }

        public void setItemTagDao(ItemTagDao itemTagDao) {
                this.itemTagDao = itemTagDao;
        }

        @Override
        public List<ItemTag> getItemTagsByTagWordKeywords(String keywords) {
               return itemTagDao.getItemTagsByTagWordKeywords(keywords);
        }
        
}
