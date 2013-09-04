/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.ebay.services.finding.Amount;
import com.eboy.action.user.SortItem;
import com.eboy.api.ExchangeConversion;
import com.eboy.dao.ItemDao;
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
public class SearchItemsFromStoreAction extends ActionSupport
{
        private ItemService itemService;
        private List<Item> itemList;
        
        private String method;
        private String value;
        
        public String execute()
        {

                ActionContext context = ActionContext.getContext();

                List<Item> items = new ArrayList<Item>();
                List<String> cla = new ArrayList<String>();                

                if(getMethod().equals("keyword"))
                        items = getItemService().getItemsOrderBySale(getValue());
                else
                        items = getItemService().getItems();
                for (int i = 0; i < items.size(); i++) {
                        if (i % 4 == 3) {
                                cla.add("product_box no_margin_right");
                        } else {
                                cla.add("product_box");
                        }
                }                
                context.put("class", cla);
                List<Item> newItemList = new ArrayList<Item>();
                List<Item> rateItemList = new ArrayList<Item>();
                List<Item> priceItemList = new ArrayList<Item>();
                List<Item> saleItemList = new ArrayList<Item>();
                int size;
                if (items.size() > 9) {
                        size = 9;
                } else {
                        size = items.size();
                }
                for (int i = 0; i < items.size(); i++) {
                        Item item = items.get(i);
                        Amount amount = new Amount();
                        amount.setCurrencyId(item.getItemPriceCurrency());
                        amount.setValue(item.getItemPrice());
                        Amount newAmount = ExchangeConversion.execute(amount);
                        item.setItemPrice(newAmount.getValue());
                        item.setItemPriceCurrency(newAmount.getCurrencyId());
                }
                newItemList = SortItem.sortByNew(items);
                context.put("newItemList", newItemList);
                rateItemList = SortItem.sortByRate(items);
                context.put("rateItemList", rateItemList);
                saleItemList = SortItem.sortBySale(items);
                context.put("saleItemList", saleItemList);
                priceItemList = SortItem.sortByPrice(items);
                context.put("priceItemList", priceItemList);
                return "success";
        }



        public List<Item> getItemList() {
                return itemList;
        }

        public void setItemList(List<Item> itemList) {
                this.itemList = itemList;
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
