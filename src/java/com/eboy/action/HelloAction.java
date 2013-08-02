/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author wjl
 */
public class HelloAction extends ActionSupport{
        @Override
        public String execute()
        {
                return "success";
        }
}
