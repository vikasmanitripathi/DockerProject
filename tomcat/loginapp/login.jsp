<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Result</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f7fb; margin: 0; padding: 40px; }
        .card { max-width: 420px; margin: 0 auto; background: white; padding: 24px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
        .success { color: #15803d; font-weight: bold; }
        .error { color: #b91c1c; font-weight: bold; }
    </style>
</head>
<body>
    <div class="card">
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if ("admin".equals(username) && "admin".equals(password)) {
        %>
            <h2 class="success">Login successful!</h2>
            <p>Welcome, <%= username %>.</p>
        <%
            } else {
        %>
            <h2 class="error">Invalid credentials</h2>
            <p>Please try again with the username and password shown on the login page.</p>
        <%
            }
        %>
        <p><a href="index.jsp">Back to login</a></p>
    </div>
</body>
</html>
