package com.floatingpopulation.service;

import com.floatingpopulation.pojo.ConditionPeople;
import com.floatingpopulation.pojo.EducationLevel;
import com.floatingpopulation.pojo.People;

import java.util.List;

/**
 * @author Administrator
 */
public interface BasicInformationService {

    List<People> showByCondition(ConditionPeople conditionPeople);

    void deletePeople(String[] id);

    People findOne(int id);

    int addPeople(People people);

    List<Integer> statistics();

}
