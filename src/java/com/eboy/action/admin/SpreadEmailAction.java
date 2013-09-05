/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.po.Item;
import com.eboy.po.Order;
import com.eboy.service.ItemService;
import com.eboy.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author game3108
 */
public class SpreadEmailAction extends ActionSupport {

    private OrderService orderService;
    private ItemService itemService;
    private Integer itemId;

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }
    // 建立会话
    private MimeMessage message;
    private Session s;

    @Override
    public String execute() {
        System.out.println("excute spreadEmail");
        Properties props = System.getProperties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.user", "ebayproject.localize");
        props.put("mail.smtp.password", "Ebay123456");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.Enable", "true");
        props.put("mail.smtp.socketFactory.fallback", "false");
        s = Session.getInstance(props);
        /* s.setDebug(true);开启后有调试信息 */
        message = new MimeMessage(s);


        Item item = itemService.getItem(itemId);
        List<Order> orderList = orderService.getOrders();

        String title = "Eboy推广：" + item.getItemTitle();
        String content = "<h1>Eboy进入新商品啦</h1>"
                + "<p>尊敬的用户您好，感谢您在百忙之中抽空来阅读本封邮件</p>"
                + "<p>EBOY郑重向您推荐下件产品:</p>"
                + "<p>产品名称：" + item.getItemTitle() + "</p>"
                + "<p>产品价格：" + item.getItemPrice() + "</p>"
                + "<a href = http://localhost:8080/Eboy/jsp/user/loadItemInfo.action?itemId=" + itemId 
                + "><img src='" + item.getItemThumbnailImageUrl() + "'/></a>"
                + "<p>点击图片查看产品详情</p>"
                + "<p>如果我们的邮件打扰到您，您可以退订</p>";

        List<String> emailList = new ArrayList<String>();

        for (int i = orderList.size() - 1; i >= 0; i--) {
            Item tempt = orderList.get(i).getItem();
            if (tempt.getCategory().getCategoryName().equals(item.getCategory().getCategoryName())) {
                int exit = 0;
                for (int j = 0; j < emailList.size(); j++) {
                    if (emailList.get(j).equals(orderList.get(i).getOrderEmail())) {
                        exit = 1;
                    }
                }
                if (exit == 0) {
                    doSendHtmlEmail(title, content, orderList.get(i).getOrderEmail());
                    emailList.add(orderList.get(i).getOrderEmail());
                } else {
                    exit = 0;
                }
            }
        }


        ActionContext context = ActionContext.getContext();
        return "success";
    }

    public void doSendHtmlEmail(String headName, String sendHtml,
            String receiveUser) {
        try {
            // 发件人
            InternetAddress from = new InternetAddress("ebayproject.localize");
            message.setFrom(from);
            // 收件人
            InternetAddress to = new InternetAddress(receiveUser);
            message.setRecipient(Message.RecipientType.TO, to);
            // 邮件标题
            message.setSubject(headName);
            String content = sendHtml.toString();
            // 邮件内容,也可以使纯文本"text/plain"
            message.setContent(content, "text/html;charset=GBK");
            message.saveChanges();
            Transport transport = s.getTransport("smtp");
            // smtp验证，就是你用来发邮件的邮箱用户名密码
            transport.connect("smtp.gmail.com", "ebayproject.localize", "Ebay123456");
            // 发送
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();

        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
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
}
