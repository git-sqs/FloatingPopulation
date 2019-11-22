package com.floatingpopulation.pojo;

public class House {
    private int id;
    private String addr;
    private double price;
    private double area;
    private int floor;
    private int rent;
    private int fitment;
    private int master;
    private String name;
    private String gender;
    private int age;
    private String idNum;
    private int photo;
    private String myRent;
    private String myFitment;

    private String rentName;
    private String rentId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

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

    public int getMaster() {
        return master;
    }

    public void setMaster(int master) {
        this.master = master;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMyRent() {
        return myRent;
    }

    public void setMyRent(String myRent) {
        this.myRent = myRent;
    }

    public String getMyFitment() {
        return myFitment;
    }

    public void setMyFitment(String myFitment) {
        this.myFitment = myFitment;
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

    public String getIdNum() {
        return idNum;
    }

    public void setIdNum(String idNum) {
        this.idNum = idNum;
    }

    public int getPhoto() {
        return photo;
    }

    public void setPhoto(int photo) {
        this.photo = photo;
    }

    public String getRentName() {
        return rentName;
    }

    public void setRentName(String rentName) {
        this.rentName = rentName;
    }

    public String getRentId() {
        return rentId;
    }

    public void setRentId(String rentId) {
        this.rentId = rentId;
    }

    @Override
    public String toString() {
        return "House{" +
                "id=" + id +
                ", addr='" + addr + '\'' +
                ", price=" + price +
                ", area=" + area +
                ", floor=" + floor +
                ", rent=" + rent +
                ", fitment=" + fitment +
                ", master=" + master +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", age=" + age +
                ", idNum='" + idNum + '\'' +
                ", photo=" + photo +
                ", myRent='" + myRent + '\'' +
                ", myFitment='" + myFitment + '\'' +
                ", rentName='" + rentName + '\'' +
                ", rentId='" + rentId + '\'' +
                '}';
    }
}
