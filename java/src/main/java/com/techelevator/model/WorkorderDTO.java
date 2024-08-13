package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

public class WorkorderDTO {

    private List<Repair> SelectedItems = new ArrayList<>();
    private int estimateId;

    public List<Repair> getSelectedItems() {
        return SelectedItems;
    }

    public void setSelectedItems(List<Repair> selectedItems) {
        SelectedItems = selectedItems;
    }

    public int getEstimateId() {
        return estimateId;
    }

    public void setEstimateId(int estimateId) {
        this.estimateId = estimateId;
    }
}
