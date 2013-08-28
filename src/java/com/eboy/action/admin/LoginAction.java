/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author wjl
 */
public class LoginAction extends ActionSupport{
        private String adminName;
        private String adminPassword;
        
        @Override
        public String execute()
        {
                if(getAdminName().equals("admin") && getAdminPassword().equals("admin"))
                {
                        ActionContext context = ActionContext.getContext();
                        context.getSession().put("login", true);
                        return "success";
                }
                else
                        return "failure";
        }

        public String getAdminName() {
                return adminName;
        }

        public void setAdminName(String adminName) {
                this.adminName = adminName;
        }

        public String getAdminPassword() {
                return adminPassword;
        }

        public void setAdminPassword(String adminPassword) {
                this.adminPassword = adminPassword;
        }
}
