package com.techelevator.dao;

import com.techelevator.model.Vehicle;
import org.springframework.jdbc.core.JdbcTemplate;

public class JdbcVehicleDAO implements VehicleDAO{
    private JdbcTemplate jdbcTemplate;

    public JdbcVehicleDAO (JdbcTemplate jdbcTemplate){
        this.jdbcTemplate=jdbcTemplate;
    }

    @Override
    public Vehicle getVehicleById(int vehicleID) {
        return null;
    }
}
