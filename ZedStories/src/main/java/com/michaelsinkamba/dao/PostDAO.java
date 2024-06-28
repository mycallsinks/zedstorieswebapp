package com.michaelsinkamba.dao;

import com.michaelsinkamba.models.Post;
import com.michaelsinkamba.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
    private static final String INSERT_POST_SQL = "INSERT INTO posts (category, title, author, location, text, image, contact_details, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_POSTS_BY_CATEGORY_SQL = "SELECT * FROM posts WHERE category = ?";
    private static final String UPDATE_POST_SQL = "UPDATE posts SET category=?, title=?, author=?, location=?, text=?, image=?, contact_details=?, status=? WHERE id=?";
    private static final String DELETE_POST_SQL = "DELETE FROM posts WHERE id=?";
    private static final String APPROVE_POST_SQL = "UPDATE posts SET status='approved' WHERE id=?";
    private static final String UPDATE_POST_STATUS_SQL = "UPDATE posts SET status=? WHERE id=?";

    public void savePost(Post post) throws SQLException, ClassNotFoundException {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(INSERT_POST_SQL)) {

            statement.setString(1, post.getCategory());
            statement.setString(2, post.getTitle());
            statement.setString(3, post.getAuthor());
            statement.setString(4, post.getLocation());
            statement.setString(5, post.getText());
            statement.setString(6, post.getImage());
            statement.setString(7, post.getContactDetails());
            statement.setString(8, post.getStatus());

            statement.executeUpdate();
        }
    }

    public List<Post> getAllPostsByCategory(String category) throws SQLException, ClassNotFoundException {
        List<Post> posts = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(SELECT_POSTS_BY_CATEGORY_SQL)) {

            statement.setString(1, category);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Post post = new Post();
                    post.setId(resultSet.getInt("id"));
                    post.setCategory(resultSet.getString("category"));
                    post.setTitle(resultSet.getString("title"));
                    post.setAuthor(resultSet.getString("author"));
                    post.setLocation(resultSet.getString("location"));
                    post.setText(resultSet.getString("text"));
                    post.setImage(resultSet.getString("image"));
                    post.setContactDetails(resultSet.getString("contact_details"));
                    post.setStatus(resultSet.getString("status"));

                    posts.add(post);
                }
            }
        }

        return posts;
    }

    public void deletePost(int postId) throws SQLException, ClassNotFoundException {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(DELETE_POST_SQL)) {

            statement.setInt(1, postId);
            statement.executeUpdate();
        }
    }

    public void updatePostDetails(Post post) throws SQLException, ClassNotFoundException {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(UPDATE_POST_SQL)) {

            statement.setString(1, post.getCategory());
            statement.setString(2, post.getTitle());
            statement.setString(3, post.getAuthor());
            statement.setString(4, post.getLocation());
            statement.setString(5, post.getText());
            statement.setString(6, post.getImage());
            statement.setString(7, post.getContactDetails());
            statement.setString(8, post.getStatus());
            statement.setInt(9, post.getId());

            statement.executeUpdate();
        }
    }

    public void approvePost(int postId) throws SQLException, ClassNotFoundException {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(APPROVE_POST_SQL)) {

            statement.setInt(1, postId);
            statement.executeUpdate();
        }
    }

    public void updatePostStatus(int postId, String newStatus) throws SQLException, ClassNotFoundException {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(UPDATE_POST_STATUS_SQL)) {

            statement.setString(1, newStatus);
            statement.setInt(2, postId);

            statement.executeUpdate();
        }
    }
    
    
    
//  displaying posts starts
    public List<Post> getPostsByCategoryAndStatus(String category, String status) throws SQLException, ClassNotFoundException {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM posts WHERE category = ? AND status = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {

            statement.setString(1, category);
            statement.setString(2, status);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Post post = new Post();
                    post.setId(resultSet.getInt("id"));
                    post.setCategory(resultSet.getString("category"));
                    post.setTitle(resultSet.getString("title"));
                    post.setAuthor(resultSet.getString("author"));
                    post.setLocation(resultSet.getString("location"));
                    post.setText(resultSet.getString("text"));
                    post.setImage(resultSet.getString("image"));
                    post.setContactDetails(resultSet.getString("contact_details"));
                    post.setStatus(resultSet.getString("status"));
                    post.setDate(resultSet.getTimestamp("date"));
                    posts.add(post);
                }
            }
        }

        return posts;
    }

}

    
    
