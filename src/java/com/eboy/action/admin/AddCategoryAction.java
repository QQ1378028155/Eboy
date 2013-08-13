/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.action.admin;

import com.eboy.service.CategoryService;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author wjl
 */
public class AddCategoryAction extends ActionSupport
{
        private String categoryName;
        private CategoryService categoryService;
        @Override
        public String execute()
        {
                getCategoryService().addCategory(getCategoryName());
                return "success";
        }

        public String getCategoryName() {
                return categoryName;
        }

        public void setCategoryName(String categoryName) {
                this.categoryName = categoryName;
        }

        public CategoryService getCategoryService() {
                return categoryService;
        }

        public void setCategoryService(CategoryService categoryService) {
                this.categoryService = categoryService;
        }
}
