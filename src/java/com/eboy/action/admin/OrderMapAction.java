/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.api.YoudaoTranslate;
import com.eboy.po.Order;
import com.eboy.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Tongda
 */
public class OrderMapAction extends ActionSupport {

        private OrderService orderService;

        class Pair {

                String orderAddress;
                int orderNumber;
        }

        @Override
        public String execute() {
                String orderinfo = "";
                List<Order> orders = orderService.getOrders();
                List<Pair> pairs = new ArrayList<Pair>();
                for (int i = 0; i < orders.size(); i++) {
                        Order order = orders.get(i);
                        boolean addflag = false;
                        for (int j = 0; j < pairs.size(); j++) {
                                if (order.getOrderAddress().equals(pairs.get(j).orderAddress)) {
                                        pairs.get(j).orderNumber++;
                                        addflag = true;
                                        break;
                                }
                        }
                        if (addflag == false || pairs.isEmpty()) {
                                Pair pair = new Pair();
                                pair.orderAddress = order.getOrderAddress();
                                pair.orderNumber = 1;
                                pairs.add(pair);
                        }
                }
                for (int i = 0; i < pairs.size(); i++) {
                        String englishAddress;
                        try {
                                englishAddress = YoudaoTranslate.execute(pairs.get(i).orderAddress);
                                orderinfo = orderinfo + englishAddress + "|" + pairs.get(i).orderNumber + "|";
                        } catch (Exception ex) {
                                Logger.getLogger(OrderMapAction.class.getName()).log(Level.SEVERE, null, ex);
                        }
                }
                ActionContext context = ActionContext.getContext();
                context.put("orderinfo", orderinfo);
                System.out.println("*******************************************orderinfo" + orderinfo);
                return "success";
        }

        public OrderService getOrderService() {
                return orderService;
        }

        public void setOrderService(OrderService orderService) {
                this.orderService = orderService;
        }
}
