<template>
  <div id="login">
    <form id="login-form" v-on:submit.prevent="login">
      <h1 id="sign-in">Please Sign In</h1>
      <div role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div id="thank-you" role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <div class="form-input-group">
        <label for="username">Username</label>
        <input type="text" id="username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password">Password</label>
        <input type="password" id="password" v-model="user.password" required />
      </div>
      <button type="submit">Sign in</button>
      <p>
        <router-link v-bind:to="{ name: 'register' }">Need an account? Sign up.</router-link>
      </p>
    </form>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            if (response.data.user.authorities[0].name == "ROLE_ADMIN") {
              this.$router.push("/admin");
            } else {
              this.$router.push("/");
            }
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style>
body {
  background-color: #E3E1DA;
  margin: 0;
}

#thank-you  {

  margin-bottom: 45px;
  font-family: Arial, Helvetica, sans-serif;
  text-align: center; 
  font-style: italic; 
 
}

#sign-in {

  margin-bottom: 5px;
  font-family: Arial, Helvetica, sans-serif;
  text-align: center; 
  color: rgb(189, 14, 14)
}

#login {
  display: flex;
  justify-content: center; 
}

.form-input-group {
  margin-bottom: 30px;
  background-color: white;
  font-family: Arial, Helvetica, sans-serif;


}

.form-input-group label {
  margin-right: 15px;
  font-family: Arial, Helvetica, sans-serif;
  background-color: white; 
  font-weight: medium;  


}

input {
  background-color: white;
  text-decoration: red;

}

button {


  background-color: rgb(189, 14, 14);
  color: white;
  padding: 14px 20px;
  margin-top: 10px;
  border: none;
  cursor: pointer;
  border-radius: 10px;
  font-weight: bold;
  margin-bottom: 10px; 



}

#login-form {

  display: flex;
  flex-direction: column; /* Stack elements vertically */
  align-items: center; /* Center elements horizontally */
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

p {
  text-align: center;
  margin-top: 10px;
}

</style>