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
            <label class="service-label" for="name">Vehicle Year:</label>
            <input class="service-input" type="text" id="name" name="name" required>

            <label class="service-label-dropdown" for="vehicle">Vehicle Make:</label>
            <select class="make-dropdown" id="vehicle-make" name="vehicle-make" required>
                <option value="">Select Make</option>
                <option value="Audi">Audi</option>
                <option value="BMW">BMW</option>
                <option value="Buick">Buick</option>
                <option value="Cadillac">Cadillac</option>
                <option value="Chevrolet">Chevrolet</option>
                <option value="Chrysler">Chrysler</option>
                <option value="Dodge">Dodge</option>
                <option value="Ford">Ford</option>
                <option value="Honda">Honda</option>
                <option value="Hyundai">Hyundai</option>
                <option value="Jeep">Jeep</option>
                <option value="Kia">Kia</option>
                <option value="Lincoln">Lincoln</option>
                <option value="Mazda">Mazda</option>
                <option value="Mercury">Mercury</option>
                <option value="Nissan">Nissan</option>
                <option value="Plymouth">Plymouth</option>
                <option value="Pontiac">Pontiac</option>
                <option value="Porsche">Porsche</option>
                <option value="Ram">Ram</option>
                <option value="Subaru">Subaru</option>
                <option value="Tesla">Tesla</option>
                <option value="Toyota">Toyota</option>
                <option value="Volkswagen">Volkswagen</option>
                <option value="Volvo">Volvo</option>
            </select>

            <label class="service-label" for="vehicle">Vehicle Model:</label>
            <input class="service-input" type="text" id="vehicle" name="vehicle" required>

            <label class="service-label" for="vehicle">Vehicle Color:</label>
            <input class="service-input" type="text" id="vehicle" name="vehicle" required>

            <label id="desc-service-label" for="description">Please describe the problem:</label>
            <textarea id="description" name="description" required></textarea>

            <button type="submit">Submit</button>
        </form>

    </div>


</template>

<script>
import repairService from '../services/RepairService';

export default {


    components: {


    },


    data() {
        return {
            estimate: {
                userId: '',
                vehicleId: '',
                createdDate: '',
                describeIssue: ''
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
        getUserDetails() {
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
