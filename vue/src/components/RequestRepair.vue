<template>

    <div>
        <form id="estimate-form">
            <img src="src\assets\manic.jpg">
            <div id="userInfo">
                <h2>Customer: </h2>
                <p>Name: </p>
                <p>Email: </p>
                <p>Phone: </p>

            </div>
            <!--<div id="userInfo" v-bind="user">
                <h2>Customer:</h2>
                <p>Name: {{ user.firstName }} {{ user.lastName }}</p>
                <p>Email: {{ user.emailAddress }} </p>
                <p>Phone: {{ user.phoneNumber }} </p>

            </div>-->
            <div id="userInfo">
                <h2>Vehicle:</h2>
                <select class="make-dropdown" id="user-vehicle" name="user-vehicle" v-model="selection">
                    <option value="vehicle" disabled selected hidden>Select Vehicle</option>

                    <option value="vehicle" v-for="vehicle in vehicles" :key="vehicle.vehicleID">
                        {{ vehicle.make }} {{ vehicle.model }}
                    </option>
                </select>
                <div v-show="selection==vehicle.vehicleID">

                    <p>Year: {{ vehicle.year }}</p>
                    <p>Make: {{ vehicle.make }}</p>
                    <p>Model: {{ vehicle.model }} </p>
                </div>
            </div>

        </form>


        <form id="request-service-form">
            <h1>Request Service</h1>

            
            
    

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

            <label class="service-label" for="vehicle">Vehicle Make:</label>
            <input class="service-input" type="text" id="vehicle" name="vehicle" required>

    

            
            <label class="service-label" for="vehicle">Vehicle Model:</label>
            <input class="service-input" type="text" id="vehicle" name="vehicle" required>


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

            <label id="desc-service-label" for="description">Please describe the problem:</label>
            <textarea id="description" name="description" required></textarea>

            <button type="submit">Submit</button>
        </form>

    </div>


</template>

<script>
import repairService from '../services/RepairService';
import vehicleService from '../services/VehicleService';

export default {


    components: {


    },


    data() {
        return {
            estimate: {
                userId: '',
                vehicleId: '',
                createdDate: ''
            },

            vehicle: {
                year: '',
                make: '',
                model: '',
                color: ''
            },
            user: {
                firstName: '',
                lastName: '',
                emailAddress: '',
                phoneNumber: ''
            },
            vehicles: [],
            selection: '',
        }
    },

    methods: {
        getUserInformation() {
            repairService.getUserDetails().then(response => {
                this.user = response.data;
            }).catch(error => {
                console.log(error);
            });
        },
        getUserVehicleList() {
            repairService.getUserVehicleList().then(response => {
                this.vehicles = response.data;
            }).catch(error => {
                console.log(error);
            });

        },
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
    created() {
        //this.getUserDetails();
        this.getUserVehicleList();
    },
}
</script>

<style scoped>
img {
    width: 200px;
    height: 200px;

}

h1 {
    background-color: white;
}

h2 {

    background-color: white;
    font-family: Arial, Helvetica, sans-serif;
    text-align: center;


}

p {
    background-color: white;
}

#estimate-form {
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
    align-items: center;

}

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

    background-color: #E3E1DA;
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
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    margin: 50px auto;


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
</style>
