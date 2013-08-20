/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.api;

import com.eboy.po.Item;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author wjl
 */
public class GetShippingCosts {

        public static void execute(Item item){
                Properties config = new Properties();
                try {
                        config.load(new FileInputStream("src/java/config.properties"));
                } catch (IOException ex) {
                        Logger.getLogger(GetShippingCosts.class.getName()).log(Level.SEVERE, null, ex);
                }
                String devID = config.getProperty("DevID");
                String appID = config.getProperty("AppID");
                String certID = config.getProperty("CertID");
                String serverUrl = config.getProperty("ServerUrl");
                String userToken = config.getProperty("UserToken");
                String compatLevel = "831";
                String siteID = "0";
                String verb = "GetShippingCosts";
                String version = "829";
                String encoding = "XML";
                try {
                        URL server = new URL(serverUrl);
                        HttpURLConnection connection = (HttpURLConnection) (server.openConnection());
                        connection.setDoInput(true);
                        connection.setDoOutput(true);
                        connection.setRequestMethod("POST");

                        connection.addRequestProperty("X-EBAY-API-APP-ID", appID);
                        connection.addRequestProperty("X-EBAY-API-VERSION", version);
                        connection.addRequestProperty("X-EBAY-API-SITE-ID", siteID);
                        connection.addRequestProperty("X-EBAY-API-CALL-NAME", verb);
                        connection.addRequestProperty("X-EBAY-API-REQUEST-ENCODING", encoding);
                        connection.addRequestProperty("Content-Type", "text/xml");
                        
                        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                        DocumentBuilder docBuild = factory.newDocumentBuilder();
                        Document xmlDoc = docBuild.parse(new File("src/java/GetShippingCosts.xml"));
                        xmlDoc.getElementsByTagName("ItemID").item(0).getChildNodes().item(0).setNodeValue(item.getItemEbayId());
                       
                        
                        OutputStream out = connection.getOutputStream();
                        TransformerFactory tf = TransformerFactory.newInstance();
                        Transformer tr = tf.newTransformer();
                        Source input = new DOMSource(xmlDoc);
                        Result output = new StreamResult(out);
                        tr.transform(input, output);
                        out.flush();
                        out.close();
                        
                        InputStream in = connection.getInputStream();
                        Document response = docBuild.parse(in);
                        in.close();
                        connection.disconnect();
                        
                        NodeList errorsNode = xmlDoc.getElementsByTagName("Errors");
                        if(errorsNode.getLength() > 0)
                        {
                                Element errElement = (Element)(errorsNode.item(0));
                                Node errCodeNode = errElement.getElementsByTagName("ErrorCode").item(0).getChildNodes().item(0);
                                
                                System.out.println("Error:" + errCodeNode.getNodeValue());
                        }
                        else
                        {
                                org.dom4j.io.DOMReader xmlReader = new org.dom4j.io.DOMReader();
                                System.out.println(xmlReader.read(response).asXML());
                        }
                } catch (MalformedURLException ex) {
                        Logger.getLogger(GetShippingCosts.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                        Logger.getLogger(GetShippingCosts.class.getName()).log(Level.SEVERE, null, ex);
                } catch (TransformerConfigurationException ex) {
                        Logger.getLogger(GetShippingCosts.class.getName()).log(Level.SEVERE, null, ex);
                } catch (ParserConfigurationException ex) {
                        Logger.getLogger(GetShippingCosts.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SAXException ex) {
                        Logger.getLogger(GetShippingCosts.class.getName()).log(Level.SEVERE, null, ex);
                } catch (TransformerException ex) {
                        Logger.getLogger(GetShippingCosts.class.getName()).log(Level.SEVERE, null, ex);
                }
        }
        
        public static void main(String args[])
        {
                Item item = new Item();
                item.setItemEbayId("181195932295");
                GetShippingCosts.execute(item);
        }
}
