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

    <td>
      <button class="btnActivateDeactivate" v-on:click="flipStatus(user.id)">{{ user.status === 'Active' ? 'Deactivate'
    : 'Activate' }}</button>
    </td>
  </tr>


</template>

<script>
export default {

}
</script>

<style>
h1 {
  font-family: 'Arial', sans-serif;
  text-align: center;
  color: rgb(189, 14, 14);

}

th {
  text-transform: uppercase;
  font-family: Arial, Helvetica, sans-serif;
  color: rgb(189, 14, 14);
  border: 2px solid black
  
}

tr.deactivated {
  color: rgb(2, 2, 151);
}
</style>