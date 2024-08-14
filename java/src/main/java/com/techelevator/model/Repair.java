package com.techelevator.model;

public class Repair {
    // set variables //
    private int repairItemId;
    private String description;
    private int partsCost;
    private int laborCost;
    private int flatRateHours;
    private boolean isSuperseded;
    private boolean isApproved;
    public boolean getIsApproved() {
        return isApproved;
    }

    public void setIsApproved(boolean approved) {
        isApproved = approved;
    }

    public int getRepairItemId() {
        return repairItemId;
    }

    public void setRepairItemId(int repairItemId) {
        this.repairItemId = repairItemId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPartsCost() {
        return partsCost;
    }

    public void setPartsCost(int partsCost) {
        this.partsCost = partsCost;
    }

    public int getLaborCost() {
        return laborCost;
    }

    public void setLaborCost(int laborCost) {
        this.laborCost = laborCost;
    }

    public int getFlatRateHours() {
        return flatRateHours;
    }

    public void setFlatRateHours(int flatRateHours) {
        this.flatRateHours = flatRateHours;
    }

    public boolean isSuperseded() {
        return isSuperseded;
    }

    public void setSuperseded(boolean superseded) {
        isSuperseded = superseded;
    }

    //explicit default constructor//
    public Repair(){};

    //overload constructor//
    public Repair(int repairItemId, String description, int partsCost, int laborCost, int flatRateHours, boolean isSuperseded, boolean isApproved) {
        this.repairItemId = repairItemId;
        this.description = description;
        this.partsCost = partsCost;
        this.laborCost = laborCost;
        this.flatRateHours = flatRateHours;
        this.isSuperseded = isSuperseded;
        this.isApproved = isApproved;
    }
}