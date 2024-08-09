package com.techelevator.dao;

import com.techelevator.model.Vehicle;

import java.util.List;

public interface VehicleDAO {
    List<Vehicle> getVehicleByUserId(int userId);
    Vehicle createVehicle(Vehicle vehicle);


}
