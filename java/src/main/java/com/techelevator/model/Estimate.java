package com.techelevator.model;

import java.util.Date;

public class Estimate {
    private int estimateID;
    private int userId;
    private int vehicleId;
    private String descriptionOfProblem;
    private Date createdDate;
    private int totalCost;
    private int recallId;
    private Date promisedDate;
    private boolean customerApproval;
    private boolean isCompleted;
    private boolean isPaid;

    public Estimate(int estimateID, int userId, int vehicleId, String descriptionOfProblem,
                    Date createdDate, int recallId, Date promisedDate,
                    boolean customerApproval, boolean isCompleted, boolean isPaid) {
        this.estimateID = estimateID;
        this.userId = userId;
        this.vehicleId = vehicleId;
        this.descriptionOfProblem = descriptionOfProblem;
        this.createdDate = createdDate;
        this.recallId = recallId;
        this.promisedDate = promisedDate;
        this.customerApproval = customerApproval;
        this.isCompleted = isCompleted;
        this.isPaid = isPaid;
    }

    public Estimate(){};

    public int getEstimateID() {
        return estimateID;
    }

    public void setEstimateID(int estimateID) {
        this.estimateID = estimateID;
    }

    public Date getPromisedDate() {
        return promisedDate;
    }

    public void setPromisedDate(Date promisedDate) {
        this.promisedDate = promisedDate;
    }

    public boolean isCustomerApproval() {
        return customerApproval;
    }

    public void setCustomerApproval(boolean customerApproval) {
        this.customerApproval = customerApproval;
    }

    public String getDescriptionOfProblem() {
        return descriptionOfProblem;
    }

    public void setDescriptionOfProblem(String descriptionOfProblem) {
        this.descriptionOfProblem = descriptionOfProblem;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getRecallId() {
        return recallId;
    }

    public void setRecallId(int recallId) {
        this.recallId = recallId;
    }

    public boolean isCompleted() {
        return isCompleted;
    }

    public void setCompleted(boolean completed) {
        isCompleted = completed;
    }

    public boolean isPaid() {
        return isPaid;
    }

    public void setPaid(boolean paid) {
        isPaid = paid;
    }

    public int getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(int totalCost) {
        this.totalCost = totalCost;
    }

    @Override
    public String toString() {
        return "Estimate{" +
                "estimateID=" + estimateID +
                ", userId=" + userId +
                ", vehicleId=" + vehicleId +
                ", descriptionOfProblem='" + descriptionOfProblem + '\'' +
                ", createdDate=" + createdDate +
                ", totalCost =" + totalCost +
                ", recallId=" + recallId +
                ", promisedDate=" + promisedDate +
                ", customerApproval=" + customerApproval +
                ", isCompleted=" + isCompleted +
                ", isPaid=" + isPaid +
                '}';
    }
}

