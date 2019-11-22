package com.floatingpopulation.pojo;

public class ConditionHouse {
    private int rent;
    private int fitment;
    private int area;

    public int getRent() {
        return rent;
    }

    public void setRent(int rent) {
        this.rent = rent;
    }

    public int getFitment() {
        return fitment;
    }

    public void setFitment(int fitment) {
        this.fitment = fitment;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    @Override
    public String toString() {
        return "ConditionHouse{" +
                "rent=" + rent +
                ", fitment=" + fitment +
                ", area=" + area +
                '}';
    }
}
