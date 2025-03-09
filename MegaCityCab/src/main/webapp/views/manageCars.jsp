<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Cars</title>
    <link rel="stylesheet" href="../css/ManageCars.css">
    <style>
        body {
            background: url('../Assets/bg3.jpg') no-repeat center center;
            background-size: cover;
            font-family: Arial, sans-serif;
            color: #000000;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 2rem;
        }

        form {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 15px;
            width: 100%;
            max-width: 600px;
            margin-bottom: 30px;
        }

        label {
            font-size: 1rem;
            margin-bottom: 10px;
            display: block;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 20px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            width: 100%;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        table {
            width: 80%; /* Adjust width to be less than 100% */
            margin: 0 auto; /* Center the table */
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
        }

        table th {
            background-color: #4CAF50;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table tr:nth-child(odd) {
            background-color: #ffffff;
        }

/* Link Styling */
a {
    color: #975656;
    text-decoration: none;
    font-weight: bold;
}

a:hover {
    text-decoration: underline;
}

a:visited {
    color: #975656;
}

        /* Center align form and table elements */
        .content {
            width: 100%;
            max-width: 1000px; /* Max width to ensure proper centering */
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="content">
        <h2>Manage Cars</h2>

        <form action="/MegaCityCab/AddCarServlet" method="post">
            <div>
                <label for="carModel">Car Model:</label>
                <input type="text" id="carModel" name="carModel" required />
            </div>
            <div>
                <label for="carNumber">Car Number:</label>
                <input type="text" id="carNumber" name="carNumber" required />
            </div>
            <div>
                <label for="carType">Car Type:</label>
                <select id="carType" name="carType">
                    <option value="Sedan">Sedan</option>
                    <option value="SUV">SUV</option>
                    <option value="Mini">Mini</option>
                </select>
            </div>
            <div>
                <label for="capacity">Capacity:</label>
                <input type="number" id="capacity" name="capacity" required />
            </div>
            <div>
                <button type="submit">Add Car</button>
            </div>
        </form>

        <!-- Display Existing Cars -->
        <h3>Existing Cars</h3>
        <table>
            <thead>
                <tr>
                    <th>Car Model</th>
                    <th>Car Number</th>
                    <th>Car Type</th>
                    <th>Capacity</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Fetch cars from the database
                    String query = "SELECT * FROM cars";
                    Connection connection = DBConnection.getConnection();
                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery(query);

                    while (resultSet.next()) {
                %>
                    <tr>
                        <td><%= resultSet.getString("car_model") %></td>
                        <td><%= resultSet.getString("car_number") %></td>
                        <td><%= resultSet.getString("car_type") %></td>
                        <td><%= resultSet.getInt("capacity") %></td>
                        <td><%= resultSet.getString("status") %></td>
                        <td>
                            <!-- Link to update car -->
                            <a href="/MegaCityCab/UpdateCarServlet?car_id=<%= resultSet.getInt("car_id") %>">Update</a> |
                            <!-- Link to delete car -->
                            <a href="/MegaCityCab/DeleteCarServlet?car_id=<%= resultSet.getInt("car_id") %>">Delete</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
