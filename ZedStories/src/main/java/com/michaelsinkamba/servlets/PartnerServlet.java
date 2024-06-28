package com.michaelsinkamba.servlets;

import com.michaelsinkamba.dao.PostDAO;
import com.michaelsinkamba.models.Post;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@SuppressWarnings("serial")
@WebServlet("/partners")
public class PartnerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDAO postDAO = new PostDAO();
        try {
            List<Post> partners = postDAO.getPostsByCategoryAndStatus("partner", "approved");

            // Debug print to log the fetched posts
            for (Post post : partners) {
                System.out.println("Post ID: " + post.getId());
                System.out.println("Category: " + post.getCategory());
                System.out.println("Title: " + post.getTitle());
                System.out.println("Author: " + post.getAuthor());
                System.out.println("Location: " + post.getLocation());
                System.out.println("Text: " + post.getText());
                System.out.println("Image: " + post.getImage());
                System.out.println("Contact Details: " + post.getContactDetails());
                System.out.println("Status: " + post.getStatus());
                System.out.println("Date: " + post.getDate());
                System.out.println("-----------------------------------");
            }

            request.setAttribute("partners", partners);
            request.getRequestDispatcher("/partner.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Handle exceptions
        }
    }
}
