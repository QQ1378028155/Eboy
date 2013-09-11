/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.dao;

import com.eboy.po.Mlc;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;



/**
 *
 * @author wjl
 */
public class MlcDao extends HibernateDaoSupport{

        public void save(Mlc mlc)
        {
                this.getHibernateTemplate().save(mlc);
        }
        public Mlc getMlc()
        {
                List<Mlc> mlcList = this.getHibernateTemplate().find("from Mlc");
                return mlcList.get(mlcList.size() - 1);
        }
}
