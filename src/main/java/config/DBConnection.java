package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    // PostgreSQL Database Details
    private static final String URL = "jdbc:postgresql://localhost:5432/role_management";
    private static final String USER = "postgres";
    private static final String PASSWORD = "postgres";

    // Method to return database connection
    public static Connection getConnection() {

        Connection conn = null;

        try {

            // Load PostgreSQL Driver
            Class.forName("org.postgresql.Driver");

            // Create Connection
            conn = DriverManager.getConnection(URL, USER, PASSWORD);

            System.out.println("Database Connected Successfully...");

        } catch (ClassNotFoundException e) {

            System.out.println("Driver Not Found!");
            e.printStackTrace();

        } catch (SQLException e) {

            System.out.println("Database Connection Failed!");
            e.printStackTrace();

        }

        return conn;
    }
}