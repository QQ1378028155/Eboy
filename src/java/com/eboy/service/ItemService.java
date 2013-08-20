/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.po.Item;
import java.util.List;

/**
 *
 * @author wjl
 */
public interface ItemService {
        void addItem(Item item);
        Item getItem(int itemId);
        void updateItem(Item item);
        List<Item> getItems();
        List<Item> getItemsOrderBySale(String keywords);
}
