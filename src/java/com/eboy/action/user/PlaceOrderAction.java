/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.ebay.services.finding.Amount;
import com.eboy.api.ExchangeConversion;
import com.eboy.po.Item;
import com.eboy.po.Order;
import com.eboy.service.ItemService;
import com.eboy.service.OrderService;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author wjl
 */
public class PlaceOrderAction extends ActionSupport
{
        private OrderService orderService;
        private ItemService itemService;
        private String orderAddress;
        private String orderPhone;
        private String orderReceiver;
        private String orderEmail;
        
        public String execute()
        {
                Cookie[] cookie = ServletActionContext.getRequest().getCookies();
                HttpServletResponse response = ServletActionContext.getResponse();
                int i,j,cartSize = 0;
                for(i = 0;i < cookie.length;i ++)
                {
                        if(cookie[i].getName().equals("cartSize"))
                        {
                                cartSize = Integer.parseInt(cookie[i].getValue());
                        }
                }
                if(cartSize == 0)
                       return "Nothing in the Cart!";
                Integer[] itemQuantity = new Integer[cartSize];
                Integer[] itemId = new Integer[cartSize];
                Item[] items = new Item[cartSize];
                for(i = 0;i < cartSize;i ++)
                {
                        
                        for(j = 0;j < cookie.length;j ++)
                        {
                                if(cookie[i].getName().equals("item" + i))
                                        itemId[i] = Integer.parseInt(cookie[i].getValue());
                                if(cookie[i].getName().equals("item"+i + "Quantity"))
                                        itemQuantity[i] = Integer.parseInt(cookie[i].getValue());
                        }
                        items[i] = getItemService().getItem(itemId[i]);
                        if(items[i].getItemQuantity() < itemQuantity[i])
                                return "Request Too much";
                }
                Cookie c;
                for(i = 0;i < cartSize;i ++)
                {
                        Order order = this.placeOrder(itemId[i], itemQuantity[i]);
                        c = new Cookie("item" + i,null);
                        c.setMaxAge(0);
                        response.addCookie(c);
                        c = new Cookie("item" + i+"Quantity",null);
                        c.setMaxAge(0);
                        response.addCookie(c);
                        sendMail(order);
                }
                c = new Cookie("cartSize","0");
                c.setMaxAge(3600 * 24 * 30);
                response.addCookie(c);
                return "success";
        }
        public void sendMail(Order order)
        {
                Properties props = System.getProperties();
                props.setProperty("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.auth", "true");
                Session s = Session.getInstance(props);
                MimeMessage message = new MimeMessage(s);
                try {
                        InternetAddress from = new InternetAddress("ebayproject.localize@gmail.com");
                        message.setFrom(from);
  
                        InternetAddress to = new InternetAddress(getOrderEmail());
                        message.setRecipient(Message.RecipientType.TO,to);
                        
                        message.setSubject("成功添加订单");
                        String content = "您的订单号为 " + order.getOrderId() + ", 认证码为 " + order.getOrderValidate();
                        message.setContent(content, "text/plan;charset=utf8");
                        message.saveChanges();
                        Transport transport = s.getTransport("smtp");
                        transport.connect("smtp.gmail.com","ebayproject.localize","Ebay123456");
                        transport.sendMessage(message, message.getAllRecipients());
                        transport.close();
                } catch (AddressException ex) {
                        Logger.getLogger(PlaceOrderAction.class.getName()).log(Level.SEVERE, null, ex);
                } catch (MessagingException ex) {
                        Logger.getLogger(PlaceOrderAction.class.getName()).log(Level.SEVERE, null, ex);
                }
        }
        
        
        public Order placeOrder(int itemId,int itemQuantity)
        {
                int quantity = itemQuantity;
                Item item = getItemService().getItem(itemId);

                Order order = new Order();
                order.setItem(item);
                order.setOrderQuantity(quantity);
                
                char[] validateCode = new char[62];
                for(int i = 0;i < 26;i ++)
                        validateCode[i] = (char)(48 + i);
                for(int i = 0;i < 10;i ++)
                        validateCode[26 + i] = (char)(65 + i);
                for(int i = 0;i < 26;i ++)
                        validateCode[36 + i] = (char)(97 + i);
                String validate = "";
                for(int i = 0;i < 8;i ++)
                {
                        int index = (int) (Math.random() * 62);
                        validate = validate + validateCode[index];
                }
                order.setOrderValidate(validate);
                Amount amount,newAmount;
                double money = 0;
                amount = new Amount();
                amount.setValue(item.getItemPrice());
                amount.setCurrencyId(item.getItemPriceCurrency());
                newAmount = ExchangeConversion.execute(amount);                       
                money += newAmount.getValue();
                if(item.getItemPackageCost() != null)
                {
                       amount = new Amount();
                       amount.setValue(item.getItemPackageCost());
                       amount.setCurrencyId(item.getItemPackageCostCurrency());
                       newAmount = ExchangeConversion.execute(amount);                       
                       money += newAmount.getValue();
                }
                if(item.getItemImportCost() != null)
                {
                       amount = new Amount();
                       amount.setValue(item.getItemImportCost());
                       amount.setCurrencyId(item.getItemImportCostCurrency());
                       newAmount = ExchangeConversion.execute(amount);                       
                       money += newAmount.getValue();
                }
                if(item.getItemShippingCost() != null)
                {
                       amount = new Amount();
                       amount.setValue(item.getItemShippingCost());
                       amount.setCurrencyId(item.getItemShippingCostCurrency());
                       newAmount = ExchangeConversion.execute(amount);                       
                       money += newAmount.getValue();
                }
                if(item.getItemInsuranceCost() != null)
                {
                       amount = new Amount();
                       amount.setValue(item.getItemInsuranceCost());
                       amount.setCurrencyId(item.getItemInsuranceCostCurrency());
                       newAmount = ExchangeConversion.execute(amount);                       
                       money += newAmount.getValue();
                }
                if(item.getItemTaxCost() != null)
                {
                       amount = new Amount();
                       amount.setValue(item.getItemTaxCost());
                       amount.setCurrencyId(item.getItemTaxCostCurrency());
                       newAmount = ExchangeConversion.execute(amount);                       
                       money += newAmount.getValue();
                }
                order.setOrderPrice(money * quantity);
                order.setOrderAddress(getOrderAddress());
                order.setOrderStatus("未发货");
                order.setOrderPhone(getOrderPhone());
                order.setOrderReceiver(getOrderReceiver());
                order.setOrderEmail(getOrderEmail());
                getOrderService().saveOrder(order);
                item.setItemQuantity(item.getItemQuantity()-quantity);
                item.setItemSoldQuantity(item.getItemSoldQuantity() + quantity);
                getItemService().updateItem(item);     
                return order;
        }

        public OrderService getOrderService() {
                return orderService;
        }

        public void setOrderService(OrderService orderService) {
                this.orderService = orderService;
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }

        public String getOrderAddress() {
                return orderAddress;
        }

        public void setOrderAddress(String orderAddress) {
                this.orderAddress = orderAddress;
        }

        public String getOrderPhone() {
                return orderPhone;
        }

        public void setOrderPhone(String orderPhone) {
                this.orderPhone = orderPhone;
        }

        public String getOrderReceiver() {
                return orderReceiver;
        }

        public void setOrderReceiver(String orderReceiver) {
                this.orderReceiver = orderReceiver;
        }

        public String getOrderEmail() {
                return orderEmail;
        }

        public void setOrderEmail(String orderEmail) {
                this.orderEmail = orderEmail;
        }
}
