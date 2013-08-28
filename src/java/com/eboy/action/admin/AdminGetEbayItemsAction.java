/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.ebay.services.finding.Amount;

import com.eboy.api.ExchangeConversion;
import com.eboy.api.FindItemsByKeywords;
import com.eboy.po.Item;
import com.eboy.service.ItemService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wjl
 */
public class AdminGetEbayItemsAction extends ActionSupport {

        private String method;
        private String value;
        private ItemService itemService;

        @Override
        public String execute() {
                List<String> cla = new ArrayList<String>();
                List<Item> items = null;
                String keyword = value;
                FindItemsByKeywords find = new FindItemsByKeywords();
                items = find.execute(keyword);
                for (int i = 0; i < items.size(); i++) {
                        Item item = items.get(i);
                        Amount amount = new Amount();
                        amount.setCurrencyId(item.getItemPriceCurrency());
                        amount.setValue(item.getItemPrice());
                        Amount newAmount = ExchangeConversion.execute(amount);
                        item.setItemPrice(newAmount.getValue());
                        item.setItemPriceCurrency(newAmount.getCurrencyId());
                }
                for (int i = 0; i < items.size(); i++) {
                        if (i % 4 == 3) {
                                cla.add("product_box no_margin_right");
                        } else {
                                cla.add("product_box");
                        }
                }
                ActionContext context = ActionContext.getContext();
                context.put("class", cla);
                context.put("items", items);
                return "success";
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
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
