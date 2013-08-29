/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.ebay.soap.eBLBaseComponents.ItemType;
import com.eboy.api.GetItem;
import com.eboy.api.HtmlParser;
import com.eboy.api.ItemAdapter;
import com.eboy.api.YoudaoTranslate;
import com.eboy.po.Category;
import com.eboy.po.Item;
import com.eboy.service.CategoryService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

/**
 *
 * @author wjl
 */
public class TranslateItemAction extends ActionSupport
{
        private CategoryService categoryService;
        private String itemEbayId;
        private String itemDescription;
        @Override
        public String execute()
        {
                ItemType itemType = GetItem.execute(itemEbayId);
                Item item = ItemAdapter.execute(itemType);
                try {
                        item.setItemTitle(YoudaoTranslate.execute(itemType.getTitle()));
                } catch (Exception ex) {
                        Logger.getLogger(TranslateItemAction.class.getName()).log(Level.SEVERE, null, ex);
                }
                try {
                        
//                        Document document = Jsoup.parse(itemDescription);
                                             
                        setItemDescription(HtmlParser.execute(itemType.getDescription()));
                        item.setItemDescription(getItemDescription().getBytes());
                } catch (Exception ex) {
                        Logger.getLogger(TranslateItemAction.class.getName()).log(Level.SEVERE, null, ex);
                }
                List<Category> categoryList = getCategoryService().getCategorys();
                ActionContext.getContext().put("item",item);
                ActionContext.getContext().put("categoryList", categoryList);
                return "success";
        }

        public CategoryService getCategoryService() {
                return categoryService;
        }

        public void setCategoryService(CategoryService categoryService) {
                this.categoryService = categoryService;
        }

        public String getItemDescription() {
                return itemDescription;
        }

        public void setItemDescription(String itemDescription) {
                this.itemDescription = itemDescription;
        }

        public String getItemEbayId() {
                return itemEbayId;
        }

        public void setItemEbayId(String itemEbayId) {
                this.itemEbayId = itemEbayId;
        }
        
        
}
