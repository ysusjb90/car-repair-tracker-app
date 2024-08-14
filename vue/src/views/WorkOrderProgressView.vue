<template>
  <div>
    Work Order Progress
    <form action="">
      <tr
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
    </form>
  </div>
  <div class="button-trackRepair">
    <button v-on:click="goToCreateRepair" type="submit">
      Create New Repair Request
    </button>
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
    goToCreateRepair() {
      this.$router.push("/");
    },
    hideCheckboxes() {
    //   Set to hidden if user role is user
      this.hidden = !this.hidden;
    },
  },
  created() {
    this.workOrderId = Number.parseInt(this.$route.params.id);
    this.getWorkOrderItems();
  },
};
</script>

<style></style>