package com.leadmngmt.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * The class helps to connect to the database server.
 *
 * @author Nikesh
 */
public class Database {

    private static Connection connection;

    /**
     * Connects to the database named lead_management with username as root and no password.
     * @return Connection object the database.
     * @throws ClassNotFoundException If the class com.mysql.jdbc.Driver is not found.
     * @throws SQLException If cannot establish connection to the "jdbc:mysql://localhost/lead_management" database with username = "root" and no password.
     */
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if (connection == null) {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost/lead_management", "root", "");
        }
        return connection;
    }

}
