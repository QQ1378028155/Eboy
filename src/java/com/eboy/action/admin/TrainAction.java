/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.ebay.services.finding.Amount;
import com.ebay.soap.eBLBaseComponents.ItemType;
import com.eboy.api.ExchangeConversion;
import com.eboy.api.GetItem;
import com.eboy.po.Comment;
import com.eboy.po.Item;
import com.eboy.po.Mlc;
import com.eboy.service.ItemService;
import com.eboy.service.MlcService;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

/**
 *
 * @author wjl
 */
public class TrainAction extends ActionSupport {

        private ItemService itemService;
        private MlcService mlcService;
        List<Integer> soldQuantity;
        List<Double> price;
        List<Double> rate;
        List<Integer> pictureNumber;
        List<Item> itemList;
        List<Double> result = new ArrayList<Double>();
        List<Double> c = new ArrayList<Double>();
        public static Integer fiveResult[] = new Integer[5];
        
        public static Integer[] getResult(){
                return fiveResult;
        }
        

        @Override
        public String execute() {
                itemList = getItemService().getItemsOrderBySale("");
                soldQuantity = new ArrayList<Integer>();
                price = new ArrayList<Double>();
                rate = new ArrayList<Double>();
                pictureNumber = new ArrayList<Integer>();

                getData();
                train();
                getScore();
                
                
                
                return null;
        }
        
        public void getScore(){
                List<Item> resultList = getItemService().getItems();
                for ( int i = 0 ; i < resultList.size() ; i++){
                        Item item = resultList.get(i);
                        if (item.getItemQuantity()==0){ 
                                result.add(0.0);
                        }else{
                                Double tempt =f(c,price.get(i), rate.get(i), pictureNumber.get(i), soldQuantity.get(i));
                                result.add(tempt);
                        }       
                }
                
                for ( int i = 0 ; i<5 ;i++){
                        fiveResult[i]=-1;
                }
                
                for ( int i = 0 ; i < result.size() ; i++){
                        Double tempt = result.get(i);
                        for ( int j = 0 ; j < 5 ; j++){
                                if (fiveResult[j]==-1){
                                        fiveResult[j]=i;
                                        break;
                                }else{
                                        if (tempt>result.get(fiveResult[j])){
                                                for (int k = 4 ;k>j ;k--){
                                                        fiveResult[k]=fiveResult[k-1];
                                                }
                                                fiveResult[j]=i;
                                                break;
                                        }
                                }
                        }
                }
                
                for ( int i =0 ; i < 5 ; i++){
                        System.out.println("result:         "+fiveResult[i]);
                }
                
                
        }

        public void getData() {
//              itemList = getItemService().getItems();
                for (int i = 0; i < itemList.size(); i++) {
                        Item item = itemList.get(i);
                        ItemType it = GetItem.execute(itemList.get(i).getItemEbayId(), true);
                        int sold = it.getSellingStatus().getQuantitySold() + itemList.get(i).getItemSoldQuantity();
                        soldQuantity.add(sold);

                        double money = 0;
                        Amount amount = new Amount();
                        Amount na;
                        amount.setValue(item.getItemPrice());
                        amount.setCurrencyId(item.getItemPriceCurrency());
                        na = ExchangeConversion.execute(amount);
                        money += na.getValue();

                        if (item.getItemPackageCost() != null) {
                                amount = new Amount();
                                amount.setValue(item.getItemPackageCost());
                                amount.setCurrencyId(item.getItemPackageCostCurrency());
                                na = ExchangeConversion.execute(amount);
                                money += na.getValue();
                        }
                        System.out.println("a");
                        if (item.getItemShippingCost() != null) {
                                amount = new Amount();
                                amount.setValue(item.getItemShippingCost());
                                amount.setCurrencyId(item.getItemShippingCostCurrency());
                                na = ExchangeConversion.execute(amount);
                                money += na.getValue();
                        }
                        System.out.println("b");
                        if (item.getItemInsuranceCost() != null) {
                                amount = new Amount();
                                amount.setValue(item.getItemInsuranceCost());
                                amount.setCurrencyId(item.getItemInsuranceCostCurrency());
                                na = ExchangeConversion.execute(amount);
                                money += na.getValue();
                        }
                        System.out.println("c");
                        if (item.getItemTaxCost() != null) {
                                amount = new Amount();
                                amount.setValue(item.getItemTaxCost());
                                amount.setCurrencyId(item.getItemTaxCostCurrency());
                                na = ExchangeConversion.execute(amount);
                                money += na.getValue();
                        }
                        System.out.println("d");
                        if (item.getItemImportCost() != null) {
                                amount = new Amount();
                                amount.setValue(item.getItemImportCost());
                                amount.setCurrencyId(item.getItemImportCostCurrency());
                                na = ExchangeConversion.execute(amount);
                                money += na.getValue();
                        }
                        System.out.println("e");
                        price.add(money);

                        Object[] cArray = item.getComments().toArray();
                        if (cArray.length == 0) {
                                rate.add(3.0);
                        } else {
                                double r = 0.0;
                                for (int j = 0; j < cArray.length; j++) {
                                        Comment co = (Comment) (cArray[j]);
                                        r += co.getCommentRate();
                                }
                                r = r / (cArray.length);
                                rate.add(r);
                        }
                        pictureNumber.add(item.getGalleries().size());
                }
        }

        public void train() {

                Mlc mlc = mlcService.getMlc();
                c.add(mlc.getMlc0());
                c.add(mlc.getMlc1());
                c.add(mlc.getMlc2());
                c.add(mlc.getMlc3());

                double RMSE = getRMSE(c);
                for (int i = 0; i < 1000; i++) {
                        int cIndex = 0;
                        double cRate = 0;
                        boolean flag = false;
                        System.out.println(c.get(0) + "  " + c.get(1) + " " + c.get(2) + "  " + c.get(3) + " " + RMSE);





                        for (int j = 0; j < 1000; j++) {
                                double p = Math.random();
                                double ra = Math.random() * (1000 - i)+ 1;
                                if (p < 0.5) {
                                        ra = 1 / ra;
                                }
                                int index = (int) (Math.random() * 4);

                                double rc = c.get(index);
                                c.set(index, rc * ra);

                                double rmse = getRMSE(c);
//                                System.out.println("                                            " + rmse + " " + c.get(0) + "  " + c.get(1) + " " + c.get(2) + "  " + c.get(3));
                                if (rmse < RMSE) {
                                         RMSE = rmse;
                                        cIndex = index;
                                        cRate = ra;
                                        flag = true;
                                }
                                c.set(index, rc);
                        }
                        if(flag == true)
                                c.set(cIndex, c.get(cIndex) * cRate);


                }
                Mlc newMlc = new Mlc();
                newMlc.setMlc0(c.get(0));
                newMlc.setMlc1(c.get(1));
                newMlc.setMlc2(c.get(2));
                newMlc.setMlc3(c.get(3));
                
                mlcService.save(newMlc);
                
                

                
                
                
        }

        public double getRMSE(List<Double> c) {
                int[] sort = new int[itemList.size()];
                for (int k = 0; k < itemList.size(); k++) {
                        itemList.get(k).setItemSortScore(f(c, price.get(k), rate.get(k), pictureNumber.get(k), soldQuantity.get(k)));
                        sort[k] = 0;
                }

                for (int k = 0; k < itemList.size(); k++) {
                        for (int l = k + 1; l < itemList.size(); l++) {
                                if (itemList.get(k).getItemSortScore() < itemList.get(l).getItemSortScore()) {
                                        sort[k]++;
                                } else {
                                        sort[l]++;
                                }
                        }
                }

                double rmse = 0;
                for (int k = 0; k < itemList.size(); k++) {
                        rmse = rmse + (sort[k] - k) * (sort[k] - k);
                }
                
//                System.out.print(rmse + " ");
//                for(int k = 0;k < sort.length;k ++)
//                        System.out.print(sort[k] + " ");
//                System.out.println();
                
                
                
                
                return rmse;
        }

        public double f(List<Double> c, double price, double rate, int pictureNumber, int sold) {
                return c.get(0) * Math.pow(price, 0.5) + c.get(1) * Math.pow(rate, 4) + c.get(2) * pictureNumber + c.get(3) * Math.log(sold);
        }

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }

        public MlcService getMlcService() {
                return mlcService;
        }

        public void setMlcService(MlcService mlcService) {
                this.mlcService = mlcService;
        }
}
