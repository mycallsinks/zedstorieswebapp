package com.michaelsinkamba.dao;


import java.sql.Connection;

import com.michaelsinkamba.util.DBUtil;

public class TestDBConnection {
    public static void main(String[] args) {
        try {
            Connection connection = DBUtil.getConnection();
            if (connection != null) {
                System.out.println("Connection successful!");
                connection.close();
            } else {
                System.out.println("Failed to make connection!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
