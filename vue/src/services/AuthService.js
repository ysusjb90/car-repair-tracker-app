import axios from 'axios';

const http = axios.create({
  baseURL: import.meta.env.VITE_REMOTE_API
});

export default {



  login(user) {
    return http.post('/login', user)
  },
  getUser(user) {
    return http.get('/users', user)
  },


  register(user) {
    return http.post('/register', user)
  },

  registerEmployee(user) {
    return http.post('/registerEmployee', user)
  },

  registerDetails(userDetails) {
    return axios.post('/users', userDetails)
  },

  registerVehicle(vehicleData) {

    return axios.post('/vehicle', vehicleData);
  },
  registerEstimate(selectedVehicle) {
    return axios.post('/estimates', selectedVehicle)
  },

  getAllVehicles() {
    return axios.get('/vehicle/all')
},


 

}
