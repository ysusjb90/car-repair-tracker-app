<template>
  
  
    <h1>Select Estimate</h1>
    <div class="table-container" v-show="!hidden">
    
    

    
    <table id="table-estimates-list">
      <thead class="table-head">
        <tr>
          <th></th>
          <th>Estimate ID</th>
          <th>Customer Name</th>
          <th>Date Created</th>
          <th>Vehicle Model</th>
          <th>Reason for Repair</th>
        </tr>
      </thead>

      <tr v-for="estimate in estimates" v-bind:key="estimate.estimateId">
        <td>
          <button v-on:click.prevent="chosenEstimate(estimate.estimateID)">
            Select Estimate
          </button>
        </td>
        <td class="repair-desc">{{ estimate.estimateID }}</td>
        <td class="repair-desc">{{ getLastName(estimate.userId) }}</td>
        <td class="repair-pc">{{ estimate.createdDate }}</td>
        <td class="repair-lc">{{ getVehicleModel(estimate.vehicleId) }}</td>
        <td class="repair-flat">{{ estimate.descriptionOfProblem }}</td>
        <!-- TODO add different class and CSS formatting? -->
      </tr>
    </table>
    <button v-on:click="toggleEvent">Hide/Show</button>
  </div>

  <!-- <hr class="divider" /> -->

  <div class="table-container" >
    <!-- <h1>Selected Estimate: {{ this.$store.estimate }}</h1> -->
     <h1>View Work Order</h1>
    <table class="work-order">
      <thead class="table-head">
        <tr>
          
          <th>Parts Cost</th>
          <th>Labor Cost</th>
          <th>Description</th>
          <th>Customer Approved?</th>
        </tr>
      </thead>
      <!--TODO: SHOW SELECTED ESTIMATE ID, USER INFO, STYLING-->
      <tr
        v-for="repair in xSelectedRepairs"
        v-bind:key="repair"
        class="selected-repair-items"
      >
        
        <td class="repair-pc">${{ repair.partsCost }}</td>
        <td class="repair-lc">${{ repair.laborCost }}</td>
        <td class="repair-desc">{{ repair.description }}</td>
        <input class="checkbox-approved" type="checkbox" v-model="repair.isApproved"/>
     
        
      </tr>
      <!-- <hr class="divider-cost" /> -->
     

      <!-- TODO: SUBMIT SENDS TO PROPER SQL TABLE -->
    </table>

    <div class="total-cost">
      <td>TOTAL COST: ${{ totalCost }}</td>

    </div>
    <button v-on:click="submitWorkOrder" type="button">Add To Work Order</button>
  </div>

  

  <!-- <hr class="divider" /> -->

  <h1>Add Repairs to Estimate</h1>

  <div class="table-container">
    <table id="table-repairs">
      <thead class="table-head">
        <tr>
          <th>Add to Estimate</th>
          <th>Description</th>
          <th>Parts Cost</th>
          <th>Labor Cost</th>
        </tr>
      </thead>

      <tr v-for="repair in repairs" v-bind:key="repair.repairItemId">
        <td>
          <!-- TODO: SUSPEND USE OF V-MODEL -->
          <input
            class="checkbox-add-to-estimate"
            type="checkbox"
            v-bind:id="repair.repairItemId"
            v-bind:value="repair.repairItemId"
            
            @change="addRemoveRepairToSelected($event, repair)"
            
          />
        </td>
        <td class="repair-desc">{{ repair.description }}</td>
        <td class="repair-pc">${{ repair.partsCost }}</td>
        <td class="repair-lc">${{ repair.laborCost }}</td>
      </tr>
    </table>
  </div>
</template>

<script>
import RepairService from "../services/RepairService";
import authService from "../services/AuthService";
import UserDetail from "./UserDetail.vue";
import UserDetailsService from "../services/UserDetailsService";
import WorkOrderService from "../services/WorkOrderService";

export default {
  data() {
    return {
      hidden: false,
      repairs: [],
      selectedRepairIDs: [],
      estimate: [],
      selectedEstimateIDs: [],
      users: [],
      vehicles: [],
      setEstimateId: 0,
      //TODO: EVALUATE AND REFACTOR BASED ON FUNCTION
      xSelectedRepairs: [],
    };
  },

  methods: {

    addRemoveRepairToSelected(event, repair){

      const item = {
        repairItemId: repair.repairItemId,
        description: repair.description,
        partsCost: repair.partsCost,
        laborCost: repair.laborCost,
        isApproved: true,
      }

      if(event.target.checked){
        this.xSelectedRepairs.push(item);
      } else {
        this.xSelectedRepairs = this.xSelectedRepairs.filter((r) => r.repairItemId !== item.repairItemId);
      }
    },

    activateSelectedRepairItems() {
      this.selectedRepairIDs.forEach((repairID) => {
        const repair = this.repairs.find((repair) => repair.id === repairID);
        repair.status = "Active";
      });
    },

    deactivateSelectedRepairItems() {
      this.selectedRepairIDs.forEach((repairID) => {
        const repair = this.repairs.find((repair) => repair.id === repairID);
        repair.status = "Inactive";
      });
    },
    getRepairs() {
      RepairService.getRepairItems().then((response) => {
        this.repairs = response.data;
        console.log(response);
      });
    },
    listOfEstimates() {
      RepairService.listOfEstimates().then((response) => {
        this.estimates = response.data;
        console.log(response);
      });
    },
    chosenEstimate(estimateID) {
      console.log(estimateID + "$$$$");
      this.$store.commit("SAVE_ESTIMATE", estimateID);
      this.hidden = true;
    },
    getUserInformation() {
      UserDetailsService.getAllUsers()
        .then((response) => {
          this.users = response.data;
          console.log("Got the users");
        })
        .catch((error) => {
          console.log(error);
        });
    },
    toggleEvent() {
      this.hidden = !this.hidden;
    },

    getUserVehicleList() {
      authService
        .getAllVehicles()
        .then((response) => {
          this.vehicles = response.data;
          console.log("Got the vehicles");
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getLastName(userId) {
      console.log(userId + "**********");
      const user = this.users.find((user) => user.userId == userId);
      //console.log(index + "**********");
      return user ? user.lastName : "Unknown";
    },
    getVehicleModel(vehicleId) {
      const vehicle = this.vehicles.find(
        (vehicle) => vehicle.vehicleId == vehicleId
      );
      return vehicle ? vehicle.model : "Unknown";
    },
    submitWorkOrder() {
      console.log("Work Order Submitted!");
      let response;

      WorkOrderService.createWorkOrder(this.xSelectedRepairs, this.$store.state.estimate)
        .then((response) => {
          alert("Work Order Submitted!");
          this.$router.push({
            name: "workOrder",
            params: { id: this.$store.state.estimate },
          });
        })
        .catch((error) => {
          this.registrationErrors = true;
        });
    },
  },
  computed: {
    /* ------------------------------------- */
    //TODO: SUSPEND USE OF DERIVED DATA
    /* ------------------------------------- */
    selectedRepairs() {
      return this.repairs.filter((repair) =>
        this.selectedRepairIDs.includes(repair.repairItemId)
      );
    },
    /* ------------------------------------- */

    totalCost() {
      return this.xSelectedRepairs.reduce(
        (total, repair) => total + repair.partsCost + repair.laborCost,
        0
      );
    },
  },

  created() {
    this.listOfEstimates();
    this.getUserInformation();
    this.getUserVehicleList();
    this.getRepairs();
    console.log("Loaded repairs, estimates, user detail and vehicles!");
  },
};
</script>

<style>
.divider {
  border: none;
  border-top: 2px solid rgb(189, 14, 14);
  /* Line color and thickness */
  margin: 20px 0;
  /* Space around the line */
  width: 100%;
  /* Make the line stretch across the container */
}

.divider-cost {
  border: none;
  border-top: 2px solid rgb(189, 14, 14);
  /* Line color and thickness */
  margin-bottom: 10px; 
  /* Space around the line */
  width: 100%;
  /* Make the line stretch across the container */
}

body {
  background-color: #e3e1da;
}

.table-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-right: 20px;
  margin-bottom: 80px; 
}

.table-head {
  font-family: Arial, Helvetica, sans-serif;
  color: rgb(189, 14, 14);
  font-size: 20px;
}



table .repair-desc {
  width: 200px;
  text-align: center;

  font-family: Arial, Helvetica, sans-serif;
  size: 16px;

  background-color: white;
  padding: 10px;
  margin-top: 10px;
  margin-bottom: 10px;
}

table .repair-pc {
  width: 200px;
  text-align: center;

  font-family: Arial, Helvetica, sans-serif;
  size: 16px;

  background-color: white;
  padding: 10px;
  margin-top: 10px;
  margin-bottom: 10px;
}

table .repair-lc {
  width: 200px;
  text-align: center;

  font-family: Arial, Helvetica, sans-serif;
  size: 16px;

  background-color: white;
  padding: 10px;
  margin-top: 10px;
  margin-bottom: 10px;
}

table .repair-flat {
  width: 200px;
  text-align: center;
  font-family: Arial, Helvetica, sans-serif;
  size: 16px;
  background-color: white;
  padding: 10px;
  margin-top: 10px;
  margin-bottom: 10px;
}

h1 {
  font-family: "Arial", sans-serif;
  text-align: center;
  color: rgb(189, 14, 14);
  padding: 40px;
  margin-bottom: -25px;
}

.actions {
  background-color: white;
  display: flex;
  flex-direction: row;
  justify-content: space-evenly;
  margin-top: 20px;
  margin-right: 20px;
  margin-left: 20px;
  padding: 10px;
}

th {
  text-transform: uppercase;
  font-family: Arial, Helvetica, sans-serif;
  color: rgb(189, 14, 14);
  background-color: white;
  margin-left: 30px;
  margin-right: 30px;
}

tr.deactivated {
  color: rgb(2, 2, 151);
}


table, th, td {
  border: 1px solid #ccc; /* Adjust the color and thickness as needed */
  border-collapse: collapse; /* Ensures there are no gaps between cells */
}

/* Optional: To make the borders more prominent */
table th, table td {
  border-left: 1px solid #ccc;
  border-right: 1px solid #ccc;
  padding: 10px; /* Adds padding for better readability */
  text-align: center; /* Center text in table cells */
}

/* Optional: Different border for the first and last columns */
table th:first-child, table td:first-child {
  border-left: none; /* Removes the left border for the first column */
}

table th:last-child, table td:last-child {
  border-right: none; /* Removes the right border for the last column */
}

.total-cost td {

  border: none; 
}


.total-cost {
  
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
  font-size: 20px;
  margin-bottom: 25px; 
  margin-top: 25px; 
 
  
  border: none; 
  
}

table td {
  border: 1px solid #ccc; /* Ensure all table cells have a border */
}

.checkbox-approved {
  margin-left: 110px;
  margin-top: 12px;
  border: 1px solid #ccc; /* Ensure all table cells have a border */
}

</style>