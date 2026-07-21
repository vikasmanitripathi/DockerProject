<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Stored User IDs</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f7fb; margin: 0; padding: 40px; }
        .card { max-width: 640px; margin: 0 auto; background: white; padding: 24px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
        table { width: 100%; border-collapse: collapse; margin-top: 16px; }
        th, td { border: 1px solid #d1d5db; padding: 10px; text-align: left; }
        th { background: #eff6ff; }
        .empty { color: #6b7280; }
    </style>
</head>
<body>
    <div class="card">
        <h2>Stored User IDs</h2>
        <p><a href="index.jsp">Back to form</a></p>
        <table>
            <tr><th>ID</th><th>Username</th></tr>
            <%
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
                try (Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);
                     PreparedStatement ps = conn.prepareStatement("SELECT id, username FROM credentials ORDER BY id");
                     ResultSet rs = ps.executeQuery()) {
                    boolean hasRows = false;
                    while (rs.next()) {
                        hasRows = true;
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("username") %></td>
            </tr>
            <%
                    }
                    if (!hasRows) {
            %>
            <tr><td colspan="2" class="empty">No credentials stored yet.</td></tr>
            <%
                    }
                } catch (Exception e) {
            %>
            <tr><td colspan="2" class="empty">Unable to load stored users: <%= e.getMessage() %></td></tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
