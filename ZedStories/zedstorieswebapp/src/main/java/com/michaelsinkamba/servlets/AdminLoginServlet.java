package com.michaelsinkamba.servlets;

import com.michaelsinkamba.dao.AdminDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@SuppressWarnings("serial")
@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        AdminDAO adminDAO = new AdminDAO();

        try {
            if (adminDAO.validateAdmin(username, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", username); // Store username in session
                
                // Redirect to admin.jsp after successful login
                response.sendRedirect("admin");
            } else {
                // Set error message for invalid credentials
                request.setAttribute("errorMessage", "Invalid username or password");
                request.getRequestDispatcher("/WEB-INF/views/adminLogin.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            
            // Set error message for database error
            request.setAttribute("errorMessage", "An error occurred. Please try again.");
            request.getRequestDispatcher("/WEB-INF/views/adminLogin.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to adminLogin.jsp for GET requests (initial load or redirection)
        request.getRequestDispatcher("/WEB-INF/views/adminLogin.jsp").forward(request, response);
    }
}
