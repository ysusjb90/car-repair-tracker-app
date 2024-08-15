<template>
  <h1>Administrative View</h1>
  
<div id="btnDiv">
  <button id="btnAddEmployee" @click="showAddEmployee = !showAddEmployee; showWorkEstimates = !showAddEmployee">{{(showAddEmployee)?"Work Estimates":"Add Employee Form"}}</button>
</div>


  <CreateEstimate v-if="showWorkEstimates"/>

  <div id="register" class="reg" v-show="showAddEmployee">
    <form v-on:submit.prevent="registerEmployee">
      <h2>Add Employee</h2>
      <div role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div class="form-input-group">
        <label for="firstName">First Name</label>
        <input type="text" id="firstName" v-model="user.firstName" required />
      </div>
      <div class="form-input-group">
        <label for="lastName">Last Name</label>
        <input type="text" id="lastName" v-model="user.lastName" required />
      </div>
      <div class="form-input-group">
        <label for="username">Username</label>
        <input
          type="text"
          id="username"
          v-model="user.username"
          required
          autofocus
        />
      </div>
      <div class="form-input-group">
        <label for="password">Password</label>
        <input type="password" id="password" v-model="user.password" required />
      </div>
      <div class="form-input-group">
        <label for="confirmPassword">Confirm Password</label>
        <input
          type="password"
          id="confirmPassword"
          v-model="user.confirmPassword"
          required
        />
      </div>
      <div class="form-input-group">
        <label for="email">E-mail</label>
        <input type="email" id="email" v-model="user.emailAddress" />
      </div>
      <div class="form-input-group">
        <label for="phoneNumber">Phone Number</label>
        <input
          type="tel"
          id="phoneNumber"
          v-model="user.phoneNumber"
          required
        />
      </div>
      <div class="button-container">
        <button type="submit">Create Account</button>
      </div>

      <p class="center-text">
        <router-link v-bind:to="{ name: 'login' }"
          >Already have an account? Log in.</router-link
        >
      </p>
    </form>
  </div>
</template>
  
  <script>
import authService from "../services/AuthService";
import RepairService from "../services/RepairService";
import CreateEstimate from '../components/CreateEstimate.vue';

export default {
  components: {
    CreateEstimate,
  },

  data() {
    return {
      user: {
        username: "",
        password: "",
        confirmPassword: "",
        role: "user",
        firstName: "",
        lastName: "",
        emailAddress: "",
        phoneNumber: "",
      },
      showAddEmployee: false,
      showWorkEstimates: true,
      registrationErrors: false,

      registrationErrorMsg: "There were problems registering this user.",
    };
  },
  methods: {
    registerEmployee() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = "Password & Confirm Password do not match.";
      } else {
        authService
          .registerEmployee(this.user)
          .then((response) => {
            if (response.status == 201) {
              alert("Employee registration successful");

              this.$router.push({
                path: "/admin",
                query: { registration: "Employee registration successful" },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = "Bad Request: Validation Errors";
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = "There were problems registering this user.";
    },
  },
};
</script>
  
  <style scoped>
h1 {
  font-family: "Arial", sans-serif;
  text-align: center;
}

#btnDiv {
  display: flex;  
  justify-content: center;
}

h2 {
  text-align: center;
  /* Center the text */
  margin-top: 20px;
  /* Add spacing if needed */
  font-family: "Arial", sans-serif;
  font-size: 24px;
}

.form-input-group label {
  font-family: "Arial", sans-serif;
  font-size: 14px;
  margin-bottom: 5px;
  font-weight: bold;
  text-align: left;
  background-color: white; 
}

#register {
  max-width: 400px;
  margin: 0 auto;
  padding: 20px;
  text-align: left;
  background-color: white; 
  border-radius: 5px; 
}

.form-input-group {
  display: flex;
  flex-direction: column;
  margin-bottom: 30px;
  background-color: white; 
}

input {
  padding: 10px;
  border: 1px solid #000000;
  border-radius: 4px;
  width: 100%;
  box-sizing: border-box;
  text-align: left;
}

.button-container {
  display: flex;
  justify-content: center;
}
</style>