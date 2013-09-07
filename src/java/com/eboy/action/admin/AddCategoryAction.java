/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.service.CategoryService;
import com.opensymphony.xwork2.ActionSupport;
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author wjl
 */
public class AddCategoryAction extends ActionSupport
{

        private CategoryService categoryService;
        @Override
        public String execute()
        {
                HttpServletRequest request = ServletActionContext.getRequest();
                try {
                        request.setCharacterEncoding("UTF-8");
                } catch (UnsupportedEncodingException ex) {
                        Logger.getLogger(AddCategoryAction.class.getName()).log(Level.SEVERE, null, ex);
                }
                String categoryName = request.getParameter("categoryName");
                System.out.println(categoryName);
                
                getCategoryService().addCategory(categoryName);
                return "success";
        }


        public CategoryService getCategoryService() {
                return categoryService;
        }

        public void setCategoryService(CategoryService categoryService) {
                this.categoryService = categoryService;
        }
}
