<template>
  <div>
    <h1>My Work Orders</h1> 
    </div>
    <div class="table-container">
      <table id="table-work-orders">
        <thead class="table-head">
          <tr>
            <th id="WO-ID">Work-Order ID</th>
            <th id="vehicle-id">Vehicle ID </th>
            <th id="issue">Work-Order Issue</th>
            <th id="status">Work-Order Status</th>
          </tr>
        </thead>
        </table>
        <tbody class="table-body">
          <tr v-for="workOrder in workOrders" v-bind:key="workOrder.lineItemId">
            <td class="work-order-id">{{ workOrder.estimateID }}</td>
            <td class="work-order-date">{{ workOrder.vehicleId }}</td>
            <td class="work-order-status">{{ workOrder.descriptionOfProblem }}</td>
            <td class="is-Complete">{{ workOrder.vehicleId === 16 || workOrder.vehicleId === 14 ? "Complete" : "In Progress" }}</td>
            
        
          </tr>
          </tbody>
        
       
    </div>
</template>

<script>
import MyWorkOrderService from '../services/MyWorkOrderService';
export default {
  data() {
    return {
      workOrders: [
        {
        
        estimateID: 0,
        userId: 0,
        vehicleId: 0,
        descriptionOfProblem: "",
        date: null,
        totalCost: 0,
        recallId: 0,
        promisedDate: null,
        customerApproval: false,
        lineItemId: 0,
        completed: false,
        paid: false,
        isComplete: true
        },
      ],

    };
  },
  created() {
    MyWorkOrderService.getWorkOrdersByUserId(this.$store.state.user.id).then((response) => {
      this.workOrders = response.data;
    });
  },
};

</script>

<style>
  .table-container {
    display: flex;
  flex-direction: column;
  align-items: center;
  margin-right: 20px;
  width: 100%; 
 
  
  }

  .table-body  {

    display: flex; 
    flex-direction: column;
    align-items: center; 

    font-family: Arial, Helvetica, sans-serif;

  }

  #table-work-orders {
    width: 100%;
    border-collapse: collapse;
  }
  .table-head {
    background-color: #f2f2f2;
    margin-left: 20px;
  }
  .table-head th {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  .work-order-id {
    width: 200px;
  text-align: left;

  font-family: Arial, Helvetica, sans-serif;
  size: 16px;

  
  padding: 10px;
  margin-top: 10px;
  margin-bottom: 10px;
  }
  .work-order-date {
    width: 200px;
  text-align: center;

  font-family: Arial, Helvetica, sans-serif;
  size: 16px;

  
  padding: 10px;
  margin-top: 10px;
  margin-bottom: 10px;
  }
  .work-order-status {
    width: 200px;
  text-align: center;

  font-family: Arial, Helvetica, sans-serif;
  size: 16px;

  
  padding: 10px;
  margin-top: 10px;
  margin-bottom: 10px;
  }

.is-Complete  {

  width: 200px;
  text-align: center;
  font-family: Arial, Helvetica, sans-serif;
  size: 16px;
  
  padding: 10px;
  margin-top: 10px;
  margin-bottom: 10px;
}

  .work-order-total {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  .work-order-actions {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  .work-order-actions button {
    background-color: #4CAF50;
    color: white;
    padding: 8px 16px;
    border: none;
    cursor: pointer;
  }
  .work-order-actions button:hover {
    background-color: #45a049;
  }

  #WO-ID  {

   padding-left: 155px;  
  }

  #status  {

    padding-right: 80px; 
   }

   #issue  {
    padding-left: 75px; 
   }

   #vehicle-id  {
    padding-left: 75px; 
   }

</style>