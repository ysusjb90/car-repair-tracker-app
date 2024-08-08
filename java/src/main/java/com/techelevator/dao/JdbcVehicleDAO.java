package com.techelevator.dao;

import com.techelevator.model.Vehicle;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

//TODO add compoent!!!!!
@Component
public class JdbcVehicleDAO implements VehicleDAO{
    private JdbcTemplate jdbcTemplate;

    public JdbcVehicleDAO (JdbcTemplate jdbcTemplate){
        this.jdbcTemplate=jdbcTemplate;
    }

    @Override
    public List<Vehicle> getVehicleByUserId(int userId) {
        List<Vehicle> usersVehicleList = new ArrayList<>();
        Vehicle vehicle = new Vehicle;
        String sql = ("SELECT * FROM vehicle WHERE user_id = ?");




        return null;
    }
    Override
    public Vehicle createVehicle(Vehicle vehicle) {
        return null;
    }
}
