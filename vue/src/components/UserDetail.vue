<template>
    <div>
        <h2>User Details</h2>
        <table>
            <tr>
                <th>Name</th>
                <td>{{ user.name }}</td>
            </tr>
            <tr>
                <th>Email</th>
                <td>{{ user.email }}</td>
            </tr>
            <!-- Add more rows for other user details -->
        </table>
    </div>
</template>

<script>
import UserDetailsService from '@/services/UserDetailsService.js';

export default {
    data() {
        return {
            user: {},
        };
    },
    mounted() {
        this.fetchUserDetails();
    },
    methods: {
        fetchUserDetails() {
            UserDetailsService.getUserDetails('/users') // Set the path to "/users"
                .then(response => {
                    this.user = response.data;
                })
                .catch(error => {
                    console.log(error);
                });
        },
    },
};
</script>