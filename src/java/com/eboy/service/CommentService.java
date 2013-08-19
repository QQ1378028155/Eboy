/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.po.Comment;
import com.eboy.po.Item;
import java.util.List;

/**
 *
 * @author Tongda
 */
public interface CommentService {    
        List<Comment> getComments();
        Comment getComment(Integer commentId);
        void deleteComment(Comment comment);
        void addComment(String commentUserName,String commentContent
                ,double commentRate,Item item );
        List<Comment> getCommentsByItemId(Integer itemId);
}
