/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.dao.CategoryDao;
import com.eboy.po.Category;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wjl
 */
public class CategoryServiceImpl implements CategoryService{

        private CategoryDao categoryDao;
        @Override
        public void addCategory(String categoryName) {
                Category category = new Category();
                category.setCategoryName(categoryName);
                try {
                        getCategoryDao().save(category);
                } catch (Exception ex) {
                        Logger.getLogger(CategoryServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
                
        }

        @Override
        public List<Category> getCategorys() {
                return this.getCategoryDao().getCategorys();
        }

        public CategoryDao getCategoryDao() {
                return categoryDao;
        }

        public void setCategoryDao(CategoryDao categoryDao) {
                this.categoryDao = categoryDao;
        }

        @Override
        public Category getCategory(int categoryId) {
                return this.categoryDao.getCategory(categoryId);
        }
        
}
