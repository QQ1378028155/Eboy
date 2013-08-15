/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.po.Gallery;
import java.util.List;

/**
 *
 * @author wjl
 */
public interface GalleryService {
        void addGallery(Gallery gallery);
        List<Gallery> getGallerys(long itemId);
}
