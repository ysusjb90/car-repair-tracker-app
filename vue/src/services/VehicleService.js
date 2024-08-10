import axios from "axios";

export default {
    
    getVehicleByUserId() {
     return axios.get('/vehicle')
    },
    getVehicleMake(){
        return axios.get('/vehicle/make')
    },
    getVehicleMakeByModel(){
        return axios.get('/vehicle/make/model')
    }

};