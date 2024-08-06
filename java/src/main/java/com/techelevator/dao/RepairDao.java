package com.techelevator.dao;

import com.techelevator.model.Repair;

import java.util.List;

public interface RepairDao {

    List<Repair> getRepairItemsList();
    Repair getRepairByDescription(String description);
    //TODO add additional methods as they are added to jdbcRepairDAO



}
