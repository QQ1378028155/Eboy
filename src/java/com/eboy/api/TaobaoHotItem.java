/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.api;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 *
 * @author wjl
 */
public class TaobaoHotItem {

        public static List<String> hotList = new ArrayList<String>();
        public static List<String> engHotList = new ArrayList<String>();
        public TaobaoHotItem()
        {
                execute();
        }
        
        
        public static void toUtf8(String s) {
                String rc = s;
                String result = "";
                boolean flag = false;
                int u;
                do {
                        u = rc.indexOf("\\u");
                        if (u == -1) {
                                break;
                        }
                        flag = true;
                        String c = rc.substring(u + 2, u + 6);
                        result += rc.substring(0, u);
                        char ch = (char) (Integer.parseInt(c, 16));
                        result = result + ch;
                        rc = rc.substring(u + 6);
                } while (true);

                result += rc;
                hotList.add(result);
                try {
                        String eng = YoudaoTranslate.execute(result);
                        engHotList.add(eng);
                } catch (Exception ex) {
                        Logger.getLogger(TaobaoHotItem.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                
                
        }

        public static void getContent(String Url) {
                URL url;
                try {
                        url = new URL(Url);
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

                        content = content.replaceAll("\\\\/", "/");
                        content = content.replaceAll("\\\\n", "\n");
                        content = content.replaceAll("\\\\t", "\t");
                        content = content.replaceAll("\\\\\"", "\"");
//                        System.out.println(content);
                        String rc = content;
                        int start, end,counter = 0;
                        do {
                                start = rc.indexOf("<i class='tc tc");
                                if (start == -1) {
                                        break;
                                }
                                rc = rc.substring(start);
                                start = rc.indexOf("&exit=0\">");

                                rc = rc.substring(start);
                                end = rc.indexOf("</a>");
                                String s = rc.substring(9, end);
                                if(s.indexOf("/") == -1)
                                        toUtf8(s);
                                counter ++;
                                if(counter >= 20)
                                        break;
                        } while (true);

                } catch (MalformedURLException ex) {
                        Logger.getLogger(TaobaoHotItem.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                        Logger.getLogger(TaobaoHotItem.class.getName()).log(Level.SEVERE, null, ex);
                }
        }

        public static List<String> execute() {
                if(hotList.size() != 0)
                        return hotList;
                URL url;
                try {
                        url = new URL("http://top.taobao.com");
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
                        Document document = Jsoup.parse(content);
                        Elements es = document.getElementsByClass("bangbox");
                        for (int i = 0; i < es.size(); i++) {
                                try {
                                        Element e = es.get(i);
                                        Element eDiv = e.getElementsByClass("subbang").get(0);
                                        Elements eLis = e.getElementsByTag("li");
                                        for(int j = 0;j < eLis.size();j ++)
                                        {
                                                Element eLi = eLis.get(j);
                                                String u = eLi.attr("data-href");
                                                if(u.length() != 0)
                                                        getContent(u);
                                        }

                                } catch (Exception e) {
                                        continue;
                                }
                        }
                } catch (MalformedURLException ex) {
                        Logger.getLogger(TaobaoHotItem.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                        Logger.getLogger(TaobaoHotItem.class.getName()).log(Level.SEVERE, null, ex);
                }
                return hotList;


        }

        public static void main(String args[]) {
                execute();
                for(int i = 0 ;i < hotList.size(); i ++)
                        System.out.println(hotList.get(i));
        }
}
