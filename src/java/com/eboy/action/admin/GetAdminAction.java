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
public class GetAdminAction extends ActionSupport {

        private String validate;
        private String adminName;

        @Override
        public String execute() 
        {
                ActionContext context = ActionContext.getContext();
                if (context.getSession().containsKey("login"))
                {
                        setValidate("");
                        setAdminName((String) context.getSession().get("login"));
                } 
                else 
                {
                        setValidate("<script>window.location.href = \"login.jsp\"</script>");
                        setAdminName("");
                }
                return  "success";
        }

        public String getValidate() {
                return validate;
        }

        public void setValidate(String validate) {
                this.validate = validate;
        }

        public String getAdminName() {
                return adminName;
        }

        public void setAdminName(String adminName) {
                this.adminName = adminName;
        }


}
