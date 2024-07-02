package com.michaelsinkamba.servlets;

import com.michaelsinkamba.dao.AdDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/deleteAd")
public class AdminDeleteAdServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int adId = Integer.parseInt(request.getParameter("adId"));
        AdDAO adDAO = new AdDAO();
        try {
            adDAO.deleteAd(adId);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Handle or log the exception as needed
        }
        response.sendRedirect(request.getContextPath() + "/admin"); // Redirect back to admin page after deletion
    }
}
