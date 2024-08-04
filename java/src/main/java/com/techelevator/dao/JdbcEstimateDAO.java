package com.techelevator.dao;

import com.techelevator.model.Estimate;
import org.springframework.jdbc.core.JdbcTemplate;

public class JdbcEstimateDAO implements EstimateDAO{

    private final JdbcTemplate jdbcTemplate;

    public JdbcEstimateDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public Estimate getEstimateByID(int estimateID) {
        return null;
    }
}
