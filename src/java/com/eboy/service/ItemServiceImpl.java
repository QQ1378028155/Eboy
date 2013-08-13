/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.dao.ItemDao;
import com.eboy.po.Item;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wjl
 */
public class ItemServiceImpl implements ItemService
{
        private ItemDao itemDao;
        @Override
        public void addItem(Item item) {
                try {
                        getItemDao().save(item);
                } catch (Exception ex) {
                        Logger.getLogger(ItemServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
        }

        public ItemDao getItemDao() {
                return itemDao;
        }

        public void setItemDao(ItemDao itemDao) {
                this.itemDao = itemDao;
        }
        
}
