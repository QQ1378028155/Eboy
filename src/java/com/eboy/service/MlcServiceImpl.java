/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eboy.service;

import com.eboy.dao.MlcDao;
import com.eboy.po.Mlc;

/**
 *
 * @author wjl
 */
public class MlcServiceImpl implements MlcService{

        private MlcDao mlcDao;
        @Override
        public void save(Mlc mlc) {
                mlcDao.save(mlc);
        }

        @Override
        public Mlc getMlc() {
                return mlcDao.getMlc();
        }

        public MlcDao getMlcDao() {
                return mlcDao;
        }

        public void setMlcDao(MlcDao mlcDao) {
                this.mlcDao = mlcDao;
        }
        
}
