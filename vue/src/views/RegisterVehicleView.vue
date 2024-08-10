<template>
  <div class="register-vehicle-view">
    <h1>Register Vehicle</h1>
    <form @submit.prevent="registerVehicle">
      <div>
        <label class="service-label-dropdown" for="vehicle">Vehicle Year:</label>
            <select class="make-dropdown" id="vehicle-year" name="vehicle-year" required>
                <option value="">Select Year</option>
                <option value="1965">1965</option>
                <option value="1966">1966</option>
                <option value="1967">1967</option>
                <option value="1968">1968</option>
                <option value="1969">1969</option>
                <option value="1970">1970</option>
                <option value="1971">1971</option>
                <option value="1972">1972</option>
                <option value="1973">1973</option>
                <option value="1974">1974</option>
                <option value="1975">1975</option>
                <option value="1976">1976</option>
                <option value="1977">1977</option>
                <option value="1978">1978</option>
                <option value="1979">1979</option>
                <option value="1980">1980</option>
                <option value="1981">1981</option>
                <option value="1982">1982</option>
                <option value="1983">1983</option>
                <option value="1984">1984</option>
                <option value="1985">1985</option>
                <option value="1986">1986</option>
                <option value="1987">1987</option>
                <option value="1988">1988</option>
                <option value="1989">1989</option>
                <option value="1990">1990</option>
                <option value="1991">1991</option>
                <option value="1992">1992</option>
                <option value="1993">1993</option>
                <option value="1994">1994</option>
                <option value="1995">1995</option>
                <option value="1996">1996</option>
                <option value="1997">1997</option>
                <option value="1998">1998</option>
                <option value="1999">1999</option>
                <option value="2000">2000</option>
                <option value="2001">2001</option>
                <option value="2002">2002</option>
                <option value="2003">2003</option>
                <option value="2004">2004</option>
                <option value="2005">2005</option>
                <option value="2006">2006</option>
                <option value="2007">2007</option>
                <option value="2008">2008</option>
                <option value="2009">2009</option>
                <option value="2010">2010</option>
                <option value="2011">2011</option>
                <option value="2012">2012</option>
                <option value="2013">2013</option>
                <option value="2014">2014</option>
                <option value="2015">2015</option>
                <option value="2016">2016</option>
                <option value="2017">2017</option>
                <option value="2018">2018</option>
                <option value="2019">2019</option>
                <option value="2020">2020</option>
                <option value="2021">2021</option>
                <option value="2022">2022</option>
            </select>
      </div>
      <div>
        <label class="reg-vehicle-label" for="make">Make:</label>
        <input class="reg-vehicle-input" type="text" id="make" v-model="vehicle.make" required />
      </div>
      <div>
        <label class="reg-vehicle-label" for="model">Model:</label>
        <input class="reg-vehicle-input" type="text" id="model" v-model="vehicle.model" required />
      </div>
      <div>
        <label class="service-label-dropdown" for="vehicle">Vehicle Color:</label>
            <select class="make-dropdown" id="vehicle-color" name="vehicle-color" required>
                <option value="">Select Color</option>
                <option value="Black">Black</option>
                <option value="White">White</option>
                <option value="Silver">Silver</option>
                <option value="Gray">Gray</option>
                <option value="Red">Red</option>
                <option value="Blue">Blue</option>
                <option value="Green">Green</option>
                <option value="Yellow">Yellow</option>
                <option value="Orange">Orange</option>
                <option value="Purple">Purple</option>
            </select>
      </div>
      <div class="button-container">
        <button type="submit">Register</button>
      </div>
    </form>
  </div>
</template>

<script>
import vehicleService from '../services/VehicleService';
import authService from '../services/AuthService';

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
    async registerVehicle() {
      try {
        // Pass the vehicle data to the service method
        const response = await authService.registerVehicle(this.vehicle);
        if (response.status === 201) {
          this.$router.push({
            path: '/vehicle',
            query: { registration: 'Great success!' },
          });
        }
      } catch (error) {
        this.registrationErrors = true;
        if (error.response && error.response.status === 400) {
          this.registrationErrorMsg = 'Bad Request: Validation Errors';
        } else {
          this.registrationErrorMsg = 'An error occurred while registering the vehicle.';
        }
      }
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