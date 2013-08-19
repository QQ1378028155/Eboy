/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.dao;

import com.eboy.po.Comment;
import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 *
 * @author Tongda
 */
public class CommentDao extends HibernateDaoSupport {

        public void save(Comment comment) throws Exception {
                this.getHibernateTemplate().save(comment);
        }
        
        public void delete(Comment comment) throws Exception {
                this.getHibernateTemplate().delete(comment);
        }

        public Comment getComment(Integer commentId) {
                return (Comment) (this.getHibernateTemplate().get(Comment.class, commentId));
        }

        public List<Comment> getComments() {
                return (List<Comment>) (getHibernateTemplate().find("from Comment"));
        }
        
        public List<Comment> getCommentsByItemId(Integer itemId)
        {
                return (List<Comment>)(getHibernateTemplate().find("from Comment where item.itemId=?", itemId));
        }

        public List<Comment> getCommentsByOrderId(Integer itemId) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        }
        
}