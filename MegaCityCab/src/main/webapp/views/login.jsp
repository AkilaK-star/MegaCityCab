<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="../css/login.css">
</head>
<body>
    <div class="login-container">
        <form action="/MegaCityCab/Loginservlet" method="post">
            <h2>Login</h2>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <button type="submit">Login</button>
            
            <% if (request.getParameter("error") != null) { %>
            <p style="color:red;">${param.error}</p>
        <% } %>
            
            <p>Don't have an account? <a href="register.jsp">Register</a></p>
        </form>
    </div>
</body>
</html>