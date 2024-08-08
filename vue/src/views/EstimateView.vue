<template>
  <form id="estimate-form">
    <img src="src\assets\manic.jpg">
    <div id="userInfo">
      <h2>Customer:</h2>
      <p>Name: </p>
      <p>Email: </p>
      <p>Phone: </p>

    </div>
    <div id="userInfo">
      <h2>Vehicle:</h2>
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
  created() {
    console.log("Here!")
  }

}
</script>

<style scoped>
img {
  width: 200px;

}

h1 {
  background-color: white;
}

h2  {

  background-color: white;
  font-family: Arial, Helvetica, sans-serif;
  text-align: center; 


}

p {
  background-color: white;
}

#estimate-form {
  display: flex;
  flex-direction: row;
  justify-content: space-evenly;
  align-items: center;

}

#userInfo {
  display: flex;
  flex-direction: column;
  align-items: left; 
  font-family: Arial, Helvetica, sans-serif;
  color: rgb(189, 14, 14);
  background-color: white;
  padding: 10px;
  margin: 10px;
  border-radius: 10px;
  width: 200px;
  height: 250px;
  font-family: Arial, Helvetica, sans-serif;
  

}

#userInfo p {
  text-align: left; 
  font-family: Arial, Helvetica, sans-serif;
  color: black; 
}

div {
  background-color: white;
}
</style>