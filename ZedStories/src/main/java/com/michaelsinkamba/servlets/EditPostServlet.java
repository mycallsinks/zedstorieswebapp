package com.michaelsinkamba.servlets;

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

@SuppressWarnings("serial")
@WebServlet("/editpost")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class EditPostServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("postId"));
        String category = request.getParameter("category");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String location = request.getParameter("location");
        String text = request.getParameter("text");
        String contactDetails = request.getParameter("contactDetails");
        String fileName = null;

        Part filePart = request.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            fileName = extractFileName(filePart);
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
        }

        Post post = new Post();
        post.setId(postId);
        post.setCategory(category); // Set category to Post object
        post.setTitle(title);
        post.setAuthor(author);
        post.setLocation(location);
        post.setText(text);
        post.setContactDetails(contactDetails);
        post.setImage(fileName); // Set fileName to Post object if applicable

        PostDAO postDAO = new PostDAO();
        try {
            postDAO.updatePostDetails(post);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Handle exception as needed
        }

        response.sendRedirect(request.getContextPath() + "/admin.jsp");
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
