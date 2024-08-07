package com.techelevator.dao;

import com.techelevator.model.Estimate;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

public class JdbcEstimateDAO implements EstimateDAO{

    private final JdbcTemplate jdbcTemplate;

    public JdbcEstimateDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public Estimate getEstimateByID(int estimateID) {
        return null;
    }

//    @Override
//    public Estimate createEstimate(Estimate estimate) {
//        Estimate newEstimate = null;
//        String sql = "INSERT INTO estimates(user_id, vehicle_id, date_created, recall_id, " +
//                "promised_completion_date, approved_by_customer, job_complete, is_paid) " +
//                "VALUES (?,?,?,?,?,?,?,?);";
//        SqlRowSet newEstimateRows = jdbcTemplate.queryForRowSet(sql,estimate.getUserId(),
//                estimate.getVehicleId(),"current date",0,
//                estimate.getPromisedDate(),"false","false","false");
//        if(newEstimateRows.next()){
//            newEstimate = mapRowToEstimate (newEstimateRows);
//        }
//        return newEstimate;
//
//    }
//
//    private Estimate mapEstimateToEstimate(sqlRowSet rows) {
//        retun null;
//    }

}
