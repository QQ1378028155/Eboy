/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.eboy.po.Comment;
import com.eboy.po.Item;
import com.eboy.service.CommentService;
import com.eboy.service.ItemService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author game3108
 */
public class AddCommentAction extends ActionSupport {

        private CommentService commentService;
        private ItemService itemService;
        private String commentUserName;
        private String commentContent;
        private double commentRate;
        private Integer itemId;
        
        @Override
        public String execute() {
                Item item = itemService.getItem(itemId);
                commentService.addComment(commentUserName, commentContent, commentRate, item);
                List<Comment> comments = commentService.getCommentsByItemId(itemId);
                
                ActionContext context = ActionContext.getContext();
                context.put("item", item);
                context.put("comments", comments);
                return "success";
        }

        public CommentService getCommentService() {
                return commentService;
        }

        public void setCommentService(CommentService commentService) {
                this.commentService = commentService;
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }

        public String getCommentUserName() {
                return commentUserName;
        }

        public void setCommentUserName(String commentUserName) {
                this.commentUserName = commentUserName;
        }

        public String getCommentContent() {
                return commentContent;
        }

        public void setCommentContent(String commentContent) {
                this.commentContent = commentContent;
        }



        public double getCommentRate() {
                return commentRate;
        }

        public void setCommentRate(double commentRate) {
                this.commentRate = commentRate;
        }

        public Integer getItemId() {
                return itemId;
        }

        public void setItemId(Integer itemId) {
                this.itemId = itemId;
        }

}
