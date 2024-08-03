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

  <tr v-for="repair in repairsList" v-bind:key="repair.id" v-bind:class="{ deactivated: user.status === 'Inactive' }">
    <td>
      <input type="checkbox" v-bind:id="user.id" v-bind:value="user.id" v-model="selectedUserIDs" />
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
export default {

  data() {

    return {

      repairs: [
        { id: 1, description: 'Oil Change', partsCost: 50, laborCost: 100, flatRate: 2 },
        { id: 2, description: 'Brake Pad Replacement', partsCost: 100, laborCost: 150, flatRate: 3 },
        { id: 3, description: 'Battery Replacement', partsCost: 75, laborCost: 125, flatRate: 2.5 },
        { id: 4, description: 'Replace Brake Lines', partsCost: 25, laborCost: 75, flatRate: 1.5 },
        { id: 5, description: 'Replace Brake Fluid', partsCost: 10, laborCost: 25, flatRate: 1 }
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
    }

  }

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