<template>
    <div>Work Order Progress
    <form action="">
        <tr v-for="lineItem in lineItems" v-bind:key="lineItem.description">
        <td>
          <!-- TODO: SUSPEND USE OF V-MODEL -->
          <input
            class="checkbox"
            type="checkbox"
            v-bind:id="repair.repairItemId"
            v-bind:value="repair.repairItemId"
            
            @change="addRemoveRepairToSelected($event, repair)"
            
          />
        </td>
        <td class="repair-desc">{{ lineItem.description }}</td>
        <td class="repair-pc">${{ lineItem.isApproved }}</td>
        <td class="repair-lc">${{ lineItem.isComplete}}</td>
      </tr>
    </form>

     
                
</div>
</template>

<script>
import WorkOrderService from '../services/WorkOrderService';
export default {
    data() {
        return {
            lineItems: [],
            
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
           WorkOrderService.getWorkOrder(8).then((response) => {
            this.workOrders = response.data;
                console.log(response);
            });
        },

    },
    created() {
        this.getWorkOrderItems();
    },

}
</script>

<style></style>