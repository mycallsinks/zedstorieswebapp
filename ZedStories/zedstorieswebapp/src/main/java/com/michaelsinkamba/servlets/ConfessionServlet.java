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
@WebServlet("/confessions")
public class ConfessionServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    PostDAO postDAO = new PostDAO();

	    // Assuming you have a method to get all approved posts for 'Confessions' category
	    List<Post> confessions = null;
	    try {
	        confessions = postDAO.getPostsByCategoryAndStatusSortedByDate("confessions", "approved");
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    }

	 // Calculate the end indices for each section
	    int endIndexForFirstThreeLatest = 3; // Number of posts for ConfessionfirstThreeLatest
	    int endIndexForSecondThreeLatest = endIndexForFirstThreeLatest + 3; // Number of posts for ConfessionsecondThreeLatest
	    int endIndexForFortherThreeLatest = endIndexForSecondThreeLatest + 3; // Number of posts for ConfessionfortherThreeLatest
	    int endIndexForTopOneTrending = endIndexForFortherThreeLatest + 1; // Number of posts for ConfessiontopOneTrending

	    // Initialize lists to store posts for each section
	    List<Post> ConfessionfirstThreeLatest = new ArrayList<>();
	    List<Post> ConfessionsecondThreeLatest = new ArrayList<>();
	    List<Post> ConfessionfortherThreeLatest = new ArrayList<>();
	    List<Post> ConfessiontopOneTrending = new ArrayList<>();

	    // Distribute posts based on your desired order
	    for (int i = 0; i < confessions.size(); i++) {
	        if (i < endIndexForFirstThreeLatest) {
	            ConfessionfirstThreeLatest.add(confessions.get(i)); // Fill ConfessionfirstThreeLatest with the first 3 posts
	        } else if (i < endIndexForSecondThreeLatest) {
	            ConfessionsecondThreeLatest.add(confessions.get(i)); // Fill ConfessionsecondThreeLatest with the next 3 posts
	        } else if (i < endIndexForFortherThreeLatest) {
	            ConfessionfortherThreeLatest.add(confessions.get(i)); // Fill ConfessionfortherThreeLatest with the next 3 posts
	        } else if (i < endIndexForTopOneTrending) {
	            ConfessiontopOneTrending.add(confessions.get(i)); // Fill ConfessiontopOneTrending with the last post
	        }
	    }

	    // Set attributes to be used in JSP
	    request.setAttribute("ConfessionfirstThreeLatest", ConfessionfirstThreeLatest);
	    request.setAttribute("ConfessionsecondThreeLatest", ConfessionsecondThreeLatest);
	    request.setAttribute("ConfessionfortherThreeLatest", ConfessionfortherThreeLatest);
	    request.setAttribute("ConfessiontopOneTrending", ConfessiontopOneTrending);
	    
	    try {
            List<Post> posts = postDAO.getPostsByCategoryAndStatusSortedByDate("confessions", "approved");
            for (Post post : posts) {
                int commentCount = postDAO.getCommentCountForPost(post.getId());
                post.setCommentCount(commentCount); // Assuming Post class has setCommentCount method
                

            }
            request.setAttribute("posts", posts);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

//        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/confessions.jsp");
//        dispatcher.forward(request, response);
  
	
	    
	    AdDAO adDAO = new AdDAO();
	    try {
	        List<Ad> confessionsAds = adDAO.getAdsByPage("confession");
	        Ad confessionsAd = null;
	        if (!confessionsAds.isEmpty()) {
	            confessionsAd = confessionsAds.get(0); // Assuming you want to display the latest ad
	        }

	        // Set the single ad as a request attribute
	        request.setAttribute("confessionsAd", confessionsAd);
	        request.getRequestDispatcher("/WEB-INF/views/confessions.jsp").forward(request, response);
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	        // Handle exceptions as needed
	    }
	    
        // Forward to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/confessions.jsp");
        dispatcher.forward(request, response);
    }
}
