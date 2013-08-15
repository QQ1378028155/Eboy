/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.dao;

import com.eboy.po.Gallery;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author wjl
 */
public class GalleryDao extends HibernateDaoSupport
{
        public void save(Gallery gallery) throws Exception
        {
                this.getHibernateTemplate().save(gallery);
        }
        public List<Gallery> getGallerys(long itemId)
        {
                return (List<Gallery>)(this.getHibernateTemplate().find("from Gallery as g where g.item.itemID=?",new Object[]{itemId}));
        }
}
