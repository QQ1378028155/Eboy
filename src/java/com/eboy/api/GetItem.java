/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.api;

import com.ebay.sdk.ApiContext;
import com.ebay.sdk.ApiCredential;
import com.ebay.sdk.ApiException;
import com.ebay.sdk.SdkException;
import com.ebay.sdk.call.GetItemCall;
import com.ebay.soap.eBLBaseComponents.DetailLevelCodeType;
import com.ebay.soap.eBLBaseComponents.ItemType;
import com.eboy.po.Item;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wjl
 */
public class GetItem {

        public static ItemType execute(String itemEbayId, boolean product) {
                ApiContext apiContext = new ApiContext();
                ApiCredential cred = apiContext.getApiCredential();
                if (product == true) {
                        cred.seteBayToken(ApiConfig.authEbayToken);
                        apiContext.setApiServerUrl(ApiConfig.apiEbayServerUrl);
                } 
                else 
                {
                        cred.seteBayToken(ApiConfig.authSandboxToken);
                        apiContext.setApiServerUrl(ApiConfig.apiSandboxServerUrl);
                }
                GetItemCall api = new GetItemCall();
                api.setApiContext(apiContext);
                api.setItemID(itemEbayId);
                api.setIncludeCrossPromotion(true);
                api.setIncludeItemCompatibilityList(true);
                api.setIncludeItemSpecifics(true);
                api.setIncludeTaxTable(true);
                DetailLevelCodeType[] dlct = new DetailLevelCodeType[1];
                dlct[0] = DetailLevelCodeType.RETURN_ALL;
                api.setDetailLevel(dlct);
                api.setEndUserIP("59.78.38.83");
                try {
                        ItemType itemType = api.getItem();
                        return itemType;
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
