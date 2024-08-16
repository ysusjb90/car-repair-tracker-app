<template>
  <div class="page-form">
    
    <form class="work-order-tracker" action="">
      <h1>Track Work Orders</h1>

      <hr class="divider">

     
      <tr class="line-item" 
     
        v-for="lineItem in workOrder.workOrderItems"
        v-bind:key="lineItem.description"
      >
      <!-- TODO have click set isCompleted to true; need to send back to server. -->

      
        <td>
          <!-- TODO: SUSPEND USE OF V-MODEL -->
          <input v-show="!hidden"
            class="checkbox"
            type="checkbox"
            v-model="lineItem.isComplete"
          />
        </td>
        <td class="repair-desc">{{ lineItem.description }}</td>
        <td id="chkComplete" class="repair-lc" v-show="lineItem.isComplete">
          &check;
        </td>
      </tr>
   
      <hr class="divider">
      <div class="button-holder">
    <button id="create" v-on:click="goToCreateRepair" type="submit">
Create New Repair Request    </button>
</div>

    <button v-show="!hidden" class="button-go-to-estimates" v-on:click="goToEstimates" type="submit">
  Go to Estimates      </button>
 
    </form>
  </div>
 
</template>

<script>
import WorkOrderService from "../services/WorkOrderService";
export default {
  data() {
    return {
      workOrder: {
        workOrderId: 0,
        workOrderDate: "",
        workOrderStatus: "",
        workOrderTotal: 0,
        workOrderItems: [],
      },

      workOrderId: 0,
      hidden: false,
    };
  },

  methods: {
    submitWorkOrders() {
      WorkOrderService.createWorkOrder().then((response) => {
        this.workOrders = response.data;
        console.log(response);
      });
    },
    getWorkOrderItems() {
      WorkOrderService.getWorkOrder(this.workOrderId).then((response) => {
        this.workOrder.workOrderItems = response.data;
        console.log(response);
      });
    },
    goToEstimates() {
      if(this.$store.state.currRole === "ROLE_USER"){
            this.hidden = true;
        }
      this.$router.push("/estimates");
    },
    
    goToCreateRepair() {
      this.$router.push("/");
    },
    hideCheckboxes() {
        if(this.$store.state.currRole === "ROLE_USER"){
            this.hidden = true;
        }
    },
  },
  created() {
    this.workOrderId = Number.parseInt(this.$route.params.id);
    this.getWorkOrderItems();
    this.hideCheckboxes();
  },
};
</script>

<style scoped>

.page-form {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-right: 20px;
  width: 100%; 
  
}

.work-order-tracker {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center; 
  margin-right: 20px;
  margin-top: 50px; 
  width: 500px; 
  background-color: white; 
  padding-bottom: 80px; 
  border-radius: 10px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.button-holder  {

  display: flex;
  flex-direction: column; 
  justify-content: center;
  margin-top: 20px;
  width: 100%;
  align-items: center;
}

#create  {

  margin-bottom: 25px; 
  margin-top: 25px; 
}

.line-item  {

  

  font-family: Arial, Helvetica, sans-serif; 
  
  margin-top: 10px;
  margin-bottom: 25px; 
  size: 18px; 
  margin-right: 15px; 
  align-content: auto; 
  

  
  

  
  
}

.button-go-to-estimates  {

  margin-top: 25px; 
  margin-bottom: 25px; 
  
}

.divider  { 
  
  border-top: .5px black solid;
  margin-top: 10px; 
  margin-bottom: 15px; 
  width: 100%; 

}

.checkbox  {

 margin-right: 10px; 
}

#chkComplete  {

  font-size: 25px; 
  color: green; 
  margin-left: 7px; 
 
}




</style>