<template>
    <div>
        <h1>Active Recalls</h1>
    </div>

    <div class="table-container">
        <table id="table-recalls">
            <!-- table content -->
        </table>
    </div>
        <table id="table-recalls">
            <thead class="table-head">
                <tr>
                    <th>Recall ID</th>
                    <th>Vehicle ID</th>
                    <th>Recall Description</th>
                    <th>Recall Date</th>
                    <th>Recall Status</th>
                </tr>
            </thead>

            <tr v-for="recall in recalls" v-bind:key="recall.recallId">
                <td>{{ recall.recallId }}</td>
                <td>{{ recall.vehicleId }}</td>
                <td>{{ recall.recallDescription }}</td>
                <td>{{ recall.recallDate }}</td>
                <td>{{ recall.recallStatus }}</td>
            </tr>
        </table>
</template>

<script>
export default {

}
</script>

<style>

</style>