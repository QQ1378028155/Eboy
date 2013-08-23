/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.po.ItemTag;
import java.util.List;

/**
 *
 * @author wjl
 */
public interface ItemTagService {
        public void addItemTag(ItemTag itemTag);
        public List<ItemTag> getItemTagsByItemId(int itemId);
        public List<ItemTag> getItemTagsByTagWord(String tagWord);
        public List<ItemTag> getItemTagsByTagWordKeywords(String keywords);
}
