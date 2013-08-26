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
import java.math.BigDecimal;
import java.math.RoundingMode;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author game3108
 */
public class LoadItemInfoAction extends ActionSupport {

        private ItemService itemService;
        private String itemDescription;

        @Override
        public String execute() {
                
                HttpServletRequest request = ServletActionContext.getRequest();
                int itemId = Integer.parseInt(request.getParameter("itemId"));
                
                Item item = getItemService().getItem(itemId);
                ActionContext context = ActionContext.getContext();


                double money;
                BigDecimal b;
                Amount amount, newAmount;

                amount = new Amount();
                amount.setValue(item.getItemPrice());
                amount.setCurrencyId(item.getItemPriceCurrency());
                newAmount = ExchangeConversion.execute(amount);

                money = newAmount.getValue();
                b = new BigDecimal(money);
                item.setItemPrice(b.setScale(2, RoundingMode.HALF_UP).doubleValue());


                if (item.getItemPackageCost() != null) {
                        amount = new Amount();
                        amount.setValue(item.getItemPackageCost());
                        amount.setCurrencyId(item.getItemPackageCostCurrency());
                        newAmount = ExchangeConversion.execute(amount);

                        money = newAmount.getValue();
                        b = new BigDecimal(money);
                        item.setItemPackageCost(b.setScale(2, RoundingMode.HALF_UP).doubleValue());
                }
                else
                        item.setItemPackageCost(0.0);
                if (item.getItemImportCost() != null) {
                        amount = new Amount();
                        amount.setValue(item.getItemImportCost());
                        amount.setCurrencyId(item.getItemImportCostCurrency());
                        newAmount = ExchangeConversion.execute(amount);

                        money = newAmount.getValue();
                        b = new BigDecimal(money);
                        item.setItemImportCost(b.setScale(2, RoundingMode.HALF_UP).doubleValue());
                }
                else
                        item.setItemImportCost(0.0);
                if (item.getItemShippingCost() != null) {
                        amount = new Amount();
                        amount.setValue(item.getItemShippingCost());
                        amount.setCurrencyId(item.getItemShippingCostCurrency());
                        newAmount = ExchangeConversion.execute(amount);

                        money = newAmount.getValue();
                        b = new BigDecimal(money);
                        item.setItemShippingCost(b.setScale(2, RoundingMode.HALF_UP).doubleValue());
                }
                else
                        item.setItemShippingCost(0.0);
                if (item.getItemInsuranceCost() != null) {
                        amount = new Amount();
                        amount.setValue(item.getItemInsuranceCost());
                        amount.setCurrencyId(item.getItemInsuranceCostCurrency());
                        newAmount = ExchangeConversion.execute(amount);

                        money = newAmount.getValue();
                        b = new BigDecimal(money);
                        item.setItemInsuranceCost(b.setScale(2, RoundingMode.HALF_UP).doubleValue());
                }
                else
                        item.setItemInsuranceCost(0.0);
                if (item.getItemTaxCost() != null) {
                        amount = new Amount();
                        amount.setValue(item.getItemTaxCost());
                        amount.setCurrencyId(item.getItemTaxCostCurrency());
                        newAmount = ExchangeConversion.execute(amount);

                        money = newAmount.getValue();
                        b = new BigDecimal(money);
                        item.setItemTaxCost(b.setScale(2, RoundingMode.HALF_UP).doubleValue());
                }
                else
                        item.setItemTaxCost(0.0);
                itemDescription = new String(item.getItemDescription());
                
                context.put("item", item);
                context.put("commentList", item.getComments());
                return "success";
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }

        public String getItemDescription() {
                return itemDescription;
        }

        public void setItemDescription(String itemDescription) {
                this.itemDescription = itemDescription;
        }

}
