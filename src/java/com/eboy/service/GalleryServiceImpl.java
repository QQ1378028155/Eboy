/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.dao.GalleryDao;
import com.eboy.po.Gallery;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author wjl
 */
public class GalleryServiceImpl implements GalleryService{
        private GalleryDao galleryDao;

        @Override
        public void addGallery(Gallery gallery) {
                try {
                        getGalleryDao().save(gallery);
                } catch (Exception ex) {
                        Logger.getLogger(GalleryServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
        }

        @Override
        public List<Gallery> getGallerys(long itemId) {
                return getGalleryDao().getGallerys(itemId);
        }

        public GalleryDao getGalleryDao() {
                return galleryDao;
        }

        public void setGalleryDao(GalleryDao galleryDao) {
                this.galleryDao = galleryDao;
        }
        
}
