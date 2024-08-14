<template>
    <div>Work Order Progress
    <form action="">
        <tr v-for="lineItem in workOrder.workOrderItems" v-bind:key="lineItem.description">
        <td>
          <!-- TODO: SUSPEND USE OF V-MODEL -->
          <input
            class="checkbox"
            type="checkbox"
            v-model="lineItem.isComplete"
            
          />
        </td>
        <td class="repair-desc">{{ lineItem.description }}</td>
        <td id="chkComplete" class="repair-lc" v-show="lineItem.isComplete">&check;   </td>
      </tr>
    </form>

     
                
</div>
</template>

<script>
import WorkOrderService from '../services/WorkOrderService';
export default {
    data() {
        return {
            
            workOrder: {
                workOrderId: 0,
                workOrderDate: "",
                workOrderStatus: "",
                workOrderTotal: 0,
                workOrderItems: [],

            } ,
            
            workOrderId: 0,
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

    },
    created() {
        this.workOrderId = Number.parseInt(this.$route.params.id);
        this.getWorkOrderItems();

    },

}
</script>

<style></style>