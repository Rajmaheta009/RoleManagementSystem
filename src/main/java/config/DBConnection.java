package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

  

    public class DBConnection {

        private static final String URL = System.getenv().getOrDefault(
                "DB_URL",
                "jdbc:postgresql://localhost:5432/role_management"
        );

        private static final String USER = System.getenv().getOrDefault("DB_USER", "postgres");

        private static final String PASSWORD = System.getenv().getOrDefault("DB_PASSWORD", "postgres");

//    private static final String H2_URL = System.getenv().getOrDefault(
//            "H2_URL",
//            "jdbc:h2:mem:role_management;DB_CLOSE_DELAY=-1;DATABASE_TO_UPPER=false;MODE=PostgreSQL"
//    );
//
//    private static final String H2_USER = System.getenv().getOrDefault("H2_USER", "sa");
//
//    private static final String H2_PASSWORD = System.getenv().getOrDefault("H2_PASSWORD", "");
        private DBConnection() {
            // Prevent object creation
        }

//    public static Connection getConnection() {
//
//        try {
//
//            Class.forName("org.postgresql.Driver");
//
//            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
//
//            System.out.println("Connected Successfully");
//            System.out.println(conn.getMetaData().getURL());
//
//            initSchema(conn);
//
//            return conn;
//
//        } catch (Exception e) {
//
//            e.printStackTrace();   // <<<<<< ADD THIS
//
//            return null;
//        }
//    }
        public static Connection getConnection() {
            Connection conn = null;

            try {
                Class.forName("org.postgresql.Driver");

                conn = DriverManager.getConnection(URL, USER, PASSWORD);
                initSchema(conn);

                System.out.println("PostgreSQL connected successfully.");
            } catch (ClassNotFoundException | SQLException e) {
                System.err.println("PostgreSQL unavailable, falling back to H2: " + e.getMessage());
            }

            return conn;
        }

    

//    try {
//            Class.forName("org.h2.Driver");
//            Connection conn = DriverManager.getConnection(H2_URL, H2_USER, H2_PASSWORD);
//            initSchema(conn);
//            System.out.println("H2 fallback database connected successfully.");
//            return conn;
//        } catch (ClassNotFoundException | SQLException e) {
//            throw new RuntimeException("Unable to connect to any database.", e);
//        }

    private static void initSchema(Connection conn) {
        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate("CREATE TABLE IF NOT EXISTS users ("
                    + "id SERIAL PRIMARY KEY,"
                    + "fullname VARCHAR(255),"
                    + "email VARCHAR(255) UNIQUE NOT NULL,"
                    + "password VARCHAR(255) NOT NULL,"
                    + "phone VARCHAR(20),"
                    + "gender VARCHAR(50),"
                    + "address VARCHAR(500),"
                    + "role VARCHAR(50),"
                    + "status BOOLEAN"
                    + ")");

            stmt.executeUpdate("INSERT INTO users (fullname, email, password, phone, gender, address, role, status) "
                    + "SELECT 'Admin User', 'admin@example.com', 'admin123', '9999999999', 'Other', 'System', 'ADMIN', TRUE "
                    + "WHERE NOT EXISTS (SELECT 1 FROM users WHERE email='admin@example.com')");
        } catch (SQLException e) {
            throw new RuntimeException("Unable to initialize database schema.", e);
        }
    }

}
