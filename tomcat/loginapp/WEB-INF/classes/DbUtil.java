import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtil {
    public static Connection getConnection() throws SQLException {
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
        return DriverManager.getConnection(url, dbUser, dbPassword);
    }
}
