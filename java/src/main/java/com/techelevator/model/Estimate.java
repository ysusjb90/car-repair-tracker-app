package com.techelevator.model;

import java.util.Date;

public class Estimate {
    private int estimateID;
    private Date date;
    private Date promisedDate;
    private boolean customerApproval;
    private boolean readyToBill;

    public Estimate(int estimateID, Date date, Date promisedDate, boolean customerApproval, boolean readyToBill) {
        this.estimateID = estimateID;
        this.date = date;
        this.promisedDate = promisedDate;
        this.customerApproval = customerApproval;
        this.readyToBill = readyToBill;
    }

    public int getEstimateID() {
        return estimateID;
    }

    public void setEstimateID(int estimateID) {
        this.estimateID = estimateID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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

    public boolean isReadyToBill() {
        return readyToBill;
    }

    public void setReadyToBill(boolean readyToBill) {
        this.readyToBill = readyToBill;
    }

    @Override
    public String toString() {
        return "Estimate{" +
                "estimateID=" + estimateID +
                ", date=" + date +
                ", promisedDate=" + promisedDate +
                ", customerApproval=" + customerApproval +
                ", readyToBill=" + readyToBill +
                '}';
    }
}
