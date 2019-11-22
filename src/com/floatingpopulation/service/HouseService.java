package com.floatingpopulation.service;

import com.floatingpopulation.pojo.ConditionHouse;
import com.floatingpopulation.pojo.House;
import com.floatingpopulation.pojo.Master;

import java.util.List;

public interface HouseService {

    List<House> showHouse(ConditionHouse conditionHouse);

    List<Master> showMaster(int id);

    int addHouse(House house);

    int addRentPeople(String rentName,String rentId,int houseId);

    House findOne(int id);

    int exitRent(int id);

    int batchDelete(String[] ids);
}
