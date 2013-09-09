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
public class GetCommentsAction extends ActionSupport {

        private CommentService commentService;

        @Override
        public String execute() {
                List<Comment> comments = commentService.getComments();
                ActionContext context = ActionContext.getContext();
                context.put("comments", comments);

                int rateone = 0;
                int ratetwo = 0;
                int ratethree = 0;
                int ratefour = 0;
                int ratefive = 0;
                String rateinfo = "['评分', '个数'],";
                for (int i = 0; i < comments.size(); i++) {
                        Comment comment = comments.get(i);
                        if (comment.getCommentRate() == 1.0) {
                                rateone++;
                        }
                        if (comment.getCommentRate() == 2.0) {
                                ratetwo++;
                        }
                        if (comment.getCommentRate() == 3.0) {
                                ratethree++;
                        }
                        if (comment.getCommentRate() == 4.0) {
                                ratefour++;
                        }
                        if (comment.getCommentRate() == 5.0) {
                                ratefive++;
                        }
                }
                rateinfo = rateinfo  + "['1'," + rateone + "], "
                        + "['2'," + ratetwo + "], "
                        + "['3'," + ratethree + "], "
                        + "['4'," + ratefour + "], "
                        + "['5'," + ratefive + "], ";
                System.out.print("rateinfo**************************" + rateinfo);
                context.put("rateinfo", rateinfo);
                
                return "success";
        }

        public CommentService getCommentService() {
                return commentService;
        }

        public void setCommentService(CommentService commentService) {
                this.commentService = commentService;
        }
}
