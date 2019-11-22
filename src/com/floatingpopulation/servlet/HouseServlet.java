package com.floatingpopulation.servlet;


import com.floatingpopulation.pojo.ConditionHouse;
import com.floatingpopulation.pojo.House;
import com.floatingpopulation.pojo.Master;
import com.floatingpopulation.service.impl.HouseServiceImpl;
import com.floatingpopulation.utils.JsonUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@WebServlet("/House/*")
public class HouseServlet extends BaseServlet {
    HouseServiceImpl houseService = new HouseServiceImpl();

    public void showHouse(HttpServletRequest request, HttpServletResponse response){

        try {
            Map<String, String[]> parameterMap = request.getParameterMap();
            ConditionHouse conditionHouse = new ConditionHouse();
            BeanUtils.populate(conditionHouse,parameterMap);

            List<House> houses = houseService.showHouse(conditionHouse);
            request.setAttribute("allHouse",houses);
            request.getRequestDispatcher("/dossier_my.jsp").forward(request,response);
        } catch (ServletException | IOException | IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    public void showMaster(HttpServletRequest request, HttpServletResponse response){
        String id = request.getParameter("id");
        List<Master> masters = houseService.showMaster(Integer.parseInt(id));
        response.setContentType("application/json;charset=utf-8");

        try {
            response.getWriter().write(JsonUtils.objectToJson(masters));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void addHouse(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("utf-8");
            Map<String, String[]> parameterMap = request.getParameterMap();
            House house = new House();
            BeanUtils.populate(house,parameterMap);
            houseService.addHouse(house);
            response.sendRedirect(request.getContextPath()+"/House/showHouse");
        } catch (IllegalAccessException | InvocationTargetException | IOException e) {
            e.printStackTrace();
        }
    }

    public void rentPeople(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("utf-8");
            String rentName = request.getParameter("rentName");
            String rentId = request.getParameter("rentId");
            String houseId = request.getParameter("houseId");
            houseService.addRentPeople(rentName,rentId,Integer.parseInt(houseId));
            response.sendRedirect(request.getContextPath()+"/House/showHouse");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void getRentPeople(HttpServletRequest request, HttpServletResponse response){
        String houseId = request.getParameter("houseId");
        House one = houseService.findOne(Integer.parseInt(houseId));
        try {
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(JsonUtils.objectToJson(one));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void exitRent(HttpServletRequest request, HttpServletResponse response){
        String houseId = request.getParameter("houseId");
        System.out.println(houseId);
        int i = houseService.exitRent(Integer.parseInt(houseId));
        System.out.println(i);
        try {
            response.sendRedirect(request.getContextPath()+"/House/showHouse");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void batchDelete(HttpServletRequest request, HttpServletResponse response){
        String[] ids = request.getParameterValues("ids");
        System.out.println(Arrays.toString(ids));
        houseService.batchDelete(ids);
        try {
            response.sendRedirect(request.getContextPath()+"/House/showHouse");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
