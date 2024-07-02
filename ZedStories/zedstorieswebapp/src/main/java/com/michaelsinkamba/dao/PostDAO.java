package com.michaelsinkamba.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.michaelsinkamba.models.Comment;
import com.michaelsinkamba.models.Post;
import com.michaelsinkamba.util.DBUtil;

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
//    public List<Post> getPostsByCategoryAndStatus(String category, String status) throws SQLException, ClassNotFoundException {
//        List<Post> posts = new ArrayList<>();
//        String sql = "SELECT * FROM posts WHERE category = ? AND status = ?";
//
//        try (Connection conn = DBUtil.getConnection();
//             PreparedStatement statement = conn.prepareStatement(sql)) {
//
//            statement.setString(1, category);
//            statement.setString(2, status);
//
//            try (ResultSet resultSet = statement.executeQuery()) {
//                while (resultSet.next()) {
//                    Post post = new Post();
//                    post.setId(resultSet.getInt("id"));
//                    post.setCategory(resultSet.getString("category"));
//                    post.setTitle(resultSet.getString("title"));
//                    post.setAuthor(resultSet.getString("author"));
//                    post.setLocation(resultSet.getString("location"));
//                    post.setText(resultSet.getString("text"));
//                    post.setImage(resultSet.getString("image"));
//                    post.setContactDetails(resultSet.getString("contact_details"));
//                    post.setStatus(resultSet.getString("status"));
//                    post.setDate(resultSet.getTimestamp("date"));
//                    posts.add(post);
//                }
//            }
//        }
//
//        return posts;
//    }
    
    public List<Post> getPostsByCategoryAndStatusSortedByDate(String category, String status) throws SQLException, ClassNotFoundException {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM posts WHERE category = ? AND status = ? ORDER BY date DESC"; // Order by date descending

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {

            statement.setString(1, category);
            statement.setString(2, status);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Post post = new Post();
                    LocalDateTime date = resultSet.getTimestamp("date").toLocalDateTime();
                    
                    
                    post.setId(resultSet.getInt("id"));
                    post.setCategory(resultSet.getString("category"));
                    post.setTitle(resultSet.getString("title"));
                    post.setAuthor(resultSet.getString("author"));
                    post.setLocation(resultSet.getString("location"));
                    post.setText(resultSet.getString("text"));
                    post.setImage(resultSet.getString("image"));
                    post.setContactDetails(resultSet.getString("contact_details"));
                    post.setStatus(resultSet.getString("status"));
                    post.setFormattedDateFromLocalDateTime(date);
                    posts.add(post);
                }
            }
        }

        return posts;
    }
    
    
    
//    displaying posts
    
    public Post getPostById(int postId) throws SQLException, ClassNotFoundException {
        Connection connection = DBUtil.getConnection();
        String sql = "SELECT * FROM posts WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, postId);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            Post post = new Post();
            
            LocalDateTime date = resultSet.getTimestamp("date").toLocalDateTime();

            post.setId(resultSet.getInt("id"));
            post.setCategory(resultSet.getString("category"));
            post.setTitle(resultSet.getString("title"));
            post.setAuthor(resultSet.getString("author"));
            post.setLocation(resultSet.getString("location"));
            post.setText(resultSet.getString("text"));
            post.setImage(resultSet.getString("image"));
            post.setContactDetails(resultSet.getString("contact_details"));
            post.setStatus(resultSet.getString("status"));
            post.setFormattedDateFromLocalDateTime(date);
            
            return post;
        }
        return null;
    }
    
 // Method to fetch a random post by category
    public Post getRandomPostByCategory(String category) throws ClassNotFoundException, SQLException {
        String query = "SELECT * FROM posts WHERE category = ? AND status = 'approved' ORDER BY RAND() LIMIT 1";
        Post post = null;

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, category);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                	
                    LocalDateTime date = resultSet.getTimestamp("date").toLocalDateTime();

                    post = new Post();
                    post.setId(resultSet.getInt("id"));
                    post.setCategory(resultSet.getString("category"));
                    post.setTitle(resultSet.getString("title"));
                    post.setAuthor(resultSet.getString("author"));
                    post.setLocation(resultSet.getString("location"));
                    post.setText(resultSet.getString("text"));
                    post.setImage(resultSet.getString("image"));
                    post.setContactDetails(resultSet.getString("contact_details"));
                    post.setStatus(resultSet.getString("status"));
                    post.setFormattedDateFromLocalDateTime(date);
                }
            }
        }
        return post;
    }
    
    
    
 // Method to fetch posts with comment count
    public List<Post> getAllPostsWithCommentCount() throws ClassNotFoundException {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT p.id, p.title, p.author, p.text, COUNT(c.id) AS commentCount " +
                     "FROM posts p " +
                     "LEFT JOIN comments c ON p.id = c.post_id " +
                     "GROUP BY p.id";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setTitle(rs.getString("title"));
                post.setAuthor(rs.getString("author"));
                post.setText(rs.getString("text"));
                post.setCommentCount(rs.getInt("commentCount"));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return posts;
    }
    
    
    
//    this displays comments for all ids and posts
 
//    public Map<Integer, Integer> getCommentCountForAllPosts() throws SQLException {
//        String sql = "SELECT p.id AS post_id, COUNT(c.id) AS comment_count " +
//                     "FROM posts p " +
//                     "LEFT JOIN comments c ON p.id = c.post_id " +
//                     "GROUP BY p.id";
//        Map<Integer, Integer> commentCounts = new HashMap<>();
//
//        try (Connection conn = DBUtil.getConnection();
//             PreparedStatement statement = conn.prepareStatement(sql);
//             ResultSet resultSet = statement.executeQuery()) {
//
//            while (resultSet.next()) {
//                int postId = resultSet.getInt("post_id");
//                int commentCount = resultSet.getInt("comment_count");
//                commentCounts.put(postId, commentCount);
//            }
//        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
//            throw new SQLException("Error fetching comment count for all posts: " + e.getMessage());
//        }
//
//        return commentCounts;
//    }
//    
    
    
    public List<Comment> getCommentsForPost(int postId) throws SQLException {
        String sql = "SELECT id, nickname, comment_text, date FROM comments WHERE post_id = ?";
        List<Comment> comments = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {

            statement.setInt(1, postId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Comment comment = new Comment();
                    comment.setId(resultSet.getInt("id"));
                    comment.setNickname(resultSet.getString("nickname"));
                    comment.setCommentText(resultSet.getString("comment_text"));
                    comment.setDate(resultSet.getTimestamp("date"));
                    comments.add(comment);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error fetching comments for post: " + e.getMessage());
        }

        return comments;
    }
    
    
//    to be checked later
    
    public int getCommentCountForPost(int postId) throws SQLException {
        String sql = "SELECT COUNT(*) AS comment_count FROM comments WHERE post_id = ?";
        int commentCount = 0;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {

            statement.setInt(1, postId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    commentCount = resultSet.getInt("comment_count");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error fetching comment count for post: " + e.getMessage());
        }

        return commentCount;
    }
    
    
    // method to getpost by edit for edting
    
    public Post getPostByIdForEdit(int id) throws ClassNotFoundException {
        Post post = null;
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement("SELECT * FROM posts WHERE id = ?")) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    post = new Post(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("author"),
                        rs.getString("location"),
                        rs.getString("text"),
                        rs.getString("image"),
                        rs.getString("status")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return post;
    }
    
    
    public void updatePostAfterEdit(Post post) {
        try (Connection connection = DBUtil.getConnection();
             PreparedStatement ps = connection.prepareStatement("UPDATE posts SET title=?, author=?, location=?, text=?, image=?, status=? WHERE id=?")) {
            ps.setString(1, post.getTitle());
            ps.setString(2, post.getAuthor());
            ps.setString(3, post.getLocation());
            ps.setString(4, post.getText());
            ps.setString(5, post.getImage());
            ps.setString(6, post.getStatus());
            ps.setInt(7, post.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    }





}

    
    
