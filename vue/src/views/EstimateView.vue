<template>
  <form>
    <img src="src\assets\manic_720.jpg">
    <div id="userInfo">
      <h1>Customer:</h1>
      <p>Name: </p>
      <p>Email: </p>
      <p>Phone: </p>

    </div>
    <div id="userInfo">
      <h1>Vehicle:</h1>
      <p>Year: </p>
      <p>Make: </p>
      <p>Model: </p>

    </div>

  </form>


  <div>


    <CreateEstimate />

  </div>

</template>

<script>

import CreateEstimate from '../components/CreateEstimate.vue';

export default {

  components: {
    CreateEstimate

  },

}
</script>

<style scoped>
img {
  width: 200px;

}

h1 {
  background-color: white;
}

p {
  background-color: white;
}

form {
  display: flex;
  flex-direction: row;
  justify-content: space-evenly;
  align-items: center;

}

#userInfo {
  display: flex;
  flex-direction: column;
  background-color: white;
  padding: 10px;
  margin: 10px;
  border-radius: 10px;
  width: 200px;
  height: 250px;
}

div {
  background-color: white;
}
</style>