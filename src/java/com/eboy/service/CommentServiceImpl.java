/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.dao.CommentDao;
import com.eboy.po.Comment;
import com.eboy.po.Item;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tongda
 */
public class CommentServiceImpl implements CommentService{

        private CommentDao commentDao;

        public CommentDao getCommentDao() {
                return commentDao;
        }

        public void setCommentDao(CommentDao commentDao) {
                this.commentDao = commentDao;
        }

        @Override
        public List<Comment> getComments() {
                return this.commentDao.getComments();
        }

        @Override
        public Comment getComment(Integer commentId) {
               return commentDao.getComment(commentId);
        }

        @Override
        public void deleteComment(Comment comment) {
                try {
                        this.commentDao.delete(comment);
                } catch (Exception ex) {
                        Logger.getLogger(CommentServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
        }

        @Override
        public void addComment(String commentUserName, String commentContent, double commentRate, Item item) {
                Comment comment = new Comment();
                comment.setCommentUserName(commentUserName);
                comment.setCommentContent(commentContent);
                comment.setCommentRate(commentRate);
                comment.setItem(item);;
                try {
                        commentDao.save(comment);
                } catch (Exception ex) {
                        Logger.getLogger(CommentServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
        }

        @Override
        public List<Comment> getCommentsByItemId(Integer itemId) {
                return this.commentDao.getCommentsByItemId(itemId);
        }
}
