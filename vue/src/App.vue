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
*{
  background-color: #E3E1DA;
}
#nav {
  background-color: #646363;
  justify-content: center;
  align-items: center;
  padding: 10px;
  
}
.link {
  background-color: #646363;
  padding: 10px;
}

</style>
