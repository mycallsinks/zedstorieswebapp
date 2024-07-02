package com.michaelsinkamba.servlets;

import com.michaelsinkamba.dao.AdDAO;
import com.michaelsinkamba.dao.PostDAO;
import com.michaelsinkamba.models.Ad;
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

@SuppressWarnings("serial")
@WebServlet("/index")
public class HomeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Initialize DAOs
        PostDAO postDAO = new PostDAO();
        AdDAO adDAO = new AdDAO();

        try {
            // Fetch posts from each category
            List<Post> confessions = fetchPostsByCategory(postDAO, "confessions");
            List<Post> lifestyle = fetchPostsByCategory(postDAO, "lifestyle");
            List<Post> partners = fetchPostsByCategory(postDAO, "partner");

            // Fetch one random post from each category
            Post randomConfession = fetchRandomPostByCategory(postDAO, "confessions");
            Post randomLifestyle = fetchRandomPostByCategory(postDAO, "lifestyle");
            Post randomPartner = fetchRandomPostByCategory(postDAO, "partner");

            // Fetch ads for homepage
            List<Ad> homeAds = adDAO.getAdsByPage("home");
            Ad homeAd = (!homeAds.isEmpty()) ? homeAds.get(0) : null;

            // Distribute posts into sections
            List<List<Post>> confessionsSections = distributePosts(confessions);
            List<List<Post>> lifestyleSections = distributePosts(lifestyle);
            List<List<Post>> partnerSections = distributePosts(partners);

            // Set attributes for JSP rendering
            request.setAttribute("confessionsSections", confessionsSections);
            request.setAttribute("lifestyleSections", lifestyleSections);
            request.setAttribute("partnerSections", partnerSections);

            request.setAttribute("randomConfession", randomConfession);
            request.setAttribute("randomLifestyle", randomLifestyle);
            request.setAttribute("randomPartner", randomPartner);

            request.setAttribute("homeAd", homeAd);
            
            
            
//            String postIdStr1 = request.getParameter("id");
//            if (postIdStr1 != null) {
//                int postId = Integer.parseInt(postIdStr1);
//                PostDAO postDAO1 = new PostDAO();
//                try {
//                    Post post = postDAO1.getPostById(postId);
//                    int commentCount = postDAO1.getCommentCountForPost(postId);
//
//                    request.setAttribute("post", post);
//                    request.setAttribute("commentCount", commentCount);
//
//                    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
//                    dispatcher.forward(request, response);
//                } catch (SQLException | ClassNotFoundException e) {
//                    e.printStackTrace();
//                    // Handle exceptions
//                }
//            } else {
//                // Handle the case where postId is not provided
//                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Post ID is required");
//            }

            // Forward to the index.jsp page
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
            dispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
        
        
        
    }

    // Method to fetch posts by category and status
    private List<Post> fetchPostsByCategory(PostDAO postDAO, String category) throws ClassNotFoundException, SQLException {
        return postDAO.getPostsByCategoryAndStatusSortedByDate(category, "approved");
    }

    // Method to fetch a random post by category
    private Post fetchRandomPostByCategory(PostDAO postDAO, String category) throws ClassNotFoundException, SQLException {
        return postDAO.getRandomPostByCategory(category);
    }

    // Method to distribute posts into sections based on desired order
    private List<List<Post>> distributePosts(List<Post> sourcePosts) {
        List<List<Post>> sections = new ArrayList<>();
        List<Post> section = new ArrayList<>();

        int count = 0;
        for (Post post : sourcePosts) {
            section.add(post);
            count++;

            if (count == 3) {
                sections.add(section);
                section = new ArrayList<>();
                count = 0;
            }
        }

        if (!section.isEmpty()) {
            sections.add(section);
        }

        return sections;
    }
}

