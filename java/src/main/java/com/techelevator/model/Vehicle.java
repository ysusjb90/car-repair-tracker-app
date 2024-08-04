package com.techelevator.model;

public class Vehicle {
    private int vehicleID;
    private String make;
    private String model;
    private int year;
    private String color;

    public Vehicle(int vehicleID, String make, String model, int year, String color) {
        this.vehicleID = vehicleID;
        this.make = make;
        this.model = model;
        this.year = year;
        this.color = color;
    }

    public int getVehicleID() {
        return vehicleID;
    }

    public void setVehicleID(int vehicleID) {
        this.vehicleID = vehicleID;
    }

    public String getMakeOfVehicle() {
        return make;
    }

    public void setMakeOfVehicle(String makeOfVehicle) {
        this.make = makeOfVehicle;
    }

    public String getModelOfVehicle() {
        return model;
    }

    public void setModelOfVehicle(String modelOfVehicle) {
        this.model = modelOfVehicle;
    }

    public int getYearOfVehicle() {
        return year;
    }

    public void setYearOfVehicle(int yearOfVehicle) {
        this.year = yearOfVehicle;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public String toString() {
        return "Vehicle{" +
                "vehicleID=" + vehicleID +
                ", make='" + make + '\'' +
                ", model='" + model + '\'' +
                ", year=" + year +
                ", color='" + color + '\'' +
                '}';
    }
}

