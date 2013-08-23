/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.ebay.services.finding.Amount;
import com.eboy.api.ExchangeConversion;
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
public class getNewItemsAction extends ActionSupport
{
        private ItemService itemService;
        @Override
        public String execute()
        {
                List<String> cla = new ArrayList<String>();
                for(int i = 0;i < 9;i ++)
                {
                        if(i % 3 == 2)
                                cla.add("product_box no_margin_right");
                        else
                                cla.add("product_box");
                }
                ActionContext context = ActionContext.getContext();
                context.put("class", cla);
                
                List<Item> items = getItemService().getItems();
                List<Item> itemList = new ArrayList<Item>();
                int size;
                if(items.size() > 9)
                        size = 9;
                else
                        size = items.size();
                for(int i = 0;i < size;i ++)
                {
                        int index = items.size() - i - 1;
                        Item item = items.get(index);
                        Amount amount = new Amount();
                        amount.setCurrencyId(item.getItemPriceCurrency());
                        amount.setValue(item.getItemPrice());
                        Amount newAmount = ExchangeConversion.execute(amount);
                        item.setItemPrice(newAmount.getValue());
                        item.setItemPriceCurrency(newAmount.getCurrencyId());
                        itemList.add(item);
                }
                context.put("itemList", itemList);
                return "success";
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }
}
