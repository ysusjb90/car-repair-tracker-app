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
          <label class="reg-vehicle-label" for="vin">VIN:</label>
          <input class="reg-vehicle-input" type="text" id="vin" v-model="vehicle.vin" required />
        </div>
        <button type="submit">Register</button>
      </form>
    </div>
  </template>
  
  <script>
  export default {
    name: 'RegisterVehicleView',
    data() {
      return {
        vehicle: {
          make: '',
          model: '',
          year: '',
          vin: ''
        }
      };
    },
    methods: {
      registerVehicle() {
        // Handle vehicle registration logic here
        console.log('Vehicle registered:', this.vehicle);
        // You can add more logic to send the data to a server, etc.
      }
    }
  };
  </script>
  
  <style scoped>

.reg-vehicle-label {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 16px;
    color: rgb(189, 14, 14);
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
  
  .register-vehicle-view button {
    display: flex;
    justify-content: center;
    width: 50%;
   
    padding: 10px;
    background-color: rgb (189, 14, 14);
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }
  
  .register-vehicle-view button:hover {
    background-color: #0056b3;
  }
  </style>