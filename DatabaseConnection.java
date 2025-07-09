import java.sql.*;

    public class DatabaseConnection {
        private static final String URL = "jdbc:mysql://localhost:3308/skyconnect";
        private static final String USER = "root";
        private static final String PASSWORD = "mariatabby";

        public static Connection getConnection() throws SQLException {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        }
    }


