import axios from "axios";
export default {
    createWorkOrder(woItems, estimateID) {
        let workOrderData = {
            selectedItems: woItems,
            estimateId: estimateID
        }
        return axios.post('/workorder', workOrderData)
    }
    
     
};
