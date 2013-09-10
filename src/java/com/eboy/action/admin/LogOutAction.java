/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author Tongda
 */
public class LogOutAction extends ActionSupport {
        @Override
        public String execute() {
                ActionContext context = ActionContext.getContext();
                context.getSession().clear();
                return "success";
        }
}
