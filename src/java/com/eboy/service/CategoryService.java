/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.po.Category;
import java.util.List;

/**
 *
 * @author wjl
 */
public interface CategoryService {
        void addCategory(String categoryName);
        List<Category> getCategorys();
        
}
