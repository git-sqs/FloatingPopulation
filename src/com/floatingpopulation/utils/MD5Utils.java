package com.floatingpopulation.utils;

import org.springframework.util.DigestUtils;

public class MD5Utils {

    public static String getMd5(String password) {
        String one = DigestUtils.md5DigestAsHex(password.getBytes());

        String two = one.substring(10,15);

        String sale = "SunQingSong";

        String passwordMd5 = one + two + sale;

        return DigestUtils.md5DigestAsHex(passwordMd5.getBytes());
    }

    /*public static void main(String[] args) {
        System.out.println(getMd5("admin"));
    }*/
}
