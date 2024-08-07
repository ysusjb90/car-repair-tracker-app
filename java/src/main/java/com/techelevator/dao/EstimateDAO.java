package com.techelevator.dao;

import com.techelevator.model.Estimate;
import com.techelevator.dao.JdbcEstimateDAO;

import java.util.List;

public interface EstimateDAO {
    Estimate getEstimateByID(int estimateID);
    Estimate createEstimate(Estimate estimate);
    List<Estimate> getListOfEstimates();



}
