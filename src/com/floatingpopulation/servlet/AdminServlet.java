package com.floatingpopulation.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.floatingpopulation.service.impl.AdminServiceImpl;
import com.floatingpopulation.utils.MD5Utils;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * @author Administrator
 */
@WebServlet("/Admin/*")
public class AdminServlet extends BaseServlet {

    public void login(HttpServletRequest req, HttpServletResponse resp) {

        AdminServiceImpl adminService = new AdminServiceImpl();
        try {
            req.setCharacterEncoding("utf-8");
            String userName = req.getParameter("userName");
            String password = MD5Utils.getMd5(req.getParameter("password"));
            /*String remember = req.getParameter("remember");*/

            ObjectMapper objectMapper = new ObjectMapper();
            resp.setContentType("application/json;charset= utf-8");
            if (adminService.oneService(userName,password)){
                HttpSession session = req.getSession();
                session.setAttribute("USERNAME",userName);
                Cookie jsessionid = new Cookie("JSESSIONID", session.getId());
                jsessionid.setMaxAge(60*60*24*7);
                resp.addCookie(jsessionid);
                objectMapper.writeValue(resp.getWriter(),true);
            } else {
               objectMapper.writeValue(resp.getWriter(),false);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void exitLogin(HttpServletRequest req, HttpServletResponse resp){
        try {
            req.getSession().removeAttribute("USERNAME");
            resp.sendRedirect(req.getContextPath()+"/login.html");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}

