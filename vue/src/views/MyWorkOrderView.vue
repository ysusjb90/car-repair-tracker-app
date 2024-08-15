<template>
  <div>
    <h1>My Work Orders</h1> 
    </div>
    <div class="table-container">
      <table id="table-work-orders">
        <thead class="table-head">
          <tr>
            <th>Work Order ID</th>
            <th>Work Order Date </th>
            <th>Work Order Status</th>
            <th>Work Order Total</th>
          </tr>
        </thead>
        </table>
       
    </div>
</template>

<script>
import MyWorkOrderService from '../services/MyWorkOrderService';
export default {
  data() {
    return {
      workOrders: [],
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
    margin-top: 20px;
  }
  #table-work-orders {
    width: 100%;
    border-collapse: collapse;
  }
  .table-head {
    background-color: #f2f2f2;
  }
  .table-head th {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  .work-order-id {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  .work-order-date {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  .work-order-status {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
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

</style>