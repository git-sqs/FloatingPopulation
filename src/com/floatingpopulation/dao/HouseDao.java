package com.floatingpopulation.dao;

import com.floatingpopulation.pojo.ConditionHouse;
import com.floatingpopulation.pojo.House;
import com.floatingpopulation.pojo.Master;
import com.floatingpopulation.utils.JdbcUtils;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

public class HouseDao {

    JdbcTemplate jdbcTemplate = new JdbcTemplate(JdbcUtils.getDataSource());

    public List<House> showHouse(ConditionHouse conditionHouse){

        int myRent = conditionHouse.getRent();
        int myFitment = conditionHouse.getFitment();
        int myArea = conditionHouse.getArea();
        String sql = "select a.*,b.name,c.myrent,d.myfitment from house a,house_master b,house_rent c,house_fitment d where a.master=b.id and a.rent=c.id and a.fitment=d.id";

        if(myRent != 0) {
            sql += " and a.rent ="+myRent;
        }
        if(myFitment != 0) {
            sql += " and a.fitment ="+myFitment;
        }
        if(myArea==1){
            sql += " and a.area <= 20";
        }
        if(myArea==2){
            sql += " and a.area <= 40 and a.area>20";
        }
        if(myArea==3){
            sql += " and a.area <= 60 and a.area>40";
        }
        if(myArea==4){
            sql += " and a.area <= 80 and a.area>60";
        }
        if(myArea==5){
            sql += " and a.area <= 100 and a.area>80";
        }
        if(myArea==6){
            sql += " and a.area>100";
        }

        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<House>(House.class));
    }

    public List<Master> showMaster(int id){
        String sql = "select * from house_master where id=?";
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Master>(Master.class),id);
    }

    public int addHouse(House house) {
        String sql1 = "insert into house_master value(?,?,?,?,?,?)";
        jdbcTemplate.update(sql1,null,house.getName(),house.getGender(),house.getAge(),house.getIdNum(),house.getPhoto());

        String sql2 = "select * from house_master where name=?";
        List<Master> query = jdbcTemplate.query(sql2, new BeanPropertyRowMapper<Master>(Master.class), house.getName());
        int count = query.get(0).getId();
        System.out.println(count);

        String sql = "insert into house value(?,?,?,?,?,?,?,?,?,?)";
        return jdbcTemplate.update(sql, null, house.getAddr(), house.getPrice(),house.getArea(), house.getFloor(), house.getRent(), house.getFitment(),count,house.getRentName(),house.getRentId());
    }

    public int addRentPeople(String rentName, String rentId, int houseId) {
        String sql="update house set rent=2,rentName=?,rentId=? where id=?";
        return jdbcTemplate.update(sql,rentName,rentId,houseId);
    }

    public House findOne(int id) {

        String sql = "select * from house where id=?";

        List<House> query = jdbcTemplate.query(sql, new BeanPropertyRowMapper<House>(House.class), id);

        return query.get(0);
    }

    public int exitRent(int id){
        String sql="update house set rent=1,rentName=?,rentId=? where id=?";
        return jdbcTemplate.update(sql,null,null,id);
    }

    public int batchDelete(String[] ids) {
        String sql="delete from house where id=?";
        System.out.println(Arrays.toString(ids));

        int[] count = jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement preparedStatement, int i) throws SQLException {
                preparedStatement.setString(1, ids[i]);
            }

            @Override
            public int getBatchSize() {
                return ids.length;
            }
        });
        return count.length;
    }
}
