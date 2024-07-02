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
@WebServlet("/lifestyle")
public class LifestyleServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    PostDAO postDAO = new PostDAO();
	    
	    // Assuming you have a method to get all approved posts for 'Lifestyle' category
	    List<Post> lifestyle = null;
	    try {
	        lifestyle = postDAO.getPostsByCategoryAndStatusSortedByDate("lifestyle", "approved");
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    }
	 // Calculate the end indices for each section
	    int endIndexForFirstThreeLatest = 3; // Number of posts for ConfessionfirstThreeLatest
	    int endIndexForSecondThreeLatest = endIndexForFirstThreeLatest + 3; // Number of posts for ConfessionsecondThreeLatest
	    int endIndexForFortherThreeLatest = endIndexForSecondThreeLatest + 3; // Number of posts for ConfessionfortherThreeLatest
	    int endIndexForTopOneTrending = endIndexForFortherThreeLatest + 1; // Number of posts for ConfessiontopOneTrending

	    // Initialize lists to store posts for each section
	    List<Post> LifestylefirstThreeLatest = new ArrayList<>();
	    List<Post> LifestylesecondThreeLatest = new ArrayList<>();
	    List<Post> LifestylefortherThreeLatest = new ArrayList<>();
	    List<Post> LifestyletopOneTrending = new ArrayList<>();

	    // Distribute posts based on your desired order
	    for (int i = 0; i < lifestyle.size(); i++) {
	        if (i < endIndexForFirstThreeLatest) {
	            LifestylefirstThreeLatest.add(lifestyle.get(i)); // Fill ConfessionfirstThreeLatest with the first 3 posts
	        } else if (i < endIndexForSecondThreeLatest) {
	            LifestylesecondThreeLatest.add(lifestyle.get(i)); // Fill ConfessionsecondThreeLatest with the next 3 posts
	        } else if (i < endIndexForFortherThreeLatest) {
	            LifestylefortherThreeLatest.add(lifestyle.get(i)); // Fill ConfessionfortherThreeLatest with the next 3 posts
	        } else if (i < endIndexForTopOneTrending) {
	            LifestyletopOneTrending.add(lifestyle.get(i)); // Fill ConfessiontopOneTrending with the last post
	        }
	    }

	    // Set attributes to be used in JSP
	    request.setAttribute("LifestylefirstThreeLatest", LifestylefirstThreeLatest);
	    request.setAttribute("LifestylesecondThreeLatest", LifestylesecondThreeLatest);
	    request.setAttribute("LifestylefortherThreeLatest", LifestylefortherThreeLatest);
	    request.setAttribute("LifestyletopOneTrending", LifestyletopOneTrending);
	    
//	    
//	    String postIdStr1 = request.getParameter("id");
//        if (postIdStr1 != null) {
//            int postId = Integer.parseInt(postIdStr1);
//            PostDAO postDAO1 = new PostDAO();
//            try {
//                Post post = postDAO1.getPostById(postId);
//                int commentCount = postDAO1.getCommentCountForPost(postId);
//
//                request.setAttribute("post", post);
//                request.setAttribute("commentCounts", commentCount);
//
//                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/lifestyle.jsp");
//                dispatcher.forward(request, response);
//            } catch (SQLException | ClassNotFoundException e) {
//                e.printStackTrace();
//                // Handle exceptions
//            }
//        } else {
//            // Handle the case where postId is not provided
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Post ID is required");
//        }
//        
	    
	    AdDAO adDAO = new AdDAO();
	    try {
	        List<Ad> lifestyleAds = adDAO.getAdsByPage("lifestyle");
	        Ad lifestyleAd = null;
	        if (!lifestyleAds.isEmpty()) {
	            lifestyleAd = lifestyleAds.get(0); // Assuming you want to display the latest ad
	        }

	        // Set the single ad as a request attribute
	        request.setAttribute("lifestyleAd", lifestyleAd);
	        request.getRequestDispatcher("/WEB-INF/views/lifestyle.jsp").forward(request, response);
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	        // Handle exceptions as needed
	    }


	    // Forward to the JSP page
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/lifestyle.jsp");
	    dispatcher.forward(request, response);
	}

}
