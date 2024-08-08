package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Repair;
import com.techelevator.model.User;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import com.techelevator.model.Repair;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class JdbcRepairDAO implements RepairDao  {

    private  JdbcTemplate repairItemTemplate;

    public JdbcRepairDAO(JdbcTemplate jdbcTemplate) {
        this.repairItemTemplate = jdbcTemplate;
    }

    @Override
    public List<Repair> getRepairItemsList() {
        List<Repair> repairsList = new ArrayList<>();
        String sql = "SELECT repair_item_id, description, parts_cost, labor_cost, flat_rate_hours, issuperseded FROM repair_items;";

        try {
            SqlRowSet results = repairItemTemplate.queryForRowSet(sql);
            while (results.next()) {
                Repair repair = mapRowToRepair(results);
                repairsList.add(repair);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database",e);
        }

        //System.out.println(repairsList);
        return repairsList;
    }

    public Repair mapRowToRepair(SqlRowSet rs) {
        Repair repair = new Repair();
        repair.setRepairItemId(rs.getInt("repair_item_id"));
        repair.setDescription(rs.getString("description"));
        repair.setPartsCost(rs.getInt("parts_cost"));
        repair.setLaborCost(rs.getInt("labor_cost"));
        repair.setFlatRateHours(rs.getInt("flat_rate_hours"));
        repair.setSuperseded(rs.getBoolean("issuperseded"));
        return repair;
    }
    @Override
    public Repair getRepairByDescription(String description) {
        if (description == null) throw new IllegalArgumentException("Part name cannot be null");
        Repair repair = null;
        String sql = "SELECT repair_item_id, description, parts_cost, labor_cost, flat-rate_hours, issuperseded " +
                "FROM repair_items WHERE description = LOWER(TRIM(ILIKE '%?%'));";

        //TODO Need to correct the sql to use the LIKE function"
        try {
            SqlRowSet rowSet = repairItemTemplate.queryForRowSet(sql, description);
            if (rowSet.next()) {
                repair = mapRowToRepair(rowSet);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        }
        return repair;
    }
}
