package com.michaelsinkamba.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/zedstoriesdb";
    private static final String USER = "root";
    private static final String PASSWORD = "mycall@fiero";
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName(DRIVER);
        return DriverManager.getConnection(DB_URL, USER, PASSWORD);
    }
}
