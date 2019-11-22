package com.floatingpopulation.service.impl;

import com.floatingpopulation.dao.HouseDao;
import com.floatingpopulation.pojo.ConditionHouse;
import com.floatingpopulation.pojo.House;
import com.floatingpopulation.pojo.Master;
import com.floatingpopulation.service.HouseService;

import java.util.List;

public class HouseServiceImpl implements HouseService {

    HouseDao houseDao = new HouseDao();
    @Override
    public List<House> showHouse(ConditionHouse conditionHouse) {
        return houseDao.showHouse(conditionHouse);
    }

    @Override
    public List<Master> showMaster(int id) {
        return houseDao.showMaster(id);
    }

    @Override
    public int addHouse(House house) {
        return houseDao.addHouse(house);
    }

    @Override
    public int addRentPeople(String rentName, String rentId, int houseId) {
        return houseDao.addRentPeople(rentName,rentId,houseId);
    }

    @Override
    public House findOne(int id) {
        return houseDao.findOne(id);
    }

    @Override
    public int exitRent(int id) {
        return houseDao.exitRent(id);
    }

    @Override
    public int batchDelete(String[] ids) {
        return houseDao.batchDelete(ids);
    }
}
