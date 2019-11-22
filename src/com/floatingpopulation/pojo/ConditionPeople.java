package com.floatingpopulation.pojo;

/**
 * @author Administrator
 */
public class ConditionPeople {
    private String name;
    private String IDNum;
    private int age;
    private String gender;
    private String address;
    private int education;
    private int intensive;
    private int income;
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIDNum() {
        return IDNum;
    }

    public void setIDNum(String IDNum) {
        this.IDNum = IDNum;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getEducation() {
        return education;
    }

    public void setEducation(int education) {
        this.education = education;
    }

    public int getIncome() {
        return income;
    }

    public void setIncome(int income) {
        this.income = income;
    }

    public int getIntensive() {
        return intensive;
    }

    public void setIntensive(int intensive) {
        this.intensive = intensive;
    }

    @Override
    public String toString() {
        return "ConditionPeople{" +
                "name='" + name + '\'' +
                ", IDNum='" + IDNum + '\'' +
                ", age=" + age +
                ", gender='" + gender + '\'' +
                ", address='" + address + '\'' +
                ", education=" + education +
                ", income=" + income +
                ", intensive=" + intensive +
                '}';
    }
}
