/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.opensymphony.xwork2.ActionContext;

/**
 *
 * @author wjl
 */
public class ValidateLogin {
        public static String execute(ActionContext context)
        {
                if(context.getSession().containsKey("login"))
                        return "success";
                else
                        return "failure";
        }
}
