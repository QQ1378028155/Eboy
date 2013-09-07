/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.user;

import com.eboy.api.TaobaoHotItem;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author wjl
 */
public class UserHotListAction extends ActionSupport {
        @Override
        public String execute()
        {
                ActionContext context = ActionContext.getContext();
                List<String> hList = TaobaoHotItem.execute();
                List<String> eHotList = TaobaoHotItem.engHotList;
                List<String> hotList = new ArrayList<String>();
                List<String> engHotList = new ArrayList<String>();
                
                for(int i = 0;i < hList.size();i ++)
                {
                        hotList.add(hList.get(i));
                        engHotList.add(eHotList.get(i));
                }
                
                List<String> hl = new ArrayList<String>();
                List<String> ehl = new ArrayList<String>();
                
                for(int i = 0;i < 5;i ++)
                {
                        int size = hotList.size();
                        int index = (int)(size * Math.random());
                        hl.add(hotList.get(index));
                        ehl.add(engHotList.get(index));
                        hotList.remove(index);
                        engHotList.remove(index);
                }
                context.put("hotList", hl);
                context.put("engHotList", ehl);
                return "success";
        }
}
