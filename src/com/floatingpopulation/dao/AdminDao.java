package com.floatingpopulation.dao;

import com.floatingpopulation.utils.JdbcUtils;
import org.springframework.jdbc.core.JdbcTemplate;


public class AdminDao {

    public int adminLogin(String name,String password) {

        JdbcTemplate jdbcTemplate = new JdbcTemplate(JdbcUtils.getDataSource());

        String sql = "select count(1) from admin where username = ? and password = ?";

        return jdbcTemplate.queryForObject(sql,Integer.class,name,password);
    }
}
