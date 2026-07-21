<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Credential Result</title>
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
            boolean stored = false;
            String message = "";

            if (username != null && password != null && !username.trim().isEmpty() && !password.trim().isEmpty()) {
                try {
                    String dbHost = System.getenv("DB_HOST");
                    String dbPort = System.getenv("DB_PORT");
                    String dbName = System.getenv("DB_NAME");
                    String dbUser = System.getenv("DB_USER");
                    String dbPassword = System.getenv("DB_PASSWORD");
                    if (dbHost == null || dbHost.isEmpty()) {
                        dbHost = "localhost";
                    }
                    if (dbPort == null || dbPort.isEmpty()) {
                        dbPort = "3306";
                    }
                    if (dbName == null || dbName.isEmpty()) {
                        dbName = "appdb";
                    }
                    if (dbUser == null || dbUser.isEmpty()) {
                        dbUser = "appuser";
                    }
                    if (dbPassword == null || dbPassword.isEmpty()) {
                        dbPassword = "apppass";
                    }

                    String url = "jdbc:mariadb://" + dbHost + ":" + dbPort + "/" + dbName;
                    Class.forName("org.mariadb.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);
                    PreparedStatement checkStmt = conn.prepareStatement("SELECT id FROM credentials WHERE username = ?");
                    checkStmt.setString(1, username.trim());
                    ResultSet rs = checkStmt.executeQuery();
                    if (rs.next()) {
                        message = "Username already exists. Please choose another one.";
                    } else {
                        PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO credentials (username, password) VALUES (?, ?)");
                        insertStmt.setString(1, username.trim());
                        insertStmt.setString(2, password);
                        insertStmt.executeUpdate();
                        stored = true;
                        message = "Credential stored successfully.";
                    }
                    rs.close();
                    checkStmt.close();
                    conn.close();
                } catch (Exception e) {
                    message = "Unable to store credentials: " + e.getMessage();
                }
            } else {
                message = "Please provide both a username and password.";
            }

            if (stored) {
        %>
            <h2 class="success">Credential saved</h2>
            <p><%= message %></p>
            <p>Stored username: <%= username %></p>
        <%
            } else {
        %>
            <h2 class="error">Unable to save</h2>
            <p><%= message %></p>
        <%
            }
        %>
        <p><a href="index.jsp">Back to form</a></p>
        <p><a href="users.jsp">View stored user IDs</a></p>
    </div>
</body>
</html>
