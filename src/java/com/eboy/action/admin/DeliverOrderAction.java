/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.ebay.services.finding.Amount;
import com.ebay.soap.eBLBaseComponents.ShippingDetailsType;
import com.eboy.api.BuyItem;
import com.eboy.api.ExchangeConversion;
import com.eboy.api.GetItemShipping;
import com.eboy.po.Item;
import com.eboy.po.Order;
import com.eboy.po.Statistics;
import com.eboy.service.DeliveryService;
import com.eboy.service.ItemService;
import com.eboy.service.OrderService;
import com.eboy.service.StatisticsService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Tongda
 */
public class DeliverOrderAction extends ActionSupport {

        private OrderService orderService;
        private DeliveryService deliveryService;
        private ItemService itemService;
        private StatisticsService statisticsService;

        @Override
        public String execute() {
                HttpServletRequest request = ServletActionContext.getRequest();

                int orderId = Integer.parseInt(request.getParameter("orderId"));
                Order order = getOrderService().getOrder(orderId);
                order.setOrderStatus("已发货");
                getOrderService().updateDeliverOrder(order);

                Item item = order.getItem();
                item.setItemSoldQuantity(item.getItemSoldQuantity() + order.getOrderQuantity());
                item.setItemQuantity(item.getItemQuantity() - order.getOrderQuantity());

                BuyItem.execute(item.getItemSandboxId(), order.getOrderQuantity(), item.getItemPrice(), item.getItemPriceCurrency());

                ShippingDetailsType sdt = GetItemShipping.execute(item.getItemEbayId(), order.getOrderQuantity());
                System.out.println("                                                               aaaaaaaaaa");
                double costs;
                Amount amount, newAmount;

                amount = new Amount();
                amount.setCurrencyId(item.getItemPriceCurrency());
                amount.setValue(item.getItemPrice());
                newAmount = ExchangeConversion.execute(amount);
                costs = newAmount.getValue();

                System.out.println("                                                               aaaaaaaaaa");
                try {
                        amount = new Amount();
                        amount.setValue(sdt.getCalculatedShippingRate().getPackagingHandlingCosts().getValue());
                        amount.setCurrencyId(sdt.getCalculatedShippingRate().getPackagingHandlingCosts().getCurrencyID().value());
                        newAmount = ExchangeConversion.execute(amount);
                        costs += newAmount.getValue();
                } catch (Exception e) {
                }
                try {
                        amount = new Amount();
                        amount.setValue(sdt.getInternationalShippingServiceOption(0).getImportCharge().getValue());
                        amount.setCurrencyId(sdt.getInternationalShippingServiceOption(0).getImportCharge().getCurrencyID().value());
                        newAmount = ExchangeConversion.execute(amount);
                        costs += newAmount.getValue();
                } catch (Exception e) {
                }
                try {
                        amount = new Amount();
                        amount.setValue(sdt.getInternationalShippingServiceOption(0).getShippingInsuranceCost().getValue());
                        amount.setCurrencyId(sdt.getInternationalShippingServiceOption(0).getShippingInsuranceCost().getCurrencyID().value());
                        newAmount = ExchangeConversion.execute(amount);
                        costs += newAmount.getValue();
                } catch (Exception e) {
                }
                                System.out.println("                                                               aaaaaaaaaa");
                try {
                        amount = new Amount();
                        amount.setValue(sdt.getInternationalShippingServiceOption(0).getShippingServiceCost().getValue());
                        amount.setCurrencyId(sdt.getInternationalShippingServiceOption(0).getShippingServiceCost().getCurrencyID().value());
                        newAmount = ExchangeConversion.execute(amount);
                        costs += newAmount.getValue();
                } catch (Exception e) {
                }
                try {
                        amount = new Amount();
                        amount.setValue(sdt.getSalesTax().getSalesTaxAmount().getValue());
                        amount.setCurrencyId(sdt.getSalesTax().getSalesTaxAmount().getCurrencyID().value());
                        newAmount = ExchangeConversion.execute(amount);
                        costs += newAmount.getValue();
                } catch (Exception e) {
                }
                System.out.println("                                                               aaaaaaaaaa");
                Statistics s = new Statistics();
                s.setStatisticsMoney(-costs);
                s.setStatisticsTime(new Date());
                getStatisticsService().addStatistics(s);



                return null;
        }

        public OrderService getOrderService() {
                return orderService;
        }

        public void setOrderService(OrderService orderService) {
                this.orderService = orderService;
        }

        public DeliveryService getDeliveryService() {
                return deliveryService;
        }

        public void setDeliveryService(DeliveryService deliveryService) {
                this.deliveryService = deliveryService;
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }

        public StatisticsService getStatisticsService() {
                return statisticsService;
        }

        public void setStatisticsService(StatisticsService statisticsService) {
                this.statisticsService = statisticsService;
        }
}
