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

/**
 *
 * @author wjl
 */
public class PlaceOrderAction extends ActionSupport
{
        private OrderService orderService;
        private ItemService itemService;
        private String itemId;
        private String itemQuantity;
        private String orderAddress;
        private String orderPhone;
        private String orderReceiver;
        private String orderEmail;
        @Override
        public String execute()
        {
                int quantity = Integer.parseInt(itemQuantity);
                Item item = itemService.getItem(Integer.parseInt(itemId));
                if(item.getItemQuantity() < quantity)
                        return "not enough";
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
                order.setOrderAddress(orderAddress);
                order.setOrderStatus("未发货");
                order.setOrderPhone(orderPhone);
                order.setOrderReceiver(orderReceiver);
                order.setOrderEmail(orderEmail);
                orderService.saveOrder(order);
                item.setItemQuantity(item.getItemQuantity()-quantity);
                item.setItemSoldQuantity(item.getItemSoldQuantity() + quantity);
                itemService.updateItem(item);
                
                Properties props = System.getProperties();
                props.setProperty("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.auth", "true");
                Session s = Session.getInstance(props);
                MimeMessage message = new MimeMessage(s);
                try {
                        InternetAddress from = new InternetAddress("ebayproject.localize@gmail.com");
                        message.setFrom(from);
  
                        InternetAddress to = new InternetAddress(orderEmail);
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
                
                return "success";
        }
}
