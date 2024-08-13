package com.techelevator.dao;

import com.techelevator.model.Estimate;
import com.techelevator.dao.JdbcEstimateDAO;

import java.util.List;

public interface EstimateDAO {
    Estimate getEstimateByID(int estimateID);
    Estimate createEstimate(Estimate estimate, int userId);
    List<Estimate> getListOfEstimates();
    void addRepairItemToEstimate(int repairItemId, int estimateId);
    Estimate addListOfRepairItemsToEstimate(List<String> SelectedItems, int estimateId);



}
