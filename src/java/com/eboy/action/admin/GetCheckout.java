/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.po.Item;
import com.eboy.po.Order;
import com.eboy.service.OrderService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author wjl
 */
public class GetCheckout {
        private OrderService orderService;
        
        public List<Item> execute()
        {
                Map<Integer,Item> itemMap = new HashMap<Integer,Item>();
                ArrayList<Item> itemList = new ArrayList<Item>();
                List<Order> orders = getOrderService().getUndeliveredOrders();
                for(int i = 0;i < orders.size();i ++)
                {
                        Item item = orders.get(i).getItem();
                        if(itemMap.containsKey(item.getItemId()) == false)
                        {
                                Item newItem = new Item();
                                newItem.setItemId(item.getItemId());
                                newItem.setItemQuantity(orders.get(i).getOrderQuantity());
                                newItem.setItemTitle(item.getItemTitle());
                                newItem.setItemThumbnailImageUrl(item.getItemThumbnailImageUrl());
                                newItem.setItemPrice(item.getItemPrice());
                                newItem.setItemPriceCurrency(item.getItemPriceCurrency());
                                newItem.setItemSandboxId(item.getItemSandboxId());
                                newItem.setItemEbayId(item.getItemEbayId());
                                itemMap.put(item.getItemId(), newItem);
                                itemList.add(newItem);
                        }
                        else
                        {
                                Item newItem = itemMap.get(item.getItemId());
                                int q = newItem.getItemQuantity() + orders.get(i).getOrderQuantity();
                                newItem.setItemQuantity(q);
                        }
                }
                return itemList;
        }

        public OrderService getOrderService() {
                return orderService;
        }

        public void setOrderService(OrderService orderService) {
                this.orderService = orderService;
        }
        
        
}
