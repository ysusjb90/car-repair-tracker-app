<template>
    <div>Work Order Progress</div>
    <form action="">
        <label for="workOrder">Work Order:</label>
        <select name="workOrder" id="workOrder">
            <option value="workOrder1">Work Order 1</option>
            <option value="workOrder2">Work Order 2</option>
            <option value="workOrder3">Work Order 3</option>
        </select>
        <button v-on:click="submitWorkOrder" class="submit">Get Work Orders</button>
        <div class="table-container">
            <table id="table-work-orders">
                <thead class="table-head">
                    <tr>
                        <th>Work Order</th>
                        <th>Vehicle</th>
                        <th>Customer</th>
                        <th>Progress</th>
                    </tr>
                </thead>
                <tr v-for="workOrder in workOrders" v-bind:key="workOrder.workOrderId">
                    <td class="work-order">{{ workOrder.workOrderId }}</td>
                </tr>
            </table>
        </div>
    </form>

</template>

<script>
import WorkOrderService from '../services/WorkOrderService';
export default {
    
    methods: {
        submitWorkOrders() {
            WorkOrderService.createWorkOrder().then((response) => {
                this.workOrders = response.data;
                console.log(response);
            });
        },

    }

}
</script>

<style></style>