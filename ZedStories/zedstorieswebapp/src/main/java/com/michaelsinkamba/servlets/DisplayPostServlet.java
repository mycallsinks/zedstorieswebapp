//package com.michaelsinkamba.servlets;
//
//import com.michaelsinkamba.dao.PostDAO;
//import com.michaelsinkamba.models.Post;
//
//import jakarta.servlet.RequestDispatcher;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//@SuppressWarnings("serial")
//@WebServlet("/displaypost")
//public class DisplayPostServlet extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String postIdStr = request.getParameter("id");
//        if (postIdStr != null) {
//            int postId = Integer.parseInt(postIdStr);
//            PostDAO postDAO = new PostDAO();
//            try {
//                Post post = postDAO.getPostById(postId);
//                request.setAttribute("post", post);
//            } catch (SQLException e) {
//                e.printStackTrace();
//                // Handle exceptions
//            } catch (ClassNotFoundException e) {
//                e.printStackTrace();
//                // Handle exceptions
//            }
//        }
//
//        PostDAO postDAO = new PostDAO();
//        
//        // Fetch approved 'lifestyle' posts
//        List<Post> lifestyle = null;
//        try {
//            lifestyle = postDAO.getPostsByCategoryAndStatusSortedByDate("lifestyle", "approved");
//        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
//        }
//        
//        // Fetch approved 'confessions' posts
//        List<Post> confessions = null;
//        try {
//            confessions = postDAO.getPostsByCategoryAndStatusSortedByDate("confessions", "approved");
//        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
//        }
//        
//        // Fetch approved 'partner' posts
//        List<Post> partner = null;
//        try {
//            partner = postDAO.getPostsByCategoryAndStatusSortedByDate("partner", "approved");
//        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
//        }
//        
//        // Initialize lists to store the top trending post for each section
//        List<Post> LifestyletopOneTrending = new ArrayList<>();
//        List<Post> ConfessiontopOneTrending = new ArrayList<>();
//        List<Post> PartnertopOneTrending = new ArrayList<>();
//
//        // Add the first post from each category if it exists
//        if (lifestyle != null && !lifestyle.isEmpty()) {
//            LifestyletopOneTrending.add(lifestyle.get(0));
//        }
//        if (confessions != null && !confessions.isEmpty()) {
//            ConfessiontopOneTrending.add(confessions.get(0));
//        }
//        if (partner != null && !partner.isEmpty()) {
//            PartnertopOneTrending.add(partner.get(0));
//        }
//
//        // Set attributes to be used in JSP
//        request.setAttribute("LifestyletopOneTrending", LifestyletopOneTrending);
//        request.setAttribute("ConfessiontopOneTrending", ConfessiontopOneTrending);
//        request.setAttribute("PartnertopOneTrending", PartnertopOneTrending);
//
//        // Forward to the JSP page
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/displaypost.jsp");
//        dispatcher.forward(request, response);
//    }
//}




package com.michaelsinkamba.servlets;

import com.michaelsinkamba.dao.PostDAO;
import com.michaelsinkamba.models.Comment;
import com.michaelsinkamba.models.Post;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@SuppressWarnings("serial")
@WebServlet("/displaypost")
public class DisplayPostServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String postIdStr = request.getParameter("id");
        if (postIdStr != null) {
            int postId = Integer.parseInt(postIdStr);
            PostDAO postDAO = new PostDAO();
            try {
                Post post = postDAO.getPostById(postId);
                request.setAttribute("post", post);
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle exceptions
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                // Handle exceptions
            }
        }

        PostDAO postDAO = new PostDAO();
        
        // Fetch approved 'lifestyle' posts
        List<Post> lifestyle = null;
        try {
            lifestyle = postDAO.getPostsByCategoryAndStatusSortedByDate("lifestyle", "approved");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
        // Fetch approved 'confessions' posts
        List<Post> confessions = null;
        try {
            confessions = postDAO.getPostsByCategoryAndStatusSortedByDate("confessions", "approved");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
        // Fetch approved 'partner' posts
        List<Post> partner = null;
        try {
            partner = postDAO.getPostsByCategoryAndStatusSortedByDate("partner", "approved");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
        // Initialize lists to store the top trending post for each section
        List<Post> LifestyletopOneTrending = new ArrayList<>();
        List<Post> ConfessiontopOneTrending = new ArrayList<>();
        List<Post> PartnertopOneTrending = new ArrayList<>();

        // Add the first post from each category if it exists
        if (lifestyle != null && !lifestyle.isEmpty()) {
            LifestyletopOneTrending.add(lifestyle.get(0));
        }
        if (confessions != null && !confessions.isEmpty()) {
            ConfessiontopOneTrending.add(confessions.get(0));
        }
        if (partner != null && !partner.isEmpty()) {
            PartnertopOneTrending.add(partner.get(0));
        }

        // Set attributes to be used in JSP
        request.setAttribute("LifestyletopOneTrending", LifestyletopOneTrending);
        request.setAttribute("ConfessiontopOneTrending", ConfessiontopOneTrending);
        request.setAttribute("PartnertopOneTrending", PartnertopOneTrending);
        
        
     // Fetch approved posts with comment counts

        
//        if you want to show all posts with their comments
        
//        try {
//            // Get comment count for all posts
//            Map<Integer, Integer> commentCounts = postDAO.getCommentCountForAllPosts();
//
//            // Forward comment counts to JSP
//            request.setAttribute("commentCounts", commentCounts);
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/displaypost.jsp");
//            dispatcher.forward(request, response);
//        } catch (SQLException e) {
//            e.printStackTrace();
//            // Handle exceptions
//        }
//    
        
        
        
        String postIdStr1 = request.getParameter("id");
        if (postIdStr1 != null) {
            int postId = Integer.parseInt(postIdStr1);
            PostDAO postDAO1 = new PostDAO();
            try {
                Post post = postDAO1.getPostById(postId);
                int commentCount = postDAO1.getCommentCountForPost(postId);

                request.setAttribute("post", post);
                request.setAttribute("commentCounting", commentCount);

                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/displaypost.jsp");
                dispatcher.forward(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                // Handle exceptions
            }
        } else {
            // Handle the case where postId is not provided
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Post ID is required");
        }
    }
}
