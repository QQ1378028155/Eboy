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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author wjl
 */
public class GetCartAction extends ActionSupport {

        private ItemService itemService;

        @Override
        public String execute() {
                HttpServletRequest request = ServletActionContext.getRequest();
                Cookie[] cookie = request.getCookies();
                int cartSize = 0;
                for (int i = 0; i < cookie.length; i++) {
                        if (cookie[i].getName().equals("cartSize")) {
                                cartSize = Integer.parseInt(cookie[i].getValue());
                                break;
                        }
                }
                if (cartSize == 0) {
                        return "Nothing in the Cart";
                }

                ArrayList<Item> cartList = new ArrayList();
                for (int i = 0; i < cartSize; i++) {
                        int itemId = 0, itemQuantity = 0;

                        for (int j = 0; j < cookie.length; j++) {
                                if (cookie[j].getName().equals("item" + i)) {
                                        itemId = Integer.parseInt(cookie[j].getValue());
                                }
                                if (cookie[j].getName().equals("item" + i + "Quantity")) {
                                        itemQuantity = Integer.parseInt(cookie[j].getValue());
                                }
                        }
                        Item item = getItemService().getItem(itemId);
                        item.setItemQuantity(itemQuantity);

                        
                        
                        
                        
                        Amount amount, newAmount;
                        amount = new Amount();
                        amount.setCurrencyId(item.getItemPriceCurrency());
                        amount.setValue(item.getItemPrice());
                        newAmount = ExchangeConversion.execute(amount);
                        item.setItemPriceCurrency(newAmount.getCurrencyId());
                        item.setItemPrice(newAmount.getValue());

                        if (item.getItemPackageCost() != null) {
                                amount = new Amount();
                                amount.setValue(item.getItemPackageCost());
                                amount.setCurrencyId(item.getItemPackageCostCurrency());
                                newAmount = ExchangeConversion.execute(amount);
                                item.setItemPackageCostCurrency(newAmount.getCurrencyId());
                                item.setItemPackageCost(newAmount.getValue());
                        }
                        else
                                item.setItemPackageCost(0.0);
                        if (item.getItemImportCost() != null) {
                                amount = new Amount();
                                amount.setValue(item.getItemImportCost());
                                amount.setCurrencyId(item.getItemImportCostCurrency());
                                newAmount = ExchangeConversion.execute(amount);
                                item.setItemImportCostCurrency(newAmount.getCurrencyId());
                                item.setItemImportCost(newAmount.getValue());
                        }
                        else
                                item.setItemImportCost(0.0);
                        if (item.getItemShippingCost() != null) {
                                amount = new Amount();
                                amount.setValue(item.getItemShippingCost());
                                amount.setCurrencyId(item.getItemShippingCostCurrency());
                                newAmount = ExchangeConversion.execute(amount);
                                item.setItemShippingCostCurrency(newAmount.getCurrencyId());
                                item.setItemShippingCost(newAmount.getValue());
                        }
                        else
                                item.setItemShippingCost(0.0);
                        if (item.getItemInsuranceCost() != null) {
                                amount = new Amount();
                                amount.setValue(item.getItemInsuranceCost());
                                amount.setCurrencyId(item.getItemInsuranceCostCurrency());
                                newAmount = ExchangeConversion.execute(amount);
                                item.setItemInsuranceCostCurrency(newAmount.getCurrencyId());
                                item.setItemInsuranceCost(newAmount.getValue());
                        }
                        else
                                item.setItemInsuranceCost(0.0);
                        if (item.getItemTaxCost() != null) {
                                amount = new Amount();
                                amount.setValue(item.getItemTaxCost());
                                amount.setCurrencyId(item.getItemTaxCostCurrency());
                                newAmount = ExchangeConversion.execute(amount);
                                item.setItemTaxCostCurrency(newAmount.getCurrencyId());
                                item.setItemTaxCost(newAmount.getValue());
                        }
                        else
                                item.setItemTaxCost(0.0);
                        item.setItemPrice(itemQuantity * item.getItemPrice());
                        item.setItemImportCost(itemQuantity * item.getItemImportCost());
                        item.setItemShippingCost(itemQuantity * item.getItemShippingCost());
                        item.setItemInsuranceCost(itemQuantity * item.getItemInsuranceCost());
                        item.setItemPackageCost(itemQuantity * item.getItemPackageCost());
                        item.setItemTaxCost(itemQuantity * item.getItemTaxCost());
                        cartList.add(item);
                }
                ActionContext.getContext().put("cartList", cartList);
                return "success";
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }
}
