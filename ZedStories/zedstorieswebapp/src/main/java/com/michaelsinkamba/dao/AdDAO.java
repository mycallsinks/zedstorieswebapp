//package com.michaelsinkamba.dao;
//
//import com.michaelsinkamba.models.Ad;
//import com.michaelsinkamba.util.DBUtil;
//
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//
//public class AdDAO {
//
//    public List<Ad> getAdsByPage(String page) throws SQLException, ClassNotFoundException {
//        List<Ad> ads = new ArrayList<>();
//        String sql = "SELECT * FROM ads WHERE page = ?";
//
//        try (Connection conn = DBUtil.getConnection();
//             PreparedStatement statement = conn.prepareStatement(sql)) {
//
//            statement.setString(1, page);
//
//            try (ResultSet resultSet = statement.executeQuery()) {
//                while (resultSet.next()) {
//                    Ad ad = extractAd(resultSet);
//                    ads.add(ad);
//                }
//            }
//        } catch (SQLException e) {
//            e.printStackTrace(); // Print the exception stack trace for debugging
//            throw e; // Re-throw the exception to propagate it
//        }
//
//        return ads;
//    }
//
//    public List<Ad> getAllAds() throws SQLException, ClassNotFoundException {
//        List<Ad> ads = new ArrayList<>();
//        String query = "SELECT id, image, text, link1, link2, page, timestamp FROM ads"; // Use timestamp here
//
//        try (Connection conn = DBUtil.getConnection();
//             PreparedStatement stmt = conn.prepareStatement(query);
//             ResultSet rs = stmt.executeQuery()) {
//
//            while (rs.next()) {
//                Ad ad = new Ad();
//                ad.setId(rs.getInt("id"));
//                ad.setImage(rs.getBytes("image"));
//                ad.setText(rs.getString("text"));
//                ad.setLink1(rs.getString("link1"));
//                ad.setLink2(rs.getString("link2"));
//                ad.setPage(rs.getString("page"));
//                ad.setTimestamp(rs.getTimestamp("timestamp")); // Use timestamp here
//
//                ads.add(ad);
//            }
//        }
//
//        return ads;
//    }
//
//    public void addAd(Ad ad, InputStream imageInputStream) throws SQLException, ClassNotFoundException {
//        String query = "INSERT INTO ads (image, text, link1, link2, page, timestamp) VALUES (?, ?, ?, ?, ?, ?)"; // Use timestamp here
//
//        try (Connection conn = DBUtil.getConnection();
//             PreparedStatement stmt = conn.prepareStatement(query)) {
//
//            stmt.setBlob(1, imageInputStream);
//            stmt.setString(2, ad.getText());
//            stmt.setString(3, ad.getLink1());
//            stmt.setString(4, ad.getLink2());
//            stmt.setString(5, ad.getPage());
//            stmt.setTimestamp(6, ad.getTimestamp()); // Use timestamp here
//
//            stmt.executeUpdate();
//        }
//    }
//
//
//    
//    private Ad extractAd(ResultSet resultSet) throws SQLException {
//        Ad ad = new Ad();
//        ad.setId(resultSet.getInt("id"));
//        ad.setImage(getBytesFromBlob(resultSet.getBlob("image"))); // Convert Blob to byte[]
//        ad.setText(resultSet.getString("text"));
//        ad.setLink1(resultSet.getString("link1"));
//        ad.setLink2(resultSet.getString("link2"));
//        ad.setPage(resultSet.getString("page"));
//        ad.setTimestamp(resultSet.getTimestamp("timestamp")); // Use setTimestamp
//        return ad;
//    }
//
//
//    private byte[] getBytesFromBlob(Blob blob) throws SQLException {
//        if (blob == null) return null;
//        try (InputStream inputStream = blob.getBinaryStream()) {
//            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//            byte[] buffer = new byte[4096];
//            int bytesRead = -1;
//            while ((bytesRead = inputStream.read(buffer)) != -1) {
//                outputStream.write(buffer, 0, bytesRead);
//            }
//            return outputStream.toByteArray();
//        } catch (IOException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//    
//    
//    public void deleteAd(int adId) throws SQLException, ClassNotFoundException {
//        String sql = "DELETE FROM ads WHERE id = ?";
//        try (Connection connection = DBUtil.getConnection();
//             PreparedStatement statement = connection.prepareStatement(sql)) {
//            statement.setInt(1, adId);
//            statement.executeUpdate();
//        }
//    }
//
//
//}


package com.michaelsinkamba.dao;

import com.michaelsinkamba.models.Ad;
import com.michaelsinkamba.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdDAO {

    public List<Ad> getAdsByPage(String page) throws SQLException, ClassNotFoundException {
        List<Ad> ads = new ArrayList<>();
        String sql = "SELECT * FROM ads WHERE page = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {

            statement.setString(1, page);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Ad ad = extractAd(resultSet);
                    ads.add(ad);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }

        return ads;
    }

    public List<Ad> getAllAds() throws SQLException, ClassNotFoundException {
        List<Ad> ads = new ArrayList<>();
        String query = "SELECT id, image, text, link1, link2, page, timestamp FROM ads";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Ad ad = extractAd(rs);
                ads.add(ad);
            }
        }

        return ads;
    }

    public void addAd(Ad ad) throws SQLException, ClassNotFoundException {
        String query = "INSERT INTO ads (image, text, link1, link2, page, timestamp) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, ad.getImage());
            stmt.setString(2, ad.getText());
            stmt.setString(3, ad.getLink1());
            stmt.setString(4, ad.getLink2());
            stmt.setString(5, ad.getPage());
            stmt.setTimestamp(6, ad.getTimestamp());

            stmt.executeUpdate();
        }
    }

    private Ad extractAd(ResultSet resultSet) throws SQLException {
        Ad ad = new Ad();
        ad.setId(resultSet.getInt("id"));
        ad.setImage(resultSet.getString("image")); // Use String for image URL
        ad.setText(resultSet.getString("text"));
        ad.setLink1(resultSet.getString("link1"));
        ad.setLink2(resultSet.getString("link2"));
        ad.setPage(resultSet.getString("page"));
        ad.setTimestamp(resultSet.getTimestamp("timestamp"));
        return ad;
    }

    public void deleteAd(int adId) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM ads WHERE id = ?";
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, adId);
            statement.executeUpdate();
        }
    }
}

