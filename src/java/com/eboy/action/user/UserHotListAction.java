/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;


import com.eboy.po.Item;
import com.eboy.po.Mlc;
import com.eboy.service.ItemService;
import com.eboy.service.MlcService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import com.eboy.action.admin.TrainAction;

/**
 *
 * @author wjl
 */
public class UserHotListAction extends ActionSupport {
        
        private ItemService itemService;

        public ItemService getItemService() {
                return itemService;
        }

        public void setItemService(ItemService itemService) {
                this.itemService = itemService;
        }
        
        @Override
        public String execute()
        {
                ActionContext context = ActionContext.getContext();
                List<Item> itemList = itemService.getItems();
                
                Integer fiveResult[]=TrainAction.getResult();
                
                List<Item> itemResult= new ArrayList<Item>();
                for ( int i = 0 ; i <5 ; i++){
                        if (fiveResult[i]==-1){
                                break;
                        }else{
                                itemResult.add(itemList.get(fiveResult[i]));;
                        }
                }
                
                context.put("itemList", itemResult);
                return "success";
        }
        
       public double f(List<Double> c, double price, double rate, int pictureNumber, int sold) {
                return c.get(0) * Math.pow(price, 0.5) + c.get(1) * Math.pow(rate, 4) + c.get(2) * pictureNumber + c.get(3) * Math.log(sold);
        }
}
