package com.michaelsinkamba.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

@SuppressWarnings("serial")
@WebServlet("/partner")
public class PartnerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDAO postDAO = new PostDAO();
	    AdDAO adDAO = new AdDAO();


        // Assuming you have a method to get all approved posts for 'Partner' category
        List<Post> partners = null;
        try {
            partners = postDAO.getPostsByCategoryAndStatusSortedByDate("partner", "approved");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

   	 // Calculate the end indices for each section
	    int endIndexForFirstThreeLatest = 3; // Number of posts for ConfessionfirstThreeLatest
	    int endIndexForSecondThreeLatest = endIndexForFirstThreeLatest + 3; // Number of posts for ConfessionsecondThreeLatest
	    int endIndexForFortherThreeLatest = endIndexForSecondThreeLatest + 3; // Number of posts for ConfessionfortherThreeLatest
	    int endIndexForTopOneTrending = endIndexForFortherThreeLatest + 1; // Number of posts for ConfessiontopOneTrending

	    // Initialize lists to store posts for each section
	    List<Post> PartnerfirstThreeLatest = new ArrayList<>();
	    List<Post> PartnersecondThreeLatest = new ArrayList<>();
	    List<Post> PartnerfortherThreeLatest = new ArrayList<>();
	    List<Post> PartnertopOneTrending = new ArrayList<>();

	    // Distribute posts based on your desired order
	    for (int i = 0; i < partners.size(); i++) {
	        if (i < endIndexForFirstThreeLatest) {
	            PartnerfirstThreeLatest.add(partners.get(i)); // Fill ConfessionfirstThreeLatest with the first 3 posts
	        } else if (i < endIndexForSecondThreeLatest) {
	            PartnersecondThreeLatest.add(partners.get(i)); // Fill ConfessionsecondThreeLatest with the next 3 posts
	        } else if (i < endIndexForFortherThreeLatest) {
	            PartnerfortherThreeLatest.add(partners.get(i)); // Fill ConfessionfortherThreeLatest with the next 3 posts
	        } else if (i < endIndexForTopOneTrending) {
	            PartnertopOneTrending.add(partners.get(i)); // Fill ConfessiontopOneTrending with the last post
	        }
	    }

	    // Set attributes to be used in JSP
	    request.setAttribute("PartnerfirstThreeLatest", PartnerfirstThreeLatest);
	    request.setAttribute("PartnersecondThreeLatest", PartnersecondThreeLatest);
	    request.setAttribute("PartnerfortherThreeLatest", PartnerfortherThreeLatest);
	    request.setAttribute("PartnertopOneTrending", PartnertopOneTrending);
//	    
	    
//	    AdDAO adDAO = new AdDAO();
	    try {
	        List<Ad> partnerAds = adDAO.getAdsByPage("partner");
	        Ad partnerAd = null;
	        if (!partnerAds.isEmpty()) {
	            partnerAd = partnerAds.get(0); // Assuming you want to display the latest ad
	        }

	        // Set the single ad as a request attribute
	        request.setAttribute("partnerAd", partnerAd);
	        request.getRequestDispatcher("/WEB-INF/views/partner.jsp").forward(request, response);
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	        // Handle exceptions as needed
	    }
 

        // Forward to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/partner.jsp");
        dispatcher.forward(request, response);
    }
}
