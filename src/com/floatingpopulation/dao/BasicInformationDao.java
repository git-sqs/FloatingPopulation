package com.floatingpopulation.dao;

import com.floatingpopulation.pojo.ConditionPeople;
import com.floatingpopulation.pojo.EducationLevel;
import com.floatingpopulation.pojo.People;
import com.floatingpopulation.utils.JdbcUtils;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BasicInformationDao {

    JdbcTemplate jdbcTemplate = new JdbcTemplate(JdbcUtils.getDataSource());

    public List<People> showPeople() {

        String sql = "select a.*,b.level,c.sort,d.everyIncome from people a,educational_level b,people_classes c,income_level d where a.education=b.id and a.intensive=c.id and a.income=d.id";

        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<People>(People.class));
    }

    public List<People> showByCondition(ConditionPeople conditionPeople){
        String name = conditionPeople.getName();
        String idNum = conditionPeople.getIDNum();
        int age = conditionPeople.getAge();
        String gender = conditionPeople.getGender();
        String address = conditionPeople.getAddress();
        int education = conditionPeople.getEducation();
        int intensive = conditionPeople.getIntensive();
        int income = conditionPeople.getIncome();

        String sql = "select a.*,b.level,c.sort,d.everyIncome from people a,educational_level b,people_classes c,income_level d where a.education=b.id and a.intensive=c.id and a.income=d.id";

        if(null != name && !"".equals(name)) {
            sql += " and a.name like '%"+name + "%'";
        }
        if(null != idNum && !"".equals(idNum)) {
            sql += " and a.idNum like '%"+idNum + "%'";
        }
        if(age != 0) {
            sql += " and a.age ="+age;
        }
        if("男".equals(gender) || "女".equals(gender)) {
            sql += " and a.gender like '%"+gender + "%'";
        }
        if(null != address && !"".equals(address)) {
            sql += " and a.address like '%"+address + "%'";
        }
        if(education != 0) {
            sql += " and a.education ="+education;
        }
        if(intensive != 0) {
            sql += " and a.intensive ="+intensive;
        }
        if(income != 0) {
            sql += " and a.income ="+income;
        }

        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<People>(People.class));

    }

    public int deletePeople(String[] ids) {

        String sql = "delete from people where id=?";

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

    public int updatePeople(People people) {
        String sql ="update people set name=?,IDNum=?,gender=?,age=?,address=?,education=?,income=?,intensive=? where id=?";
        return jdbcTemplate.update(sql,people.getName(),people.getIDNum(),people.getGender(),people.getAge(),people.getAddress(),people.getEducation(),people.getIncome(),people.getIntensive(),people.getId());
    }

    public People findOne(int id) {

        String sql = "select a.*,b.level,c.sort,d.everyIncome from people a,educational_level b,people_classes c,income_level d where a.education=b.id and a.intensive=c.id and a.income=d.id and a.id=?";

        List<People> query = jdbcTemplate.query(sql, new BeanPropertyRowMapper<People>(People.class), id);

        return query.get(0);
    }

    public int addPeople(People people){
        String sql = "insert into people value(?,?,?,?,?,?,?,?,?)";
        return jdbcTemplate.update(sql,null,people.getIDNum(),people.getName(),people.getGender(),people.getAge(),people.getAddress(),people.getEducation(),people.getIncome(),people.getIntensive());
    }

    public List<Integer> statistics(){
        List<Integer> count = new ArrayList<>();
        String sql1 = "select count(1) from people where age<10";
        count.add(jdbcTemplate.queryForObject(sql1, Integer.class));
        String sql2 = "select count(1) from people where age>=10 and age<20";
        count.add(jdbcTemplate.queryForObject(sql2, Integer.class));
        String sql3 = "select count(1) from people where age>=20 and age<30";
        count.add(jdbcTemplate.queryForObject(sql3, Integer.class));
        String sql4 = "select count(1) from people where age>=30 and age<40";
        count.add(jdbcTemplate.queryForObject(sql4, Integer.class));
        String sql5 = "select count(1) from people where age>=40 and age<50";
        count.add(jdbcTemplate.queryForObject(sql5, Integer.class));
        String sql6 = "select count(1) from people where age>=50 and age<60";
        count.add(jdbcTemplate.queryForObject(sql6, Integer.class));
        String sql7 = "select count(1) from people where age>=60 and age<70";
        count.add(jdbcTemplate.queryForObject(sql7, Integer.class));
        String sql8 = "select count(1) from people where age>=70";
        count.add(jdbcTemplate.queryForObject(sql8, Integer.class));

        for (int i = 0; i < 7; i++) {
            String sql = "select count(1) from people where education=?";
            Integer integer = jdbcTemplate.queryForObject(sql, Integer.class, i+1);
            count.add(integer);
        }

        for (int i = 0; i < 7; i++) {
            String sql = "select count(1) from people where income=?";
            Integer integer = jdbcTemplate.queryForObject(sql, Integer.class, i+1);
            count.add(integer);
        }
        return count;
    }
}
