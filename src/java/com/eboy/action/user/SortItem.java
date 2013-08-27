/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.ebay.services.finding.Amount;
import com.eboy.api.ExchangeConversion;
import com.eboy.po.Comment;
import com.eboy.po.Item;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author wjl
 */
public class SortItem {

        public static List<Item> sortByNew(List<Item> items) {
                List<Item> itemList = new ArrayList<Item>();
                int[] sorted = new int[items.size()];
                for (int i = 0; i < items.size(); i++) {
                        sorted[i] = 0;
                }
                for (int i = 0; i < items.size(); i++) {
                        int maxItemId = -1;
                        int index = 0;
                        for (int j = 0; j < items.size(); j++) {
                                if (sorted[j] == 0 && maxItemId < items.get(j).getItemId()) {
                                        maxItemId = items.get(j).getItemId();
                                        index = j;
                                }

                        }
                        itemList.add(items.get(index));
                        sorted[index] = 1;
                }
                return itemList;
        }

        public static List<Item> sortByRate(List<Item> items) {
                List<Item> itemList = new ArrayList<Item>();
                int[] sorted = new int[items.size()];
                double[] rate = new double[items.size()];
                for (int i = 0; i < items.size(); i++) {
                        sorted[i] = 0;
                        rate[i] = 0;
                        Object[] c = items.get(i).getComments().toArray();
                        for (int j = 0; j < c.length; j++) {
                                rate[i] += ((Comment) c[j]).getCommentRate();
                        }
                        if(c.length != 0)
                                rate[i] /= c.length;
                }
                for (int i = 0; i < items.size(); i++) {
                        double maxItemRate = -1;
                        int index = 0;
                        for (int j = 0; j < items.size(); j++) {
                                if (sorted[j] == 0 && maxItemRate < rate[j]) {
                                        maxItemRate = rate[j];
                                        index = j;
                                }

                        }
                        itemList.add(items.get(index));
                        sorted[index] = 1;
                }
                return itemList;

        }

        public static List<Item> sortBySale(List<Item> items) {
                List<Item> itemList = new ArrayList<Item>();
                int[] sorted = new int[items.size()];
                for (int i = 0; i < items.size(); i++) {
                        sorted[i] = 0;
                }
                for (int i = 0; i < items.size(); i++) {
                        int maxItemSold = -1;
                        int index = 0;
                        for (int j = 0; j < items.size(); j++) {
                                if (sorted[j] == 0 && maxItemSold < items.get(j).getItemSoldQuantity()) {
                                        maxItemSold = items.get(j).getItemSoldQuantity();
                                        index = j;
                                }

                        }
                        itemList.add(items.get(index));
                        sorted[index] = 1;
                }
                return itemList;
        }

        public static List<Item> sortByPrice(List<Item> items) {

                List<Item> itemList = new ArrayList<Item>();
                int[] sorted = new int[items.size()];
                for (int i = 0; i < items.size(); i++) {
                        sorted[i] = 0;
                }
                for (int i = 0; i < items.size(); i++) {
                        double minItemPrice = 99999999;
                        int index = 0;
                        for (int j = 0; j < items.size(); j++) {
                                if (sorted[j] == 0 && minItemPrice > items.get(j).getItemPrice()) {
                                        minItemPrice = items.get(j).getItemPrice();
                                        index = j;
                                }

                        }
                        itemList.add(items.get(index));
                        sorted[index] = 1;
                }
                return itemList;

        }
}
