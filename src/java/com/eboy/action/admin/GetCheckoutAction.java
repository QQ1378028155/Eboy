/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.po.Item;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author wjl
 */
public class GetCheckoutAction extends ActionSupport{
        
        private GetCheckout getCheckout;
        
        @Override
        public String execute()
        {
                List<Item> itemList = getCheckout.execute();
                ActionContext context = ActionContext.getContext();
                context.put("itemList", itemList);
                return "success";
        }

        
        public GetCheckout getGetCheckout() {
                return getCheckout;
        }

        public void setGetCheckout(GetCheckout getCheckout) {
                this.getCheckout = getCheckout;
        }
}
