import axios from "axios";
export default {
    getRepairItems() {
        return axios.get('/repairs')
    },
    registerDetails(userDetails) {
        return axios.post('/users', userDetails)
      },
    getUserDetails() {
        return axios.get('/users')
    },
    getUserVehicleList() {
        return axios.get('/vehicle')
    }
     

};