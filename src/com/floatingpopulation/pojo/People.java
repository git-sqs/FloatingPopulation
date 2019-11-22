package com.floatingpopulation.pojo;

public class People {
    private int id;
    private String IDNum;
    private String name;
    private String gender;
    private int age;
    private String address;
    private int education;
    private int income;
    private int intensive;
    private String level;
    private String sort;
    private String everyIncome;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIDNum() {
        return IDNum;
    }

    public void setIDNum(String IDNum) {
        this.IDNum = IDNum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
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

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getEveryIncome() {
        return everyIncome;
    }

    public void setEveryIncome(String everyIncome) {
        this.everyIncome = everyIncome;
    }

    @Override
    public String toString() {
        return "People{" +
                "id=" + id +
                ", IDNum='" + IDNum + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", age=" + age +
                ", address='" + address + '\'' +
                ", education=" + education +
                ", income=" + income +
                ", intensive=" + intensive +
                ", level='" + level + '\'' +
                ", sort='" + sort + '\'' +
                ", everyIncome='" + everyIncome + '\'' +
                '}';
    }
}
