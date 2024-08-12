<template>
  <h1>Select Estimate</h1>

  <hr class="divider" />


  <div class="table-container">
    <table id="table-estimates-list">


      <thead class="table-head">
        <tr>
          <th>Customer Name</th>
          <th>Promised Date</th>
          <th>Vehicle Model</th>
          <th>Reason for Repair</th>
         

        </tr>
      </thead>

      <tr v-for="estimate in estimates" v-bind:key="estimate.estimateId">
        <!-- <td>
          <input class="checkbox" type="checkbox" v-bind:id="estimate.estimateId" v-bind:value="estimate.estimateId"
            v-model="selectedEstimateIDs" />
        </td> -->
        <td class="repair-desc">{{ estimate.userId }}</td>
        <td class="repair-pc">{{ estimate.promisedDate }}</td>
        <td class="repair-lc">{{ estimate.estimateId }}</td>
        <td class="repair-flat">{{ estimate.descriptionOfProblem }}</td>
<!-- TODO add different class and CSS formatting? -->
      </tr>

    </table>

  </div>

 <hr class="divider" />


 <h1>Add Repairs to Estimate</h1>


  <div class="table-container">
    <table id="table-repairs">


      <thead class="table-head">
        <tr>
          <th>Add to Estimate</th>
          <th>Description</th>
          <th>Parts Cost</th>
          <th>Labor Cost</th>
          <th>Flat Rate (Time)</th>

        </tr>
      </thead>

      <tr v-for="repair in repairs" v-bind:key="repair.repairItemId">
        <td>
          <input class="checkbox" type="checkbox" v-bind:id="repair.repairItemId" v-bind:value="repair.repairItemId"
            v-model="selectedRepairIDs" />
        </td>
        <td class="repair-desc">{{ repair.description }}</td>
        <td class="repair-pc">{{ repair.partsCost }}</td>
        <td class="repair-lc">{{ repair.laborCost }}</td>
        <td class="repair-flat">{{ repair.flatRateHours / 10 }}</td>

      </tr>

    </table>

  </div>



  <div class="actions">
    <button v-on:click="activateSelectedRepairItems()" v-bind:disabled="!actionButtonEnabled">Add Repair Items</button>
    <button v-on:click="deactivateSelectedRepairItems()" v-bind:disabled="!actionButtonEnabled">Remove Repair
      Items</button>
    <button class="submit">Add To Estimate</button>

  </div>

</template>

<script>

import RepairService from '../services/RepairService';

export default {

  data() {

    return {

      repairs: [
      ],
      selectedRepairIDs: [],
      estimate: [],
      selectedEstimateIDs: [],

    };
  },

  methods: {

    activateSelectedRepairItems() {
      this.selectedRepairIDs.forEach((repairID) => {
        const repair = this.repairs.find((repair) => repair.id === repairID);
        repair.status = 'Active';
      });
    },

    deactivateSelectedRepairItems() {
      this.selectedRepairIDs.forEach((repairID) => {
        const repair = this.repairs.find((repair) => repair.id === repairID);
        repair.status = 'Inactive';
      });
    },
    getRepairs() {
      RepairService.getRepairItems().then((response) => {
        this.repairs = response.data;
        console.log(response);
      });
    },
    getEstimates() {
      RepairService.getEstimates().then((response) => {
        this.estimate = response.data;
        console.log(response);
      });
    }
    //getSelectedRepairItems() {
    //  return this.selectedRepairIDs.filter((repair) => );
    //},


  },
  created() {
    this.getRepairs();
    this.getEstimates();
    console.log("Here!")
  },

}
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

body {

  background-color: #E3E1DA;

}

.table-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-right: 20px;



}

.table-head {
  font-family: Arial, Helvetica, sans-serif;
  color: rgb(189, 14, 14);
  font-size: 20px;

}


.checkbox {
  margin-left: 75px;

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
  font-family: 'Arial', sans-serif;
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
</style>