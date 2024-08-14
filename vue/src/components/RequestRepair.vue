<template>
  <div>

    <h1 id="welcome">Welcome, {{ user.firstName }} {{ user.lastName }}</h1>

    <form class="service-request-form" v-on:submit.prevent="requestEstimate">
      <div id="car_stuff">

        
        <h2>Service Request Form</h2>

        <h2>Vehicle:</h2>
        <select v-on:change="selectedVehicleSearch" class="make-dropdown" id="user-vehicle" name="user-vehicle"
          v-model="selection">
          <option value="">Select Vehicle</option>

          <option v-for="vehicle in vehicles" :value="vehicle.vehicleId" :key="vehicle.vehicleId">
            {{ vehicle.make }} {{ vehicle.model }}
          </option>
        </select>
        <div class="hiddenWhenEmpty" v-show="selection != ''">

          <p>Customer Name: {{ user.firstName }} {{ user.lastName }}</p>
          <p>Email: {{ user.emailAddress }}</p>
          <p>Phone: {{ user.phoneNumber }}</p>
          <p>Year: {{ selectedVehicle.year }}</p>
          <p>Make: {{ selectedVehicle.make }}</p>
          <p>Model: {{ selectedVehicle.model }}</p>
          <p>Color: {{ selectedVehicle.color }}</p>
      </div>
          <p>Reason for Request:</p>
          <input class="reason" type="text" id="reason" v-model="selectedVehicle.descriptionOfProblem"
         required />
      
        <div class="button-container">
          <button type="submit">Submit Request</button>
        </div>
      </div>
    </form>


            
            
    

  </div>
</template>

<script>
import AuthService from "../services/AuthService";
import repairService from "../services/RepairService";
import vehicleService from "../services/VehicleService";
import CreateEstimate from "../components/CreateEstimate.vue";
import { mapState } from "vuex";

export default {
  components: {},

  data() {
    return {
      
      vehicle: {
        userId: "",
        year: "",
        make: "",
        model: "",
        color: "",

      },
      user: {
        firstName: "",
        lastName: "",
        emailAddress: "",
        phoneNumber: "",
      },
      vehicles: [],
      selectedVehicle: {},
      selection: "",
    }
  },

  methods: {
    getUserInformation() {
      repairService
        .getUserInformation()
        .then((response) => {
          this.user = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getUserVehicleList() {
      repairService
        .getUserVehicleList()
        .then((response) => {
          this.vehicles = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    requestEstimate() {
      
        // Pass the vehicle data to the service method
        let response;
        
        AuthService.registerEstimate(this.selectedVehicle).then((response) => {
          
            alert("Estimate Requested!");
            this.$router.push(
              {
                path: '/',
                query: { registration: 'Great success!' },
              }
            );
          
      }).catch( (error) => {
        this.registrationErrors = true;
        if (error.response && error.response.status === 400) {
          this.registrationErrorMsg = 'Bad Request: Validation Errors';
        } else {
          this.registrationErrorMsg = 'An error occurred while trying to create this estimate.';
        }
      })
    },
    
    selectedVehicleSearch() {
      if (this.selection !== "") {
        this.selectedVehicle = this.vehicles.find(
          (vehicle) => vehicle.vehicleId === this.selection
        );
      } else {
        this.selectedVehicle = {};
      }
    },
    
  },
  created() {
    //this.getUserDetails();
    this.getUserVehicleList();
    this.getUserInformation();
  },
};
</script>

<style scoped>
img {
  width: 300px;
  height: 300px;
}

#welcome  {
  color: black; 
  margin-bottom: 15px; 
}

h2 {
  background-color: white;
  font-family: Arial, Helvetica, sans-serif;
  text-align: center;
  size: 18px;
  margin-top: 10px;
  margin-bottom: 15px;
  Color: rgb(189, 14, 14);
}

h3 {
  background-color: white;
  font-family: Arial, Helvetica, sans-serif;
  text-align: center;
 
}


.service-request-form {
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: #fff;
  padding-left: 10px;
  padding-right: 10px;
  padding-top: 15px;
  padding-bottom: 15px;
  border-radius: 15px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  max-width: 400px;
  margin: 0px auto;

}

#car_stuff {
  display: flex;
  flex-direction: column;
  align-items: center;
}

/* create .css for id="reason" */
#userInfo {
  display: flex;
  flex-direction: column;
  align-items: left;
  font-family: Arial, Helvetica, sans-serif;
  color: rgb(189, 14, 14);
  background-color: white;
  padding: 10px;
  margin: 10px;
  border-radius: 10px;
  width: 200px;
  height: 250px;
  font-family: Arial, Helvetica, sans-serif;
}

#userInfo p {
  text-align: left;
  font-family: Arial, Helvetica, sans-serif;
  color: black;
}

body {
  background-color: #e3e1da;
}

h1 {
  margin-top: -10px;
  margin-bottom: -25px;
}

#request-service-form {
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: #fff;
  padding-left: 400px;
  padding-right: 400px;
  padding-top: 50px;
  padding-bottom: 50px;
  border-radius: 100px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  max-width: 800px;
  margin: 0px auto;
}

.service-label {
  margin-top: 5px;
  margin-bottom: 5px;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: medium;
  color: rgb(189, 14, 14);
}

.service-input {
  margin-bottom: 15px;
  border-radius: 2px;
  height: 20px;
}

.make-dropdown {
  margin-bottom: 15px;
  border-radius: 2px;
  height: 30px;
  width: 43%;
  border: 1px black solid;
}

.service-label-dropdown {
  margin-top: 10px;
  margin-bottom: 5px;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: medium;
  color: rgb(189, 14, 14);
}

#description {
  margin-top: 5px;
  background-color: white;
  border-radius: 4px;
  border: 2px solid #ccc;
  width: 75%;
  box-sizing: border-box;
  /* Ensure textarea aligns with input fields */
  padding: 10px;
}

#desc-service-label {
  margin-top: 10px;
  margin-bottom: 5px;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: medium;
}

.reason {
  text-align: left;
  width: 100%;
  height: 100px;
  word-wrap: normal;
}
</style>
