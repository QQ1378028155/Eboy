/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.api;

import com.ebay.sdk.ApiContext;
import com.ebay.sdk.ApiCredential;
import com.ebay.sdk.ApiException;
import com.ebay.sdk.SdkException;
import com.ebay.sdk.call.PlaceOfferCall;
import com.ebay.soap.eBLBaseComponents.AmountType;
import com.ebay.soap.eBLBaseComponents.BidActionCodeType;
import com.ebay.soap.eBLBaseComponents.CurrencyCodeType;
import com.ebay.soap.eBLBaseComponents.OfferType;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wjl
 */
public class BuyItem {
        public static void execute(String itemEbayId,int itemQuantity,double itemPrice,String itemPriceCurrency)
        {
                ApiContext apiContext = new ApiContext();
                ApiCredential cred = apiContext.getApiCredential();
                cred.seteBayToken(ApiConfig.authSandboxBuyerToken);
                apiContext.setApiServerUrl(ApiConfig.apiSandboxServerUrl);
                PlaceOfferCall api = new PlaceOfferCall();
                api.setApiContext(apiContext);
                api.setItemID(itemEbayId);
                OfferType offer = new OfferType();
                offer.setAction(BidActionCodeType.PURCHASE);
                AmountType amount = new AmountType();
                amount.setValue(itemPrice);
                amount.setCurrencyID(CurrencyCodeType.valueOf(itemPriceCurrency));
                offer.setMaxBid(amount);
                offer.setQuantity(itemQuantity);
                api.setOffer(offer);                
                api.setEndUserIP("59.78.38.83");
                try {
                        api.placeOffer();
                } catch (ApiException ex) {
                        Logger.getLogger(BuyItem.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SdkException ex) {
                        Logger.getLogger(BuyItem.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                        Logger.getLogger(BuyItem.class.getName()).log(Level.SEVERE, null, ex);
                }
        }
        
        public static void main(String args[])
        {
                BuyItem.execute("110121414657", 1, 470.0,"USD");
        }
        
}
