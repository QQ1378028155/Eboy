/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author wjl
 */
public class FetchFilterAction extends ActionSupport{
        private String method;
        private String value;
        @Override
        public String execute()
        {
                return "success";
        }

        public String getMethod() {
                return method;
        }

        public void setMethod(String method) {
                this.method = method;
        }

        public String getValue() {
                return value;
        }

        public void setValue(String value) {
                this.value = value;
        }
        
}
