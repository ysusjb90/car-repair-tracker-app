package com.techelevator.model;

public class Vehicle {
    private int vehicleID;
    private String make;
    private String model;
    private int year;
    private String color;
    private Boolean isActive;

    public Vehicle(int vehicleID, String make, String model, int year, String color, boolean IsActive) {
        this.vehicleID = vehicleID;
        this.make = make;
        this.model = model;
        this.year = year;
        this.color = color;
        this.isActive = false;
    }
//do explicit default constructor
    public Vehicle(){};

    public int getVehicleID() {
        return vehicleID;
    }

    public void setVehicleID(int vehicleID) {
        this.vehicleID = vehicleID;
    }

    public String getMake() {
        return make;
    }

    public void setMake(String make) {
        this.make = make;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Boolean getActive() {
        return isActive;
    }

    public void setActive(Boolean active) {
        isActive = active;
    }

//    public int getVehicleID() {
//        return vehicleID;
//    }
//
//    public void setVehicleID(int vehicleID) {
//        this.vehicleID = vehicleID;
//    }
//
//    public String getMakeOfVehicle() {
//        return make;
//    }
//
//    public void setMakeOfVehicle(String makeOfVehicle) {
//        this.make = makeOfVehicle;
//    }
//
//    public String getModelOfVehicle() {
//        return model;
//    }
//
//    public void setModelOfVehicle(String modelOfVehicle) {
//        this.model = modelOfVehicle;
//    }
//
//    public int getYearOfVehicle() {
//        return year;
//    }
//
//    public void setYearOfVehicle(int yearOfVehicle) {
//        this.year = yearOfVehicle;
//    }
//
//    public String getColor() {
//        return color;
//    }
//
//    public void setColor(String color) {
//        this.color = color;
//    }
//
//    @Override
//    public String toString() {
//        return "Vehicle{" +
//                "vehicleID=" + vehicleID +
//                ", make='" + make + '\'' +
//                ", model='" + model + '\'' +
//                ", year=" + year +
//                ", color='" + color + '\'' +
//                '}';
//    }
}

