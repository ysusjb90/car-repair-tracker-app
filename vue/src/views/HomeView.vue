<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>
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
<style scoped>
template{
  background-color: #E3E1DA;
}
.form-input-group {
  background-color:white;
}
</style>
