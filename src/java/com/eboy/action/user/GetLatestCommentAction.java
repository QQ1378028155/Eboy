/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.eboy.po.Comment;
import com.eboy.service.CommentService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author game3108
 */
public class GetLatestCommentAction extends ActionSupport {

        private CommentService commentService;

        @Override
        public String execute() {
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
}