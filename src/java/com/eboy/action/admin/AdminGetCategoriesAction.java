/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.po.Category;
import com.eboy.service.CategoryService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author Tongda
 */
public class AdminGetCategoriesAction extends ActionSupport {

        private CategoryService categoryService;

        @Override
        public String execute() {
                List<Category> categoryList = getCategoryService().getCategorys();
                ActionContext context = ActionContext.getContext();
                context.put("categoryList", categoryList);
                return "success";
        }

        public CategoryService getCategoryService() {
                return categoryService;
        }

        public void setCategoryService(CategoryService categoryService) {
                this.categoryService = categoryService;
        }
}
