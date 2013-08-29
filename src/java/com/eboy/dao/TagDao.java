/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.dao;

import com.eboy.po.Tag;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author wjl
 */
public class TagDao extends HibernateDaoSupport{
        public void save(Tag tag) throws Exception
        {
                this.getHibernateTemplate().save(tag);
        }
        public Tag getTag(int tagID)
        {
                return (Tag)(this.getHibernateTemplate().get(Tag.class, tagID));
        }
        public Tag getTag(String tagWord)
        {
                try
                {
                        return ((List<Tag>)(this.getHibernateTemplate().find("from Tag where tagWord = ?",tagWord ))).get(0);
                }
                catch(IndexOutOfBoundsException e)
                {
                        return null;
                }
        }
        public List<Tag> getTags()
        {
                return (List<Tag>)(getHibernateTemplate().find("from Tag"));
        }
}
