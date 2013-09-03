/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.api;

import com.ebay.sdk.ApiContext;
import com.ebay.sdk.ApiCredential;
import com.ebay.sdk.ApiException;
import com.ebay.sdk.SdkException;
import com.ebay.sdk.call.GetItemShippingCall;
import com.ebay.soap.eBLBaseComponents.CountryCodeType;
import com.ebay.soap.eBLBaseComponents.ShippingDetailsType;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wjl
 */
public class GetItemShipping {
        public static ShippingDetailsType execute(String itemEbayId,int itemQuantity)
        {
                ApiContext apiContext = new ApiContext();
                ApiCredential cred = apiContext.getApiCredential();
                cred.seteBayToken(ApiConfig.authEbayToken);
                apiContext.setApiServerUrl(ApiConfig.apiEbayServerUrl);
                
                GetItemShippingCall api = new GetItemShippingCall();
                api.setApiContext(apiContext);
                api.setItemID(itemEbayId);
                api.setDestinationCountryCode(CountryCodeType.CN);
                api.setDestinationPostalCode("201100");
                api.setQuantitySold(itemQuantity);
                try {
                        ShippingDetailsType shippingDetails = api.getItemShipping();
                        return shippingDetails;
                } catch (ApiException ex) {
                        Logger.getLogger(GetItemShipping.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SdkException ex) {
                        Logger.getLogger(GetItemShipping.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                        Logger.getLogger(GetItemShipping.class.getName()).log(Level.SEVERE, null, ex);
                }
                return null;          
        }
        
//        public static void main(String args[])
//        {
//                GetItemShipping api = new GetItemShipping();
//                ShippingDetailsType sdt = api.execute("141029577170");
//        }
}
