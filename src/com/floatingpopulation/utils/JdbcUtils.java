package com.floatingpopulation.utils;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.util.Properties;

public class JdbcUtils {

    private static DataSource dataSource;

    static {

        try {
            //加载配置文件
            Properties properties = new Properties();

            properties.load(JdbcUtils.class.getClassLoader().getResourceAsStream("db.properties"));

            //获取DataSource
            dataSource = DruidDataSourceFactory.createDataSource(properties);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 获取连接池方法
     */
    public static DataSource getDataSource() {
        return dataSource;
    }

}

