package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

public class WorkorderDTO {

    private List<String> SelectedItems = new ArrayList<>();
    private int estimateId;

    public List<String> getSelectedItems() {
        return SelectedItems;
    }

    public void setSelectedItems(List<String> selectedItems) {
        SelectedItems = selectedItems;
    }

    public int getEstimateId() {
        return estimateId;
    }

    public void setEstimateId(int estimateId) {
        this.estimateId = estimateId;
    }
}
