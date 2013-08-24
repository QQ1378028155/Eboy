/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.ebay.services.finding.Amount;
import com.eboy.api.ExchangeConversion;
import com.eboy.po.Item;
import com.eboy.service.ItemService;
import com.opensymphony.xwork2.ActionSupport;
import java.math.BigDecimal;
import java.math.RoundingMode;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author wjl
 */
public class GetCheckoutFormAction extends ActionSupport {

        private ItemService itemService;
        private double total;

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
                setTotal(0);
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
                        } else {
                                item.setItemPackageCost(0.0);
                        }
                        if (item.getItemImportCost() != null) {
                                amount = new Amount();
                                amount.setValue(item.getItemImportCost());
                                amount.setCurrencyId(item.getItemImportCostCurrency());
                                newAmount = ExchangeConversion.execute(amount);
                                item.setItemImportCostCurrency(newAmount.getCurrencyId());
                                item.setItemImportCost(newAmount.getValue());
                        } else {
                                item.setItemImportCost(0.0);
                        }
                        if (item.getItemShippingCost() != null) {
                                amount = new Amount();
                                amount.setValue(item.getItemShippingCost());
                                amount.setCurrencyId(item.getItemShippingCostCurrency());
                                newAmount = ExchangeConversion.execute(amount);
                                item.setItemShippingCostCurrency(newAmount.getCurrencyId());
                                item.setItemShippingCost(newAmount.getValue());
                        } else {
                                item.setItemShippingCost(0.0);
                        }
                        if (item.getItemInsuranceCost() != null) {
                                amount = new Amount();
                                amount.setValue(item.getItemInsuranceCost());
                                amount.setCurrencyId(item.getItemInsuranceCostCurrency());
                                newAmount = ExchangeConversion.execute(amount);
                                item.setItemInsuranceCostCurrency(newAmount.getCurrencyId());
                                item.setItemInsuranceCost(newAmount.getValue());
                        } else {
                                item.setItemInsuranceCost(0.0);
                        }
                        if (item.getItemTaxCost() != null) {
                                amount = new Amount();
                                amount.setValue(item.getItemTaxCost());
                                amount.setCurrencyId(item.getItemTaxCostCurrency());
                                newAmount = ExchangeConversion.execute(amount);
                                item.setItemTaxCostCurrency(newAmount.getCurrencyId());
                                item.setItemTaxCost(newAmount.getValue());
                        } else {
                                item.setItemTaxCost(0.0);
                        }
                        double price = item.getItemPrice() + item.getItemImportCost() + item.getItemInsuranceCost() + item.getItemPackageCost() + item.getItemShippingCost() + item.getItemTaxCost();
                        BigDecimal b = new BigDecimal(price);
                        item.setItemPrice(b.setScale(2, RoundingMode.HALF_UP).doubleValue());
                        setTotal(getTotal() + (item.getItemPrice() * item.getItemQuantity()));
                        b = new BigDecimal(getTotal());
                        setTotal(b.setScale(2, RoundingMode.HALF_UP).doubleValue());
                }
                return "success";
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }

        public double getTotal() {
                return total;
        }

        public void setTotal(double total) {
                this.total = total;
        }
}
