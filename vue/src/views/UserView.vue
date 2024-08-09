<template>
    <div>
        <h1>User Details</h1>
        <p>Name: {{ }}</p>
        <p>Email: {{ }}</p>
        <p>Phone: {{ }}</p>
    </div>
</template>

<script>
export default {
    name: 'UserView',
    props: {
        user: {
            type: Object,
            required: true
        }
    }
}
</script>