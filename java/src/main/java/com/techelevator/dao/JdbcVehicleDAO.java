package com.techelevator.dao;

import com.techelevator.model.UserDetail;
import com.techelevator.model.Vehicle;
import org.springframework.data.repository.query.Param;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;


@Component
public class JdbcVehicleDAO implements VehicleDAO{
    private JdbcTemplate jdbcTemplate;

    public JdbcVehicleDAO (JdbcTemplate jdbcTemplate){
        this.jdbcTemplate=jdbcTemplate;
    }


    @Override
    public List<Vehicle> getVehicleByUserId(int userId) {
        List<Vehicle> usersVehicleList = new ArrayList<>();
        String sql = "SELECT * FROM vehicle WHERE user_id = ?";


        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql, userId);

        while (rs.next()) {
            usersVehicleList.add(mapRowToVehicle(rs));
        }

        return usersVehicleList;
    }


    @Override
    public Vehicle createVehicle(Vehicle vehicle, int userId) {
        Vehicle newVehicle = null;

        String sql = "INSERT INTO vehicle(user_id, vehicle_make, vehicle_model, vehicle_year,  vehicle_color)  VALUES (?,?,?,?,?) RETURNING vehicle_id;";


        int newVehicleRows = jdbcTemplate.queryForObject(sql, int.class,
                userId,
                vehicle.getMake(),
                vehicle.getModel(),
                vehicle.getYear(),
                vehicle.getColor());
        newVehicle = getVehicleById(newVehicleRows);

        return newVehicle;
    }

    @Override
    public Vehicle getVehicleById(int vehicleId) {
        return null;
    }

// GFV ## working here



    // TODO Add back Override here??
    public Vehicle createVehicle(Vehicle vehicle) {
        // user.getid is the second paramater after vehicle ;inserting into vehicle table first - get vehicle ID then pass in int userId plus
        //  UPdate1 into vehicles - get veh id;  call next method that Updates , user id second paramater
        return null;
    }

    @Override
    public List<Vehicle> getModelByMake(String make) {
        return null;
    }

    public Vehicle mapRowToVehicle(SqlRowSet rs) {
        Vehicle vehicle = new Vehicle();
        vehicle.setVehicleID(rs.getInt("vehicle_id"));
        vehicle.setMake(rs.getString("vehicle_make"));
        vehicle.setModel(rs.getString("vehicle_model"));
        vehicle.setYear(rs.getInt("vehicle_year"));
        vehicle.setColor(rs.getString("vehicle_color"));
        return vehicle;
    }
}

