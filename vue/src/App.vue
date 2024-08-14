<template>
  <div id="capstone-app">
    <div id="nav">
      <router-link id="link" v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link id="link" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>&nbsp;|&nbsp;
      <router-link id="link" v-bind:to="{ name: 'estimates'}" v-if="$store.state.token != ''">Estimate</router-link>&nbsp;|&nbsp;
      <router-link id="link" v-bind:to="{ name: 'vehicle'}" v-if="$store.state.token != ''">Register Vehicle</router-link>
     
      {{role}}

    </div>
    <router-view />
  </div>
</template>

<script>

export default {
  name: 'App',
  data() {
    return {
      role: '',  
      };
  },
  watch: {
    '$store.state.token': function() {
      this.$store.commit('SET_ROLE', this.$store.state.user.authorities[0].name);
    },
  },
};

</script>


<style>


#nav {
  display: flex;
  justify-content: flex-start;
  background-color: #646363;
  align-items: center;
  color: white;
  margin-bottom: 50px;

}

#link {

  background-color: #636364;
  padding: 10px;
  font-family: Arial, Helvetica, sans-serif;
  color: white;
  font-size: medium;


}

</style>
