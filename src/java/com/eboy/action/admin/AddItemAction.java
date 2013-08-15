/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.ebay.soap.eBLBaseComponents.ItemType;
import com.ebay.soap.eBLBaseComponents.PictureDetailsType;
import com.ebay.soap.eBLBaseComponents.ShippingDetailsType;
import com.eboy.api.AddItem;
import com.eboy.api.GetItem;
import com.eboy.api.GetItemShipping;
import com.eboy.api.ItemAdapter;
import com.eboy.po.Category;
import com.eboy.po.Gallery;
import com.eboy.po.Item;
import com.eboy.service.CategoryService;
import com.eboy.service.GalleryService;
import com.eboy.service.ItemService;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author wjl
 */
public class AddItemAction extends ActionSupport
{
        private CategoryService categoryService;
        private ItemService itemService;
        private GalleryService galleryService;
        private String itemEbayId;
        private String itemTitle;
        private String itemDescription;
        private String itemCategoryId;
        @Override
        public String execute()
        {
                System.out.println("                                                                      " + getItemEbayId());
                ItemType itemType = GetItem.execute(getItemEbayId());
                String itemSandboxId =  AddItem.execute(itemType);
                
                Item item = ItemAdapter.execute(itemType);
                item.setItemEbayId(getItemEbayId());
                item.setItemTitle(getItemTitle());
                item.setItemDescription(getItemDescription().getBytes());
                item.setItemSandboxId(itemSandboxId);
                Category category = getCategoryService().getCategorys().get(Integer.parseInt(getItemCategoryId()) - 1);
                item.setCategory(category);
                
                ShippingDetailsType sdt = GetItemShipping.execute(getItemEbayId());
                try
                {
                        item.setItemPackageCost(sdt.getCalculatedShippingRate().getPackagingHandlingCosts().getValue());
                        item.setItemPackageCostCurrency(sdt.getCalculatedShippingRate().getPackagingHandlingCosts().getCurrencyID().value());
                }
                catch(Exception e)
                {
                        
                }
                try
                {
                        item.setItemImportCost(sdt.getInternationalShippingServiceOption(0).getImportCharge().getValue());
                        item.setItemImportCostCurrency(sdt.getInternationalShippingServiceOption(0).getImportCharge().getCurrencyID().value());
                }
                catch(Exception e)
                {
                        
                }
                try
                {
                        item.setItemInsuranceCost(sdt.getInternationalShippingServiceOption(0).getShippingInsuranceCost().getValue());
                        item.setItemInsuranceCostCurrency(sdt.getInternationalShippingServiceOption(0).getShippingInsuranceCost().getCurrencyID().value());
                }
                catch(Exception e)
                {
                        
                }
                try
                {
                        item.setItemShippingCost(sdt.getInternationalShippingServiceOption(0).getShippingServiceCost().getValue());
                        item.setItemShippingCostCurrency(sdt.getInternationalShippingServiceOption(0).getShippingServiceCost().getCurrencyID().value());
                }
                catch(Exception e)
                {

                }
                try
                {
                        item.setItemTaxCost(sdt.getSalesTax().getSalesTaxAmount().getValue());
                        item.setItemTaxCostCurrency(sdt.getSalesTax().getSalesTaxAmount().getCurrencyID().value());
                }
                catch(Exception e)
                {

                }
                
                
                getItemService().addItem(item);
                
                PictureDetailsType pdt = itemType.getPictureDetails();
                String[] pictureURL = pdt.getPictureURL();
                for(int i = 0;i < pictureURL.length;i ++)
                {
                        Gallery gallery = new Gallery();
                        gallery.setItem(item);
                        gallery.setGalleryUrl(pictureURL[i]);
                        galleryService.addGallery(gallery);
                }
                
                
                
                
                return "success";
        }

        public CategoryService getCategoryService() {
                return categoryService;
        }

        public void setCategoryService(CategoryService categoryService) {
                this.categoryService = categoryService;
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }

        public String getItemEbayId() {
                return itemEbayId;
        }

        public void setItemEbayId(String itemEbayId) {
                this.itemEbayId = itemEbayId;
        }

        public String getItemTitle() {
                return itemTitle;
        }

        public void setItemTitle(String itemTitle) {
                this.itemTitle = itemTitle;
        }

        public String getItemDescription() {
                return itemDescription;
        }

        public void setItemDescription(String itemDescription) {
                this.itemDescription = itemDescription;
        }

        public String getItemCategoryId() {
                return itemCategoryId;
        }

        public void setItemCategoryId(String itemCategoryId) {
                this.itemCategoryId = itemCategoryId;
        }

        public GalleryService getGalleryService() {
                return galleryService;
        }

        public void setGalleryService(GalleryService galleryService) {
                this.galleryService = galleryService;
        }
        
}
