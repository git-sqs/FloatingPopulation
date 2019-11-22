package com.floatingpopulation.servlet;

import com.floatingpopulation.pojo.ConditionPeople;
import com.floatingpopulation.pojo.People;
import com.floatingpopulation.service.impl.BasicInformationServiceImpl;
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

/**
 * @author Administrator
 */
@WebServlet("/Basic/*")
public class BasicInformationServlet extends BaseServlet {

    BasicInformationServiceImpl basicInformationService = new BasicInformationServiceImpl();

    public void showPeople(HttpServletRequest request, HttpServletResponse response) {
        try {
            ConditionPeople conditionPeople = new ConditionPeople();
            Map<String, String[]> parameterMap = request.getParameterMap();
            BeanUtils.populate(conditionPeople,parameterMap);
            List<People> people = basicInformationService.showByCondition(conditionPeople);
            request.setAttribute("allPeople",people);

            request.getRequestDispatcher("/work.jsp").forward(request,response);
        } catch (ServletException | IOException | InvocationTargetException | IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    public void deletePeople(HttpServletRequest request, HttpServletResponse response){

        try {
            String[] ids = request.getParameterValues("ids");
            System.out.println(Arrays.toString(ids));
            basicInformationService.deletePeople(ids);
            response.sendRedirect(request.getContextPath()+"/Basic/showPeople");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void addOrUpdatePeople(HttpServletRequest request, HttpServletResponse response){

        Map<String, String[]> parameterMap = request.getParameterMap();



    }

    public void findOne(HttpServletRequest request, HttpServletResponse response){
        String id = request.getParameter("id");

        People one = basicInformationService.findOne(Integer.parseInt(id));

        try {
            request.setCharacterEncoding("utf-8");

            request.setAttribute("findOnePeople",one);
            request.getRequestDispatcher("/workAdd.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public void addPeople(HttpServletRequest request, HttpServletResponse response){
        try {
            request.setCharacterEncoding("utf-8");
            Map<String, String[]> parameterMap = request.getParameterMap();
            People people = new People();
            BeanUtils.populate(people,parameterMap);
            int i = basicInformationService.addPeople(people);
            response.sendRedirect(request.getContextPath()+"/Basic/showPeople");
        } catch (IllegalAccessException | InvocationTargetException | IOException e) {
            e.printStackTrace();
        }
    }

    public void statistics(HttpServletRequest request, HttpServletResponse response){

        List<Integer> statistics = basicInformationService.statistics();

        request.setAttribute("myStatic",statistics);

        try {
            request.getRequestDispatcher("/locationStatic.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }


    }

}
