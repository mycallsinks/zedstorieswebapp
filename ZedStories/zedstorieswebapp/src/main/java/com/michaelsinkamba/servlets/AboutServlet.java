package com.michaelsinkamba.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/about")
@SuppressWarnings("serial")
public class AboutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to aboutus.jsp
        request.getRequestDispatcher("/WEB-INF/views/aboutus.jsp").forward(request, response);
    }
}
