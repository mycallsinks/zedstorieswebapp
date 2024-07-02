package com.michaelsinkamba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.michaelsinkamba.util.DBUtil;

public class AdminDAO {
    public boolean validateAdmin(String username, String password) throws SQLException, ClassNotFoundException {
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        boolean isValid = rs.next();
        rs.close();
        stmt.close();
        conn.close();
        return isValid;
    }
}
