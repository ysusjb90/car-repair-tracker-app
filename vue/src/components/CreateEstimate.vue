<template>
  <h1>Create New Estimate</h1>

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

  </div>

</template>

<script>
import RepairService from '../services/RepairService';

export default {

  data() {

    return {

      repairs: [
      ],
      selectedRepairIDs: []

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


  },
  created() {
    this.getRepairs();
    console.log("Here!")
  },

}
</script>

<style>

body {

background-color: #E3E1DA;

}
.table-head {
  font-family: Arial, Helvetica, sans-serif;
  color: rgb(189, 14, 14);
  margin-bottom: 140px; 
}

.table-container {
  display: flex;
  flex-direction: column;

  margin-left: 15px; 
  margin-right: 15px; 
}


.checkbox {
  margin-left: 150px; 
}

table .repair-desc  {

  width: 200px;
  text-align: center;
  margin-left: 30px;
  margin-right: 30px;
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
  margin-left: 30px;
  margin-right: 30px;
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
  margin-left: 30px;
  margin-right: 30px;
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
  margin-left: 30px;
  margin-right: 30px;
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