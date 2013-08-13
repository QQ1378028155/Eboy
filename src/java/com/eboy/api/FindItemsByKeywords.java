package com.eboy.api;

import java.util.ArrayList;
import java.util.List;

import com.ebay.services.client.ClientConfig;
import com.ebay.services.client.FindingServiceClientFactory;
import com.ebay.services.finding.FindItemsByKeywordsRequest;
import com.ebay.services.finding.FindItemsByKeywordsResponse;
import com.ebay.services.finding.FindingServicePortType;
import com.ebay.services.finding.ItemFilter;
import com.ebay.services.finding.ItemFilterType;
import com.ebay.services.finding.PaginationInput;
import com.ebay.services.finding.SearchItem;
import com.eboy.po.Item;

public class FindItemsByKeywords {
        private ClientConfig config;
        private FindingServicePortType serviceClient;


        public FindItemsByKeywords() {
                config = new ClientConfig();
                config.setApplicationId("SJTUd2934-8ef2-490d-b5da-760f66fd588");
                serviceClient = FindingServiceClientFactory.getServiceClient(config);
                
        }

        public List<Item> execute(String keyword) 
        {
                List<SearchItem> items;
                int itemsNumber;
                List<Item> itemList = new ArrayList<Item>();
                try {
                        FindItemsByKeywordsRequest request = new FindItemsByKeywordsRequest();
                        request.setKeywords(keyword);
                        PaginationInput pi = new PaginationInput();
                        pi.setEntriesPerPage(50);
                        request.setPaginationInput(pi);
                        List<ItemFilter> itemFilterList = request.getItemFilter();

                        ItemFilter filter = new ItemFilter();
                        List<String> values = filter.getValue();
                        filter.setName(ItemFilterType.LISTING_TYPE);
                        values.add("FixedPrice");
                        itemFilterList.add(filter);

                        filter = new ItemFilter();
                        values = filter.getValue();
                        filter.setName(ItemFilterType.AVAILABLE_TO);
                        values.add("CN");
                        itemFilterList.add(filter);
                        
                        filter = new ItemFilter();
                        values = filter.getValue();
                        filter.setName(ItemFilterType.MIN_QUANTITY);
                        values.add("1");
                        itemFilterList.add(filter);
                        
                        
                        
                        FindItemsByKeywordsResponse result = serviceClient.findItemsByKeywords(request);
                        itemsNumber = result.getSearchResult().getCount();
                        items = result.getSearchResult().getItem();
                        for (SearchItem item : items) 
                        {
                                Item newItem = new Item();
                                newItem.setItemEbayId(item.getItemId());
                                newItem.setItemPrice(item.getSellingStatus().getConvertedCurrentPrice().getValue());
                                newItem.setItemTitle(item.getTitle());
                                if(item.getGalleryURL() == null)
                                        newItem.setItemThumbnailImageUrl("./images/notFound.jpg");
                                else
                                        newItem.setItemThumbnailImageUrl(item.getGalleryURL());
                                itemList.add(newItem);
                        }
                } 
                catch (Exception e) {
                        e.printStackTrace();
                }
                return itemList;
        }
//        public static void main(String[] args) {
//                FindItemsByKeywords fi = new FindItemsByKeywords();
//                List<Item> itemlist = new ArrayList<Item>();
//                itemlist= fi.findItemByKeywords("iphone");
//        }
}
