import axios from "axios";

export default {
    registerVehicle() {
        return axios.post('/vehicle')
    },
    getVehicleByUserId() {
     return axios.get('/vehicle')
    },

};