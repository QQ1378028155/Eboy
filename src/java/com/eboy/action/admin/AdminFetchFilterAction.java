/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author Tongda
 */
public class AdminFetchFilterAction extends ActionSupport{
        private String method;
        private String value;
        @Override
        public String execute()
        {
                System.out.println("fetch method ==== "+method);
                System.out.println("fetch value ==== "+value);
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
