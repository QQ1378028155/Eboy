/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.api;

import com.ebay.sdk.ApiContext;
import com.ebay.sdk.ApiCredential;
import com.ebay.sdk.ApiException;
import com.ebay.sdk.SdkException;
import com.ebay.sdk.call.AddItemCall;
import com.ebay.soap.eBLBaseComponents.BuyerPaymentMethodCodeType;
import com.ebay.soap.eBLBaseComponents.CategoryType;
import com.ebay.soap.eBLBaseComponents.FeesType;
import com.ebay.soap.eBLBaseComponents.ItemType;
import com.ebay.soap.eBLBaseComponents.ListingTypeCodeType;
import com.ebay.soap.eBLBaseComponents.PaymentDetailsType;
import com.ebay.soap.eBLBaseComponents.ShippingDetailsType;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wjl
 */
public class AddItem {
        public static String execute(ItemType itemType)
        {
                ApiContext apiContext = new ApiContext();
                ApiCredential cred = apiContext.getApiCredential();
                cred.seteBayToken(ApiConfig.authSandboxToken);
                apiContext.setApiServerUrl(ApiConfig.apiSandboxServerUrl);                
                AddItemCall api = new AddItemCall();
                api.setApiContext(apiContext);
                
//                ItemType newItem = new ItemType();
//                newItem.setListingType(ListingTypeCodeType.FIXED_PRICE_ITEM);
//                newItem.setTitle(itemType.getTitle());
//
//                newItem.setStartPrice(itemType.getSellingStatus().getConvertedCurrentPrice());
//                newItem.setAutoPay(false);
//                newItem.setPictureDetails(itemType.getPictureDetails());
//                newItem.setDescription(itemType.getDescription()+"");
//                newItem.setCurrency(itemType.getCurrency());
//                newItem.setCountry(itemType.getCountry());
//                newItem.setListingDuration(itemType.getListingDuration());
//                newItem.setLocation(itemType.getLocation());
//                newItem.setPrimaryCategory(itemType.getPrimaryCategory());
//                BuyerPaymentMethodCodeType[] bpmcts = new BuyerPaymentMethodCodeType[1];
//                bpmcts[0] = BuyerPaymentMethodCodeType.PAY_PAL;
//                newItem.setConditionID(itemType.getConditionID());
//                newItem.setConditionDefinition(itemType.getConditionDefinition());
//                newItem.setConditionDescription(itemType.getConditionDescription());
//                newItem.setConditionDisplayName(itemType.getConditionDisplayName());
//                
//                
//                newItem.setPaymentMethods(bpmcts);
//                newItem.setPayPalEmailAddress("1378028155@qq.com");
//                
//                newItem.setShippingDetails(itemType.getShippingDetails());
//                newItem.setDispatchTimeMax(10);
//                
//                api.setItem(newItem);
//                itemType.setDescription(itemType.getDescription()+"");
//                itemType.setListingType(ListingTypeCodeType.FIXED_PRICE_ITEM);
//                itemType.setStartPrice(itemType.getSellingStatus().getConvertedCurrentPrice());
////                itemType.setBuyItNowPrice(itemType.getSellingStatus().getConvertedCurrentPrice());
//                itemType.setPayPalEmailAddress("1378028155@qq.com");
//                itemType.setShippingPackageDetails(null);
//                
//                
//                api.setItem(itemType);
                
                ItemType newItem = new ItemType();
                newItem.setTitle(itemType.getTitle());
                newItem.setDescription(itemType.getDescription());
                newItem.setListingType(ListingTypeCodeType.FIXED_PRICE_ITEM);
                newItem.setStartPrice(itemType.getSellingStatus().getConvertedCurrentPrice());
                newItem.setPictureDetails(itemType.getPictureDetails());
                newItem.setListingDuration(itemType.getListingDuration());
                newItem.setCurrency(itemType.getCurrency());
                newItem.setCountry(itemType.getCountry());
                newItem.setLocation(itemType.getLocation());
                
                
                CategoryType ct = new CategoryType();
                ct.setCategoryID("171485");
                ct.setCategoryName("Computers/Tablets &amp; Networking:iPads, Tablets &amp; eBook Readers");
                
                newItem.setPrimaryCategory(ct);

                
                
                
                
                BuyerPaymentMethodCodeType[] bpmcts = new BuyerPaymentMethodCodeType[1];
                bpmcts[0] = BuyerPaymentMethodCodeType.PAY_PAL;
                newItem.setPaymentMethods(bpmcts);
                newItem.setConditionID(itemType.getConditionID());
                newItem.setPayPalEmailAddress("1378028155@qq.com");
               
//                ShippingDetailsType sdt = new ShippingDetailsType();
                newItem.setShippingDetails(itemType.getShippingDetails());
                newItem.setReturnPolicy(itemType.getReturnPolicy());
                newItem.setDispatchTimeMax(itemType.getDispatchTimeMax());
                
                
                api.setItem(newItem);
                
                api.setEndUserIP("59.78.38.83");
                try {
                        FeesType fee = api.addItem();
                        String ebayId = api.getReturnedItemID();
                        System.out.println("sandboxID = " + ebayId);
                        return ebayId;
                } catch (ApiException ex) {
                        Logger.getLogger(GetItem.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SdkException ex) {
                        Logger.getLogger(GetItem.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                        Logger.getLogger(GetItem.class.getName()).log(Level.SEVERE, null, ex);
                }
                return null;
        }
}