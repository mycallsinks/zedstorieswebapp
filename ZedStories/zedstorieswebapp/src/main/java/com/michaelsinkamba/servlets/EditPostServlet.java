package com.michaelsinkamba.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import com.michaelsinkamba.dao.PostDAO;
import com.michaelsinkamba.models.Post;



@WebServlet("/edit")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class EditPostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("id"));
        PostDAO postDAO = new PostDAO();
        try {
            Post post = postDAO.getPostByIdForEdit(postId);
            request.setAttribute("post", post);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/edit.jsp");
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            // Handle exception as needed
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String location = request.getParameter("location");
        String text = request.getParameter("text");
        String status = request.getParameter("status");

        // Get the existing image from the request
        String existingImage = request.getParameter("existingImage");

        // Handle file upload
        Part filePart = request.getPart("newimage");
        String fileName = extractFileName(filePart);
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // If a new file is uploaded, save it and update the image name
        String image = existingImage;
        if (fileName != null && !fileName.isEmpty()) {
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
            image = fileName; // Use the uploaded file name as the image
        }

        Post post = new Post(id, title, author, location, text, image, status);
        PostDAO postDAO = new PostDAO();
        postDAO.updatePostAfterEdit(post);

        response.sendRedirect(request.getContextPath() + "/admin");
    }

    // Method to extract file name from HTTP header content-disposition
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }
}
