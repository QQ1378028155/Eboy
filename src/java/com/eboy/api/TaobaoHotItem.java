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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wjl
 */
public class TaobaoHotItem {

        public static String toUtf8(String s)
        {
                String rc = s;
                String eng = "";
                String chn = "";
                int u;
                do
                {
                        u = rc.indexOf("\\u");
                        if(u == -1)
                                break;
                        String c = rc.substring(u + 2, u + 6);
                        eng += rc.substring(0,u);
                        char ch = (char)(Integer.parseInt(c, 16));
                        chn = chn +  ch;
                        rc = rc.substring(u + 6);
                }while(true);
                
                eng += rc;
                boolean flag = false;
                for(int i = 0;i < eng.length();i ++)
                {
                        if(eng.charAt(i) != ' ')
                                flag = true;
                }
                System.out.println(eng.length());
                
                if(flag == true)
                {
                        System.out.println(eng);
                        System.out.println();
                        return null;
                }
                
                String trans = null;
                try {
                        trans = YoudaoTranslate.execute(chn);
                } catch (Exception ex) {
                        Logger.getLogger(TaobaoHotItem.class.getName()).log(Level.SEVERE, null, ex);
                }
                System.out.println(trans);
                System.out.println();
                
                return null;
        }
        public static List<String> getContent(String Url){
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
                        int start,end;
                        do
                        {
                                start = rc.indexOf("<i class='tc tc");
                                if(start == -1)
                                        break;
                                rc = rc.substring(start);
                                start = rc.indexOf("&exit=0\">");
                                
                                rc = rc.substring(start);
                                end = rc.indexOf("</a>");
                                String s = rc.substring(9, end);
                                System.out.println(s);
                                toUtf8(s);
                                
                        }while(true);
                        
//                        do
//                        {
//                                
//                        }while(true);
//                        
                        
                } catch (MalformedURLException ex) {
                        Logger.getLogger(TaobaoHotItem.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                        Logger.getLogger(TaobaoHotItem.class.getName()).log(Level.SEVERE, null, ex);
                }

                return null;
        }

        public static void execute() {
                getContent("http://top.taobao.com/interfacebangbox.php?cat=50006843&from=");
        }

        public static void main(String args[]) {
                execute();
        }
}
