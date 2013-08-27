/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.dao;

import com.eboy.po.Category;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author wjl
 */
public class CategoryDao extends HibernateDaoSupport
{
        public void save(Category category) throws Exception
        {
                this.getHibernateTemplate().save(category);
        }
        public Category getCategory(int categoryID)
        {
                return (Category)(this.getHibernateTemplate().get(Category.class, categoryID));
        }
        public List<Category> getCategorys()
        {
                return (List<Category>)(this.getHibernateTemplate().find("from Category"));
        }
}
