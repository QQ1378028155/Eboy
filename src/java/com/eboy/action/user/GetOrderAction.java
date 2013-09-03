/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.eboy.po.Item;
import com.eboy.po.Order;
import com.eboy.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Tongda
 */
public class GetOrderAction extends ActionSupport {

        private OrderService orderService;

        @Override
        public String execute() {
                int orderId;
                String orderValidate;

                HttpServletRequest request = ServletActionContext.getRequest();
                orderId = Integer.parseInt(request.getParameter("orderId"));
                orderValidate = request.getParameter("orderValidate");
                String responseText = "";
                Order order = orderService.getOrder(orderId);
                if (order == null) 
                        responseText = "failure 该订单不存在";
                else
                {
                        if(order.getOrderValidate().equals(orderValidate) == false)
                                responseText = "failure 订单验证错误";
                        else
                        {
                                Item item = order.getItem();
                                BigDecimal b = new BigDecimal(order.getOrderPrice());
                                double price = b.setScale(2, RoundingMode.HALF_UP).doubleValue();
                                responseText = "success " + item.getItemThumbnailImageUrl().length() + " " + item.getItemTitle().length() + " " + item.getItemThumbnailImageUrl()+item.getItemTitle() + " " + order.getOrderQuantity() + " " + price + " " + order.getOrderStatus() + " " + order.getItem().getItemId();
                        }
                }
                HttpServletResponse response = ServletActionContext.getResponse();
                response.setCharacterEncoding("utf-8");
                response.setContentType("text/plain");
                try {
                        PrintWriter out = response.getWriter();
                        out.print(responseText);
                        out.flush();
                        out.close();
                } catch (IOException ex) {
                        Logger.getLogger(GetOrderAction.class.getName()).log(Level.SEVERE, null, ex);
                }
                return null;
        }

        public OrderService getOrderService() {
                return orderService;
        }

        public void setOrderService(OrderService orderService) {
                this.orderService = orderService;
        }
}
