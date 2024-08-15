<template>
  <div id="capstone-app">

    <div id="hero">
      <img id="manic-logo" src="src/assets/manic.png" />
    </div>

    <div id="nav">

     <!--  <router-link id="link" v-bind:to="{ name: 'home' }">Home</router-link>-->

    <!-- Conditional Links with Delimiters -->
    <template v-if="$store.state.token != ''">

      <router-link id="link" v-bind:to="{ name: 'admin'}" v-if="$store.state.currRole == 'ROLE_ADMIN'">Admin Home</router-link>
      <router-link id="link" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      <router-link id="link" v-bind:to="{ name: 'estimates'}" v-if="$store.state.currRole != 'ROLE_USER' && $store.state.currRole != 'ROLE_ADMIN'">Estimate</router-link>
      <router-link id="link" v-bind:to="{ name: 'vehicle'}" v-if="$store.state.token != ''">Register Vehicle</router-link>

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
      if(this.$store.state.token != '') {
      this.$store.commit('SET_ROLE', this.$store.state.user.authorities[0].name);
      }
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

#hero {
  display: flex;
  justify-content: center;
  background-color: #636364;

}

#nav {
 
  display: flex;
  justify-content: center;
  background-color: #646363;
  align-items: center;
  margin-bottom: 50px;
  color: white;

}

#manic-logo {
  
  background-color: #636364;
}

@media only screen and (max-width: 400px) {
#manic-logo {
  
  height: 200px;
  width: 334px;
}
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
