import axios from 'axios';

export default{

getWorkOrdersByUserId(id) {
    return axios.get(`/myworkorder/myid/${id}`)
}
}