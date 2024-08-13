import axios from "axios";

export default {
    getRepairItems() {
        return axios.get('/repairs')
    },
    registerDetails(userDetails) {
        return axios.post('/users', userDetails)
    },
    getUserInformation() {
        return axios.get('/users')
    },
    getUserVehicleList() {
        return axios.get('/vehicle')
    },
    getAllUsers() {
        return axios.get('/userlist')
    }
}