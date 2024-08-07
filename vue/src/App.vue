<template>
  <div id="capstone-app">
    <div id="nav">
      <router-link id="link" v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link id="link" v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>&nbsp;|&nbsp;
      <router-link id="link" v-bind:to="{ name: 'estimate'}" v-if="$store.state.token != ''">Estimate</router-link>
     
    </div>
    <router-view />
  </div>
</template>
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
