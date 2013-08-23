/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author wjl
 */
public class AddCartAction extends ActionSupport {

        private String itemQuantity;
        private String itemId;

        @Override
        public String execute() {
                HttpServletRequest request = ServletActionContext.getRequest();
                HttpServletResponse response = ServletActionContext.getResponse();
                Cookie[] cookie = request.getCookies();
                int i, cartSize = 0;
                for (i = 0; i < cookie.length; i++) {
                        if (cookie[i].getName().equals("cartSize")) {
                                cartSize = Integer.parseInt(cookie[i].getValue()) + 1;
                                Cookie c = new Cookie("cartSize", "" + cartSize);
                                c.setPath("/Eboy/");
                                c.setMaxAge(3600 * 24 * 30);
                                response.addCookie(c);
                        }
                }
                if (cartSize == 0) {
                        cartSize = 1;
                        Cookie c = new Cookie("cartSize", "" + cartSize);
                        c.setPath("/Eboy/");
                        c.setMaxAge(3600 * 24 * 30);
                        response.addCookie(c);
                }

                Cookie c = new Cookie("item" + (cartSize - 1), "" + getItemId());
                c.setMaxAge(3600 * 24 * 30);
                c.setPath("/Eboy/");
                response.addCookie(c);

                c = new Cookie("item" + (cartSize - 1) + "Quantity", "" + getItemQuantity());
                c.setMaxAge(3600 * 24 * 30);
                c.setPath("/Eboy/");
                response.addCookie(c);
                return "success";

        }

        public String getItemQuantity() {
                return itemQuantity;
        }

        public void setItemQuantity(String itemQuantity) {
                this.itemQuantity = itemQuantity;
        }

        public String getItemId() {
                return itemId;
        }

        public void setItemId(String itemId) {
                this.itemId = itemId;
        }
}
