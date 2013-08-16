/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.po.Comment;
import com.eboy.service.CommentService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author Tongda
 */
public class DeleteCommentAction extends ActionSupport {

        private CommentService commentService;
        private Integer commentId;
        @Override
        public String execute() {
                Comment comment = commentService.getComment(commentId);
                commentService.deleteComment(comment);
                List<Comment> comments = commentService.getComments();
                ActionContext context = ActionContext.getContext();
                context.put("comments", comments);
                return "success";
        }

        public CommentService getCommentService() {
                return commentService;
        }

        public void setCommentService(CommentService commentService) {
                this.commentService = commentService;
        }

        public Integer getCommentId() {
                return commentId;
        }

        public void setCommentId(Integer commentId) {
                this.commentId = commentId;
        }
        
}
