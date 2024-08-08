package com.techelevator.dao;

import com.techelevator.model.Vehicle;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;


@Component
public class JdbcVehicleDAO implements VehicleDAO{
    private JdbcTemplate jdbcTemplate;

    public JdbcVehicleDAO (JdbcTemplate jdbcTemplate){
        this.jdbcTemplate=jdbcTemplate;
    }
// TODO need to fix SQL to join with bridge table; need join; fix FK
    @Override
    public List<Vehicle> getVehicleByUserId(int userId) {
        List<Vehicle> usersVehicleList = new ArrayList<>();
        Vehicle vehicle = new Vehicle();
        String sql = ("SELECT * FROM vehicle WHERE user_id = ?");
        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql, userId);
        if(rs.next()) {
            usersVehicleList.add(mapRowToVehicle(rs));
        }
        return usersVehicleList;
    } // note that this is coded as a list to capture all of a customer's cars

   // TODO Add back Override here??
    public Vehicle createVehicle(Vehicle vehicle) {
        return null;
    }

    public Vehicle mapRowToVehicle(SqlRowSet rs) {
        Vehicle vehicle = new Vehicle();
        vehicle.setVehicleID(rs.getInt("vehicle_id"));
        vehicle.setMake(rs.getString("vehicle_make"));
        vehicle.setModel(rs.getString("vehicle_model"));
        vehicle.setYear(rs.getInt("vehicle_year"));
        vehicle.setColor(rs.getString("vehicle_color"));
        vehicle.setActive(rs.getBoolean("vehicle_active"));


        return vehicle;
    }
}

