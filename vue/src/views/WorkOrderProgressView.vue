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

    <button v-show="!hidden" class="button-go-to-estimates" v-on:click="goToEstimates" type="submit">
      Go To Estimates
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

<style></style>