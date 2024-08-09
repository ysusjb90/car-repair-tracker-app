<template>
  <div class="register-vehicle-view">
    <h1>Register Vehicle</h1>
    <form @submit.prevent="registerVehicle">
      <div>
        <label class="reg-vehicle-label" for="make">Make:</label>
        <input class="reg-vehicle-input" type="text" id="make" v-model="vehicle.make" required />
      </div>
      <div>
        <label class="reg-vehicle-label" for="model">Model:</label>
        <input class="reg-vehicle-input" type="text" id="model" v-model="vehicle.model" required />
      </div>
      <div>
        <label class="reg-vehicle-label" for="year">Year:</label>
        <input class="reg-vehicle-input" type="number" id="year" v-model="vehicle.year" required />
      </div>
      <div>
        <label class="reg-vehicle-label" for="color">Color:</label>
        <input class="reg-vehicle-input" type="text" id="color" v-model="vehicle.color" required />
      </div>
      <div class="button-container">
        <button type="submit">Register</button>
      </div>
    </form>
  </div>
</template>

<script>
import vehicleService from '../services/VehicleService';
import AuthService from '../services/AuthService';

export default {
  name: 'RegisterVehicleView',
  data() {
    return {
      vehicle: {
        make: '',
        model: '',
        year: '',
        color: ''
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this vehicle.',
    };
  },
  methods: {
    registerVehicle() {
      vehicleService
        .registerVehicle(this.vehicle)
        .then((response) => {
          if (response.status === 201) {
            this.$router.push({
              path: '/vehicle',
              query: { registration: 'Great success!' },
            });
          }
        })
        .catch((error) => {
          this.registrationErrors = true;
          if (error.response && error.response.status === 400) {
            this.registrationErrorMsg = 'Bad Request: Validation Errors';
          } else {
            this.registrationErrorMsg = 'An error occurred while registering the vehicle.';
          }
        });
    }
  },
};
</script>

<style scoped>
.reg-vehicle-label {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 16px;
  color: rgb(189, 14, 14);
  font-weight: bold;
}

.reg-vehicle-input {
  width: 50%;
  padding: 8px;
  box-sizing: border-box;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.register-vehicle-view {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
  background-color: white;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.register-vehicle-view h1 {
  text-align: center;
  margin-bottom: 20px;
}

.register-vehicle-view form div {
  margin-bottom: 15px;
}

.register-vehicle-view label {
  display: block;
  margin-bottom: 5px;
}

.register-vehicle-view input {
  width: 100%;
  padding: 8px;
  box-sizing: border-box;
}

.button-container {
  display: flex;
  justify-content: center;
  /* Center the button horizontally */
}

.register-vehicle-view button:hover {
  background-color: #0056b3;
}
</style>