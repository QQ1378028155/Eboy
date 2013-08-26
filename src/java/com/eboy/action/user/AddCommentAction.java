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
        private String b;
        private Integer itemId;
        
        @Override
        public String execute() {
                Item item = getItemService().getItem(getItemId());
                getCommentService().addComment( getCommentUserName(), getCommentContent(), Double.parseDouble(getB()), item);

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




        public Integer getItemId() {
                return itemId;
        }

        public void setItemId(Integer itemId) {
                this.itemId = itemId;
        }

        public String getB() {
                return b;
        }

        public void setB(String b) {
                this.b = b;
        }

}
