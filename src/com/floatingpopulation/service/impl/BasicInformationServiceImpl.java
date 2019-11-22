package com.floatingpopulation.service.impl;

import com.floatingpopulation.dao.BasicInformationDao;
import com.floatingpopulation.pojo.ConditionPeople;
import com.floatingpopulation.pojo.EducationLevel;
import com.floatingpopulation.pojo.People;
import com.floatingpopulation.service.BasicInformationService;

import java.util.List;

/**
 * @author Administrator
 */
public class BasicInformationServiceImpl implements BasicInformationService {

    BasicInformationDao basicInformation = new BasicInformationDao();

    @Override
    public List<People> showByCondition(ConditionPeople conditionPeople) {
        return basicInformation.showByCondition(conditionPeople);
    }

    @Override
    public void deletePeople(String[] id) {
        basicInformation.deletePeople(id);
    }

    @Override
    public People findOne(int id) {
        return basicInformation.findOne(id);
    }


    @Override
    public int addPeople(People people) {
        if(people.getId()==0){
            return basicInformation.addPeople(people);
        }else {
            return basicInformation.updatePeople(people);
        }

    }

    @Override
    public List<Integer> statistics() {
        return basicInformation.statistics();
    }
}
