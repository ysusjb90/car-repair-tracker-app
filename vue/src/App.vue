<template>
  <div id="capstone-app">
    
    <div id="nav">
      <img id="manic-logo" src="src/assets/manic.png" />

      <router-link id="link" v-bind:to="{ name: 'home' }">Home</router-link>

    <!-- Conditional Links with Delimiters -->
    <template v-if="$store.state.token != ''">

      
      <router-link id="link" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>&nbsp;|&nbsp;
      <router-link id="link" v-bind:to="{ name: 'estimates'}" v-if="$store.state.currRole != 'ROLE_USER'">Estimate</router-link>&nbsp;|&nbsp;
      <router-link id="link" v-bind:to="{ name: 'vehicle'}" v-if="$store.state.token != ''">Register Vehicle</router-link>
     
      {{role}}

      </template>

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
  created() {
    if(this.$store.state.token != '') {
      this.$store.commit('SET_ROLE', this.$store.state.user.authorities[0].name);
    }
   
  },
};

</script>


<style>


#nav {
 
  display: flex;
  justify-content: flex-start;
  background-color: #646363;
  align-items: center;
  margin-bottom: 50px;
  color: white;

}

#manic-logo {
  width: 350px;
  
  margin-left: 50px;
  background-color: #636364;
}

.manic-footer  {

  width: 500px;
}

#link {

  background-color: #636364;
  padding: 10px;
  font-family: Arial, Helvetica, sans-serif;
  color: white;
  font-size: medium;


}



</style>
