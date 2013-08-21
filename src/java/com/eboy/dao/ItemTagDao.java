/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.dao;

import com.eboy.po.ItemTag;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author wjl
 */
public class ItemTagDao extends HibernateDaoSupport
{
        public void save(ItemTag itemTag) throws Exception
        {
                this.getHibernateTemplate().save(itemTag);
        }
        public List<ItemTag> getItemTagsByItemId(int itemId)
        {
                return (List<ItemTag>)(this.getHibernateTemplate().find("from ItemTag as it where it.item.itemId=?",itemId));
        }
        public List<ItemTag> getItemTagsByTagWord(String tagWord)
        {
                return(List<ItemTag>)(this.getHibernateTemplate().find("from ItemTag as it where it.tag.tagWord = ?",tagWord));
        }
        
        public List<ItemTag> getItemTagsByTagWordKeywords(String keywords) {
                keywords = "%" + keywords + "%";
                return (List<ItemTag>)(this.getHibernateTemplate().find("from ItemTag where tag.tagWord like ?", keywords));
        }
}
