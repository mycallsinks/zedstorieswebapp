package com.michaelsinkamba.servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;

import com.michaelsinkamba.dao.AdDAO;
import com.michaelsinkamba.models.Ad;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

//@WebServlet("/AddAdServlet")
@MultipartConfig
public class AddAdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String category = request.getParameter("category");
        String text = request.getParameter("text");
        String link1 = request.getParameter("link1");
        String link2 = request.getParameter("link2");

        // Retrieve image part
        Part imagePart = request.getPart("image");

        // Check if imagePart is not null
        if (imagePart != null && imagePart.getSize() > 0) {
            // Define the upload directory and create it if it doesn't exist
            String uploadDirectory = getServletContext().getRealPath("/adImage");
            File uploadDir = new File(uploadDirectory);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Generate a unique filename
            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
            String uniqueFileName = System.currentTimeMillis() + "_" + fileName;

            // Save the file on disk
            Path filePath = Paths.get(uploadDirectory, uniqueFileName);
            try (InputStream fileContent = imagePart.getInputStream()) {
                Files.copy(fileContent, filePath);
            }

            // Create Ad object
            Ad ad = new Ad();
            ad.setImage("adImage/" + uniqueFileName); // Store the relative path to the image
            ad.setPage(category);
            ad.setText(text);
            ad.setLink1(link1);
            ad.setLink2(link2);
            ad.setTimestamp(Timestamp.from(Instant.now())); // Set current timestamp

            // Create AdDAO instance and add ad with image
            AdDAO adDAO = new AdDAO();
            try {
                adDAO.addAd(ad);
                // Handle success (e.g., redirect to a success page)
                response.sendRedirect("admin?success=true");
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                // Handle exceptions (e.g., redirect with error message)
                response.sendRedirect("admin?success=false&error=db");
            }
        } else {
            // Handle case where imagePart is null or empty (e.g., redirect with error message)
            response.sendRedirect("admin?success=false&error=image");
        }
    }
}
