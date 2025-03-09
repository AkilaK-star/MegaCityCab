<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard - Manage Users</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style>
        body {
            background: url('../Assets/bg4.jpg') no-repeat center center;
            background-size: cover;
            color: white;
        }
        .container {
            margin-top: 50px;
            background: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
        }
        .table {
            background-color: white;
            color: black;
            border-radius: 8px;
            overflow: hidden;
        }
        .btn-custom {
            background-color: #ff9800;
            color: white;
        }
        .btn-custom:hover {
            background-color: #e68900;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4">Manage Users</h2>
        
        <!-- Add User Section -->
        <h3 class="mb-3">Add User</h3>
        <form action="/MegaCityCab/AddUserServlet" method="POST" class="row g-3">
            <div class="col-md-6">
                <input type="text" name="username" class="form-control" placeholder="Username" required>
            </div>
            <div class="col-md-6">
                <input type="password" name="password" class="form-control" placeholder="Password" required>
            </div>
            <div class="col-md-6">
                <input type="email" name="email" class="form-control" placeholder="Email" required>
            </div>
            <div class="col-md-6">
                <input type="text" name="phone" class="form-control" placeholder="Phone" required>
            </div>
            <div class="col-md-6">
                <select name="role" class="form-select">
                    <option value="user">User</option>
                    <option value="admin">Admin</option>
                    <option value="Manager">Manager</option>
                </select>
            </div>
            <div class="col-md-6">
                <button type="submit" class="btn btn-custom w-100">Add User</button>
            </div>
        </form>

        <!-- Display Existing Users -->
        <h3 class="mt-5">Existing Users</h3>
        <div class="table-responsive">
            <table class="table table-hover mt-3">
                <thead class="table-dark">
                    <tr>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        String query = "SELECT * FROM users";
                        try (Connection connection = DBConnection.getConnection();
                             Statement statement = connection.createStatement();
                             ResultSet resultSet = statement.executeQuery(query)) {
    
                            while (resultSet.next()) {
                    %>
                    <tr>
                        <td><%= resultSet.getString("username") %></td>
                        <td><%= resultSet.getString("email") %></td>
                        <td><%= resultSet.getString("phone") %></td>
                        <td><%= resultSet.getString("role") %></td>
                        <td>
                            <a href="updateUser.jsp?id=<%= resultSet.getInt("user_id") %>" class="btn btn-warning btn-sm">Update</a>
                            <a href="deleteConfirmation.jsp?id=<%= resultSet.getInt("user_id") %>" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                    <% 
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
