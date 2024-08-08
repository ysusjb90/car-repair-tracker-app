<template>

    <div>

      
        <form id = "request-service-form">
            <h1>Request Service</h1>
            <label class = "service-label" for="name">Vehicle Year:</label>
            <input class = "service-input" type="text" id="name" name="name" required>

            <label class = "service-label" for="vehicle">Vehicle Make:</label>
            <input class = "service-input" type="text" id="vehicle" name="vehicle" required>

            <label class = "service-label" for="vehicle">Vehicle Model:</label>
            <input class = "service-input" type="text" id="vehicle" name="vehicle" required>

            <label class = "service-label" for="vehicle">Vehicle Color:</label>
            <input class = "service-input" type="text" id="vehicle" name="vehicle" required>

            <label id = "desc-service-label" for="description">Please describe the problem:</label>
            <textarea id="description" name="description" required></textarea>

            <button type="submit">Submit</button>
        </form>

    </div>


</template>

<script>


export default {
    
    components: {


    },
    
    
    date() {
        return {
            estimate: {
                userId: '',
                vehicleId: '',
                createdDate: '',
                describeIssue: ''
            },
            
            vehicle: {
                year: '',
                make: '',
                model: '',
                color: ''
            }








        }



    }
}
</script>

<style scoped>

body  {

    background-color: #E3E1DA;
}

h1  {

    margin-top: -10px; 
    margin-bottom: -25px; 
}

#request-service-form {
    display: flex;
  flex-direction: column;
  align-items: center; 
  background-color: #fff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  max-width: 400px;
  margin: 50px auto; 
 
    
}

.service-label {
    
    margin-top: 5px;
    margin-bottom: 5px;
    font-family: Arial, Helvetica, sans-serif;
    font-weight: medium; 
    
   

}

.service-input {
    margin-bottom: 15px;
    border-radius: 2px;
    height: 20px;

}

#description {

    margin-top: 5px;
  background-color: white;
  border-radius: 4px;
  border: 2px solid #ccc;
  width: 75%;
  box-sizing: border-box; /* Ensure textarea aligns with input fields */
  padding: 10px;
}

#desc-service-label {
    margin-top: 10px;
    margin-bottom: 5px;
    font-family: Arial, Helvetica, sans-serif;
    font-weight: medium; 
}

</style>
