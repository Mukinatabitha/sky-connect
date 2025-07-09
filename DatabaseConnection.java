import java.sql.*;

    public class DatabaseConnection {
        private static final String URL = "jdbc:mysql://localhost:3306/sky_connect";
        private static final String USER = "root";
        private static final String PASSWORD = "admin123";

        public static Connection getConnection() throws SQLException {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        }
    }


