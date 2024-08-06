<template>
  <h1>Create New Estimate</h1>

  <div class="table-container">
    <table id="table-repairs">

      <thead class="table-head">
        <tr>
          <th>Description</th>
          <th>Parts Cost</th>
          <th>Labor Cost</th>
          <th>Flat Rate (Time)</th>

        </tr>
      </thead>

    </table>

  </div>

  <tr v-for="repair in repairs" v-bind:key="repair.repairItemId">
    <td>
      <input type="checkbox" v-bind:id="repair.repairItemId" v-bind:value="repair.repairItemId" v-model="selectedRepairIDs" />
    </td>
    <td>{{ repair.description }}</td>
    <td>{{ repair.partsCost }}</td>
    <td>{{ repair.laborCost }}</td>
    <td>{{ repair.flatRate }}</td>

  </tr>

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
    getRepairs(){
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
h1 {
  font-family: 'Arial', sans-serif;
  text-align: center;
  color: rgb(189, 14, 14);

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
  background-color: white;
  text-transform: uppercase;
  font-family: Arial, Helvetica, sans-serif;
  color: rgb(189, 14, 14);
  border: 2px solid black
}

tr.deactivated {
  color: rgb(2, 2, 151);
}
</style>