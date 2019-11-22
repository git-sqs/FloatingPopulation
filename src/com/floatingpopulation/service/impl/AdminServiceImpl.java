package com.floatingpopulation.service.impl;


import com.floatingpopulation.dao.AdminDao;
import com.floatingpopulation.service.AdminService;

/**
 * @author Administrator
 */
public class AdminServiceImpl implements AdminService {

    private AdminDao adminDao = new AdminDao();

    @Override
    public boolean oneService(String name,String password) {

        int count = adminDao.adminLogin(name,password);
        if (count == 0) {
            return false;
        } else {
            return true;
        }
    }

}
