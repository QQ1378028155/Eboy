/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.api;

import com.ebay.services.finding.Amount;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wjl
 */
public class ExchangeConversion {

        private static Map<String, Double> rateCache;
        private static Map<String, Long> rateExpire;

        public static Amount execute(Amount input) {
                boolean flag = false;
                if (rateCache == null) {
                        rateCache = new HashMap<String, Double>();
                }
                if (rateExpire == null) {
                        rateExpire = new HashMap<String, Long>();
                }

                if (rateCache.containsKey(input.getCurrencyId()) == false) {
                        flag = true;
                } else {
                        long now = System.currentTimeMillis();
                        long past = rateExpire.get(input.getCurrencyId());
                        if (now - past == 1000000) {
                                flag = true;
                        }
                }
                double rate;
                if (flag == true) {
                        String path = "http://qq.ip138.com/hl.asp?from=" + input.getCurrencyId() + "&to=CNY&q=1";
                        try {
                                URL url = new URL(path);
                                HttpURLConnection connection = (HttpURLConnection) (url.openConnection());
                                connection.connect();
                                InputStream in = connection.getInputStream();
                                String content = "";
                                int c;
                                while ((c = in.read()) != -1) {
                                        int all = in.available();
                                        byte[] b = new byte[all];
                                        in.read(b);
                                        content += new String(b, "UTF-8");
                                }
                                String requestMark = "<tr bgcolor=#ffffff align=center><td>1</td><td>";
                                int indexStart = content.indexOf(requestMark) + requestMark.length();
                                int indexEnd = content.substring(indexStart).indexOf("<") + indexStart;
                                String restContent = content.substring(indexStart, indexEnd);
                                rate = Double.parseDouble(restContent);
                                rateCache.put(input.getCurrencyId(), rate);
                                rateExpire.put(input.getCurrencyId(), System.currentTimeMillis());
                        } catch (MalformedURLException ex) {
                                Logger.getLogger(ExchangeConversion.class.getName()).log(Level.SEVERE, null, ex);
                        } catch (IOException ex) {
                                Logger.getLogger(ExchangeConversion.class.getName()).log(Level.SEVERE, null, ex);
                        }
                }

                rate = rateCache.get(input.getCurrencyId());
                Amount amount = new Amount();
                amount.setCurrencyId("CNY");
                double m = rate * input.getValue();
                BigDecimal b = new BigDecimal(m);

                amount.setValue(b.setScale(2, RoundingMode.HALF_UP).doubleValue());
                System.out.println(amount.getValue());
                return amount;
        }
}
