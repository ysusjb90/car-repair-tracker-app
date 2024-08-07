<template>
  <div id="login">
    <form v-on:submit.prevent="login">
      <h1>Please Sign In</h1>
      <div role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div role="alert" v-if="this.$route.query.registration">
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
.form-input-group {
  margin-bottom: 30px;


}

label {
  margin-right: 0.5rem;
}

input {
  background-color: white;
  text-decoration: red;

}

button {

  background-color: rgb(189, 14, 14);
  color: white;
  padding: 14px 20px;
  margin: 8px 0px;
  border: none;
  cursor: pointer;
  border-radius: 10px;
  font-weight: bold;

}

form {


  color: rgb(189, 14, 14);
}
</style>