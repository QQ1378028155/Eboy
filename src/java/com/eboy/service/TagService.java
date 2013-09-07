/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.po.Tag;
import java.util.List;

/**
 *
 * @author wjl
 */
public interface TagService {
        void addTag(String tagWord);    
        Tag getTag(int tagId);
        Tag getTag(String tagWord);
        List<Tag> getTags();
        void updateTag(Tag tag);
}
