<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Car" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Car</title>
<style type="text/css">
/* Reset default styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body Styling */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f1f1f1; /* Light background for better contrast */
    color: #333; /* Dark text for readability */
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    padding: 20px;
}

/* Heading Styling */
h2 {
    color: #333;
    font-size: 2.5rem;
    margin-bottom: 20px;
    text-align: center;
}

/* Form Styling */
form {
    background-color: #ffffff; /* White background for the form */
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Soft shadow for a modern feel */
    width: 100%;
    max-width: 600px; /* Form width limitation */
    transition: transform 0.3s ease;
}

/* Form field styling */
label {
    color: #333;
    font-size: 1.1rem;
    margin-bottom: 5px;
    display: block;
}

input[type="text"], input[type="number"], select {
    width: 100%;
    padding: 12px;
    border-radius: 8px;
    border: 1px solid #ddd; /* Lighter border color */
    background-color: #fafafa; /* Slightly lighter background */
    color: #333;
    font-size: 1rem;
    margin-bottom: 20px;
    transition: border-color 0.3s ease;
}

/* Focus effects for inputs */
input[type="text"]:focus, input[type="number"]:focus, select:focus {
    border-color: #4CAF50; /* Green color on focus */
    outline: none;
}

/* Button Styling */
button {
    background-color: #4CAF50; /* Green button */
    color: #fff;
    padding: 12px 20px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 1.1rem;
    transition: background-color 0.3s ease;
    width: 100%;
}

/* Button hover and focus effects */
button:hover {
    background-color: #45a049; /* Darker green on hover */
}

button:focus {
    outline: none;
}

/* Select box styling */
select {
    padding: 12px;
}

/* Grouping form fields */
.form-group {
    margin-bottom: 25px;
}

/* Optional: Responsive Styling */
@media (max-width: 768px) {
    form {
        padding: 20px;
    }

    h2 {
        font-size: 2rem;
    }
}

</style>
</head>
<body>
    <form action="/MegaCityCab/UpdateCarServlet" method="POST">
        <h2>Update Car</h2>
        <input type="hidden" name="car_id" value="<%= ((Car) request.getAttribute("car")).getCarId() %>">
        
        <label for="car_model">Car Model:</label>
        <input type="text" name="car_model" value="<%= ((Car) request.getAttribute("car")).getCarModel() %>" required><br>
        
        <label for="car_number">Car Number:</label>
        <input type="text" name="car_number" value="<%= ((Car) request.getAttribute("car")).getCarNumber() %>" required><br>
        
        <label for="car_type">Car Type:</label>
        <input type="text" name="car_type" value="<%= ((Car) request.getAttribute("car")).getCarType() %>" required><br>
        
        <label for="capacity">Capacity:</label>
        <input type="number" name="capacity" value="<%= ((Car) request.getAttribute("car")).getCapacity() %>" required><br>
        
        <label for="status">Status:</label>
        <select name="status">
            <option value="Available" <% if ("Available".equals(((Car) request.getAttribute("car")).getStatus())) out.print("selected"); %>>Available</option>
            <option value="In Use" <% if ("In Use".equals(((Car) request.getAttribute("car")).getStatus())) out.print("selected"); %>>In Use</option>
            <option value="Under Maintenance" <% if ("Under Maintenance".equals(((Car) request.getAttribute("car")).getStatus())) out.print("selected"); %>>Under Maintenance</option>
        </select><br>
        
        <button type="submit">Update Car</button>
    </form>
</body>
</html>
