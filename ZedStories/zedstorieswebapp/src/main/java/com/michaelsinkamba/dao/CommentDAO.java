package com.michaelsinkamba.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.michaelsinkamba.models.Comment;
import com.michaelsinkamba.util.DBUtil;

public class CommentDAO {

    public void addComment(Comment comment) throws ClassNotFoundException {
        String sql = "INSERT INTO comments (post_id, nickname, comment_text, date) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, comment.getPostId());
            stmt.setString(2, comment.getNickname());
            stmt.setString(3, comment.getCommentText());
            stmt.setTimestamp(4, comment.getDate());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Comment> getCommentsByPostId(int postId) throws ClassNotFoundException {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT * FROM comments WHERE post_id = ? ORDER BY date DESC";
        try (Connection conn = DBUtil.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, postId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setId(rs.getInt("id"));
                comment.setPostId(rs.getInt("post_id"));
                comment.setNickname(rs.getString("nickname"));
                comment.setCommentText(rs.getString("comment_text"));
                comment.setDate(rs.getTimestamp("date"));
                comments.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comments;
    }
}

