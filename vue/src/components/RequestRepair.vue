<template>

    <div>

        <h1>Request Service</h1>
        <form id = "request-service-form">
            <label class = "service-label" for="name">Vehicle Year:</label>
            <input class = "service-input" type="text" id="name" name="name" required>

            <label class = "service-label" for="vehicle">Vehicle Make:</label>
            <input class = "service-input" type="text" id="vehicle" name="vehicle" required>

            <label class = "service-label" for="vehicle">Vehicle Model:</label>
            <input class = "service-input" type="text" id="vehicle" name="vehicle" required>

            <label id = "desc-service-label" for="description">Please describe the problem:</label>
            <textarea id="description" name="description" required></textarea>

            <button type="submit">Submit</button>
        </form>

    </div>


</template>

<script>


export default {

}
</script>

<style>

body  {

    background-color: #E3E1DA;
}

#request-service-form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.service-label {
    margin-top: 5px;
    margin-bottom: 5px;
    font-family: Arial, Helvetica, sans-serif;
    font-weight: bold; 

}

.service-input {
    margin-bottom: 15px;
    border-radius: 2px;

}

#description {

    margin-top: 5px;
    background-color: white;
    width: 300px;
    height: 100px; 
    border-radius: 2px;
}

#desc-service-label {
    margin-top: 10px;
    margin-bottom: 5px;
    font-family: Arial, Helvetica, sans-serif;
    font-weight: bold; 
}

</style>
