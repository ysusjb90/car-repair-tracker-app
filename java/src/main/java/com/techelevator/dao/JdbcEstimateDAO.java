package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Estimate;
import com.techelevator.model.Repair;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
@Component
public class JdbcEstimateDAO implements EstimateDAO{

    private final JdbcTemplate jdbcTemplate;

    public JdbcEstimateDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public Estimate getEstimateByID(int estimateID) {
        Estimate singleEstimate = null;
        String sql = "SELECT * FROM estimates WHERE estimate_id = ?;";
        SqlRowSet row = jdbcTemplate.queryForRowSet(sql, estimateID);

        if(row.next()) {
            singleEstimate = mapRowToEstimate(row);
        }
        return singleEstimate;
    }

    @Override
    public List<Estimate> getListOfEstimates() {
        List<Estimate> estimatesList = new ArrayList<>();

        String sql = "SELECT estimate_id, user_id, vehicle_id, description_of_problem, date_created, total_cost, recall_id, " +
                "promised_completion_date, approved_by_customer, job_complete, is_paid FROM estimates";

        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                Estimate estimate = mapRowToEstimate(results);
                estimatesList.add(estimate);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database",e);
        }
        return estimatesList;
    }




    //public Estimate createEstimate(Estimate estimate) {
    //    Estimate newEstimate = null;
    //    String sql = "INSERT INTO estimates (user_id, vehicle_id, description_of_problem, date_created, total_cost, recall_id, " +
    //            "promised_completion_date, approved_by_customer, job_complete, is_paid) " +
    //            "VALUES (?,?,?,?,?,?,?,?,?) RETURNING estimate_id;";
    //    int newEstimateRows = jdbcTemplate.queryForObject(sql, int.class,
    //            estimate.getUserId(),
    //            estimate.getVehicleId(),
    //            estimate.getDescriptionOfProblem(),
    //            estimate.getCreatedDate(),
    //            estimate.getRecallId(),
    //            estimate.getTotalCost(),
    //            estimate.getPromisedDate(),
    //            estimate.isCustomerApproval(),
    //            estimate.isCompleted(),
    //            estimate.isPaid());
    //    newEstimate = getEstimateByID(newEstimateRows);
//
    //    return newEstimate;
//TO//DO Look at rewriting the above to match the createvehicle method jbdcVehicleDAO
    //}
    @Override
    public Estimate createEstimate(Estimate estimate, int userId){
        String sql = "INSERT INTO estimates (user_id, vehicle_id, description_of_problem, date_created, total_cost, recall_id, " +
                    "promised_completion_date, approved_by_customer, job_complete, is_paid) " +
                   "VALUES (?,?,?,CURRENT_DATE,?,?,?,?,?,?);";
        jdbcTemplate.update(sql,
                userId,
                estimate.getVehicleId(),
                estimate.getDescriptionOfProblem(),
                // estimate.getCreatedDate(),
                estimate.getRecallId(),
                estimate.getTotalCost(),
                estimate.getPromisedDate(),
                estimate.isCustomerApproval(),
                estimate.isCompleted(),
                estimate.isPaid());
        return estimate;
    }

    public void addRepairItemToEstimate( int repairItemId, int estimateId){

        String sql = "INSERT INTO work_order_items " +
                "(estimate_id, repair_item_id, recall_id, item_complete, repair_notes, is_approved) " +
                "VALUES (?, ?, ?, ?, ?, ?);";
        jdbcTemplate.update(sql,
                repairItemId,
                estimateId) ;
        //TODO test this to confirm that it works.
    }
    public Estimate addListOfRepairItemsToEstimate(List<com.techelevator.model.Repair> selectedItems, int estimateId){
        int targetEstimate = estimateId;
        String sql = "INSERT INTO work_order_items (estimate_id,repair_item_id, is_approved) VALUES (?, ?, ?)";
        for(Repair item : selectedItems) {
            jdbcTemplate.update(sql, targetEstimate, item.getRepairItemId(), item.getIsApproved());
        }
        return getEstimateByID(targetEstimate);
    }


    private Estimate mapRowToEstimate(SqlRowSet rows) {
        Estimate estimate = new Estimate();
        estimate.setEstimateID(rows.getInt("estimate_id"));
        estimate.setUserId(rows.getInt("user_id"));
        estimate.setVehicleId((rows.getInt("vehicle_id")));
        estimate.setDescriptionOfProblem(rows.getString("description_of_problem"));
        estimate.setCreatedDate(rows.getDate("date_created"));
        estimate.setTotalCost(rows.getInt("total_cost"));
        estimate.setRecallId(rows.getInt("recall_id"));
        estimate.setPromisedDate(rows.getDate("promised_completion_date"));
        estimate.setCustomerApproval(rows.getBoolean("approved_by_customer"));
        estimate.setCompleted(rows.getBoolean("job_complete"));
        estimate.setPaid(rows.getBoolean("is_paid"));
        return estimate;

    }

}
