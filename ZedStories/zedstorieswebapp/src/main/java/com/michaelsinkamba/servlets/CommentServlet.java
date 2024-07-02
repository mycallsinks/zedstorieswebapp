package com.michaelsinkamba.servlets;

import java.io.IOException;
import java.sql.Timestamp;

import com.michaelsinkamba.dao.CommentDAO;
import com.michaelsinkamba.models.Comment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addComment")
public class CommentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CommentDAO commentDAO;

    public void init() {
        commentDAO = new CommentDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String postIdParam = request.getParameter("postId");
        if (postIdParam == null || postIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid post ID.");
            return;
        }

        int postId;
        try {
            postId = Integer.parseInt(postIdParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid post ID format.");
            return;
        }

        String nickname = request.getParameter("nickname");
        String commentText = request.getParameter("commentText");
        Timestamp date = new Timestamp(System.currentTimeMillis());

        Comment comment = new Comment();
        comment.setPostId(postId);
        comment.setNickname(nickname);
        comment.setCommentText(commentText);
        comment.setDate(date);

        try {
            commentDAO.addComment(comment);
        } catch (ClassNotFoundException e) {
            throw new ServletException("Database error occurred", e);
        }

        // Redirect to the displaypost.jsp or similar page with the correct postId
//        response.sendRedirect("displaypost?postId=" + postId);
        response.sendRedirect("displaypost?id=" + postId);

    }
    
    
    

}
