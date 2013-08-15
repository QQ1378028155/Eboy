/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.api;

import com.ebay.soap.eBLBaseComponents.ItemType;
import com.eboy.po.Item;

/**
 *
 * @author wjl
 */
public class ItemAdapter 
{
        public static Item execute(ItemType itemType)
        {
                Item item = new Item();
                item.setItemEbayId(itemType.getItemID());
                item.setItemTitle(itemType.getTitle());
                item.setItemDescription(itemType.getDescription().getBytes());
                item.setItemQuantity(itemType.getQuantity());
                item.setItemPrice(itemType.getSellingStatus().getCurrentPrice().getValue());
                item.setItemPriceCurrency(itemType.getSellingStatus().getCurrentPrice().getCurrencyID().value());                
                try
                {
                        item.setItemThumbnailImageUrl(itemType.getPictureDetails().getGalleryURL());
                }
                catch(Exception e)
                {
                        item.setItemThumbnailImageUrl("img/nothing.jpg");
                }
                return item;
        }
}
