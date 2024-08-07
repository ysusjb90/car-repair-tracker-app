<template>
  <div class="home">
    


  </div>
  
  <RequestRepair />
  <VehicleRegistration />
</template>

<script>

import RequestRepair from '../components/RequestRepair.vue';
import VehicleRegistration from '../components/VehicleRegistration.vue';


export default {

components: {
  RequestRepair,
  VehicleRegistration

},


};
</script>
<style>


template {
  background-color: #E3E1DA;
}
.form-input-group {
  background-color:white;
}

.home-view {
  text-align: center;
  font-family: Arial, Helvetica, sans-serif;
  color: rgb(189, 14, 14);
  font-weight: bold; 
  font-size: xx-large;
  margin-top: 45px;
  margin-bottom: 15px;
}

#link {
  background-color: #636364;
  padding: 10px;
  font-family: Arial, Helvetica, sans-serif;
  color: white;
  font-size: medium;
  
}

.authentication-font {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 16px;
  font-style: italic;
  text-align: center;
  margin-top: 20px;
}



</style>
