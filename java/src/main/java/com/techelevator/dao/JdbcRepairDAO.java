package com.techelevator.dao;

import com.techelevator.model.Repair;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JdbcRepairDAO implements RepairDao  {

//
//    private JdbcTemplate jdbcTemplate;
//    public JdbcRepairDAO(JdbcTemplate jdbcTemplate) {
//        this.jdbcTemplate = jdbcTemplate;
//
//
//
//
//    }
//    public Map<Integer, Object[]> getRepairItemsList() {
//        String sql = "SELECT * from repair_items";
//        List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
//
//        List<Map<String, Object>> repairItemsMap = new HashMap<>();
//
//        for (Map<String, Object> row: rows) {
//            Integer repairItemId = row.get("repair_item_id");
//            String description = row.get("description");
//            Integer partsCost = row.get("parts_cost");
//            Integer laborCost = row.get("labor_cost");
//            Integer flatRateHours = row.get("flat_rate_hours");
//        }
//
//// Standard version of mapper //
//
//
//
//
//    }
//
//
//
//
//
//// add a mapper  (does it need an @Override?? - I don't think so.
//
//    private Repair mapRowToRepair(SqlRosSet rs) {
//
//
//    }
//
//
//
//
//
//
//
//
//


}
