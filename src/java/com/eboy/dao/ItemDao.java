/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.dao;

import com.eboy.po.Item;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author wjl
 */
public class ItemDao extends HibernateDaoSupport
{
        public void save(Item item) throws Exception
        {
                this.getHibernateTemplate().save(item);
        }
        public Item getItem(int itemID)
        {
                return (Item)(this.getHibernateTemplate().get(Item.class, itemID));
        }
        public List<Item> getItems()
        {
                return (List<Item>)(this.getHibernateTemplate().find("from Item"));
        }
        public void update(Item item) throws Exception
        {
                this.getHibernateTemplate().update(item);
        }
}
