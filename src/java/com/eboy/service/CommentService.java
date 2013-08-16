/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.po.Comment;
import java.util.List;

/**
 *
 * @author Tongda
 */
public interface CommentService {    
        List<Comment> getComments();
        Comment getComment(Integer commentId);
        void deleteComment(Comment comment);
}
