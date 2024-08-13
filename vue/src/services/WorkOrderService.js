import axios from "axios";
export default {
    createWorkOrder(selectedItems, estimateID) {
        let workOrderData = {
            selectedItems: selectedItems.map(String),
            estimateID: estimateID
        }
        return axios.post('/workorder', workOrderData)
    }
    
     
};
