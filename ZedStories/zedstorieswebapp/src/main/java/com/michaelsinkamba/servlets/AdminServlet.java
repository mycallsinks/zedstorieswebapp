package com.michaelsinkamba.servlets;

import com.michaelsinkamba.dao.AdDAO;
import com.michaelsinkamba.dao.PostDAO;
import com.michaelsinkamba.models.Ad;
import com.michaelsinkamba.models.Post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDAO postDAO = new PostDAO();
        AdDAO adDAO = new AdDAO();

        try {
            // Retrieve posts
            List<Post> confessions = postDAO.getAllPostsByCategory("confessions");
            List<Post> partners = postDAO.getAllPostsByCategory("partner");
            List<Post> lifestyles = postDAO.getAllPostsByCategory("lifestyle");

            // Set posts as request attributes
            request.setAttribute("confessions", confessions);
            request.setAttribute("partners", partners);
            request.setAttribute("lifestyles", lifestyles);

            // Retrieve ads
            List<Ad> ads = adDAO.getAllAds();

            // Set ads as a request attribute
            request.setAttribute("ads", ads);

            // Forward request to admin.jsp
            request.getRequestDispatcher("/WEB-INF/views/admin.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Handle or log the exception as needed
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int postId = Integer.parseInt(request.getParameter("postId"));
            try {
                deletePost(postId);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                // Handle or log the exception
            }
            response.sendRedirect("admin"); // Redirect back to admin page
        } else if ("approve".equals(action)) {
            int postId = Integer.parseInt(request.getParameter("postId"));
            try {
                approvePost(postId);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                // Handle or log the exception
            }
            response.sendRedirect("admin"); // Redirect back to admin page
        } else if ("changeStatus".equals(action)) {
            int postId = Integer.parseInt(request.getParameter("postId"));
            String newStatus = request.getParameter("newStatus");
            try {
                changePostStatus(postId, newStatus);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                // Handle or log the exception
            }
            response.sendRedirect("admin"); // Redirect back to admin page
        } else {
            // Handle other actions or errors if needed
        }
    }

    private void deletePost(int postId) throws ClassNotFoundException, SQLException {
        PostDAO postDAO = new PostDAO();
        postDAO.deletePost(postId); // Assuming deletePost method in PostDAO handles deletion
    }

    private void approvePost(int postId) throws ClassNotFoundException, SQLException {
        PostDAO postDAO = new PostDAO();
        postDAO.approvePost(postId); // Method in PostDAO to approve the post
    }

    private void changePostStatus(int postId, String newStatus) throws ClassNotFoundException, SQLException {
        PostDAO postDAO = new PostDAO();
        postDAO.updatePostStatus(postId, newStatus); // Method in PostDAO to update post status
    }
}
