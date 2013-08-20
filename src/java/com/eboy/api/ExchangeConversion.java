/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.api;

import com.ebay.services.finding.Amount;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wjl
 */
public class ExchangeConversion {
        public static Amount execute(Amount input)
        {
                String path = "http://qq.ip138.com/hl.asp?from="+ input.getCurrencyId() +"&to=CNY&q=1";                
                try {
                        URL url = new URL(path);
                        HttpURLConnection connection = (HttpURLConnection)(url.openConnection());
                        connection.connect();
                        InputStream in = connection.getInputStream();
                        String content = "";
                        int c;
                        while((c = in.read()) != -1)
                        {
                                int all = in.available();
                                byte[] b = new byte[all];
                                in.read(b);
                                content += new String(b,"UTF-8");                                                                                
                        }
                        String requestMark = "<tr bgcolor=#ffffff align=center><td>1</td><td>";
                        int indexStart = content.indexOf(requestMark) + requestMark.length();
                        int indexEnd = content.substring(indexStart).indexOf("<") + indexStart;
                        String restContent = content.substring(indexStart,indexEnd);
                        double rate = Double.parseDouble(restContent);
                        Amount amount = new Amount();
                        amount.setCurrencyId("CNY");
                        amount.setValue(rate * input.getValue());
                        return amount;
                                               
                } catch (MalformedURLException ex) {
                        Logger.getLogger(ExchangeConversion.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                        Logger.getLogger(ExchangeConversion.class.getName()).log(Level.SEVERE, null, ex);
                }
                return null;

        }
}
