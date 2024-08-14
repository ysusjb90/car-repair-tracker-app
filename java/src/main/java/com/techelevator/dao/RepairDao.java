package com.techelevator.dao;

import com.techelevator.model.Repair;

import java.util.List;

public interface RepairDao {

    List<Repair> getRepairItemsList();
    Repair getRepairByDescription(String description);
    public List<Repair> getListOfPendingRepairs(int estimateId);



}
