/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.api;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.nodes.TextNode;

/**
 *
 * @author wjl
 */
public class HtmlParser {
        
        public static String execute(String html)
        {
                Document document = Jsoup.parse(html);
                HtmlParser.recursion(document.body());
                String newHtml = document.body().toString();
                newHtml = newHtml.substring(6, newHtml.length() - 7);
                System.out.println(newHtml);
                return newHtml;
        }
        
        public static void recursion(Node e)
        {
                if(e.nodeName().equals("#text"))
                {
                        String value = ((TextNode)e).text();
                        try {
                                if(!value.equals(" "))
                                {
                                        String newValue = YoudaoTranslate.execute(value);
                                        ((TextNode)e).text(newValue);
                                }
                        } catch (Exception ex) {
                                Logger.getLogger(HtmlParser.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        return;
                }
                
                List<Node> nodes = e.childNodes();
                for(int i = 0;i < nodes.size();i ++)
                        recursion(nodes.get(i));
        }
        
//        
//        public static void main(String args[])
//        {
//                HtmlParser.execute("<p style=\"margin: 5px 0px 0px 5px;\"><table align=\"center\" border=\"0\" width=\"70%\">\n" +
//"<tbody>\n" +
//"<tr>\n" +
//"<td style=\"text-align: center;\" width=\"481\"><strong><font face=\"Tahoma, Verdana, Arial, sans-serif\" size=\"6\"><span style=\"color: rgb(255, 0, 16);\">1000</span> MAGIC: THE GATHERING CARDS COLLECTION WITH RARES &amp; FOILS!<br></font></strong></td></tr></tbody></table><br>\n" +
//"<table align=\"center\" bgcolor=\"#003366\" border=\"0\" width=\"95%\">\n" +
//"<tbody>\n" +
//"<tr>\n" +
//"<td>\n" +
//"<table align=\"center\" bgcolor=\"#e0e8e9\" border=\"0\" cellpadding=\"2\" cellspacing=\"2\" width=\"100%\">\n" +
//"<tbody>\n" +
//"<tr>\n" +
//"<td align=\"left\" width=\"375px\">\n" +
//"<p align=\"center\"><font face=\"Tahoma, Verdana, sans-serif\" size=\"-1\"><img alt=\"2inMagicTGLogo_4c\" src=\"http://imgs.inkfrog.com/pix/muniverse/1000T01.jpg\" width=\"350\"></font><br><font face=\"Tahoma, Verdana, sans-serif\" size=\"-1\"><b>(Stock Photo of Previously Sold Lot - These Will Not Be The Specific Cards You Receive)</b> <br></font></p><p style=\"text-align: center;\"><span style=\"color: rgb(0, 66, 154); font-family: 'Arial Black';\">Normally,\n" +
//"to\n" +
//"get 1000 MTG cards you would have to buy over 66 booster\n" +
//"packs at a retail price of over $250.00! Don't Miss This Special!</span></p><p style=\"text-align: center; color: rgb(0, 66, 154);\"><font face=\"Tahoma, Verdana, sans-serif\" size=\"-1\"><font size=\"4\"><span style=\"font-weight: bold;\"></span></font></font></p></td>\n" +
//"<td align=\"left\">\n" +
//"<blockquote><font color=\"#0033ff\" face=\"Tahoma, Verdana, sans-serif\"><span style=\"color: rgb(255, 0, 16);\"><span style=\"color: rgb(0, 0, 0);\"><span style=\"font-family: 'Comic Sans MS'; color: rgb(0, 66, 154);\"><br><font size=\"5\"><span style=\"font-weight: bold;\">Item Details:</span>&nbsp;</font></span></span></span></font></blockquote><blockquote><ul><li><span style=\"font-family: 'Comic Sans MS';\"><font size=\"5\"><b><font color=\"#00429a\">Includes at &nbsp;least </font><font color=\"#ff0010\"><u>15 rares</u></font><font color=\"#00429a\"> and </font><font color=\"#ff0010\"><u>5 foil</u></font><font color=\"#00429a\"> cards.&nbsp;</font></b></font></span></li><li><span style=\"font-family: 'Comic Sans MS';\"><font color=\"#00429a\" size=\"5\">A <b>great variety</b> of uncommons and commons comprised of a mix of sets and colors!&nbsp;</font></span></li><li><font size=\"5\"><span style=\"font-family: 'Comic Sans MS';\"><font color=\"#00429a\"><b>English</b> cards and NO basic lands!</font></span></font></li><li><font size=\"5\"><span style=\"color: rgb(0, 66, 154); font-family: 'Comic Sans MS';\"><b>Low duplication!</b>&nbsp;Few cards with more than four copies!&nbsp;</span></font></li><li><font size=\"5\"><span style=\"color: rgb(0, 66, 154); font-family: 'Comic Sans MS';\"><b>Bonus cards!</b>&nbsp; We include extra cards in every lot in case a few non-English, excessive duplicates, or basic lands do slip by!</span></font></li></ul><font color=\"#0033ff\" face=\"Tahoma, Verdana, sans-serif\" size=\"4\"><span style=\"color: rgb(255, 0, 16);\"><span style=\"color: rgb(0, 0, 0);\"><span style=\"font-family: Comic Sans MS; color: rgb(0, 66, 154);\"><br>These lots make for an ideal gift and are a fun way to get into the Magic: The Gathering card game or to add to an existing collection!<br></span></span></span></font><font color=\"#0033ff\" face=\"Tahoma, Verdana, sans-serif\" size=\"4\"><span style=\"color: rgb(255, 0, 16);\"><span style=\"color: rgb(0, 0, 0);\"><span style=\"font-family: Comic Sans MS; color: rgb(0, 66, 154);\"></span></span></span></font><p align=\"center\"><font color=\"#0033ff\" face=\"Tahoma, Verdana, sans-serif\" size=\"-1\"><span style=\"font-weight: bold; text-decoration: underline;\"></span></font></p></blockquote></td></tr></tbody></table></td></tr></tbody></table>\n" +
//"<table align=\"center\" bgcolor=\"#e0e8e9\" border=\"0\" cellpadding=\"5\" cellspacing=\"0\" width=\"95%\">\n" +
//"<tbody>\n" +
//"<tr>\n" +
//"<td>\n" +
//"<blockquote><font size=\"2\"><br><div style=\"text-align: center;\"><span style=\"font-family: Arial; font-size: medium;\"><b>CUSTOMER SATISFACTION:</b></span><span style=\"font-weight: bold; font-family: Arial; font-size: medium;\">&nbsp;</span><span style=\"font-family: Arial; font-size: medium;\">We strive to provide the best product and service possible!</span><span style=\"font-family: Arial; font-size: medium;\"><b> &nbsp;</b><b><font color=\"#ff0010\">If you are unhappy for any reason please send us a message through eBay</font></b> </span><span style=\"font-family: Arial; font-size: medium;\">so we can correct any problem before you leave feedback! Please give us time to respond! We want you to be happy!</span></div></font></blockquote></td></tr></tbody></table></p><br><br>\n" +
//"<table align=\"center\" bgcolor=\"#e0e8e9\" border=\"2\" bordercolor=\"#003366\" Ã‚Â cellpadding=\"5\" cellspacing=\"0\" width=\"700px\">\n" +
//"<tbody><tr><td><div style=\"text-align: center;\"><b><font size=\"5\">Check Out Our Other <font color=\"#ff0010\">E</font><font color=\"#00429a\">B</font><font color=\"#fff125\">A</font><font color=\"#00ae5f\">Y</font>&nbsp;Auctions!</font></b></div><br><table align=\"center\" bgcolor=\"#e0e8e9\" border=\"0\" cellpadding=\"5\" cellspacing=\"0\" width=\"100%\"><tbody><tr>\n" +
//"<td width=\"67%\"><p align=\"center\"><b><font size=\"4\">Improve Your Card Lot With:<br><table><tbody><tr>\n" +
//"<td><p align=\"center\"><a href=\"http://stores.ebay.com/THE-MAGIC-UNIVERSE-STORE/_i.html?_nkw=80+mtg+foils&amp;submit=Search&amp;_sid=8159763\"><img src=\"http://imgs.inkfrog.com/pix/muniverse/80MTGF.jpg\" width=\"200px\" height=\"180px\"><br><b>80 MTG Foils</b></a></p></td>\n" +
//"<td><p align=\"center\"><a href=\"http://stores.ebay.com/THE-MAGIC-UNIVERSE-STORE/_i.html?_nkw=100+mtg+rares+only&amp;submit=Search&amp;_sid=8159763\"><img src=\"http://imgs.inkfrog.com/pix/muniverse/100mtgrares.jpg\" width=\"200px\" height=\"180px\"><br><b>100 MTG Rares</b></a></p></td></tr></tbody></table>\n" +
//"</font></b></p></td>\n" +
//"<td width=\"33%\"><p align=\"center\"><b><font size=\"4\">Or Upgrade To:<br><table><tbody><tr>\n" +
//"<td><p align=\"center\"><a href=\"http://stores.ebay.com/THE-MAGIC-UNIVERSE-STORE/_i.html?_nkw=3000+mtg&amp;submit=Search&amp;_sid=8159763\"><img src=\"http://imgs.inkfrog.com/pix/muniverse/mtg3000f_001.jpg\" width=\"200px\" height=\"180px\"><br><b>3000 MTG Cards w/100 Rares</b></a></p></td></tr></tbody></table></font></b></p></td></tr></tbody></table><blockquote><p align=\"center\"><font face=\"Tahoma, Verdana, sans-serif\"><font size=\"3\">US Shipping &amp; Handling is <span style=\"color: red; font-weight: bold;\">reduced by 50%</span> on each additional item purchased!</font></font><br><font size=\"-1\">The item with the highest shipping &amp; handling charge is considered the 1st item. All items must be paid for using one payment. Please wait for a combined invoice!</font></p>\n" +
//"</blockquote></td></tr></tbody></table>");
//        }
}
