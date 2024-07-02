package com.michaelsinkamba.servlets;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import com.michaelsinkamba.dao.PostDAO;
import com.michaelsinkamba.models.Post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@SuppressWarnings("serial")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
@WebServlet("/makeapost")
public class MakePostServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = null;
        String author = null;
        String location = null;
        String text = null;
        String contactDetails = null;
        String category = request.getParameter("category");
        String fileName = null;
        String status = "pending"; // Default status is pending

        // Determine category and retrieve corresponding fields
        switch (category) {
            case "confessions":
                title = request.getParameter("confessions-title");
                author = request.getParameter("confessions-author");
                location = request.getParameter("confessions-location");
                text = request.getParameter("confessions-text");
                Part confessionFilePart = request.getPart("confession-image");
                if (confessionFilePart != null && confessionFilePart.getSize() > 0) {
                    fileName = extractFileName(confessionFilePart);
                    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }
                    String filePath = uploadPath + File.separator + fileName;
                    confessionFilePart.write(filePath);
                }
                break;
            case "partner":
                title = request.getParameter("partner-title");
                author = request.getParameter("partner-author");
                location = request.getParameter("partner-location");
                text = request.getParameter("partner-text");
//                contactDetails = request.getParameter("partner-contact-details");
                Part partnerFilePart = request.getPart("partner-image");
                if (partnerFilePart != null && partnerFilePart.getSize() > 0) {
                    fileName = extractFileName(partnerFilePart);
                    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }
                    String filePath = uploadPath + File.separator + fileName;
                    partnerFilePart.write(filePath);
                }
                break;
            case "lifestyle":
                title = request.getParameter("lifestyle-title");
                author = request.getParameter("lifestyle-author");
                location = request.getParameter("lifestyle-location");
                text = request.getParameter("lifestyle-text");
                Part lifestyleFilePart = request.getPart("lifestyle-image");
                if (lifestyleFilePart != null && lifestyleFilePart.getSize() > 0) {
                    fileName = extractFileName(lifestyleFilePart);
                    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }
                    String filePath = uploadPath + File.separator + fileName;
                    lifestyleFilePart.write(filePath);
                }
                break;
            default:
                // Handle default case if needed
                break;
        }

        Post post = new Post();
        post.setTitle(title);
        post.setAuthor(author);
        post.setLocation(location);
        post.setText(text);
        post.setContactDetails(contactDetails);
        post.setImage(fileName); // Set fileName to Post object if applicable
        post.setCategory(category);
        post.setStatus(status);

        PostDAO postDAO = new PostDAO();
        try {
            postDAO.savePost(post);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        

        request.setAttribute("successMessage", "Post created successfully!");
        request.getRequestDispatcher("/WEB-INF/views/makeapost.jsp").forward(request, response);
    }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/makeapost.jsp").forward(request, response);
    }


    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
    
    
    
    
}
